create user C##HR identified by 1234;

grant connect, resource to C##HR;

alter user C##HR quota unlimited on USERS;