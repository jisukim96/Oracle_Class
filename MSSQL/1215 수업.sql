-- �� �� �ּ�
/*
	���� �� �ּ�
*/
-- DataBase ����
create database myDB;

-- DataBase ���� : �ش� DB�� ���ӵ� ���¿����� DB���� �Ұ�
drop database myDB;

-- �ش� DataBase�� ����
use myDB;

--tempdb�� �̵�
use tempdb;

-- ���̺� ���� �� ����

create table test1 (
	a int not null primary key,	-- ������ �ִ� �ڷ��� (number ���Ұ�)
	b varchar (10) null,
	c char(10) null
	);

select * from test1;

drop table test1;

-- �� insert  : MSSQL , MYSQL(MariaDB)�� �ڵ� Ŀ�� Ʈ�����
-- commit�� ������� �ʾƵ� �ڵ����� Ŀ�Եȴ�. (DML : Insert, Update,Delete)
insert into test1 (a,b,c)
values (1,'aaa','bbb');

-- ��������� Ʈ������� �����ϸ� Ʈ������� �Ϸ��ؾ��Ѵ�.
begin transaction
insert into test1 (a,b,c)
values (2,'ccc','ddd');

select * from test1;

rollback;

------------------------------------------------------
-- Sample ���̺� ����
DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;
DROP TABLE SALGRADE;


-- �μ� ���̺� ����(Department)
	-- NUMBER	: ����Ŭ�� �ڷ��� ����, �Ǽ� ó��
	-- int		: ����(MS-SQL , MYSQL)
	-- float	: �Ǽ�(MS-SQL , MYSQL)

	-- VARCHAR2		: Oracle���� VARCHAR�� �����Ͽ� ���� �ڷ���
	-- VARCHAR		: MS-SQL , MYSQL

CREATE TABLE DEPARTMENT(
	DNO INT CONSTRAINT PK_DEPARTMENT_DNO PRIMARY KEY,
    DNAME VARCHAR(14),
	LOC   VARCHAR(13) 
	) ;


CREATE TABLE EMPLOYEE (
	 ENO INT CONSTRAINT PK_EMPLOYEE_ENO PRIMARY KEY,
	 ENAME VARCHAR(10),
 	 JOB   VARCHAR(9),
	 MANAGER  INT,
	 HIREDATE DATE,
	 SALARY FLOAT,
	 COMMISSION FLOAT,
	 DNO INT CONSTRAINT FK_EMPLOYEE_DNO FOREIGN KEY REFERENCES DEPARTMENT(DNO)
	 );


CREATE TABLE SALGRADE(
	 GRADE INT,
	 LOSAL INT,
	 HISAL INT 
	 );

---- �� insert

INSERT INTO DEPARTMENT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPARTMENT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPARTMENT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPARTMENT VALUES (40,'OPERATIONS','BOSTON');

-- select * from department;


-- MSSQL������ to_date() �Լ��� ����. convert �Լ��� ��¥ �ڷ��� ��ȯ
-- select * from employee;


INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','CLERK',    7902,'19801217',800,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7499,'ALLEN','SALESMAN', 7698,'19810220',1600,300,30);
INSERT INTO EMPLOYEE VALUES
(7521,'WARD','SALESMAN',  7698,'19810220',1250,500,30);
INSERT INTO EMPLOYEE VALUES
(7566,'JONES','MANAGER',  7839,'19810402',2975,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7654,'MARTIN','SALESMAN',7698,'19810928',1250,1400,30);
INSERT INTO EMPLOYEE VALUES
(7698,'BLAKE','MANAGER',  7839,'19810501',2850,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7782,'CLARK','MANAGER',  7839,'19810609',2450,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7788,'SCOTT','ANALYST',  7566,'19870713',3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7839,'KING','PRESIDENT', NULL,'19811117',5000,NULL,10);
INSERT INTO EMPLOYEE VALUES
(7844,'TURNER','SALESMAN',7698,'19810908',1500,0,30);
INSERT INTO EMPLOYEE VALUES
(7876,'ADAMS','CLERK',    7788,'19870713',1100,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7900,'JAMES','CLERK',    7698,'19811203',950,NULL,30);
INSERT INTO EMPLOYEE VALUES
(7902,'FORD','ANALYST',   7566,'19811203',3000,NULL,20);
INSERT INTO EMPLOYEE VALUES
(7934,'MILLER','CLERK',   7782,'19820123',1300,NULL,10);

INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

-- COMMIT;

select * from department;
select * from employee;
select * from salgrade;

