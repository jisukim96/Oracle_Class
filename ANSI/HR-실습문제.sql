
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







