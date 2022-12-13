-- View , Index 

show user;
-- View 의 정보를 저장하는 데이터 사전
select * from user_vivews;
-- Index 정보를 저장하는 데이터 사전
select * from user_indexes;

/* VIEW : 가상의 테이블, 데이터가 저장되어있지 않다.
        -- 실제 테이블의 값을 select 하는 코드만 들어있다.
        -- 목적 : 1. 보안을 위해서 사용하는 경우 : 실제 테이블의 특정 컬럼을 숨겨서
                 2. 편의성을 위해서 사용하는 경우 : 복잡한 구문을 View로 만들어서 
                    JOIN 구문, 복잡한 구문
                    복잡한 구문이나 JOIN구문을 만들어 VIEW에 저장해서 select하여 사용
*/

-- View 실습을 위한 샘플 테이블 생성
create table emp100
as
select * from employee;

select * from emp100;

grant dba to C##HR; -- system에서 HR 권한 부여 , 프로그램 리부팅

-- VIEW 생성 : 
    -- 1. 보안을 위해서 사용하는 경우
    -- view는 실제 테이블의 주로 select 구문을 저장하고 있다.
    -- view는 가상의 테이블 , 데이터를 저장하고 있지 않다.
    -- 실제 테이블의 실행 코드만 들어있다.
        
-- 보안을 위해서 생성한 VIEW : 실제 테이블의 특정 컬럼을 출력하지 않을 수 있다.        
create view V_emp                       -- 함수 F_ , 테이블 T_ , 뷰 V_
as
select eno,ename,salary from employee; -- EX)ID,PASSWORD, ... 중에서 개인정보는 제외한 자료 (영업사원에게 전달)

-- View 를 실행 : select * from 뷰 명
select * from V_emp;

-- View 정보를 담은 데이터 사전
select * from user_views;

-- View 의 내용을 수정
create or replace view V_emp
as
(select * from employee);

-- View 삭제
drop view V_emp;

-- view 수정 : 주의 : Oracle에서는 Alter View가 없다.
    --create or replace view 구문을 사용
alter view V_EMP
as
(select eno, ename, dno from employee);

-- View 삭제
drop view V_emp;

    -- 2. 편의성을 위해서 view를 사용함 : 복잡한 JOIN구문을 VIEW로 생성하고
      -- VIEW를 select하면 된다.
-- 사원이름, 상사이름을 바로 출력하는 쿼리 : self 조인을 사용해서      
create view V_emp02
as
select e.ename 사원이름, m.ename 상사이름
from employee e, employee m
where e.manager = m.eno;

select * from user_views

-- view 실행
select * from V_emp02

-- 사원명, 월급, 부서번호, 부서명, 부서위치를 출력하는 view를 생성 : V_emp_dept
create or replace view V_emp_dept
as
select ename 사원명, salary 월급 , e.dno 부서번호 , dname 부서명 , loc 부서위치
from employee e , department d
where e.dno = d.dno

drop view V_emp_dept

select * from V_emp_dept

/*
    뷰의 처리 과정
        - view 는 가상의 테이블이고 , 값을 가지고 있지 않다. (select , Join)
        - 실행 쿼리만 가지고 있다. (select)
  
        1. user_views의 데이터 사전에서 뷰 이름에 대한 쿼리를 조회
        2. 접속한 계정이 실제 테이블에 접근할 수 있는 권한이 있는지 확인
        3. 각 테이블에 권한이 있으면 쿼리를 실행
        4. 검색 ( 값을 가지고 온다.)
        5. 출력
*/        

-- View를 사용해서 값을 넣을 수 있다.
    -- view에는 값이 저장되지 않는다. 코드만 존재함.
    -- 값은 실제 테이블에 저장됨.
    -- 실제 테이블의 제약 조건에 따라서 값이 저장될 수도 있고, 안될 수도 있다.

select * from emp100;       -- 테이블을 복사했으므로 제약 조건이 모두 빠져있다.

