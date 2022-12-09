/*
    SQL (Structured Query Language) : 구조화된 질의 언어 , (시퀄)
        select 컬럼
        from 테이블명 , 뷰명
        where 조건
        group by 그룹핑할 컬럼명
        having group by에서 나온 결과에 대한 조건
        order by 정렬할 컬럼
        
    DDL(Data Definition Language) : 데이터 질의 언어 , 객체를 생성 , 수정 , 삭제
            객체(OBJECT) - Table , view , Function , Index , Store Procudure , Triger, USER , ...
        CREATE(생성) , ALTER(수정) , DROP(삭제)
        RENAME(객체이름변경) , TRUNCATE(레코드 삭제)
    DML (Data Manipulation Language) : 데이터 조작 언어, 레코드를 생성, 수정, 삭제
        INSERT (생성), UPDATE(수정), DELETE(삭제)
        -- 트랜젝션을 발생시킴. commit(DB에 영구저장) , rollback (원래 상태로 되돌림)
    DCL (Data Control Language) : 데이터 제어 언어 , 계정에 권한을 부여 , 삭제할 때 사용
        GRANT(권한을 부여) , REVOKE(권한 회수)
    
    DQL (Data Query Language) : 데이터 질의 언어 (출력 시) :SELECT
    DTL ((Data Transaction Control Language) : 트랜젝션 제어 언어
        BEGIN TRANSACTION   <== 트랜잭션 시작 ( INSERT , UPDATE , DELETE <== DML )
        
        COMMIT      <== 트랜잭션을 종료 ( DataBase에 영구저장)
        ROLLBACK    <== 트랜잭션을 종료 ( 원래 상태로 되돌림, 트랜잭션 시작 전 상태로 되돌림)
        SAVEPOINT ( 트랜젝션 내의 임시 저장 시점 설정)
*/

-- 테이블 생성 ( Create Table )

Create Table dept (                 -- 생성할 테이블 명
    dno number(2) not null,         -- 컬럼명 자료형 NULL 허용여부 2자리까지만 넣을 수 있다. NULL을 넣을 수 없다.
    dname varchar(4) not null,      -- 4자리까지(4byte) 넣을 수 있다. NULL을 넣을 수 없다.
    loc varchar2(13) null           -- 13자리 가능, NULL 넣을 수 있음.
    );

-- 테이블 구조 확인
desc dept;

-- 테이블에 값 넣기 INSERT INTO 테이블명 (명시할 컬럼명) values (넣을 값);
    -- BEGIN TRANSACTION     <== 트랜 잭션이 자동 시작
Begin TRANSACTION
insert into dept (dno,dname,loc) 
values (10,'ACCO','SEOUL');     --메모리(RAM)에만 변경된 데이터

commit ;                        -- DataBase에 영구적으로 저장(실제 DB에 변경 저장)
rollback;                       -- 트랜잭션 시작시점으로 되돌아감 (DB에는 값이 있고 메모리는 날아감)

-- 데이터 검색하기
select * from dept;

/* 트랜잭션 (TRANSACTION) : 작업(일)을 처리하는 최소 단위
    DML(Insert, Update,Delete 문을 사용하면 자동으로 트랜잭션이 시작됨  
    트랜잭션을 종료하지 않으면 외부에서 다른 사용자가 접근을 못함 (LOCK이 걸림)
    트랜잭션 종료
        commit : DB에 영구저장
        rollback : 원래 상태로 되돌림
        
    트랜젝션의 4가지 특징
        원자성(Atomicy) : 여러 구문을 하나의 작업 단위로 처리됨
        일관성(Consistency) : 트랜잭션에서 처리한 결과는 일관성을 가져야한다.
        독립성(Isolation) : 하나의 트랜잭션이 처리되기 전까지는 다른 트랜잭션과 격리
        지속성(Durability) : commit된 트랜잭션은 DB에 영구적으로 저장됨
*/

select * from dept;

-- 컬럼과 값의 순서가 맞아야 한다.
insert into dept (dno,loc,dname)
values(20,'BUSAN','SALE');

-- 컬럼명을 생략하여 값 넣기, 모든 컬럼에 값을 넣어줘야 한다.
insert into dept
values (30,'abc','Daegu');

