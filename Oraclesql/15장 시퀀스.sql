/*
============== 시퀀스 개념 이해와 시퀀스 생성 =================

오라클에서는 행을 구분하기 위해서 기본 키를 두고 있음.

기본 키는 중복된 값을 가질 수 없으므로 항상 유일한 값을 가져야 함. 

기본 키가 유일한 값을 갖도록 사용자가 직접 값을 생성해내려면 부담이 클 것. 

시퀀스는 테이블 내의 유일한 숫자를 자동으로 생성하는 자동 번호 발생기이므로 
시퀀스를 기본 키로 사용하게 되면 사용자의 부담을 줄일 수 있음.


============= 시퀀스 기본 형식 ==================

        시퀀스를 생성하기 위한 기본 형식

CREATE SEQUENCE sequence_name 
                [START WITH n]              ① 
                [INCREMENT BY n]            ② 
                [{MAXVALUE n | NOMAXVALUE}] ③
                [{MINVALUE n | NOMINVALUE}] ④
                [{CYCLE | NOCYCLE}]         ⑤
                [{CACHE n | NOCACHE}]       ⑥ 
                
① START WITH 

시퀀스 번호의 시작값을 지정할 때 사용. 
만일 1부터 시작되는 시퀀스를 생성하려면 START WITH 1이라고 기술. 

② INCREMENT BY 

연속적인 시퀀스 번호의 증가치를 지정할 때 사용. 
만일 1씩 증가하는 시퀀스를 생성하려면 INCREMENT BY 1이라고 기술. 

③ MAXVALUE n | NOMAXVALUE 

MAXVALUE 은 시퀀스가 가질 수 있는 최대값을 지정. 
만일 NOMAXVALUE를 지정하게 되면 
ASCENDING 순서일 경우에는 1027승이고 
DESCENDING 순서일 경우에는 -1로 설정됨.

④ MINVALUE n | NOMINVALUE

MINVALUE 은 시퀀스가 가질수 있는 최소값을 지정. 
만일 NOMINVALUE을 지정하게 되면 
ASCENDING 순서일 경우에는 1이고 
DESCENDING 순서일 경우에는 1026승으로 설정됨.

⑤ CYCLE | NOCYCLE

CYCLE 은 지정된 시퀀스 값이 최대값까지 증가가 완료되게 되면 
다시 START WITH 옵션에 지정한 시작 값에서 다시 시퀀스를 시작하도록 함. 

NOCYCLE은 증가가 완료되게 되면 에러를 유발시킴. 

⑥ CACHE n | NOCACHE 

CACHE 은 메모리상의 시퀀스 값을 관리하도록 하는 것인데 기본 값은 20.
NOCACHE는 원칙적으로 메모리 상에서 시퀀스를 관리하지 않음.

*/

-- 다음은 부서 번호를 자동으로 부여해주는 시퀀스 객체를 생성하는 문장

CREATE SEQUENCE DEPT_DEPTNO_SEQ
INCREMENT BY 10
START WITH 10;

-- 시작 값이 10이고 10씩 증가하는 시퀀스 DEPT_DEPTNO_SEQ 를 생성.

/*
==================== 시퀀스 관련 데이터 딕셔너리 ===========================

사용자가 작성한 객체들의 정보를 저장하고 있는 데이터 딕셔너리의 이름을 보면 
다음과 같은 규칙성이 있음. 

테이블(TABLE) 객체에 대한 정보를 저장하는 데이터 딕셔너리는 USER_TABLES이고, 
뷰(VIEW)객체에 대한 정보를 저장하는 데이터 딕셔너리는 USER_VIEWS이므로 
시퀀스(SEQUENCE)에 대한 자료사전의 이름은 USER_SEQUENCES 이라고 사료될 것.

생성된 시퀀스 객체에 대한 정보를 저장하는 데이터 딕셔너리로는 
USER_SEQUENCES가 있음.

시퀀스와 관련된 데이터 딕셔너리 : user_sequences

====================== 시퀀스 객체의 정보를 살펴보기 ===========================
*/

-- 1. 우선 데이터 딕셔너리 USER_SEQUENCES의 테이블 구조를 먼저 살펴보기

DESC USER_SEQUENCES;

-- SEQUENCE_NAME은 시퀀스 객체의 이름을 저장하고 
-- MIN_VALUE는 최소값, MAX_VALUE는 최대값. 
-- INCREMENT_BY는 증가치에 대한 정보를 가지고 있으며, 
-- CYCLE_FLAG는 CYCLE옵션을 사용하는지, 하지 않는지에 대한 정보를 가지며
-- LAST_NUMBER는 마지막 숫자 값을 가지고 있음.