-- 테이블의 제약 조건을 확인하는 데이터 사전
select * from user_constraints
where table_name in ('EMP100');


-- view 생성
create or replace view v_emp10
as
select eno, ename, salary
from emp100;

-- view 출력
select * from v_emp10

-- view 값 넣기 : view에 값이 저장되는 것이 아니라 실제 테이블에 값이 저장됨.(emp100)
insert into v_emp10
values(8888,'KORNAN',6000);

commit;

-- view 에 값을 넣으면 실제 테이블에 값이 저장됨.
select * from emp100;

-- view 에 값을 저장할 때 실제 테이블에 저장이 되면서 실제 테이블에 제약조건에 따라서
    -- 값이 저장될 수도 있고, 그렇지 않을 수도 있다.

--view 를 사용해서 값을 삭제 (실제 테이블 : emp100)
delete v_emp10
where eno = 8888;
commit;

select * from emp100;

--alter table을 사용해서 hiredate 컬럼에 NOT NULL 제약조건 추가
    -- NOT NULL , Default 수정 할 때는 modify 수정할 컬럼 제약조건 제약조건이름 제약조건 default는 제약조건 입력안함.
alter table emp100
modify hiredate constraint EMP100_HIREDATE_NN not null ; -- nn,default > modify

select * from user_constraints
where table_name = 'EMP100';

-- 테이블에 제약 조건 위배로 view에서 값을 넣을 때 오류 발생
select * from v_emp10

-- 실제 테이블의 hiredate 컬럼 제약조건 위배 : NOT NULL [ORA-01400: NULL을 ("C##HR"."EMP100"."HIREDATE") 안에 삽입할 수 없습니다]
insert into v_emp10
values(9999,'KENDY',7000);

-- view를 사용해서 INSERT , UPDATE , DELETE할 때 실제 테이블의 제약 조건에 따라 달라진다.

/* 뷰 : 
        1. 단순뷰(simple view) : 하나의 테이블로 생성된 view
        2. 복합뷰(complex view) : 두개 이상의 테이블로 생성된 view
            - 뷰 내에서는 DISTINCT, 그룹함수(SUM,AVG,MAX,MIN) , Group by, ROWNUM 을 사용하지 못한다.
              - 단, 그룹함수를 사용할 경우 반드시 별칭이름을 사용하면 사용할 수 있다
*/

-- ROWNUM : 레코드의 숫자를 출력해줌 , ROW의 넘버를 출력
    -- MS-SQL , MYSQL : TOP n
    
-- 출력중에 10개만 출력해라   <<=== 레코드가 많을 때 조건을 사용해서 출력
select rownum , eno , ename, salary
from employee
where rownum <= 10;

-- 중복된 값 제거 : 직급의 종류
select distinct job from employee;

create or replace job from employee;

-- view 내부에 rownum 컬럼 때문에 << 오류발생 >> [ORA-00998: 이 식은 열의 별명과 함께 지정해야 합니다]
create or replace view v_emp30
as
select rownum , eno,ename from emp100;

-- view 내부에 rownum 컬럼에 별칭이름을 사용할 경우 사용가능
create or replace view v_emp30
as
select rownum 행번호, eno,ename from emp100;

select * from v_emp30;

drop view v_emp30;

-- view 내부에 Distinct는 별칭이름 없이 잘 생성됨.<Oracle21C 버전에서 잘 생성됨>
create or replace view v_emp31
as
select distinct job from emp100;

select * from v_emp31

--View 내부에서 그룹 함수를 사용했을 때 : SUM,AVG,MAX,MIN,COUNT(*) 함수를 사용하면 컬럼이름 없어짐 > 별칭 사용해야함.
    -- 오류발생 [ORA-00998: 이 식은 열의 별명과 함께 지정해야 합니다] 별칭 이름을 사용해서 view를 생성해야 한다.
create or replace view v_emp32
as
select sum(salary),round(avg(salary)),max(salary),min(salary)
from emp100;