select * from dept;
desc dept;

--암시적으로 NULL이 들어감 < == 컬럼을 선택하지 않을 때
insert into dept (dno , dname)
values (30,'abc');

--명시적으로 NULL 넣기 컬럼을 명시하지 않았기 때문에 순서대로 값을 넣어야 함.
insert into dept
values(40,'bcd',null);

commit;

-- 회원 정보를 저장하는 테이블 생성
create table member (
    id varchar2(50) not null primary key , 
    pass varchar2(50) not null ,
    addr varchar2(100) null ,
    phone varchar(30) null ,
    age number(3) not null , 
    weight number (5,2) not null
    );

/* 제약 조건 : 데이터의 무결성을 확보하기 위해서 테이블의 컬럼에 부여
            - 무결성 : 오류없는 데이터 , 원하는 데이터
   
    -foreign key
     Primary key : 테이블에서 하나만 존재할  수 있음.
      -  primary key 가 적용된 컬럼은 중복된 값을 넣을 수 없다.
      -  데이터를 수정할 때, 삭제할 때 조건을 사용하는 컬럼.
      -  인덱스가 자동으로 생성된다. <== 검색을 빠르게 할 때 사용됨.
      -  NULL을 넣을 수 없다.
        
    Unique : 중복된 값을 넣을 수 없다. 테이블에서 여러번 넣을 수 있다.
      -  NULL을 넣을 수 있다. 한번만 넣을 수 있다.
      -  인덱스가 자동으로 생성된다. <== 검색을 빠르게 함.
        
    check : 값을 넣을 때 체크해서 값을 넣는다.
    
    NOT NULL : 컬럼에 NULL을 넣을 수 없다.
        
*/
select * from user_constraints; -- 현재 접속한 계정에서 생성된 객체의 모든 제약 조건을 확인
-- R : foreign key 의 'r'eferences

-- 원하는 테이블의 제약조건 확인
select * from user_constraints
where table_name = 'EMPLOYEE';

desc member;

insert into member (id,pass,addr,phone,age,weight)
values ('cccc','1234','서울 종로구','010-1111-1111',20,20.55);

select * from member

-- null 허용 컬럼에 null 넣기
desc member;

insert into member
values ('dddd','1234',null,null,30,70.557);

commit;

insert into member (pass,age,weight,id)
values('1234',30,88.888,'eee');

/* 수정 (UPDATE)  <<=== 반드시 where 절을 사용해서 수정해야함.
        where 절에 사용되는 컬럼은 중복되지 않는 컬럼을 사용해서 수정 : Primary key, Unique
        update 테이블명
        set 컬럼명 = 바꿀값, 컬럼명 = 바꿀값
        where 조건
*/

select * from member ;

update member
set phone = '010-2222-2222',age=55,weight=90.55  -- 모든 컬럼이 해당 데이터로 변경됨
where id = 'bbbb'                                -- 조건

commit;

rollback;

--update 시 중복되는 값의 컬럼을 조건으로 준 경우
update member
set phone = '010-3333-3333', age = 80
where pass ='1234'

rollback;

--update 시 중복되지 않는 값의 컬럼을 조건으로 준 경우
update member
set phone = '010-3333-3333',age = 80
where id = 'eee';

commit;

-- delete : 반드시 where 조건을 사용해야 한다. 조건없이 삭제하면 모든 데이터가 삭제됨.
        -- 중복되지 않는 컬럼을 조건에 적용 : primary key , unique
select * from member;

delete member;

rollback;

delete member
where id = 'cccc'

commit;

-- 테이블 복사 ( EMP )
create table emp
as
select * from employee;

-- 복사한 테이블
select * from emp;
desc emp;

/* Unique 제약 조건 : 중복된 데이터를 넣을 수 없다.
    NULL을 넣을 수 있다. 한 번만 넣을 수 있다.
    테이블에 특정 컬럼에 여러번 넣을 수 있다.
    인덱스를 자동으로 생성한다. <== 검색을 아주 빠르게 함.
    JOIN시 ON절 , WHERE 조건
*/

