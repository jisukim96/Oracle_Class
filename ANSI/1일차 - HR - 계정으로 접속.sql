

-- 1. HR �������� ���� Ȯ�� : resource : ���̺� ����, ����, ����
show user;

-- 2. ���̺� ���� , ; ������ �ϳ��� ��ɾ�� ó���Ǵ� ���
create table myTbl2(  
    id varchar2 (20),
    pass varchar2(20)
    );

-- 3. ���̺� �� �ֱ� : commit (�����϶�)
insert into myTbl2 values ('1','1234');
commit; --DB�� ���������� �����ض�.(insert, Update, Delete �������� ���)

-- 4. ���̺��� ���� ����ϱ�
select * from MyTbl2;

-- 5. ���̺� �����ϱ�
drop table myTbl2;


-- ���� ������ Oracle ���� Ȯ��
select * from V$version;

-- ������ DataBase�� �����ϴ� ��� ���̺� ����
select * from tab;