-- view에서 그룹함수 사용시 별칭이름을 부여해서 사용 : 오류가 발생되지 않는다.
create or replace view v_emp32
as
select SUM(salary) 합계,round(avg(salary)) 평균 ,max(salary) 최대값 ,min(salary) 최소값
from emp100;

-- view 내부에서 group by를 사용할 경우 : 별칭이름을 사용하지 않아서 오류 발생 [ORA-00998: 이 식은 열의 별명과 함께 지정해야 합니다]
-- 각 부서별로 월급의 합계 , 평균, 최대값, 최소값, count(*)
create or replace view v_emp33
as
select dno,SUM(salary) ,round(avg(salary),2)  ,max(salary)  ,min(salary) ,count(*)
from emp100
group by dno        -- 부서별로 동일한 값을 그룹핑해서 출력

-- view 내부에서 group by를 사용할 경우 : 별칭이름을 사용하면 오류 발생되지 않음
create or replace view v_emp33
as
select dno,SUM(salary) 부서별합계 ,round(avg(salary),2) 부서별평균 ,
            max(salary) 부서별최대값 ,min(salary) 부서별최소값 ,count(*) 그룹된개수
from emp100
group by dno 

/*
    뷰 생성 시 옵션 사용
        - force 옵션 : 기존 테이블 생성 유무에 상관없이 뷰를 생성하게 됨.
        - noforce 옵션 : 반드시 기존 테이블이 존재해야만 생성 가능 <<기본값>>
*/

create or replace view v_emp34
as 
select * from emp101;   -- emp101 테이블은 존재하지 않으므로 뷰 생성 시 오류


-- force 옵션을 사용해서 해당 테이블이 존재하지 않더라도 강제로 생성
    -- 해당 테이블은 나중에 만들 수 있다.
create or replace force view v_emp34
as
select * from emp101;

select * from user_views

-- view 생성 이후에 테이블 생성
create table emp101
as
select * from employee;


select * from v_emp34;


---------------------------------------------------------
/*
    index (인덱스,색인) : 테이블의 컬럼에 검색을 빠르게 하기위해 컬럼에 index를 생성
        - select 를 빠르게 하기 위해서 사용
        - 테이블 스캔 : 검색할 내용을 첫 레코드부터 마지막 레코드까지 순차적으로 검색 (where 절)
            - 검색할 내용을 찾기 위해서 책의 첫창부터 마지막 장까지 검색
            index가 생성되어있지 않는 컬럼의 내용을 검색할 때는 테이블 스캔을 한다. 
        - index 정보를 사용한 스캔 : 검색이 빠르다
            - index를 사용해서 정보를 검색
            - 책의 색인, 목차(index)
              
    자주 검색에서 사용되는 컬럼은 index를 생성해서 검색을 빠르게 한다.
        where 절에서 사용되는 컬럼
        JOIN 할 때 ON절에서 사용되는 컬럼
        
        테이블의 Primary Key,Unique 컬럼은 자동으로 Index가 생성됨.
        
        테이블의 index 정보를 출력하는 데이터 사전
        select * from user_indexes
            where table_name in ('EMPLOYEE','DEPARTMENT');
        select * from user_columns
            where table_name in ('EMPLOYEE','DEPARTMENT');
        select* from user_ind_columns 어느 컬럼에 인덱스가 들어가 있는지 확인
            where table_name in ('EMPLOYEE','DEPARTMENT');
        
*/            

-- ename 컬럼은 index가 생성되지 않아서 테이블 스캔을 한다.
select * from employee
where ename = 'KING';

select* from user_ind_columns 
    where table_name in ('TBL1','TBL2');

-- index 자동 생성되는 컬럼 : Primary Key,Unique 컬럼은 자동으로 index 생성됨
create table tbl1 (
    a number(4) constraints tbl1_a_PK primary key,
    b number(4) ,
    c number(4) 
    );

create table tbl2 (
    a number(4) constraints tbl2_a_PK primary key,
    b number(4) constraints tbl2_b_UK unique ,
    c number(4) constraints tbl2_c_uk unique
    )

-- 특정 컬럼에 index 부여하기 , where 절 , JOIN 시 ON 절에서 사용되는 컬럼.
select * from employee;

/* employee table의 ename 컬럼은 검색을 자주 사용한다. 레코드가 10만개 존재한다.
    - 컬럼에 index를 생성하면 컬럼의 값을 가지고 index page를 생성한다.
    - 부하가 굉장히 많이 걸리는 작업이다. 야간에 index를 생성해야 한다.

    - DBA 과정에서 전문적으로 다룬다.
        - index는 DBMS를 잘 이해하고 잘 생성해야한다.
        - index는 잘못 만들면 오히려 성능이 떨어진다.
        - 주기적으로 index 정보를 업데이트 해야한다. (insert , update,delete)
            - 값들이 주기적으로 변경된다면 rebuild가 필요하다.
            
*/    
-- index가 테이블의 어떤 컬럼에 index가 생성되었는지 확인
select * from user_ind_columns
where table_name = 'EMPLOYEE';

-- index의 자세한 정보를 출력
select * from user_indexes
where table_name = 'EMPLOYEE';

-- employee 테이블의 ename 컬럼에 index 생성
create index idx_employee_ename
on employee(ename);

/* index는 생성 후 지속적인 관리가 필요함.
    employee 테이블의 ename 컬럼에 index를 생성함.
        - ename 컬럼에 insert , update , delete가 빈번하게 일어날 경우 index 페이지가 조각남.
        - 테이블 값이 계속 변경되면 주기적으로 rebuild 해줘야 함. (index 패이지를 업데이트 해야함)
*/

-- 생성된 index 정보를 새로이 업데이트
alter index idx_employee_ename rebuild; 
    -- ename 컬럼의 수정된 정보를 index 페이지에 새로이 업데이트

select * from employee;

-- employee 테이블에서 job 컬럼을 빈번하게 검색된다.
create index idx_employee_job
on employee(job);

-- employee 테이블에 job 컬럼이 빈번하게 값이 (update,delete,insert)
    -- 주기적으로 수정될 경우 업데이트가 필요함. : 1주, 한달 한 번씩
    -- 레코드가 적을 때는 index를 생성할 필요없고, 10만건 이상이 되면 테이블 스캔으로 검색하는데 
        -- 시간이 오래걸릴 경우 index 생성의 필요성이 있다.
alter index idx_employee_job rebuild;

-- index 정보 출력
select* from user_ind_columns
where table_name = 'EMPLOYEE';

-- 생성된 index 삭제
drop index idx_employee_ename;

drop index idx_employee_job;



/* ERD (Entity Relationship Diagram) : 데이터 베이스 모델링, 설계도
    - 테이블과 테이블의 관계
        - ER-WIN : 전 세계적으로 제일 많이 사용한 모델링 툴
 
 모델링                                                        | Oracle
 ========================================================================
 1. 요구 사항 분석 ==> 2. 논리적 모델링 ==> 3. 물리적 모델링 ==> 4. 구현   : (50%)

 1. 요구 사항 분석 : 업무 파악 우선, 고객의 협의, 프로젝트의 범위를 지정. (비용,기간) < ===
            테이블, 각 테이블의 속성 , 테이블간의 관계 
            
            DB 설계 ====> APP 개발
 
 2. 논리적 모델링 (한글로 적용)
        엔티티 ( 논리적 모델링 ): 테이블 ( 물리적 모델링 )
        속성 ( 논리적 모델링 ) : 컬럼 ( 물리적 모델링 )
        관계 =  1 : 1 관계 , 1 : 다수 , 다수 : 다수

 3. 물리적 모델링 ( 영문으로 테이블명, 컬럼명, 컬럼의 자료형을 적용, 테이블간의 관계)
 
 4. 구현 (Oracle) <== 물리적 모델링을 기반으로 테이블 생성
 
*/
