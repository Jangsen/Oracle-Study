-- 테이블에 새로운 행을 추가하는 INSERT 문    ============================ insert

-- INSERT 문은 테이블에 새로운 데이터를 입력하기 위해 사용하는 데이터 조작어
-- INSERT 문의 기본 형식
-- INSERT INTO table_name
-- (column_name, …)
-- VALUES(column_value, …);

-- INSERT 문을 위한 실습에 사용할 테이블 생성하기

DROP TABLE DEPT01;

CREATE TABLE DEPT01
AS
SELECT * FROM DEPT
WHERE 1 = 0;

-- 새로운 데이터를 추가하기  

-- 새로운 데이터를 추가하기 위해서 사용할 명령어 INSERT INTO ~ VALUES ~는 
-- 칼럼 명에 기술된 목록의 수와 VALUES 다음에 나오는 괄호에 기술한 값의 개수가 같아야 함

INSERT INTO DEPT01
(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING', 'NEW YORK');

-- INSERT 구문에서 오류 발생의 예

-- 컬럼 명에 기술된 목록의 수보다 
-- VALUES 다음에 나오는 괄호안에 기술한 값의 개수가 적으면 오류 발생

INSERT INTO DEPT01
(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING');

-- 실행 시 오류

-- 컬럼 명에 기술된 목록의 수보다
-- VALUES 다음에 나오는 괄호에 기술한 개수가 많으면 오류 발생

INSERT INTO DEPT01
(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING', 'NEW YORK', 20);

-- 실행 시 오류

-- 컬럼 명이 잘못 입력되었을 때도 에러가 발생

INSERT INTO DEPT01
(NUM, DNAME, LOC)
VALUES(10, 'ACCOUNTING', 'NEW YORK');

-- 실행 시 오류

-- 컬럼과 입력할 값의 데이터 타입이 서로 맞지 않을 경우에도 에러가 발생

INSERT INTO DEPT01
(DEPTNO, DNAME, LOC)
VALUES('50', 'ACCOUNTING', SEOUL);

-- 실행 시 오류

-- 컬럼 명을 생략한 INSERT 구문  ==================================

-- 테이블에 로우를 추가할 때 모든 칼럼에 모두 자료를 입력하는 경우에는
-- 굳이 컬럼 목록을 기술하지 않아도 됨

-- 컬럼 목록이 생략되면 VALUES 절 다음의 값들이 테이블의 기본 컬럼 순서대로 입력됨.

-- 테이블의 컬럼 순서는 CREATE TABLE로 테이블을 생성할 때의 순서를 따름

-- 테이블의 기본 컬럼 순서는 DESC 문으로 조회했을 때 보여지는 순서

-- 칼럼 명을 생략한 INSERT 구문 사용

-- 칼럼명을 생략한 채 테이블이 갖은 모든 컬럼에 데이터를 추가

INSERT INTO DEPT01
VALUES(20, 'RESEARCH', 'DALLAS');


-- EMPNO    NUMBER(4)    
-- ENAME    VARCHAR2(10) 
-- JOB      VARCHAR2(9)  
-- SAL      NUMBER(7,2)  
-- 다음과 같은 구조로 SAM01 테이블을 생성하시오. 
-- 존재할 경우 DROP TABLE로 삭제 후 생성
 
CREATE TABLE SAM01
AS
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE 1 = 0;

DESC SAM01;

-- EMPNO ENAME  JOB     SAL
-- 1000	APPLE	POLICE	10000
-- 1010	BANANA	NURSE	15000
-- 1020	ORANGE	DOCTOR	25000
-- SAM01 테이블에 다음과 같은 데이터를 추가

INSERT INTO SAM01
VALUES(1000, 'APPLE', 'POLICE', 10000);
INSERT INTO SAM01
VALUES(1010, 'BANANA', 'NURSE', 15000);
INSERT INTO SAM01
VALUES(1020, 'ORANGE', 'DOCTOR', 25000);

SELECT * FROM SAM01;

-- NULL 값 삽입하는 다양한 방법 ==============================null

/* 데이터를 입력하는 시점에서 
   해당 컬럼 값을 모르거나 확정되지 않았을 경우에는 NULL값을 입력
   
   NULL 값 삽입은 암시적인 방법과 명시적인 방법이 있음
   
   암시적 방법은 칼럼 명 리스트에 칼럼을 생략하는 것
   즉, 다른 칼럼은 값을 입력하지만 
   이렇게 생략한 칼럼에는 암시적으로 NULL 값이 할당되는 것
   
   명시적 방법은 VALUES 리스트에 명시적으로 NULL을 입력
*/

-- 부서 테이블에 컬럼이 NULL값을 허용하는지 살펴보기 위해서 DESC 명령을 실행
-- DEPT 테이블의 DEPTNO 컬럼은 NOT NULL 제약조건이 지정되어 있음

-- NOT NULL 제약조건이 지정된 DEPTNO 컬럼은 널 값을 입력하지 못함

-- 오라클이 제공해 주는 DEPT 테이블의 DEPTNO 컬럼에 
-- 널값을 허용하지 못하도록 오라클 내부에서 이미 컬럼에 제약조건을 지정해 놓은 상태

-- 컬럼에 널값을 허용하지 못하도록 하려면 컬럼에 제약조건을 지정해야 함

-- 암시적으로 NULL 값의 삽입 ====================================

-- 지역명이 결정되지 않은 30번 부서에 부서명만 입력하려고 함
-- 저장할 값을 명확하게 알고 있는 컬럼 명만 명시적으로 기술한 후에 
-- 그에 매칭되는 값을 VALUES 절 다음에 기술
INSERT INTO DEPT01
(DEPTNO, DNAME)
VALUES(30, 'SALES');

-- 명시적으로 NULL 값의 삽입 =====================================

-- 컬럼명을 명시적으로 기술하지 않으면 테이블이 갖고 있는 모든 컬럼에 값을 지정해야 함
-- 지역명이 결정되어 지지 않았더라도 반드시 값을 3개 지정해야 하기 때문에 
-- 명시적으로 VALUES 리스트에서 지역명에 NULL을 입력해야 함

INSERT INTO DEPT01
VALUES(40,'OPERATIONS', NULL);

-- NULL 값을 갖는 컬럼을 추가하기 위해서는 NULL 대신 ''를 사용할 수 있음
-- 지역명이 아닌 부서명이 결정되지 않아 부서명에 NULL 값을 입력한 예

INSERT INTO DEPT01
VALUES(50, '', 'CHICAGO');

SELECT * FROM DEPT01;

-- SAM01 테이블에 다음과 같이 NULL 값을 갖는 행을 추가하기

-- EMPNO ENAME  JOB     SAL
-- 1000	APPLE	POLICE	10000
-- 1010	BANANA	NURSE	15000
-- 1020	ORANGE	DOCTOR	25000
-- 1030	VERY		25000
-- 1040	CAT		2000

INSERT INTO SAM01
(EMPNO, ENAME, JOB, SAL)
VALUES(1030, 'VERY', '', 25000);

INSERT INTO SAM01
(EMPNO, ENAME, JOB, SAL)
VALUES(1040, 'CAT', '', 2000);

SELECT * FROM SAM01;

-- 서브 쿼리로 데이터 삽입하기 ====================================
-- INSERT INTO 다음에 VALUES 절을 사용하는 대신에 서브 쿼리를 사용할 수 있음
-- 이렇게 하면 기존의 테이블에 있던 여러 행을 복사해서 다른 테이블에 삽입할 수 있음
-- 이 때 주의할 점은 INSERT 명령문에서 
-- 지정한 컬럼의 개수나 데이터 타입이 서브 쿼리를 수행한 결과와 동일해야 함!!

-- 서브 쿼리로 데이터 삽입하는 예제

-- 1.서브 쿼리로 데이터 삽입하기 위해서 
-- 우선 테이블을 생성하되 데이터는 복사하지 않고 빈 테이블만 생성

DROP TABLE DEPT02;

CREATE TABLE DEPT02
AS
SELECT * 
FROM DEPT 
WHERE 1 = 0;

-- 2.테이블 구조만을 복사해서 내용을 갖지 않는 테이블에 서브 쿼리로 로우를 입력해보기

INSERT INTO DEPT02
SELECT *
FROM DEPT;

SELECT *
FROM DEPT02;

-- SAM01 테이블에 서브 쿼리문을 사용하여 
-- EMP에 저장된 사원 중 10번 부서 소속 사원의 정보를 추가

INSERT INTO SAM01
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE DEPTNO = 10;

SELECT * FROM SAM01;

-- 다중 테이블에 다중 행 입력하기 ========================================

/* 

INSERT ALL문을 사용하면 서브 쿼리의 결과를 조건 없이 여러 테이블에 동시에 입력할 수 있음.
사원번호, 사원명, 입사일자로 구성된 EMP_HIR 테이블과 
사원번호, 사원명, 해당관리자(상관))로 구성된 EMP_MGR 테이블이 빈 테이블로 존재한다고 가정
사원 테이블(EMP)에서 부서 번호가 20인 사원들을 검색하여 
EMP_HIR 테이블에는 사원 번호, 사원 명, 급여를 
EMP_MGR 테이블에는 사원 번호, 사원 명, 해당관리자(상관)를 입력하려면 어떻게 해야 할까?

INSERT ALL 명령문을 사용하면 두 번의 쿼리문을 수행하지 않고도 
하나의 쿼리문으로 두 개의 테이블에 원하는 컬럼 값을 삽입할 수 있음.

*/

CREATE TABLE EMP_HIR
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE 1 = 0;

CREATE TABLE EMP_HIR2
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE 1 = 0;

CREATE TABLE EMP_MGR
AS
SELECT EMPNO, ENAME, MGR
FROM EMP
WHERE 1 = 0;

CREATE TABLE EMP_SAL
AS
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE 1 = 0;

/*
INSERT ALL 명령문은 
서브 쿼리의 결과 집합을 
조건 없이 여러 테이블에 동시에 입력하기 위한 명령문
이때 주의할 점은 
서브 쿼리의 컬럼명과 데이터가 입력되는 테이블의 컬럼명이 동일해야 한다는 점
*/

INSERT ALL 
INTO EMP_HIR
VALUES(EMPNO, ENAME, HIREDATE)
INTO EMP_MGR
VALUES(EMPNO, ENAME, MGR)
SELECT EMPNO, ENAME, HIREDATE, MGR
FROM EMP
WHERE DEPTNO = 20;

SELECT * FROM EMP_MGR;

-- 조건(WHEN)에 의해 다중 테이블에 다중 행 입력 ================== when

/*
INSERT ALL 명령문에 WHEN 절을 추가해서 조건을 제시하여 
조건에 맞는 행만 추출하여 테이블에 추가. 
EMP_HIR02 테이블에는 
1982 년 01 월01 일 이후에 입사한 사원들의 번호, 사원 명, 입사일을 추가. 
EMP_SAL 테이블에는 
급여가 2000 이상인 사원들의 번호, 사원 명, 급여를 추가. 
*/

INSERT ALL
WHEN HIREDATE > '1982/01/01' THEN
    INTO EMP_HIR2
    VALUES(EMPNO, ENAME, HIREDATE)
WHEN SAL > 2000 THEN
    INTO EMP_SAL
    VALUES(EMPNO, ENAME, SAL)
SELECT EMPNO, ENAME, HIREDATE, SAL
FROM EMP;

-- PIVOTING에 의해 다중 테이블에 다중 행 입력하기

-- 1. 한 주차 월요일부터 금요일까지 매일 매일의 판매 실적을 기록하는 테이블을 생성

CREATE TABLE SALES
(SALES_ID NUMBER(4),
 WEEK_ID NUMBER(4),
 MON_SALES NUMBER(8, 2),
 TUE_SALES NUMBER(8, 2),
 WED_SALES NUMBER(8, 2),
 THU_SALES NUMBER(8, 2),
 FRI_SALES NUMBER(8, 2));
 
--  2. 결과를 저장할 SALES_DATA 테이블을 생성

CREATE TABLE SALES_DATA
(SALES_ID NUMBER(4),
 WEEK_ID NUMBER(4),
 DAILY_ID NUMBER(4),
 SALES NUMBER(8, 2));
 
-- 3. 새롭게 생성된 SALES 테이블에 주간 판매 실적을 추가

INSERT INTO SALES VALUES
(1001, 1, 200, 100, 300, 400, 500);
INSERT INTO SALES VALUES
(1002, 2, 100, 300, 200, 500, 350);

-- 4. 각 요일을 구분할 수 있는 컬럼을 추가하여 매일 매일의 판매 실적을 기록

INSERT ALL
INTO SALES_DATA VALUES(SALES_ID, WEEK_ID, 1, MON_SALES)
INTO SALES_DATA VALUES(SALES_ID, WEEK_ID, 2, TUE_SALES)
INTO SALES_DATA VALUES(SALES_ID, WEEK_ID, 3, WED_SALES)
INTO SALES_DATA VALUES(SALES_ID, WEEK_ID, 4, THU_SALES)
INTO SALES_DATA VALUES(SALES_ID, WEEK_ID, 5, FRI_SALES)
SELECT SALES_ID, WEEK_ID, MON_SALES, TUE_SALES,
       WED_SALES, THU_SALES, FRI_SALES
FROM SALES;

DESC SALES;
DESC SALES_DATA;

SELECT * FROM SALES;
SELECT * FROM SALES_DATA;


-- 테이블의 내용을 수정하기 위한 UPDATE문    ======================== update
/*
UPDATE문은 테이블에 저장된 데이터를 수정하기 위해 사용

UPDATE table_name
SET column_name1 = value1, column_name2 = value2, …
WHERE conditions;

UPDATE문은 기존의 행을 수정하는 것
따라서 어떤 행의 데이터를 수정하는지
WHERE 절을 이용하여 조건을 지정

WHERE 절을 사용하지 않을 경우는
테이블에 있는 모든 행이 수정됨

테이블의 전체 행을 수정하려고 했던 것이 아니라면
큰 문제가 발생하므로 WHERE절의 사용 유무를 신중히 판단해야함.
*/

-- EMP01 테이블을 EMP테이블로 복사

CREATE TABLE EMP01
AS
SELECT *
FROM EMP;

SELECT * FROM EMP01;

-- EMP01 테이블의 모든 행 변경

-- 모든 사원의 부서번호를 30번으로 수정

UPDATE EMP01
SET DEPTNO = 30;

-- 모든 사원의 급여를 10% 인상

UPDATE EMP01
SET SAL = SAL * 1.1;

-- 모든 사원의 입사일을 오늘로 수정

UPDATE EMP01
SET HIREDATE = SYSDATE;

-- 테이블의 특정 행만 변경
/*
UPDATE 문에 WHERE 절을 추가하면 테이블의 특정 행이 변경됨.
UPDATE 문을 이용하여 테이블의 특정 행을 변경하기 위한 실습을 하기에 앞서서 
실습에 사용할 테이블을 먼저 만들자. 
이전 실습을 위해서 사용하였던 사원 테이블(EMP01)을 제거한 후 
기존 사원 테이블(EMP)과 동일한 구조와 데이터를 갖는 사원 테이블(EMP01)을 생성.
*/

DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT * FROM EMP;

SELECT * FROM EMP01;

-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정

UPDATE EMP01
SET DEPTNO = 30
WHERE DEPTNO = 10;

SELECT * FROM EMP01;
-- 급여가 3000 이상인 사원만 급여를 10% 인상

UPDATE EMP01
SET SAL = SAL * 1.1
WHERE SAL >= 3000;

SELECT * FROM EMP01;
-- 1987년에 입사한 사원의 입사일을 오늘로 수정

UPDATE EMP01
SET HIREDATE = SYSDATE
WHERE SUBSTR(HIREDATE,1,2) = '87';

SELECT * FROM EMP01;

-- SAM01에 테이블에 저장된 사원 중 급여가 10000 이상인 사원들의 급여만 5000원씩 삭감

UPDATE SAM01
SET SAL = SAL - 5000
WHERE SAL >= 10000;

SELECT * FROM SAM01;

-- 테이블에서 2개 이상의 컬럼 값 변경 =========================================
-- 테이블에서 하나의 칼럼이 아닌 복수 개 칼럼의 값을 변경하려면 
-- 기존 SET 절에 콤마를 추가하고 칼럼=값을 추가 기술하면 됨.

-- SCOTT 사원의 부서번호는 20번으로, 직급은 MANAGER로 한꺼번에 수정  (EMP01 테이블)

UPDATE EMP01
SET DEPTNO = 20, JOB = 'MANAGER'
WHERE ENAME = 'SCOTT';

--SELECT DEPTNO, ENAME, JOB
--FROM EMP01;

--SELECT DEPTNO, ENAME, JOB
--FROM EMP01
--WHERE ENAME = 'SCOTT';

-- SCOTT 사원의 입사일자는 오늘로, 급여를 50 으로 커미션을 4000 으로 수정

UPDATE EMP01
SET HIREDATE = SYSDATE, SAL = 50, COMM = 4000
WHERE ENAME = 'SCOTT';

SELECT * FROM EMP01
WHERE ENAME = 'SCOTT';

-- 서브 쿼리를 이용한 데이터 수정하기
/*
UPDATE 문의 SET 절에서 서브 쿼리를 기술하면 서브 쿼리를 수행한 결과로 내용이 변경됨
이러한 방법으로 다른 테이블에 저장된 데이터로 해당 컬럼 값을 변경할 수 있음
*/

-- 현재 DEPT01 에는 40번 부서가 없음 생성하기

SELECT * FROM DEPT01;
INSERT INTO DEPT01
(DEPTNO, DNAME, LOC)
VALUES(40, 'OPERATIONS', 'BOSTON');

-- 40번 부서의 지역명을 10번 부서의 지역명으로 변경

UPDATE DEPT01
SET LOC = (SELECT LOC
           FROM DEPT01
           WHERE DEPTNO = 10)
           WHERE DEPTNO = 40;
           
SELECT * FROM DEPT01;

-- 서브 쿼리문을 사용하여 EMP 테이블에 저장된 데이터의 특정 컬럼만으로 구성된
-- SAM02 테이블 생성

DROP TABLE SAM02;

CREATE TABLE SAM02
AS
SELECT ENAME, SAL, HIREDATE, DEPTNO
FROM EMP;

-- 생성 후 DALLAS에 위치한 부서 소속 사원들의 급여를 1000 인상하시오

SELECT * FROM SAM02;

UPDATE SAM02
SET SAL = SAL + 1000
WHERE DEPTNO = 20;

-- 서브 쿼리를 이용한 두개 이상의 컬럼에 대한 값 변경
/*
서브 쿼리를 사용한 UPDATE 형식은 다음과 같이 2가지

형식 1
UPDATE table_name
SET column_name1 = (sub_query1), column_name2 = (sub_query2), …
WHERE 조건


형식 2
UPDATE table_name
SET (column_name1, column_name2, …) = (sub_query)
WHERE 조건
*/

-- 서브쿼리를 이용해서 부서번호가 20인 부서의 부서명과 지역명을 
-- 부서번호가 40번인 부서와 동일하게 변경
-- 부서번호가 20번인 부서의 이름과 지역은 RESEACH 와 DALLAS

UPDATE DEPT01
SET (DNAME, LOC) = (SELECT DNAME, LOC
                    FROM DEPT
                    WHERE DEPTNO = 40)
WHERE DEPTNO = 20;

SELECT * FROM DEPT01;

-- 서브 쿼리문을 사용하여 SAM02 테이블의 모든 사원의 급여와 입사일을 
-- 이름이 KING 인 사원의 급여와 입사일로 변경

SELECT * FROM SAM02;

UPDATE SAM02
SET (SAL, HIREDATE) = (SELECT SAL, HIREDATE
                       FROM SAM02
                       WHERE ENAME = 'KING');

-- 테이블에 불필요한 행을 삭제하기 위한 DELETE 문 ====================   delete
/*
DELETE 문은 테이블에 저장되어 있는 데이터를 삭제

DELETE FROM table_name 
WHERE conditions;

DELETE 문은 테이블의 기존 행을 삭제하며 
특정한 로우(행)을 삭제하기 위해서 WHERE 절을 이용하여 조건을 지정

만약 DELETE 문에 WHERE 절을 사용하지 않을 경우 테이블에 있는 모든 행이 삭제되므로 
매우 신중하게 명령문을 사용해야 함
*/

-- 부서 테이블의 모든 행을 삭제

DELETE FROM DEPT01;

DROP TABLE DEPT01;

CREATE TABLE DEPT01
AS
SELECT * FROM DEPT;

-- 부서 테이블에서 30번 부서만 삭제
SELECT * FROM DEPT01;

DELETE FROM DEPT01
WHERE DEPTNO = 30;

-- SAM01 테이블에서 직급이 정해지지 않은 사원을 삭제

SELECT * FROM SAM01;

DELETE FROM SAM01
WHERE JOB IS NULL;

-- 서브 쿼리를 이용한 데이터 삭제 

/*
DELETE 문을 사용하기에 앞서 사원 테이블을 복사. 

사원 테이블에서 부서명이 SALES인 사원을 모두 삭제. 

사원 테이블에는 부서명이 기록되어 있지 않음. 

부서명은 부서 테이블에 기록되어 있으므로 부서 테이블에서 
부서명이 SALES인 부서의 번호부터 알아내야 함. 

이렇게 알아낸 부서번호를 사원 테이블에 적용하기 위해서는 
서브 쿼리를 이용해야 함.
*/

-- 사원 테이블에서 부서명이 SALES인 사원을 모두 삭제
SELECT * FROM EMP01;

SELECT * FROM DEPT;

DELETE FROM EMP01
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');

-- SAM02 테이블에서 'RESEARCH' 부서 소속 사원들만 삭제

SELECT * FROM SAM02;

DELETE FROM SAM02
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'RESEARCH');
                
-- 테이블을 병합하는 MERGE  =========================== merge

/*
MERGE는 병합이란 의미로 
구조가 같은 두개의 테이블을 하나의 테이블로 합치는 기능. 

MERGE 명령을 수행하기 위해서 
수행하는 테이블에 기존에 존재하는 행이 있다면 
새로운 값으로 갱신(UPDATE)되고, 
존재하지 않으면 새로운 행으로 추가(INSERT)됩니다
*/

-- MERGE 문에 의해서 갱신(UPDATE) 되고 추가(INSERT) 되는지 살펴보기

-- 1. 새로운 테이블 EMP01을 생성
DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT * FROM EMP;

SELECT * FROM EMP01;
-- 2. 직급이 'MANAGER' 인 사원들로만 구성된 EMP02 테이블을 생성

CREATE TABLE EMP02
AS
SELECT * FROM EMP
WHERE JOB = 'MANAGER';

SELECT * FROM EMP02;

-- 3. MERGE 문에 의해서 기존에 존재하는 행이 갱신(UPDATE) 되는지 살펴보기 위해
--    새로 생성된 EMP02 테이블의 JOB을 'TEST' 로 변경

UPDATE EMP02
SET JOB = 'TEST';

-- 4. MERGE 문에 의해서 새로운 행이 추가(INSERT) 되는지 살펴보기 위해서 
--    새로운 로우를 추가

INSERT INTO EMP02
VALUES(8000, 'SYJ', 'TOP', 7566, '2009/01/12', 1200, 10, 20);
DESC EMP02;

-- 5. EMP01 테이블에 EMP02 테이블을 합병

MERGE INTO EMP01
USING EMP02
ON(EMP01.EMPNO = EMP02.EMPNO)
WHEN MATCHED THEN
UPDATE SET
EMP01.ENAME = EMP02.ENAME,
EMP01.JOB = EMP02.JOB,
EMP01.MGR = EMP02.MGR,
EMP01.HIREDATE = EMP02.HIREDATE,
EMP01.SAL = EMP02.SAL,
EMP01.COMM = EMP02.COMM,
EMP01.DEPTNO = EMP02.DEPTNO
WHEN NOT MATCHED THEN
INSERT VALUES(EMP02.EMPNO, EMP02.ENAME, EMP02.JOB,
              EMP02.MGR, EMP02.HIREDATE, EMP02.SAL,
              EMP02.COMM, EMP02.DEPTNO);
              
SELECT * FROM EMP01;
SELECT * FROM EMP02;