--���̺��� ������ִ��� �����ϰ� ����Ȯ��

--user1 �������� ���� : MYDB�� ���� ���� db_owner <�ش� DB�� ������: DB�������� ��� ���� ����>

create database myDB2; -- �����߻�


create table a(
	a int IDENTITY(1,1) not null primary key,		-- a�÷��� ���� ������ �ȵ�, �ڵ����� ���� ��
	b int );

insert into a 
values (30);

select * from a;

-- MSSQL�� �ڵ����� Ŀ�ԵǹǷ� Update , delete �� �� ��������� Ʈ������� �����ϰ� ���. �׷��� rollback ����




-- update
update a
set b = 50
where a = 2;

--delete
begin tran		-- Ʈ������� ��������� ����. begin transaction
delete a
where a = 2;


select * from a;
rollback;
commit;


--drop table
drop table a;