show databases;	-- 테타베스 구경
use webDB;			-- 데타베스 선택
show tables;			-- 태이블 구경

-- 테이블 생성
create table pets(
name varchar(20),
owner varchar(20),
species varchar(20),
gender char(1),
birth date,
death date
);

-- 테이블 스키마 확인
desc pets;

-- 추가하기 (C)
insert into pets values("JJ","DINGDONG","Norway","M","2020-10-21",null);
insert into pets (owner, name, species, gender, birth) values("May","Pang","gil","F","2021-01-21");
insert into pets values("DD","KK","mon","M","2019-08-31",'2021-3-30');

-- select 시 필요한 값만 (R)
select * from pets;		-- select에서 필요한거만 쿼리해야 메모리 세이브 가능함
select name, birth from pets;
-- order by 
select name, birth from pets order by birth desc;	-- 내림차순
select name, birth from pets order by birth asc;		-- 오름차순
-- 갯수 확인
select count(name) from pets;
-- null 은 카운트 되지 않음
select count(death) from pets;
-- where 절 사용
select count(*) from pets where death is not null;

-- update 하기 (U)
update pets set species="korshort" where name = "DD";

-- delete 하기 (D)
delete from pets where death is not null;





