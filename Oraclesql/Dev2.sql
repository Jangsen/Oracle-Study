DROP TABLE boards;
create table boards (
    bno             number          primary key,
    btitle          varchar2(100)   not null,
    bcontent        clob            not null,
    bwriter         varchar2(50)    not null,
    bdate           date            default sysdate,
    bfilename       varchar2(50)    null,
    bfiledata		blob			null
);
CREATE SEQUENCE SEQ_BNO NOCACHE;
INSERT INTO boards VALUES
(SEQ_BNO.NEXTVAL,'눈오는 날','함박눈이 내려요','winter',sysdate,'snow.jpg','');