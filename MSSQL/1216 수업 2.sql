
<실습> user2 계정을 생성 후 myDB2만 접속하여 테이블 생성, 값 insert ,update,delete,drop table
		<sql 인증> 으로 계정 생성


create table a (
	a int identity(1,1) not null primary key,
	b int );

insert into a
values(15);

select * from a;

begin transaction
update a
set b = 5
where a = 1;

begin tran
delete a
where b = 10;

rollback;