-- 2. 데이터 딕셔너리 USER_SEQUENCES로 현재 사용 중인 시퀀스 객체의 정보를 살펴보기

SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE,
INCREMENT_BY, CYCLE_FLAG
FROM USER_SEQUENCES;

-- 지금까지 생성한 시퀀스 객체는 DEPT_DEPTNO_SEQ 한 개이기에 
-- 데이터 딕셔너리에도 DEPT_DEPTNO_SEQ 시퀀스 객체 하나에 대한 정보만 나타냄

-- INCREMENT_BY가 증가치를 지정하는 컬럼으로 10씩 증가한다고 증가치가 설정되어 있고 
-- MIN_VALUE와 MAX_VALUE, CYCLE 옵션 값은 따로 지정하지 않았으므로 
-- 기본 값인 1과 10^27, N(사이클을 사용하지 않겠다)으로 지정되어 있음.

/*
===================== CURRVAL, NEXTVAL  ==========================

시퀀스의 현재 값을 알아내기 위해서 CURRVAL를 사용하고,   
다음 값을 알아내기 위해서는 NEXTVAL를 사용

CURRVAL : 현재 값을 반환한다.
NEXTVAL : 현재 시퀀스 값의 다음 값을 반환한다

CURRVAL에 새로운 값이 할당되기 위해서는 NEXTVAL로 새로운 값을 생성해야 함. 

즉, NEXTVAL로 새로운 값을 생성한 다음에 이 값을 CURRVAL에 대체하게 됨. 

NEXTVAL, CURRVAL을 사용할 수 있는 경우와 사용할 수 없는 경우를 살펴보기

    사용할 수 있는 경우                  사용할 수 없는 경우
    
서브 쿼리가 아닌 SELECT 문            VIEW의 SELECT 절
INSERT 문의 SELECT 절                DISTINCT 키워드가 있는 SELECT 문
INSERT 문의 VALUE절                  GROUP BY, HAVING, ORDER BY 절이 있는 SELECT 
UPDATE문의 SET 절                    SELECT, DELETE, UPDATE의 서브 쿼리
                                    CREATE TABLE, ALTER TABLE 명령의 DEFAULT 값
                                                              
*/

-- CURRVAL, NEXTVAL의 실제 사용 예를 살펴보기

-- 1. NEXTVAL로 새로운 값을 생성해야 함

SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;

-- 2. 시퀀스의 현재 값을 알아내기 위해서 CURRVAL를 사용

SELECT DEPT_DEPTNO_SEQ.CURRVAL FROM DUAL;

/*
======================== 시퀀스 실무에 적용하기 =======================

시퀀스는 99.9%가 INSERT 연산과 같이 사용되어 컬럼 값을 자동으로 발생시키는 용도로 사용. 

사원 테이블을 생성하면서 사원 번호를 기본 키로 설정. 

기본 키는 반드시 유일한 값을 가져야 함. 

사용자가 새로운 사원을 추가할 때마다 
유일한 사원번호를 INSERT 해야 하는 번거로움이 있음.

사원 번호를 생성하는 시퀀스 객체를 사용하여 사원 번호가 자동 생성되도록 한다면 
이러한 번거로움을 덜어줄 수 있음.

*/

--  ===================== 시퀀스를 테이블의 기본 키에 접목하기 ===============

-- 사원 번호를 생성하는 시퀀스 객체를 생성하여 
-- 이를 기본 키인 사원 번호에 사용하여 사용자가 새로운 사원을 추가할 때마다 
-- 유일한 사원번호를 INSERT 해야 하는 번거로움을 줄여보기

-- 1. 시작 값이 1이고 1씩 증가하고, 최댓값이 100000이 되는 시퀀스 EMP_SEQ 생성하기

CREATE SEQUENCE EMP_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000 ;

-- 2. 이번에는 생성된 시퀀스를 사용하기 위해서 
--    사원 번호를 기본 키로 설정하여 EMP01란 이름으로 새롭게 생성하기

DROP TABLE EMP01;

CREATE TABLE EMP01(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR(10),
HIREDATE DATE
);

-- 3. 사원 번호를 저장하는 EMPNO 컬럼은 기본 키로 설정해서 중복된 값을 가질 수 없음
--    다음은 생성한 EMP_SEQ 시퀀스로부터 
--    사원번호를 자동으로 할당받아 데이터를 추가하는 문장