-- ���̺��� ���� ��� : desc ���̺�� < == Oracle  , Mysql , MariaDB
sp_help [DEPARTMENT];
sp_help [EMPLOYEE];
sp_help [SALGRADE];

/*
select �÷���
from ���̺�� or �� ��
where ����
group by �÷�
having ���� ( group by ����� ���� ����) ��Ī �ȵ�.
order by �÷���		<== ����
*/

select eno as �����ȣ , ename �����, salary ���� 
from employee
where salary > 2000 and eno in ( 7788,7839)

-- �����Լ��� ���� (sum,avg,max,min,count)

-- �μ��� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��� ��
select sum(salary) �հ� , avg(salary) ��� ,max(salary) �ִ밪 ,
		min(salary) �ּҰ�,count(*) �׷��εȼ�
from employee
group by dno
having avg(salary) > 2000

-- insert ,update ,delete ,truncate table : Oracle , MySQL , MSSQL ��� �����ϴ�.

-- ���̺� ���� : ����Ŭ�� ���� �ٸ� create ������ ���̺� from ���� ���̺�� as ������ ����
	-- ���� ������ ������� �ʴ´�.

-- department ���̺��� ��� �÷��� ��� ���ڵ带 ����
select * into dept_copy		-- dept_copy : ������ ���̺�
from department ;			-- department : ������ ���� ���̺�

select * from dept_copy;

-- employee ���̺��� Ư�� �÷��� Ư�� ���ڵ常 ����
select eno,ename,salary,dno into emp_copy
from employee
where dno = 10;

select * from emp_copy;

------------------------------------------------
-- ANSI JOIN (INNER JOIN)

-- �����ȣ, �����, ����, �μ���ȣ,�μ���, �μ���ġ ��� : employee,department INNERJOIN
select eno �����ȣ, ename �����, salary ����, e.dno �μ���ȣ, dname �μ���, loc �μ���ġ
from employee e inner join department d 
on e.dno = d.dno

--ANSI SELF JOIN
--��� �̸��� ���� ��� �̸���  SELF JOIN���� ��� (13)
select e.eno , e.ename ,m.ename, m.eno 
from employee e inner join employee m
on e.manager = m.eno;

--ANSI SELF JOIN �� ��簡 ���� ������� ��� LEFT outer (14) 
select e.eno , e.ename ,m.ename, m.eno
from employee e left outer join employee m
on e.manager = m.eno;

-------------------------------------------------------------
create table userTbl (	-- < ȸ�����̺� > --
	userID char(8) NOT NULL constraint PK_USERTBL_USERID primary key ,	--����� ID
	name nvarchar(10) NOT NULL,	-- �̸�
	birthYear int NOT NULL,		-- ������ �⵵ , int : 4byte
	addr nchar(3) NOT NULL,		-- �ּ�(���,����, �泲 3���ڱ��� �Է�)
	mobile1 char(3) ,			-- �ڵ��� (010. )
	mobile2 char(8),			-- �ڵ��� ���ڸ� 8�ڸ�
	height smallint,			-- Ű
	mDate date					-- ��¥(ȸ��������)
	);

create table buyTbl (	-- < ���� ���̺� > --
	num int IDENTITY not null constraint PK_BUYTBL_NUM primary key,
	userID char(8) not null constraint FK_BUYTBL_USERID foreign key references userTbl(userID),
	prodName nchar(6) not null,
	groupName nchar(4),
	price int not null,
	amount smallint not null
	);

-- �� �ֱ�

INSERT INTO userTbl VALUES('LSG', '�̽±�', 1987, '����', '011','1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '�����', 1979, '�泲', '011','2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '���ȣ', 1971, '����', '019','3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '������', 1950, '���', '011','4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '���ð�', 1979, '����', NULL ,NULL , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '�����', 1963, '����', '016','6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '������', 1969, '�泲', NULL ,NULL , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '������', 1972, '���', '011','8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '������', 1965, '���', '018','9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '�ٺ�Ŵ', 1973, '����', '010','0000000', 176, '2013-5-5');
GO
INSERT INTO buyTbl VALUES('KBS', '�ȭ', NULL , 30, 2);
INSERT INTO buyTbl VALUES('KBS', '��Ʈ��', '����', 1000, 1);
INSERT INTO buyTbl VALUES('JYP', '�����', '����', 200, 1);
INSERT INTO buyTbl VALUES('BBK', '�����', '����', 200, 5);
INSERT INTO buyTbl VALUES('KBS', 'û����', '�Ƿ�', 50, 3);
INSERT INTO buyTbl VALUES('BBK', '�޸�', '����', 80, 10);
INSERT INTO buyTbl VALUES('SSK', 'å' , '����', 15, 5);
INSERT INTO buyTbl VALUES('EJW', 'å' , '����', 15, 2);
INSERT INTO buyTbl VALUES('EJW', 'û����', '�Ƿ�', 50, 1);
INSERT INTO buyTbl VALUES('BBK', '�ȭ', NULL , 30, 2);
INSERT INTO buyTbl VALUES('EJW', 'å' , '����', 15, 1);
INSERT INTO buyTbl VALUES('BBK', '�ȭ', NULL , 30, 2);
GO


	--- IDENTITY : �ʱⰪ : 1 , ������ : 1�� �ڵ����� �ϴ� �÷�.		-- int : ������ ������ Ÿ������ ����, NOT NULL,		-- �Ϲ������� Primary Key <== Index�� �ڵ����� �����ǰ� �˻� ������ �Ѵ�.		-- IDENTITY Ű�� ����ִ� �÷��� ���� ������ �ȵ�.


	/*
	char		: MSSQL : �ѱ� 1�ڸ� 2byte , ������ �ڸ����� �ƴ� ��� , ������ ������
	nchar		: MSSQL : �ѱ��� ���ڼ� ��ŭ �Էµǵ��� ó����.

	varchar		: �ڸ����� �˼� ���� ��� , char���� ������.
	nvarchar
	*/

	create table testTbl(
		a char(4) ,			-- �ѱ� 2�� : 4byte
		b nchar(4) ,		-- �ѱ� 4�� : 8byte

		c varchar(6) ,		-- �ѱ� 3�� : 6byte
		d nvarchar(6) 		-- �ѱ� 6�� : 12byte
		);

		drop table testTbl ;

		insert into testTbl ( b)
		values ('�ѱ۵���' );

		select * from testTbl;

-- �� ���̺��� �� ���
select * from userTbl;
select * from buyTbl;

-- 11�� 40�б��� ���Ϲ߼�
--<����1>  JOIN�� ����ؼ� userID, �̸�, �ּ� , ���Ź�ǰ,��ǰ����,������ ����Ͻÿ�
select u.userID ���̵�,name �̸�,addr �ּ�,prodName ���Ź�ǰ,groupName ��ǰ����,price ����
from userTbl u join buyTbl b
on u.userID = b.userID


select u.userID ���̵�,name �̸�,addr �ּ�,prodName ���Ź�ǰ,groupName ��ǰ����,price ����
from userTbl u left join buyTbl b		-- INNER : ������ ����ڸ� ��Ī
on u.userID = b.userID
--���Ź�ǰ�� ���� ����ڵ� ��� ���

--<����2> ���Ź�ǰ ������ �׷����ؼ� ������ �հ� ,����� ���Ͻÿ� <JOIN�� ������� �ʰ� ���>
select sum(price) �����հ� , avg(price) �������, groupName ���Ź�ǰ����
from buyTbl
group by groupName


--<����3> �ּҺ��� ��ǰ ���� ������ ����Ͻÿ� <�� �÷��� �ٸ� ���̺� �����ϹǷ� JOIN �� �׷��� , ���Ű��� : amount>
-- MS SQL�� �Լ��� �׷����� �÷��� ó���� ��� �÷����� ��������. ��Ī�� ����ؾ���
select addr �ּ� ,sum(amount) ��ǰ���Ű���
from userTbl u, buyTbl b
where u.userID = b.userID
group by addr


select  sum(amount) ��ǰ���Ű��� , addr �ּ� , count(*) "�׷����� ��"
from userTbl u join buyTbl b
on u.userID = b.userID
group by addr

--<����4> �����̷��� ���� ����ڸ� ����Ͻÿ�
select u.userID,name
from userTbl u left join buyTbl b
on u.userID = b.userID
where price is null;

select userID ,count(*)
from buyTbl
where userID  in (select userID from userTbl)
group by userID

select userID 
from buyTbl
where userID  in (select userID from userTbl)

select userID
from userTbl
where userID not in (select userID from buyTbl)
group by userID

select u.userID ���̵�,name �̸�,addr �ּ�,prodName ���Ź�ǰ,groupName ��ǰ����,price ����
from userTbl u left join buyTbl b		-- left outer join : userTbl �� ��� ������ ���
on u.userID = b.userID
where prodName is null




create database myDB2;

<�ǽ�> user2 ������ ���� �� myDB2�� �����Ͽ� ���̺� ����, �� insert ,update,delete,drop table
		<sql ����> ���� ���� ����

