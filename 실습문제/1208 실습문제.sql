-- 복사한 테이블
select * from emp;
desc emp
1. 레코드 3개의 값 입력 , 모든 값 입력, null 이 허용된 컬럼에 null 넣기 (insert)
insert into emp 
values (1234,'Mile','CLERK',1234,'21/12/25',3000,500,30)

insert into emp 
values (2345,'ACE','CLERK',1234,'20/12/25',2000,800,30)

insert into emp (ENAME,JOB,MANAGER,HIREDATE,SALARY,COMMISSION,DNO)
values ('RUPI','ANALYST',1234,'21/12/25',3050,200,20)

2. update를 사용해서 데이터 수정 , SCOTT의 보너스를 500으로 수정
update emp
set commission = 500
where ename = 'SCOTT';

    영업사원들의 보너스를 300으로 수정
update emp
set commission = 300
where job = 'SALESMAN'

    WARD의 부서를 10번으로 수정
update emp
set dno = 10
where ename = 'WARD'

    ALLEN의 manager 를 7839로,월급을 1800으로 , 입사일을 22/01/01로 수정
update emp
set manager = 7839 , salary = 1800 , hiredate = '22/01/01'
where ename = 'ALLEN'

3. delete : eno 7782 와 eno 7698 의 레코드를 삭제
delete emp
where eno = 7698 or eno = 7782

delete emp
where eno in (7698, 7782)