create table customer1 (
    id varchar(20) not null primary key,     -- null => 오류발생 , primary key : not null
    pass varchar(20) not null unique,    -- 중복되지 않는 컬럼 중복되면 인서트되지 않음
    name varchar(20) null unique,        -- null 허용, 테이블에 여러번 넣을 수 있다.
    phone varchar(20) null unique,
    addr varchar(20) null
    );
desc customer1;

insert into customer1 (id,pass,name,phone,addr)
values ('bbb','12345','홍길동2','010-1111-1112','서울 종로');

select * from customer1;

-- 제약 조건 확인하기
select * from user_constraints
where table_name = 'CUSTOMER1';

-- check 제약 조건 : 값을 컬럼에 넣을 때 체크해서 값을 넣는다.

-- 테이블 생성시 제약조건의 이름을 부여하면서 테이블 생성
-- 제약 조건 이름 생성 규칙 : 테이블이름_컬럼명_제약조건유형
create table emp3 (
    eno number(4) constraint emp3_eno_PK primary key, -- 제약조건 이름 생성
    ename varchar2 (10),
    salary number(7,2) constraint emp3_salary_CK check(salary > 0)
    );

-- emp3 테이블에 할당된 제약 조건 확인하기
select * from user_constraints
where table_name = 'EMP3';

insert into emp3 (eno,ename,salary)
values(1111,'SMITH',10);

select * from emp3;

create table emp4 (
    eno number(4) constraint emp4_eno_PK primary key, -- 제약조건 이름 생성
    ename varchar2 (10),
    salary number(7,2) constraint emp4_salary_CK check(salary > 0 ),
    dno number(2) constraint emp4_dno_CK check(dno in (10,20,30,40))
    );

insert into emp4
values ( 3333,'scott',300,20);

select * from emp4;
commit;

select * from user_constraints
where table_name = 'EMP4';

-- FOREIGN KEY (참조키) : 다른테이블(부모)의 Primary key, Unique 컬럼을 참조해서 값을 할당

select * from employee;     --dno : FK(department 테이블의 dno 를 참조)

select * from department;  -- 부모 , dno

insert into employee
values (8888,'aaaa','aaaa',7788,'22/12/08',6000,null,40);

rollback;

-- 부모 테이블 생성 : Foreign key가 참조하는 컬럼은 Primary key,Unique 키컬럼을 참조함.
create table ParentTbl(
    name varchar2 (20) ,
    age number(3) constraint ParentTbl_age_CK check( age > 0 and age < 200),
    gender varchar2(3) constraint ParentTbl_gender_CK check (gender IN ('M','W')),
    infono number constraint ParentTbl_infono_PK Primary key
    );
    
create table ChildTbl(
    id varchar2(40) constraint ChildTbl_id_PK Primary key,
    pw varchar2(40) ,
    infono number ,
    constraint ChildTbl_infono_FK foreign key(infono) references ParentTbl(infono) --FK:부모테이블의 infono 참조
);

-- 부모테이블에 값 넣기
insert into ParentTbl values ('홍길동',30,'M',1);
insert into ParentTbl values ('김똘똘',20,'M',2);
insert into ParentTbl values ('원빈',25,'M',3);
insert into ParentTbl values ('홍길순',40,'W',4);

select * from ParentTbl;

-- 자식 테이블에 값 넣기
insert into ChildTbl values ('aaa','1234',1);
insert into ChildTbl values ('bbb','1234',2);
insert into ChildTbl values ('ccc','1234',3);
insert into ChildTbl values ('ddd','1234',4);

select * from ChildTbl;

-- default : 컬럼의 값을 넣지 않을 때 default로 설정된 값이 기본적으로 들어간다.
    -- 제약 조건은 아니어서 제약조건이름을 할당할 수 없다.
    

create table emp5 (
    eno number (4) constraint emp5_eno_PK primary key,
    ename varchar2(10),
    salary number (7,2) default 1000    -- 값을 넣지 않으면 default 로 설정된 값이 들어감.
    );

insert into emp5 (eno,ename,salary) values(1111,'aaaa',1000);    

insert into emp5 (eno,ename,salary) values(2222,'aaaa',5000);

insert into emp5 (eno,ename,salary) values(3333,'aaaa',default);

insert into emp5 (eno,ename) values(4444,'aaaa');
commit;

select * from emp5;
drop table member;
































