
use employees;

-- 예제 1
-- 현재 fai bale 이 근무하는 부서의 전체 직원의 사번과 이름을 출력하세요.
-- 방법1 (개별 쿼리)
select dept_no
from employees e, dept_emp d
where e.emp_no = d.emp_no and d.to_date="9999-01-01" and first_name="Fai" and last_name="Bale";

select d.emp_no, e.first_name
from dept_emp d, employees e
where e.emp_no = d.emp_no and dept_no = "d004" and to_date="9999-01-01";

-- 방법2 (서브쿼리)
select d.emp_no, e.first_name
from dept_emp d, employees e
where e.emp_no = d.emp_no 
and dept_no in (select dept_no from employees e, dept_emp d where e.emp_no = d.emp_no and first_name="Fai" and last_name="Bale") 
and to_date="9999-01-01";

-- in subquery in where
-- single result : =, !=, <, >, >=, <=
-- multi result : In(not in), ALL(=all, >all, <all, <>all, <=all, >=all), Any(=any, <any, >any, <>any, <=any, >=any), Exists 

-- 예제2, 현재 전체 사원의 평균연봉보다 적은 급여를 받는 사원들의 이름, 급여를 출력하세요
select e.first_name, s.salary
from salaries s, employees e
where s.emp_no = e.emp_no and s.to_date = "9999-01-01" and s.salary < (select avg(salary) from salaries where to_date="9999-01-01")
order by e.first_name desc;

-- 예제 3
-- 현재 급여가 50000 이상인 직원의 이름과 급여를 출력하세요.
-- way to join
select e.first_name, s.salary
from employees e, salaries s
where e.emp_no=s.emp_no and salary >= 50000 and s.to_date="9999-01-01"
order by s.salary;

-- way to subquery
select e.first_name, s.salary  from employees e, (select emp_no, salary from salaries where to_date="9999-01-01" and salary >=50000) s where e.emp_no=s.emp_no;

-- 예제 4
-- 현재 가장 적은 평균급여의 직책과 평균급여를 출력하세요.
select t.title, avg(s.salary) from titles t, salaries s where t.emp_no = s.emp_no and s.to_date="9999-01-01" group by t.title limit 0,1;

-- 문제1 
-- from 절 subquery
-- 현재 각 부서별로 최고 급여를 받는 사원의 이름과 급여를 출력하세요. (부서별 최고급여 선정, 별도의 테이블을 만들고 테이블 안에서 다시정리)
select * from dept_emp;
select * from salaries;

-- 부서 및 부서 최대 급여 테이블
-- select g.dept_no, max(g.salary) from (select e.emp_no, e.first_name as "name", s.salary as "salary", d.dept_no as "dept_no" from salaries s, employees e, dept_emp d where s.emp_no = e.emp_no and e.emp_no = d.emp_no and s.to_date="9999-01-01") g group by g.dept_no;

-- 필요한 자료 조인 테이블 (선생님 자료에는 부서이름도 포함되어 있음)
-- select e.emp_no, e.first_name as "name", s.salary as "salary", d.dept_no as "dept_no" from salaries s, employees e, dept_emp d where s.emp_no = e.emp_no and e.emp_no = d.emp_no and s.to_date="9999-01-01";

--  합체
--  from 절
select c.dept_no, c.name, c.salary
from (select e.emp_no, e.first_name as "name", s.salary as "salary", d.dept_no as "dept_no" from salaries s, employees e, dept_emp d where s.emp_no = e.emp_no and e.emp_no = d.emp_no and s.to_date="9999-01-01") c, (select g.dept_no as "dept_no", max(g.salary)as "max_salary" from (select e.emp_no, e.first_name as "name", s.salary as "salary", d.dept_no as "dept_no" from salaries s, employees e, dept_emp d where s.emp_no = e.emp_no and e.emp_no = d.emp_no and s.to_date="9999-01-01") g group by g.dept_no) cc
where c.salary = cc.max_salary and c.dept_no = cc.dept_no
order by c.salary desc;

-- where 절
select d.dept_no as "dept_no", e.first_name as "name", s.salary as "salary" 
from salaries s, employees e, dept_emp d 
where s.emp_no = e.emp_no and e.emp_no = d.emp_no and s.to_date="9999-01-01" and (dept_no, salary) =any(select g.dept_no as "dept_no", max(g.salary) as "salary" from (select e.emp_no, e.first_name as "name", s.salary as "salary", d.dept_no as "dept_no" from salaries s, employees e, dept_emp d where s.emp_no = e.emp_no and e.emp_no = d.emp_no and s.to_date="9999-01-01") g group by g.dept_no) 
order by salary desc;


