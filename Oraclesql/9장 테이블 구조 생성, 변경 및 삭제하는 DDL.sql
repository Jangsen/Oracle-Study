-- 테이블 구조 정의하는 CREATE TABLE ========================    create
-- DDL(Data Definition Language)을
-- 사용하여 테이블 구조 자체를 새롭게 생성, 수정, 삭제
-- CREATE TABLE 명령어로 새로운 테이블을 생성
-- CREATE TABLE 문의 기본 형식

-- CREATE TABLE table_name
--(column_name, data_type expr, ...);

-- 데이터형
-- 데이터베이스에는 문자, 숫자, 날짜, 이미지 등과 같은 다양한 형태의 데이터가 저장

-- 자료형

-- 사용자 정의 , 내장 ( 스칼라, 컬렉션, 관계 )

-- 벡터(vector)는 크기와 방향을 갖는 개념
-- 스칼라(scalar)는 방향을 갖지 않고 크기만 갖는 개념

-- 스칼라 ===================

-- CHAR(N), NCHAR(N)
-- VARCHAR2(N)
-- NVARCHAR2(N)
-- NUMBER(P,S)  
-- DATE                
-- BLOB, CLOB                    

-- NCLOB, BFILE

-- LONG, LONG RAW

-- ROWID

-- 컬렉션 ===================

-- VARRAY
-- TABLE

-- 관계 ===================

-- REF

-- 데이터형 ===================
 
/* CHAR(N)          CHAR(SIZE) 고정 길이 문자 데이터
                    입력된 자료의 길이와는 상관없이 정해진 길이만큼 저장 영역 차지
                    최소 크기 1 */

/* VARCHAR2(N)      가변 길이 문자 데이터, 실제 입력된 문자열 길이만큼 저장 영역 차지
                    최대 크기 명시, 최소 크기 1 */   
                    
/* NUMBER           Internal Number Format 최고 40자리까지의 숫자를 저장
                    이때 소수점이나 부호는 길이에 포함되지 않음 */
                    
/* NUMBER(W)        W 자리까지의 수치로 최대 38자리까지 가능 (38자리가 유효 숫자) */

/* NUMBER (W,D)     W 는 전체 길이, D는 소수점 이하 자릿수.
                    소수점은 자릿수에 포함되지 않음 */
                    
/* DATE             BC 4712년 1월 1일 ~ AD 4712년 12월 31일까지의 날짜 */

/* LOB              2GB까지의 가변 길이 바이너리 데이터를 저장 가능
                    이미지 문서, 실행 파일 저장 가능 */
                    
/* LONG             가변 길이의 문자형 데이터 타입, 최대 크기 2GB

/* ROWID            ROWID 는 Tree-piece Format을 갖음
                    ROWID는 DB에 저장되어 있지 않으며 , DB DATA도 아님

/* TIMESTAMP(m)        DATE형의 확정된 형태 */

/* INTERVAL YEAR TO MONTH   년과 월을 이용하여 기간을 저장 */

/* INTERVAL DAY TO SECOND   일,시,분,초를 이용하여 기간을 저장
                            두 날짜 값의 정확한 차이를 표현하는데 유용 */

-- LOB ===================
/* Large OBject 데이터 형은 텍스트, 그래픽 이미지, 동영상, 사운드와 같이
                           구조화되지 않은 대용량의 텍스트나 멀티미디어 데이터를
                           저장하기 위한 데이터 형
                           최대 4GB 까지 저장 가능
                           오라클에서 제공되는 LOB의 데이터 형은
                           BLOB, CLOB, NCLOB, BFILR 등이 있음 */
 
-- CLOB ===================
-- e-BOOK 과 같은 대용량의 텍스트 데이터를 저장하기 위해 사용

-- NCLOB ===================
-- 국가별 문자셋 데이터를 저장

-- BFILE ===================
-- 바이너리 데이터를 파일 형태로 저장

