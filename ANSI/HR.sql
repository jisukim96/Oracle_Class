
-- ��� ���̺� ����ϱ�
select * from tab;

-- ���̺��� ���� Ȯ���ϱ�
    -- select : ����ϱ�
    /*
        select + �÷��� (* ��� �÷�)
        from ���̺��̸�
    */
-- 1. employee ���̺��� ��� �÷��� ����϶�.
    -- �ٷ���(�����) �� ���� ������ �����ϴ� ���̺�
select *
from employee;

-- 2. department ���̺��� ��� �÷��� ����϶�.
    -- �μ��� ���� ������ �����ϴ� ���̺�
select * 
from department;

-- 3. salgrade ���̺��� ��� �÷�(�ʵ�, ��ƼƼ)�� ����϶�.
    -- �Ǹ� ������ �����ϴ� ���̺�
select *
from salgrade;


-- ========================================================
-- �� ���̺��� ������ �÷� ����
-- 1. employee ���̺�
select * from employee;
/*
  ENO : �����ȣ
  ENAME : �����
  JOB : ��å
  MANAGER : ���(���)�� �����ȣ
  HIREDATE : �Ի���
  SALARY : ����
  COMMISSION : ���ʽ�
  DNO : �μ���ȣ
*/

-- 2. �μ������� �����ϴ� ���̺�
select * from department;
/*
    DNO : �μ���ȣ
    DNAME : �μ���
    LOC : �μ��� ��ġ
*/

-- 3. ������ ������ �����ϴ� ���̺�
select * from salgrade;
/*
    GRADE : ����  <-- ������ ���� : 
    LOSAL : ���� ���� ���� 
    HISAL : ���� ���� ����
*/    
    
-----------------------------------------
-- select : ����϶�
-- �÷���, �ʵ�, ��ƼƼ 
-- ���ڵ� : �� �÷��� �� ��, 1���� ����
-- ���ڵ� �� : ���ڵ���� ����, ���� ���� ����
select * 
from employee;
    
-- Ư�� �÷��� ����ϱ�
select eno
from employee;
    
-- Ư�� �÷� ������ ����ϱ� (�ϳ��� �÷��� ���� ��� ,(�޸�) �� ����)
select eno,ename,salary
from employee;

-- ��� �÷� ����ϱ� 
select eno,eno,eno,ename,job,manager,hiredate,salary,commission,dno
from employee;
    
-- Ư�� �÷��� ��� �� ������ ����ϱ�    
select eno, ename,salary,ename,ename
from employee;
    
-- ���̺��� ���� Ȯ���ϱ� : ���̺��� �÷����� Ȯ��
DESCRIBE employee;
desc employee;

-- �÷��� ��Ī���� ����ϱ� (�÷��� as ��Ī, as ��������)
select eno  �����ȣ, ename  �����, job as ��å
from employee;

-- employee ���̺��� ��� �÷��� ��Ī���� ����ϱ�
select eno �����ȣ, ename �����, job ��å , manager �����ȣ , 
hiredate �Ի��� , salary "��#��" , commission ���ʽ�,dno "�μ� ��ȣ"
from employee;

-- ������ ����Ͽ� ����ϱ� : Where

select *
from employee
where eno = 7499; --������ ����ؼ� ����� ���, eno �÷��� ���� 7499�� ���

desc employee;      --employee ���̺��� ������ Ȯ��

-- ���� ����� �� number ������ Ÿ���� ���� '' ���� ���
--       number �̿��� ������ Ÿ���� ���� '' �� ���� ��� : char , varchar,date

select * from employee
where job = 'MANAGER' ; -- job(varchar2), ���� ������ ���� �ݵ�� ��ҹ��� �����ؾ� ��.

desc employee;

select * from employee

-- �μ���ȣ�� 20���� ��� �÷��� ����Ͽ���.
select * from employee
where dno = 20;

--< ���� >
-- salary (����)2000 �̻��� ����ڸ� ��� �÷� ���.
-- �̸��� CLARK�� ������� ���޸� ���
-- ��� ��ȣ(eno)�� 7788�� ������� �̸��� �Ի糯¥ ���   <== �÷� �̸��� ��Ī���� ���

--������ ���� Ȯ��
desc employee;

select *
from employee
where salary >= 2000;

select salary as ���� , ename as �̸� , eno �����ȣ
from employee
where ename = 'CLARK';

select ename �̸�,hiredate �Ի糯¥
from employee
where eno = 7788;

/*
--- select ���� ��ü ���� ---
select -- �÷��� : * (��� �÷�)
distinct -- �ߺ��� ���� �����Ͽ� ��� (��������)
from   -- ���̺��, ���̸�
where  -- ����
group by -- �÷��� :  Ư�� �÷��� ������ ���� �׷�ȭ
Having -- group by ���� ���� ����� ���� ó��
Order by -- ���Ŀ��� ����� �÷� , asc : �������� ���� , desc :  �������� ����
*/

select * from employee;

select distinct dno �μ���ȣ    
    -- distinct �ߺ��� ���� ���� �� ���, �ٸ� �÷��� ���ÿ� �۵��ϸ� ���� �߻�
