--테이블을 만들수있는지 간단하게 계정확인

--user1 계정으로 접속 : MYDB만 접근 가능 db_owner <해당 DB의 소유주: DB내에서만 모든 권한 가짐>

create database myDB2; -- 오류발생


create table a(
	a int IDENTITY(1,1) not null primary key,		-- a컬럼은 값을 넣으면 안됨, 자동으로 값이 들어감
	b int );

insert into a 
values (30);

select * from a;

-- MSSQL은 자동으로 커밋되므로 Update , delete 할 때 명시적으로 트랜잭션을 시작하고 사용. 그래야 rollback 가능




-- update
update a
set b = 50
where a = 2;

--delete
begin tran		-- 트랜잭션을 명시적으로 시작. begin transaction
delete a
where a = 2;


select * from a;
rollback;
commit;


--drop table
drop table a;