-- ROWID ===================
/* ROWID 데이터 형은 테이블에서 행의 위치를 지정하는 논리적인 주소값
                    데이터베이스 전체에서 중복되지 않는 유일한 값으로
                    테이블에 새로운 행이 삽입되면
                    테이블 내부에서 의사 컬럼 형태로 자동적으로 생성
                    테이블의 특정 레코드를 랜덤하게 접근하기 위해 주로 사용 */

-- SELECT문을 통해서 EMP 테이블의 ROWID 주소값 보기 

SELECT ROWID, EMPNO, ENAME
FROM EMP;

-- rowid
/* ROWID 는 다음과 같은 형식으로 데이터를 저장
                                            (총 80비트 : 10바이트)
        32BIT           10BIT           22BIT           16BIT
        00000            FFF            BBBBB            RRR
     데이터객체번호    상대적파일번호      블록번호          행번호  */

-- 데이터 객체번호  =      테이블이나 인덱스와 같은 데이터 객체가 생성될 때 할당됨
-- 상대적 파일번호  =      데이터가 저장되는 물리적인 데이터 파일번호로 유일한 값을 가짐
-- 블록번호        =      데이터 파일 내에서 행을 포함한 블록 위치
-- 행번호          =      블록 내에서 행 위치를 나타내는 번호

SELECT ROWID, DEPTNO, DNAME
FROM DEPT;

-- timestamp
-- TIMESTAMP        DATE형의 확장된 형태
--                  백만분의 일초 단위까지 표현할 수 있음
-- interval year
-- INTERNAL YEAR TO MONTH   
--                    년과 월을 사용하여 두 날짜 사이의 기간을 저장하기 위한 데이터형
-- INTERNAL YEAR (년도에 대한 자릿수) TO MONTH (달에 대한 자릿수)
--                     자릿수를 지정하지 않으면 기본적으로 2자리로 잡힘

DROP TABLE SAM02;

CREATE TABLE SAM02(
YEAR01 INTERVAL YEAR(4) TO MONTH);

CREATE TABLE SAM03(
DAY01 INTERVAL DAY(3) TO SECOND);



DESC EMP01;
DESC DEPT01;

INSERT INTO SAM03
VALUES(INTERVAL '100' DAY(3));

DESC SAM02;

INSERT INTO SAM02
VALUES(INTERVAL '48' MONTH(3));

SELECT * FROM SAM02;

-- 오늘 날짜를 출력하고 
-- 테이블 SAM02의 YEAR01 이라는 컬럼에 저장된 날짜만큼 지난 날짜를 계산하여 출력

SELECT YEAR01, SYSDATE, SYSDATE + YEAR01
FROM SAM02;

-- interval day
-- INTERVAL DAY TO SECOND
-- INTERVAL DAY (일수에 대한 자릿수) TO SECOND (초에 대한 자릿수)

SELECT * FROM SAM03;
SELECT DAY01, SYSDATE, SYSDATE + DAY01 FROM SAM03;

-- EMP TABLE에 MICHALE 추가
INSERT INTO EMP
VALUES(8000, 'MICHALE', 'ARTIST', 7839,
        TO_DATE('90-01-01','YY-MM-DD'),4000,600,40);

-- new table
-- 새롭게 테이블 생성하기

CREATE TABLE EMP01(
EMPNO NUMBER(4),
ENAME VARCHAR2(20),
SAL NUMBER(7,2));

CREATE TABLE DEPT01(
DEPTNO NUMBER(2),
DNAME VARCHAR2(14),
LOC   VARCHAR2(13));

-- sub query new table
-- 서브 쿼리로 테이블 생성
-- 이미 존재하는 테이블과 동일한 구조와 내용을 갖는 새로운 테이블 생성 가능

CREATE TABLE EMP02
AS
SELECT * FROM EMP;

-- as select
-- 원하는 컬럼으로 구성된 복제 테이블 생성

CREATE TABLE EMP03
AS
SELECT EMPNO, ENAME
FROM EMP;

SELECT * FROM EMP01;

-- EMP 테이블을 복사할때 사원번호, 사원이름, 급여 컬럼으로 구성된 테이블 생성
CREATE TABLE EMP03
AS
SELECT EMPNO, ENAME, SAL
FROM EMP;