from employee;

select distinct dno -- �ߺ��� ������ �÷� 1���� ���
from employee;

-- �÷��� ������ ���� : �÷����� ������, alias(��Ī)�ؼ� ���
select eno,ename,salary ����, salary*12 as ����, commission ���ʽ�
from employee;

-- ��ü ���� ���ϱ� : ���� * 12 + ���ʽ�  = ��ü ����
--null �÷��� ����(+,-,*,/)�� �ϰ� �Ǹ� ��ü�� null
--commission �� �� null ����. null + @ = null
select eno , ename , salary, commission , salary *12 as ����, (salary *12)+commission as ��ü����
from employee;

-- ��ü ������ ����� �� null�� �� �÷��� 0���� ���� �� ������ �����ؾ� �Ѵ�.
    -- nvl �Լ�: null�� �� �÷��� �ٸ� ������ ��ȯ�ؼ� ó�����ִ� �Լ�
    -- bvl(commission,0) <== commission�÷��� null�� 0���� �����ؼ� ó���ض�
    
select eno , ename , salary, commission , salary *12 as ����, (salary *12)+nvl(commission,0) as ��ü����
from employee;

--- null�� �� �÷��� ����ϱ� <����>
    -- null�� �˻��� ���� is�� ���, = �� ����ϸ� ������. 

select *
from employee
where commission is null;   -- null �� ��
    
select *
from employee
where commission is not null;   -- null �ȵ� ��    
    
-- where ���ǿ��� and , or ����ϱ�
-- �μ���ȣ�� 20���� 30���� ��� �÷� ���
select *
from employee
where dno = 20 or dno = 30;
    
-- �μ���ȣ 20���̰ų� ���� 2000�̻�
select *
from employee
where dno = 20 or salary >= 2000;

--�μ���ȣ�� 20�� �̰�, ���� 1500����
select *
from employee
where dno = 20 and salary <= 1500;

--job(��å)�� manager�̸鼭 ������ 2000�̻��� ����ڸ� ���
select *
from employee
where job = 'MANAGER' and salary >= 2000;



select * from employee;
/* employee ���̺��� �۾� ,select ���� ���, where ������ ����Ͽ� ����Ͻÿ�
6�� 20�б��� . ���Ϲ߼�
*/

--<����1> �÷� �˸��(��Ī) , commission(���ʽ�) �÷��� null�� ���� ����ϵ� �����ȣ, ����̸�,�Ի糯¥�� ����Ͻÿ� 
select eno �����ȣ, ename ����̸�, hiredate �Ի糯¥
from employee
where commission is null;

--<����2> dno(�μ���ȣ) �÷��� 20�̰�, hiredate(�Ի糯¥)�� 81��4�� ������ ����� �̸��� ��å�� �Ի糯¥�� ����Ͻÿ� 
select ename �̸� ,job ��å, hiredate �Ի糯¥
from employee
where dno = 20 and hiredate >= '81/04/01';

--<����3> ������ ����ؼ� ��� ��ȣ,����̸�, ����, ���ʽ�, ��ü ������ ����Ͻÿ�
select eno �����ȣ , ename ����̸� , salary ���� , commission ���ʽ� , (salary*12)+nvl(commission,0) as ��ü����
from employee;

--<����4> commission�� null�� �ƴ� ����� �̸��� ����Ͻÿ�
select ename ����̸� 
from employee
where commission is not null;

--<����5> MANAGER (���޻��) 7698�� ��� �̸��� ��å�� ����Ͻÿ�
select ename ����̸�, job ��å
from employee
where MANAGER = 7698;

--<����6> ������ 1500 �̻��̰� , �μ���ȣ�� 20�� ����� �̸�, �Ի糯¥,�μ���ȣ,������ ����Ͻÿ�
select ename ����̸� ,hiredate �Ի糯¥, dno �μ���ȣ , salary ����
from employee
where salary >= 1500 and dno = 20;

--<����7> �Ի糯¥�� 81�� 4�� 1�Ϻ���, 81�� 12�� ���ϱ��� ������� �̸��� �Ի糯¥�� ����Ͻÿ�
select ename ����̸�, hiredate �Ի糯¥
from employee
where hiredate >= '81/04/01' and hiredate <= '81/12/31';

--<����8> job(��å)�� salesman�̸鼭 ������ 2000�̻��̸鼭 �μ���ȣ�� 20�� ��� �̸��� ����Ͻÿ�
select ename ����̸�
from employee
where job = 'SALESMAN' and salary >= 1500 and dno = 30;

--<����9> ������ 1500�����̸鼭 �μ���ȣ�� 20���� �ƴ� ����̸���,����,�μ���ȣ�� ����Ͻÿ�
select ename ����̸�, salary ����, dno �μ���ȣ
from employee
where salary <= 1500 and dno != 20;

--<����10>eno(�����ȣ)�� 7788,7782�� ����� �μ���ȣ�� �̸�, ��å�� ����Ͻÿ�
select dno �μ���ȣ , ename ����̸�, job ��å
from employee
where eno = 7788 or eno = 7782;

desc employee;







