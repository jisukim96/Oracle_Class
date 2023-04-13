-- 데이터 베이스 생성 , 사용, 삭제

create database mydb2;

show databases;

use mydb2;

create table test1 (
	a int not null primary key,
	b char(5) null,
    c varchar(10)
    );

insert into test1 values (1, 'a', 'b');

select * from test1;

-- 트랜잭션 시작
start transaction ;
insert into test1 values (3,'a','b');
rollback;
commit;
-- ------------------------------------
-- 한 라인 주석
-- MSSQL , developer에서는 --에 붙여 적어도 주석 처리됨.
-- MySQL은 붙이면 주석 처리 안됨. 세미콜론 없으면 다음 실행구문에서 오류 발생.
/*
	여러 줄 주석
*/

CREATE TABLE DEPARTMENT(
	DNO INT  PRIMARY KEY , -- 컬럼에 제약조건 이름을 생략하고 넣을 수 있다.
    DNAME VARCHAR(14),
	LOC   VARCHAR(13) 
	) ;


CREATE TABLE EMPLOYEE (
	 ENO INT ,
		CONSTRAINT PK_EMPLOYEE_ENO PRIMARY KEY (eno),
	 ENAME VARCHAR(10),
 	 JOB   VARCHAR(9),
	 MANAGER  INT,
	 HIREDATE DATE,
	 SALARY FLOAT,
	 COMMISSION FLOAT,
	 DNO INT ,
		CONSTRAINT FK_EMPLOYEE_DNO FOREIGN KEY (dno) REFERENCES DEPARTMENT(DNO)
	 );

INSERT INTO DEPARTMENT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPARTMENT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPARTMENT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPARTMENT VALUES (40,'OPERATIONS','BOSTON');


-- select * from department;

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

select * from employee;

/* select 구문
	select 컬럼명 별칭이름 
    from 테이블명 또는 뷰 명
	group by 컬럼명
    having 조건 <-- 그룹핑한 결과에 대한 조건
    order by 컬럼명 <-- 정렬할 컬럼명
*/

select eno as 사원번호, ename 사원명, salary 월급
from employee
order by salary asc;

-- 집계 함수 사용
select sum(salary), avg(salary), max(salary), min(salary),count(*),dno
from employee
group by dno
having avg(salary) >= 2000
order by dno desc;

-- JOIN 두 테이블 조인 ( INNER JOIN )
select eno , ename , e.dno, dname, loc 
from employee e JOIN department d
on e.dno = d.dno;

-- SELF JOIN
-- 사원이름에 대한 상사번호 출력

select e.ename, m.ename
from employee e join employee m
on e.manager = m.eno;

create table userTbl (	-- < 회원테이블 > --
	userID char(8) NOT NULL ,
		constraint PK_USERTBL_USERID primary key (userID),	-- 사용자 ID
	name nvarchar(10) NOT NULL,	-- 이름
	birthYear int NOT NULL,		-- 생일의 년도 , int : 4byte
	addr nchar(3) NOT NULL,		-- 주소(경기,서울, 경남 3글자까지 입력)
	mobile1 char(3) ,			-- 핸드폰 (010. )
	mobile2 char(8),			-- 핸드폰 뒷자리 8자리
	height smallint,			-- 키
	mDate date					-- 날짜(회원가입일)
	);

select * from usertbl;

-- IDENTITY : MS SQL 의 자동증가 컬럼, identity (1,1)
-- Auto_increment : My SQL의 자동증가 컬럼

create table buyTbl (	-- < 구매 테이블 > --
	num int auto_increment not null,
		constraint PK_BUYTBL_NUM primary key (num),
	userID char(8) not null ,
		constraint FK_BUYTBL_USERID foreign key (userID) references userTbl(userID),
	prodName nchar(6) not null,
	groupName nchar(4),
	price int not null,
	amount smallint not null
	);

select * from buyTbl;

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011','1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011','2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019','3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011','4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL ,NULL , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016','6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL ,NULL , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '011','8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018','9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010','0000000', 176, '2013-5-5');

INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	VALUES('KBS', '운동화', NULL , 30, 2);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('JYP', '모니터', '전자', 200, 1);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('BBK', '모니터', '전자', 200, 5);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('KBS', '청바지', '의류', 50, 3);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('BBK', '메모리', '전자', 80, 10);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('SSK', '책' , '서적', 15, 5);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('EJW', '책' , '서적', 15, 2);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('EJW', '청바지', '의류', 50, 1);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('BBK', '운동화', NULL , 30, 2);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('EJW', '책' , '서적', 15, 1);
INSERT INTO buyTbl (userID,prodName,groupName,price,amount)
	 VALUES('BBK', '운동화', NULL , 30, 2);

select * from userTbl;
select * from buyTbl;

-- JOIN ( INNER JOIN ) , group by
-- 이름, 생일, 구매물품, 가격, 구매개수를 출력
select name,birthyear,prodName,price,amount
from userTbl u inner join buyTbl b
on u.userID = b.userID;

-- 구매물품별 총 구매액(금액 * 구매수량) 을 출력 
select prodName 구매물품 , sum((price*amount)) as "구매물품별 총 구매액"
from buyTbl
group by prodName;

-- 물품구매액이 가장 많은 사용자
select name 사용자 , sum(price*amount) as 물품구매액
from userTbl u join buyTbl b
on u.userID = b.userID
group by u.userID
having sum(price*amount) >=all (select sum(price*amount) from buyTbl group by userID);


-- 물품을 구매하지 않은 사용자 (left join)
select userID 아이디 , name 사용자
from userTbl
where userID not in (select userID from buyTbl);