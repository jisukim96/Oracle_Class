

use myDB;
/*MS-SQL에서 Table 생성*/
create table guestboard(
    name varchar(100),
    email varchar(100),
    inputdate varchar(100) primary key,
    subject varchar(100),
    content varchar(2000)
    );

desc guestboard

drop table guestboard;