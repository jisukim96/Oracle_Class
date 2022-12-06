
select * from myTbl;

insert into myTbl values ( '1','1234');
commit;  

select * from myTbl;


-- 한 줄 주석 : 프로그램에서 해석되지 않는 영역
/*
여러줄 주석

*/

-- 1. HR 계정 생성 : 12버전부터 계정 생성 시 계정명 앞에 C##을 붙여야한다.
-- 계정 생성하려면 system 계정으로 접속한 쿼리창에서 명령을 줘야한다.
-- HR : 계정명, 암호 : 1234
create user C##HR identified by 1234;

-- 2. HR 계정의 권한 부여 : 
/* connect : 원격에서 DB에 접속할 수 있는 권한, 
    resource : 객체(resource) - Table, index,view,store procedure,triger,funtion를 생성 ,수정, 삭제 권한을 부여
*/
grant connect,resource to C##HR;

-- 3. 테이블 스페이스를 사용할 권한 부여 , 
    -- USERS 테이블 스페이스의 사용량을 무제한 사용할 수 있도록 권한 부여 /하드공간 무제한 사용 권한
alter user C##HR quota unlimited on USERS;

-- 4. HR 계정 삭제 - 연결 설정이 되어있는 경우 삭제가 안됨. 연결을 먼저 삭제 후 계정 삭제
drop user C##HR;



show user;

select * from tab; -- table 출력