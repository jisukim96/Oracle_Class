create user C##shop identified by 1234;

grant connect, resource to C##shop;

alter user C##shop quota unlimited on USERS;