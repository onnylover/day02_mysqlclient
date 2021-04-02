
show databases;
use employees;
show tables;

-- 예제1.
-- salaries 테이블에서 사번이 10060인 직원의 급여 평균과 총합
select avg(salary), sum(salary) from salaries where emp_no="10060";

-- 이 예제 직원의 최저임금을 받은 시기와 최대 임금을 받은 시기를 각각 출력해보세요.
-- select salary, from_date from salaries where emp_no="10060";
-- select avg(salary), sum(salary) from salaries where emp_no="10060" group by from_date;

-- 예제5.
-- 각 사원별로 평균연봉 출력
select emp_no, avg(salary) from salaries group by emp_no;

-- 예제6.
-- salaries 테이블에서 현재 전체 직원별로 평균급여가 35000이상인 직원의 평균 급여를 큰 순서대로 출력하세요.
select emp_no, avg(salary) as "avg_salary" from salaries where to_date="9999-01-01" group by emp_no having avg_salary >=35000 order by avg_salary desc;

-- 예제7.
-- 사원별로 몇번의 직책 변경이 있었는지 조회해 보세요.
select emp_no, count(*) from titles group by emp_no;

-- 예제8.
-- 현재 직책별로 직원 수를 구하고, 직원수가 100명 이상인 직책만 출력하세요.
select title, count(*) as "count" from titles where to_date="9999-01-01" group by title having count >=100 order by count desc;

-- 예제9. JOIN
-- 현재 근무하고 있는 여직원의 이름과 직책을 직원 이름 순으로 출력하세요.
select a.first_name, a.last_name,  b.title from employees as a, titles as b where a.emp_no = b.emp_no and b.to_date = "9999-01-01" and a.gender = "F" order by a.first_name;			-- where 이하절을 Join condition

-- 예제10.
-- 부서별 현재 직책이 Engineer인 직원들에 대한 평균 급여를 구하세요.
select * from departments;
select d.dept_no, dd.dept_name, avg(s.salary) as avg_salary
from titles t, salaries s, dept_emp d, departments dd
where t.emp_no = s.emp_no and s.emp_no = d.emp_no and d.dept_no = dd.dept_no
		and t.to_date = "9999-01-01" and s.to_date = "9999-01-01" and d.to_date = "9999-01-01" 
        and t.title = "Engineer"
group by d.dept_no
order by avg_salary;

-- 연습문제1.
-- 현재 직책별로 급여의 총합을 구하세요.
-- Engineer 직책은 제외하세요.
-- 단, 총합이 2,000,000,000 이상인 직책만 나타내며,
-- 급여의 총합에 대해서는 내림차순으로 정렬하세요.
select t.title, sum(s.salary) as "sum_salary" 
from titles t, salaries s
where t.emp_no = s.emp_no and s.to_date = "9999-01-01" and t.to_date = "9999-01-01" and not t.title="Engineer"
group by t.title
having sum_salary>= 2000000000
order by sum_salary desc;

-- join on
select a.first_name, a.last_name,  b.title 
from employees as a join  titles as b
on a.emp_no = b.emp_no
where b.to_date = "9999-01-01" and a.gender = "F" 
order by a.first_name;	

-- Natural join (not exist join condition)
select a.first_name, a.last_name,  b.title 
from employees as a 
Natural join  titles as b
where b.to_date = "9999-01-01" and a.gender = "F" 
order by a.first_name;	

-- join using (cover for Natural join)
select a.first_name, a.last_name,  b.title 
from employees as a 
join  titles as b 
using (emp_no)
where b.to_date = "9999-01-01" and a.gender = "F" 
order by a.first_name;	

-- outer join 
-- 예제
-- 현재 회사의 직원 이름과 부서 이름을 출력하세요.
-- 테스트용 db table 생성 및 values 넣기 (테이블은 erd로 포워드)
desc emp;
desc dept;
insert into dept values(null, "총무");
insert into dept values(null, "개발");
insert into dept values(null, "영업");
select * from dept;
insert into emp values(null, "JJ","2");
insert into emp values(null, "DD","3");
insert into emp values(null, "MJ","2");
insert into emp values(null, "SR","3");
insert into emp values(null, "BB",null);
select * from emp;

-- 기본 조인
select e.name, d.name
from emp e
join dept d
on e.department_no = d.no;

-- left join
select e.name, ifnull(d.name,"none")
from emp e
left join dept d
on e.department_no = d.no;

-- right join
select ifnull(e.name,"not exist") as name, d.name as dept_name
from emp e
right join dept d
on e.department_no = d.no;