-- sub query select
-- 서브 쿼리문의 SELECT 문을 구성할 때
-- WHERE 절을 추가하여 원하는 조건을 제시하면 기존 테이블에서 일부의 행만 복사

CREATE TABLE EMP05
AS
SELECT * FROM EMP
WHERE DEPTNO = 10;

CREATE TABLE DEPT20
AS
SELECT EMPNO,ENAME,SAL*12 ANNSAL
FROM EMP
WHERE DEPTNO = 20;

-- 테이블의 구조만 복사하기
-- 별도의 명령이 있는것이 아니고, 서브 쿼리를 이용해야 함
-- WHERE 조건 절에 항상 거짓이 되는 조건을 지정하게 되면
-- 테이블에서 얻어질수 있는 로우가 없게 되므로 빈 테이블이 생성되게 됨

CREATE TABLE EMP04
AS
SELECT EMPNO, ENAME
FROM EMP
WHERE 1 = 0;

-- 테이블 칼럼 이름 바꿔서 복사하기 table clone calumn change
CREATE TABLE EMP02
AS
SELECT EMPNO EMP_ID, ENAME NAME, SAL, DEPTNO DEPT_ID
FROM EMP;

-- DEPT 테이블과 동일한 구조의 빈 테이블 생성 (테이블의 이름은 DEPT02로 하자)

CREATE TABLE DEPT02
AS
SELECT DEPTNO,DNAME,LOC
FROM DEPT
WHERE 1 = 0;

DESC DEPT02;
-- 구조 동일
SELECT * FROM DEPT02;
-- 빈 테이블

-- 테이블 구조 변경하는 ALTER TABLE  alter table
/* 기존 테이블의 구조를 변경하기 위한 DDL 명령문
   테이블에 대한 구조 변경은 컬럼의 추가, 삭제, 컬럼의 타입이나 길이를 변경할 때 사용
   테이블의 구조를 변경하게 되면 기존에 저장되어 있던 데이터에 영향을 주게됨
   
   ALTER TABLE로 컬럼 추가, 수정, 삭제하기 위해서는 다음과 같은 명령어를 사용
   
   ADD COLUMN 절을 사용하여 새로운 컬럼을 추가
   MODIFY COLUMN 절을 사용하여 기존 컬럼을 수정
   DROP COLUMN 절을 사용하여 기존 컬럼을 삭제    */

-- ALTER TABLE ADD 문은 기존 테이블에 새로운 컬럼을 추가
-- 새로운 컬럼은 테이블 맨 마지막에 추가되고 자신이 원하는 위치에 만들수 없음
-- 이미 이전에 추가해 놓은 로우가 존재하면 그 로우에도 컬럼이 추가되지만, 컬럼 값은 NULL

-- ALTER TABLE table_name
-- ADD (column_name, data type expr,...)

-- EMP01 테이블에 문자 타입의 직급(JOB) 칼럼을 추가
ALTER TABLE EMP01
ADD(JOB VARCHAR(9));

DESC EMP01;

-- DEPT02 테이블에 문자 타입의 부서장(DNGR) 칼럼을 추가
ALTER TABLE DEPT02
ADD(DNGR NUMBER(4));

DESC DEPT02;

-- 기존 컬럼 속성 변경하기 ALTER TABLE MODIFY alter table modify
-- ALTER TABLE table_name
-- MODIFY (column_name, data_type expr, …);
-- 컬럼을 변경한다는 것은 컬럼에 대해서 
-- 데이터 타입이나 크기, 기본 값들을 변경한다는 의미

-- 직급(JOB) 칼럼을 최대 30글자까지 저장할 수 있게 변경
ALTER TABLE EMP01
MODIFY(JOB VARCHAR2(30));

DESC EMP01;

-- DEPT02 테이블의 부서장(DNGR) 칼럼을  문자 타입으로 변경
ALTER TABLE DEPT02
MODIFY(DNGR VARCHAR2(15));

SELECT * FROM DEPT02; 
DESC DEPT02;

INSERT INTO DEPT02
VALUES(10, 'RESEARCH', 'PARIS','KIM');

