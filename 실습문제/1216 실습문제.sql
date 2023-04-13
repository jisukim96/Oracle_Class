-- JOIN ( INNER JOIN ) , group by
-- 이름, 생일, 구매물품, 가격, 구매개수를 출력
select name,birthyear,prodName,price,amount
from userTbl u inner join buyTbl b
on u.userID = b.userID;

-- 구매물품별 총 구매액(금액 * 구매수량) 을 출력 
select prodName 구매물품 , sum(price*amount) as "구매물품별 총 구매액"
from buyTbl
group by prodName;

-- 물품구매액이 가장 많은 사용자
select name 사용자 , sum(price*amount) 
from buyTbl b inner join userTbl u
on b.userID = u.userID
group by name
having sum(price*amount) >= all(select sum(price*amount) from buyTbl group by userID);

select name 사용자 , sum(price*amount) as 물품구매액
from userTbl u join buyTbl b
on u.userID = b.userID
group by u.userID
having sum(price*amount) >=all (select sum(price*amount) from buyTbl group by userID);


-- 물품을 구매하지 않은 사용자 (left join)
select userID 아이디 , name 사용자
from userTbl
where userID not in (select userID from buyTbl);









































select name 사용자 , sum(price*amount) as 물품구매액
from userTbl u join buyTbl b
on u.userID = b.userID
group by u.userID
having sum(price*amount) >=all (select sum(price*amount) from buyTbl group by userID);