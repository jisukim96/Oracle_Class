
select * from employee;
/* employee 테이블에서 작업 ,select 문을 사용, where 조건을 사용하여 출력하시오
6시 20분까지 . 메일발송
*/

--<문제1> 컬럼 알리어스(별칭) , commission(보너스) 컬럼의 null인 값만 출력하되 사원번호, 사원이름,입사날짜를 출력하시오 
select eno 사원번호, ename 사원이름, hiredate 입사날짜
from employee
where commission is null;

--<문제2> dno(부서번호) 컬럼이 20이고, hiredate(입사날짜)가 81년4월 이후인 사원의 이름과 직책과 입사날짜를 출력하시오 
select ename 이름 ,job 직책, hiredate 입사날짜
from employee
where dno = 20 and hiredate >= '81/04/01';

--<문제3> 연봉을 계산해서 사원 번호,사원이름, 월급, 보너스, 전체 연봉을 출력하시오
select eno 사원번호 , ename 사원이름 , salary 월급 , commission 보너스 , (salary*12)+nvl(commission,0) as 전체연봉
from employee;

--<문제4> commission이 null이 아닌 사원의 이름만 출력하시오
select ename 사원이름 
from employee
where commission is not null;

--<문제5> MANAGER (직급상사) 7698인 사원 이름과 직책을 출력하시오
select ename 사원이름, job 직책
from employee
where MANAGER = 7698;

--<문제6> 월급이 1500 이상이고 , 부서번호가 20인 사원의 이름, 입사날짜,부서번호,월급을 출력하시오
select ename 사원이름 ,hiredate 입사날짜, dno 부서번호 , salary 월급
from employee
where salary >= 1500 and dno = 20;

--<문제7> 입사날짜가 81년 4월 1일부터, 81년 12월 말일까지 사원들의 이름과 입사날짜를 출력하시오
select ename 사원이름, hiredate 입사날짜
from employee
where hiredate >= '81/04/01' and hiredate <= '81/12/31';

--<문제8> job(직책)이 salesman이면서 연봉이 2000이상이면서 부서번호가 20인 사원 이름을 출력하시오
select ename 사원이름
from employee
where job = 'SALESMAN' and salary >= 1500 and dno = 30;

--<문제9> 월급이 1500이하이면서 부서번호가 20번이 아닌 사원이름과,월급,부서번호를 출력하시오
select ename 사원이름, salary 월급, dno 부서번호
from employee
where salary <= 1500 and dno != 20;

--<문제10>eno(사원번호)가 7788,7782인 사원의 부서번호와 이름, 직책을 출력하시오
select dno 부서번호 , ename 사원이름, job 직책
from employee
where eno = 7788 or eno = 7782;

desc employee;