ALTER TABLE DEPT02
MODIFY(DNGR NUMBER(4));

DELETE FROM DEPT02;
DESC DEPT02;
SELECT * FROM DEPT02;

-- 기존 칼럼 삭제 
-- 테이블에 이미 존재하는 컬럼을 삭제하기 culomn delete
-- alter table drop column
-- ALTER TABLE ~ DROP COLUMN 명령어로 컬럼을 삭제 할 수 있음

-- ALTER TABLE table_name
-- DROP COLUMN column_name;

ALTER TABLE EMP01
DROP COLUMN JOB;
DESC EMP01;

-- DEPT02 테이블의 부서장(DNGR) 컬럼을 삭제
ALTER TABLE DEPT02
DROP COLUMN DNGR;

DESC DEPT02;

-- SET UNUSED 옵션 적용 =================set unused
/* 특정 테이블(EMP02)에서 컬럼(JOB)을 삭제하는 경우 무조건 삭제하는 것은 위험함
   테이블에 저장된 내용이 많을 경우 해당 테이블에서 삭제하는 데 꽤 오랜 시간이 걸림
   컬럼을 삭제하는 동안 다른 사용자가 해당 컬럼을 사용하려고 접근하게 되면
   지금 현재 테이블이 사용되고 있기 때문에 다른 사용자는 테이블을 이용할 수 없게 됨
   작업이 원활하게 진행되지 않고 락(LOCK)이 발생
   
   ALTER TABLE에 SET UNUSED 옵션을 지정하면
   컬럼을 삭제하는 것은 아니지만 컬럼의 사용을 논리적으로 제한할 수 있음
   
   SET UNUSED 옵션은 사용을 논리적으로 제한할 뿐 실제로 컬럼을 삭제하지 않았기 때문에
   작업 시간이 오래 걸리지 않음
   락이 걸리는 일도 일어나지 않게 됨  */
   
-- SET UNUSED 옵션을 사용하여 EMP02 테이블의 JOB 컬럼의 사용을 논리적으로 제한하기

DESC EMP02;

ALTER TABLE EMP02
SET UNUSED(JOB);

-- 가장 사용빈도가 적은 시간에 실제적인 삭제 작업을 진행

ALTER TABLE EMP02
DROP UNUSED COLUMNS;

-- 테이블 구조 삭제하는 DROP TABLE   drop table
-- DROP TABLE table_name;

-- 테이블 삭제하기
-- EMP01 테이블을 삭제하기

DROP TABLE EMP01;

/* DDL 문은 커밋을 내장하고 있음 */

-- 테이블의 모든 로우를 제거하는 TRUNCATE    truncate
-- 기존에 사용하던 테이블의 모든 로우를 제거하기 위한 명령어

-- TRUNCATE table_name

-- 테이블의 내용 전체 제거하기===============   delete
-- EMP02 에 저장된 데이터를 확인하였으면 이번에는 테이블의 모든 로우를 제거하기
SELECT * FROM EMP02;
DESC EMP02;
DELETE FROM EMP02
WHERE DEPTNO = 20;
TRUNCATE TABLE EMP02;   -- 모든 로우를 제거
DESC EMP02;

-- 테이블 명을 변경하는 RENAME       rename
-- 기존에 사용하던 테이블의 이름을 변경하기 위한 명령어
-- RENAME OLD_NAME TO NEW_NAME

-- EMP02 테이블의 이름을 TEST란 이름으로 변경

RENAME EMP02 TO TEST;

-- 데이터 딕셔너리와 데이터 딕셔너리 뷰     dir

