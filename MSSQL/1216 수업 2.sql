
<�ǽ�> user2 ������ ���� �� myDB2�� �����Ͽ� ���̺� ����, �� insert ,update,delete,drop table
		<sql ����> ���� ���� ����


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
