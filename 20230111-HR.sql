select * from guestboard;
commit;
/*최근에 인풋받은 값을 먼저 출력하는 쿼리 */
select * from guestboard order by inputdate desc;

select * from guestlab;