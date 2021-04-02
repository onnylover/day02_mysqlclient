use employees;
show tables;
select * from departments;
select * from dept_emp;
select * from employees;

-- 쿼리 처리 프로세스
select * from departments;
-- 프로세스 : 
-- 1번 확인 : from 절
-- 2번확인 : where 절
-- 3번 확인 : order by 절로 정렬
-- 4번 확인 : 대상칼럼 추

-- alias
select first_name as '이름', last_name as '성', hire_date as '입사일' from employees;

-- 함수
-- concat (합치기)
select concat(first_name, ' ',  last_name) as 'Full_name', hire_date as '입사일' from employees;
-- length (길이)
select concat(first_name, ' ',  last_name) as 'Full_name', 
length(first_name),
hire_date as '입사일'
from employees;

-- distinct (중복제거)
select distinct title from titles;

-- order by (차순 desc 내림, asc 오름)
select concat(first_name, ' ',  last_name) as 'Full_name', 
length(first_name),
hire_date as '입사일'
from employees
order by hire_date desc;

-- where 절
-- where 안에서 like 사용 (like 사용시 %, _ 사용)
select * from employees where first_name like "P%";
select * from employees where first_name like "P____";

-- 1. like 활용 : salaries 테이블에서 2001년 월급을 가장 높은 순으로 사번, 월급순으로 출력
select emp_no,salary from salaries where from_date like "2001%" order by salary desc;

-- 2. and 조건 :  salaries 테이블에서 2001년 월급을 가장 높은 순으로 사번, 월급순으로 출력
select emp_no,salary from salaries where from_date < "2002-01-01" and from_date > "2000-12-31" order by salary desc;

-- 3. employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
select first_name, gender, hire_date  from employees where hire_date < "1992-01-01" order by hire_date desc;

-- 4. employees 테이블에서 1989년 이전에 입하산 여직원의 이름, 입사일을 출력
-- date_format  (포맷은 별도 참고, 시간까지 다 바꿀 수 있음)
select first_name, date_format(hire_date,"%Y년 %m월 %d일 %h:%i:%s") as "hire_date" from employees where gender = "F" and hire_date < "1989-01-01" order by hire_date desc;