INSERT INTO EMP01
VALUES(EMP_SEQ.NEXTVAL, 'JULIA', SYSDATE);

SELECT * FROM EMP01;

-- 1. 부서 번호를 생성하는 시퀀스 객체를 생성하여 
--    시퀀스 객체를 이용하여 부서 번호를 자동 생성하도록 해보기

-- 부서 테이블 생성

CREATE SEQUENCE DEPT_SEQ
START WITH 10
INCREMENT BY 10
MAXVALUE 100000 ;

CREATE TABLE DEPT_EXAMPLE(
DEPTNO NUMBER(4) PRIMARY KEY,
DNAME VARCHAR2(15),
LOC VARCHAR2(15)
);

-- 부서 번호를 저장하는 DEPTNO 컬럼은 기본 키로 설정하였으므로 중복된 값을 가질수 없음

INSERT INTO DEPT_EXAMPLE
VALUES(DEPT_SEQ.NEXTVAL, 'ACCOUNT', 'SEOUL');
INSERT INTO DEPT_EXAMPLE
VALUES(DEPT_SEQ.NEXTVAL, '경리과', '서울');
INSERT INTO DEPT_EXAMPLE
VALUES(DEPT_SEQ.NEXTVAL, '총무과', '대전');
INSERT INTO DEPT_EXAMPLE
VALUES(DEPT_SEQ.NEXTVAL, '기술팀', '인천');

SELECT * FROM DEPT_EXAMPLE;

-- 추가된 행을 살펴보면 시퀀스 객체가 발생시킨 일련번호가 
-- 부서 번호에 적용된 것을 확인할 수 있습니다. 
-- 시퀀스 객체의 초기 값을 10으로 하여 10씩 증가하도록 했기 때문에 
-- 증가치를 지정했기 때문에 부서 번호가 10, 20, 30, 40으로 지정된 것을 확인할 수 있음.

-- ================= DROP SEQUENCE문으로 시퀀스를 제거 =================

DROP SEQUENCE DEPT_DEPTNO_SEQ;

/*
=================== 시퀀스 수정 ========================

이번에는 시퀀스를 변경해보기. 
시퀀스를 변경하려면 ALTER SEQUENCE 문을 사용해야함.

ALTER SEQUENCE sequence_name 
[INCREMENT BY n] 
[{MAXVALUE n | NOMAXVALUE}] 
[{MINVALUE n | NOMINVALUE}] 
[{CYCLE | NOCYCLE}] 
[{CACHE n | NOCACHE}]

ALTER SEQUENCE는 START WITH 절이 없다는 점을 빼고는
CREATE SEQUENCE와 구조가 동일. 

START WITH 옵션은 ALTER SEQUENCE를 써서 변경할 수 없음.

다른 번호에서 다시 시작하려면 이전 시퀀스를 삭제하고 다시 생성해야 함.  
*/

-- 이미 생성해서 사용하던 시퀀스의 최대값을 변경해보기

-- 1. 시퀀스는 최대값을 지정하지 않으면 기본적으로 10^27으로 지정됨.
--    사용자가 임의로 최대값을 지정할 수 있는데 MAXVALUE에 값을 지정하면 됨. 
--    10부터 10씩 증가하면서 최대 30까지의 값을 갖는 시퀀스를 생성하기

DROP SEQUENCE DEPT_DEPTNO_SEQ;

CREATE SEQUENCE DEPT_DEPTNO_SEQ
START WITH 10
INCREMENT BY 10 
MAXVALUE 30; 

-- 2. 부서 번호를 계속 생성하다 보면 최대값을 넘게 됨. 
--    최대값을 넘을 때까지 시퀀스를 생성해보기

SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;
SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;
SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;
SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;

-- 이때 CYCLE 옵션을 지정하지 않으면 기본값으로 NOCYCLE를 갖게 되므로 오류가 발생하게 됨.

-- 3. ALTER SEQUENCE문을 사용하여 사용 중이던 
-- DEPT_DEPTNO_SEQ 시퀀스의 최대값을 수정해보기

ALTER SEQUENCE DEPT_DEPTNO_SEQ
MAXVALUE 1000;

-- 4. USER_SEQUENCES 를 조회하면 시퀀스가 수정되었는지 확인할 수 있음

SELECT SEQUENCE_NAME, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG
FROM USER_SEQUENCES;