-- 데이터 딕셔너리 ======================
/* 데이터베이스 자원을 효율적으로 관리하기 위한 다양한 정보를 저장하는 시스템 테이블

   사용자가 테이블을 생성하거나 사용자를 변경하는 등의 작업을 할 때 
   데이터베이스 서버에 의해 자동으로 갱신되는 테이블
   사용자는 데이터 딕셔너리의 내용을 직접 수정하거나 삭제 할 수 없음
   
   데이터 딕셔너리를 사용자가 조회해 보면 시스템이 직접 관리하는 테이블이기에 
   암호 같은 기호만 보여질 뿐 내용을 알 수 없음
   
   데이터 딕셔너리 원 테이블은 직접 조회하기란 거의 불가능한 일   
   
   의미있는 자료 조회가 불가능하기 때문에 
   오라클은 사용자가 이해할 수 있는 데이터를 산출해 줄 수 있도록 하기 위해
   데이터 딕셔너리에서 파생된 데이터 딕셔너리 뷰를 제공   */
   
-- 데이터 딕셔너리 뷰 (접두어에 따라 세 종류) ================== 

/*접두어
DBA_XXXX        데이터베이스 관리자만 접근 가능한 객체등의 정보 조회
                (DBA는 모두 접근 가능하므로 결국 디비에 있는 모든 객체에 관한 조회)

ALL_XXXX        자신 계정 소유 또는 권한을 부여 받은 객체 등에 관한 정보 조회

USER_XXXX       자신의 계정이 소유한 객체 등에 관한 정보 조회      */

-- USER_데이터 딕셔너리================            user

-- 접두어로 USER가 붙은 데이터 딕셔너리는 
-- 자신의 계정이 소유한 객체 등에 관한 정보를 조회 

-- USER가 붙은 데이터 딕셔너리 중에서 
-- 자신이 생성한 테이블이나 인덱스나 뷰 등과 같은 
-- 자신 계정 소유의 객체 정보를 저장한 USER_TABLES 데이터 딕셔너리 뷰를 살펴보기

-- DESC 명령어로 데이터 딕셔너리 뷰 USER_TABLES의 구조를 살펴보기
DESC USER_TABLES;

-- 현재 사용자가 누구
SHOW USER

-- 테이블의 이름을 알려주는 TABLE_NAME 컬럼의 내용을 살펴보기
-- 현재 사용자 계정이 SCOTT 이므로 SCOTT이 사용가능한 테이블의 이름만 알 수 있음

SELECT TABLE_NAME
FROM USER_TABLES
ORDER BY TABLE_NAME DESC;

-- ALL_데이터 딕셔너리 ================        all
-- 사용자 계정이 소유한 객체는 자신의 소유이므로 당연히 접근이 가능
-- 만일 자신의 계정이 아닌 다른 계정 소유의 테이블이나 시퀀스 등은 접근 가능할까?
-- 오라클에서는 타계정의 객체는 원천적으로 접근 불가능
-- 그 객체의 소유자가 접근할 수 있도록 권한을 부여하면 타 계정의 객체에도 접근이 가능
-- ALL_ 데이터 딕셔너리 뷰는 현재 계정이 접근 가능한 객체
-- 즉, 자신 계정의 소유이거나 접근 권한을 부여 받은 
-- 타계정의 객체 등을 조회 할 수 있는 데이터 딕셔너리 뷰 
-- 현재 계정이 접근 가능한 테이블의 정보를 조회하는 뷰

-- DESC 명령어로 데이터 딕셔너리 뷰 ALL_TABLES의 구조를 살펴보기

DESC ALL_TABLES;

-- 이 중에서 OWNER, TABLE_NAME 컬럼 값만 살펴보기

/* NOT NULL을 보면 PRIMARY KEY 인지 먼저 생각하기 not null*/

SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;

-- DBA_ 데이터 딕셔너비 뷰======================        dba

-- DBA_ 데이터딕셔너리는 DBA가 접근 가능한 객체 등을 조회 할 수 있는 뷰
-- DBA가 접근 불가능한 정보는 없기에 데이터베이스에 있는 모든 객체 등의 의미
-- USER_ 와 ALL_ 와 달리 DBA_ 데이터딕셔너리뷰는 
-- DBA 시스템 권한을 가진 사용자만 접근할 수 있음

-- DBA_TABLES 데이터 딕셔너리 뷰의 내용을 조회

-- SELECT TABLE_NAME, OWNER
-- FROM DBA_TABLES;

-- SYSTEM 사용자로 접근해야 사용 가능 SCOTT은 불가능