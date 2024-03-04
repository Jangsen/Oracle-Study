/*
=================== 무결성 제약 조건의 개념과 종류   ======================

데이터 무결성 제약 조건(Data Integrity Constraint Rule)이란 
테이블에 부적절한 자료가 입력되는 것을 방지하기 위해서
테이블을 생성할 때 각 컬럼에 대해서 정의하는 여러 가지 규칙을 말함.

무결성 제약 조건           역할

NOT NULL                NULL을 허용하지 않는다.

UNIQUE                  중복된 값을 허용하지 않는다. 항상 유일한 값을 갖도록 함.

PRIMARY KEY             NULL을 허용하지 않고 중복된 값을 허용하지 않는다.
                        NOT NULL 조건과 UNIQUE 조건을 결합한 형태

FOREIGN KEY             참조되는 테이블의 컬럼의 값이 존재하면 허용

CHECK                   저장 가능한 데이터 값의 범위나 조건을 지정하여 설정한 값만 허용


===== EMP 테이블에 INSERT 작업 중 무결성 제약 조건을 위배했을 때 나타나는 에러 메시지

ORA-00001: 무결성 제약 조건( ... )에 위배됩니다.

DESC 명령어로는 NOT NULL 제약조건만 확인할 수 있고 
DEPTNO 컬럼에 기본 키 제약 조건이 지정된 것을 알 수 없음

======== 제약 조건 확인하기

오라클은 USER_CONSTRAINTS 데이터 딕셔너리 뷰로 제약 조건에 관한 정보를 알려 줌

USER_CONSTRAINTS 데이터 딕셔너리 뷰를 조회하면 
내가 만든(USER) 제약 조건(CONSTRAINTS)의 정보를 조회 할 수 있음

*/

DESC USER_CONSTRAINTS

/*
USER_CONSTRAINTS 데이터 딕셔너리는 
제약 조건의 정보를 위해서 많은 칼럼으로 구성되어 있지만, 
우선 중요한 컬럼 몇 개만 살펴보기.

OWNER는 제약 조건을 소유한 사용자명을 저장하는 컬럼. 
CONSTRAINT_NAME은 제약 조건 명을 ,
CONSTRAINT_TYPE는 제약 조건 유형을 저장하는 컬럼.
CONSTRAINT_TYPE은 P, R, U, C 4가지 값 중에 하나를 가짐.

CONSTRAINT_TYPE                 의미

P                               PRIMARY KEY

R                               FOREIGN KEY

U                               UNIQUE

C                               CHECK, NOT NULL

제약 조건은 5개라고 했는데 제약 조건 유형은 4가지로 나타남.

제약 조건 중에 NOT NULL 은 컬럼에 NULL 값이 저장되어서는 안 된다는 조건.

즉, NOT NULL 조건은 컬럼에 NULL 값을 체크하는 조건으로 처리되기 때문에 
CHECK 를 나타내는 C로 표현.

C는 CHECK 조건과 NOT NULL 조건을 모두 포함. 

제약 조건 유형은 제약 조건의 이니셜로 표현되지만 
FOREIGN KEY 만은 R로 표현. 

이는 FOREIGN KEY는 PRIMARY KEY 를 참조하기 때문에 참조 무결성을 지켜야 함. 
그러므로 참조 무결성(REFERENCE INTEGRITY)의 이니셜인 R을 
FOREIGN KEY 의 제약 조건 유형으로 
FOREIGN KEY 의 제약 조건 유형이 R인 이유가 
REFERENCE INTEGRITY 의 이니셜로 인한 것이라는 것까지만 이해하기.

TABLE_NAME은 각 제약 조건들이 속한 테이블의 이름.
제약 조건 유형이 C인 경우에는 NOT NULL 조건과 CHECK 조건이 모두 포함되는데 
NOT NULL 조건인 경우에는 따로 언급되는 내용이 없지만 
CHECK 조건일 경우에는 어떤 내용이 조건으로 사용되었는지를 기록하고 있어야 하는데, 
SEARCH_CONDITION은 제약 조건 유형이 C인 경우 각 행에 대한 조건을 설명해 줌. 

R_CONSTRAINT_NAME은 제약 조건이 FOREIGN KEY인 경우 
어떤 PRIMARY KEY를 참조했는지에 대한 정보를 갖는 것

================ 명시적으로 NULL 값의 삽입   =============

테이블에 어떤 제약 조건들이 사용되었는지 살펴보기 위해 
데이터 딕셔너리USER_CONSTRAINTS의 내용을 출력

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 
               ①               ②           ③
FROM USER_CONSTRAINTS; 
④

④ 의 USER_CONSTRAINTS은 
제약 조건에 대한 모든 정보가 저장된 데이터 딕셔너리. 

① , ② , ③ 은 데이터딕셔너리인 USER_CONSTRAINTS 테이블내의 컬럼
① 은 제약 조건 명을 
② 는 제약 조건 유형을 
③ 은 제약 조건이 어느 테이블 소속인지 테이블 명을 저장하고 있는 컬럼. 

scott 계정으로 접속해 있는 상태에서 
scott 소유의 테이블에 지정된 제약조건을 살펴보도록 하기       */

-- 1. USER_CONSTRAINTS 테이블의 내용을 살펴보기
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 
FROM USER_CONSTRAINTS;

-- 어떤 테이블에 어떤 제약 조건이 설정되어 있는지 종류와 제약 조건 이름을 알 수 있음.

-- 2. 하지만, USER_CONSTRAINTS 데이터 딕셔너리 뷰에는 
--    어떤 칼럼에 제약 조건이 정의되었는지 칼럼 명이 보이질 않음. 
--    어떤 칼럼에 어떤 제약 조건이 지정되었는지 알려주는 데이터 딕셔너리는 없을까? 
--    USER_CONS_COLUMNS 데이터 딕셔너리 뷰는 제약 조건이 지정된 칼럼 명도 알려줌

SELECT * 
FROM USER_CONS_COLUMNS;

/*
============== 필수 입력을 위한 NOT NULL 제약 조건     ==================

새로운 사원이 입사하여 사원의 정보를 입력하는데 
사원번호와 사원 명이 불분명하여 데이터가 저장되지 않았다면 
누구의 직급인지, 누구의 부서번호인지를 모르게 되므로 자료로서의 의미를 갖기 어려움.

INSERT INTO EMP01
VALUES(NULL, NULL, 'SALESMAN', 30);

따라서 사원의 정보를 입력할 때 
반드시 입력해야하는 선택이 아닌 필수 입력을 요구하는 컬럼이 있다면 
NULL 값이 저장되지 못하도록 제약 조건을 설정해야 함.

NOT NULL 제한 조건은 
해당 컬럼에 데이터를 추가하거나 수정할 때 NULL 값이 저장되지 않게 제약을 걸어주는 것
사원번호와 사원명과 같이 자료가 꼭 입력되게 하고 싶을 때 사용.

NOT NULL 제약조건을 학습하기 전에 
지금까지 실습에 사용했던 사원 테이블과 유사한 구조의 
사원번호, 사원명, 직급, 부서번호 4개의 칼럼으로 구성된 EMP01 테이블에 
아무런 제약 조건을 설정하지 않고 생성한 후에 
이렇게 생성한 테이블에는 NULL 값이 저장됨을 확인해보기            */

-- 1. 지금까지 실습에 사용했던 사원 테이블과 유사한 구조의 
--    사원번호, 사원명, 직급, 부서번호 4개의 칼럼으로 구성된 EMP01 테이블을 생성

SELECT * FROM EMP01;

DROP TABLE EMP01;

CREATE TABLE EMP01( 
EMPNO NUMBER(4), 
ENAME VARCHAR2(10), 
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
);

-- 2. 생성된 테이블의 내용을 살펴보면 내용을 갖고 있지 않음을 알 수 있음. 
--    CREATE TABLE 명령은 
--    테이블을 생성하면서 칼럼과 그 칼럼의 자료 형태 등의 구조를 정의하는 것이지 
--    자료를 입력하는 것이 아니기 때문

-- 3. 위에서 생성한 EMP01 테이블에 데이터를 추가.

INSERT INTO EMP01
VALUES(NULL, NULL, 'SALESMAN', 30);

SELECT * FROM EMP01;

-- 4. EMP01 테이블에 사원번호와 사원명에 데이터를 저장하지 않더라도 
--    해당 로우가 테이블에 추가됨. 
--    테이블을 생성하면서 아무런 제약 조건도 주지 않았기 때문. 
--    DESC 명령어로도 NOT NULL 제약조건이 설정되어 있지 않음을 확인할 수 있음. 

DESC EMP01;

/*
=================== 컬럼 레벨 정의 방법으로 제약 조건 지정 ==================

NOT NULL 제약 조건을 지정하지 않으면 위 예에서처럼 NULL 값이 저장됨. 

특정 컬럼에 NULL 값이 저장되지 못하도록 하려면 NOT NULL 제한 조건을 설정해야 함. 

제약 조건을 설정하는 방법은 컬럼 레벨과 테이블 레벨 두 가지 방식이 있음. 
NOT NULL 제약 조건은 컬럼 레벨로만 정의할 수 있음. 

column_name data_type constraint_type

제약 조건은 칼럼명과 자료형을 기술한 후에 연이어서 NOT NULL을 기술하면 됨
*/

-- 1. 지금까지 실습에 사용했던 사원 테이블과 유사한 구조의 
--    사원번호, 사원명, 직급, 부서번호 4개의 칼럼으로 구성된 EMP02 테이블을 생성하되
--    EMPNO와 EMPNAME 컬럼에 NOT NULL 제약 조건 설정해보기

SELECT * FROM EMP02;
DROP TABLE EMP02;

CREATE TABLE EMP02( 
EMPNO NUMBER(4) NOT NULL, 
ENAME VARCHAR2(10) NOT NULL, 
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
); 

DESC EMP02;
-- 2. . 위에서 생성한 EMP02 테이블에 데이터를 추가.

INSERT INTO EMP02
VALUES(NULL, NULL, 'SALESMAN', 10);

-- EMP02 테이블은 사원번호와 사원명에 NOT NULL 조건을 지정하였기에 
-- 사원번호에 NULL을 추가하는 명령어에서 오류가 발생

-- 3. DESC 명령어로 NOT NULL 제약조건이 설정되어 있음을 확인할 수 있음

DESC EMP02;

/*
=============== 유일한 값만 허용하는 UNIQUE 제약 조건 ===============

UNIQUE 제약 조건이란 특정 칼럼에 대해 자료가 중복되지 않게 하는 것. 

즉, 지정된 칼럼에는 유일한 값이 수록되게 하는 것.

새로운 사원이 입사하여 이 사원의 정보를 입력했는데, 
이미 존재하는 사원의 번호와 동일한 사원번호로 입력하였더니 
성공적으로 추가된다면 어떻게 될까?

다음은 사원 테이블의 사원번호를 유일키로 지정한 예        */

-- 1. 지금까지 실습에 사용했던 사원 테이블과 유사한 구조의 
--    사원번호, 사원명, 직급, 부서번호 4개의 칼럼으로 구성된 EMP03 테이블을 생성하되 
--    사원번호를 유일키로 지정. 
--    제약 조건은 칼럼명과 자료형을 기술한 후에 연이어서 UNIQUE를 기술하면 됨

SELECT * FROM EMP03;
DROP TABLE EMP03;

CREATE TABLE EMP03( 
EMPNO NUMBER(4) UNIQUE,
ENAME VARCHAR2(10) NOT NULL, 
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
); 

-- 2. 위에서 생성한 EMP03 테이블에 데이터를 추가.

INSERT INTO EMP03
VALUES(7499, 'ALLEN', 'SALESMAN', 30);

-- 3. 앞에서 사원번호로 7499번의 자료를 입력했는데 
--    다시 동일한 사원번호를 입력하면 어떻게 될까?

INSERT INTO EMP03
VALUES(7499, 'JONES', 'MANAGER', 20);

-- 4. 하지만 NULL 값은 중복되어 저장할 수 있음. 
--    UNIQUE는 값(VALUE)이 유일함을 의미하는 것. 
--    NULL은 값(VALUE)에서 제외되므로 유일한 조건인지를 체크하는 값에서 제외됨. 

INSERT INTO EMP03
VALUES(NULL, 'JONES', 'MANAGER', 20);

INSERT INTO EMP03
VALUES(NULL, 'JONES', 'SALESMAN', 10);

/*
=============== 컬럼 레벨로 제약 조건명을 명시해서 제약 조건 설정하기 ============

지금까지는 사용자가 제약 조건명을 지정하지 않고 제약 조건만을 명시했음.

이럴 경우 오라클 서버가 자동으로 제약 조건명을 부여함.

오라클이 부여하는 제약 조건명은 SYS_ 다음에 숫자를 나열함.

제약 조건에 위배하면 오류 메시지에 제약 조건명만 출력되는데 
오라클이 부여한 제약 조건명으로는 어떤 제약 조건을 위반했는지 알 수 없기에 
USER_CONSTRAINTS 데이터 딕셔너리를 검색해야만 어떤 제약 조건인지 확인 할 수 있음.

만일 사용자가 의미있게 제약 조건명을 명시한다면 
제약 조건명만으로도 어떤 제약 조건을 위배했는지 알 수 있게 됨     

이번에는 제약 조건명을 지정하는 방법을 살펴보도록 하기

column_name data_type CONSTRAINT 
constraint_name constraint_type

사용자 제약 조건 명을 설정하기 위해서는 
CONSTRAINT라는 키워드와 함께 제약 조건 명을 기술하면 된다는 것을 확인할 수 있음.

제약 조건 명(constraing_name)은 다음과 같은 명명 규칙을 준수해서 작성하는 것이 좋음.

[테이블명]_[칼럼명]_[제약 조건 유형] 

사원 테이블 EMP04에 대해서 사원 번호를 
저장하는 칼럼 EMPNO에 대한 유일 키 제약 조건 명인 EMP04_EMPNO_UK를 지정

                EMP04_EMPNO_UK
        테이블명 _ 칼럼명 _ 제약 조건유형

사용자 제약 조건 명을 설정하기 위해서는 
CONSTRAINT라는 키워드와 함께 제약 조건 명을 기술해야 함.       */

-- 지금까지 실습에 사용했던 사원 테이블과 유사한 구조의 
-- 사원번호, 사원명, 직급, 부서번호 4개의 칼럼으로 구성된 EMP04 테이블을 생성하되 
-- 사원번호에는 유일키로 사원명은 NOT NULL 제약조건을 설정해 보기.

CREATE TABLE EMP04( 
EMPNO NUMBER(4) CONSTRAINT EMP04_EMPNO_UK UNIQUE,
ENAME VARCHAR2(10) CONSTRAINT EMP04_ENAME_NN NOT NULL, 
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
);

-- 2. 생성된 제약 조건 명을 확인하기 위해서 USER_CONSTRAINTS 데이터 딕셔너리 뷰를 검색

SELECT TABLE_NAME, CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('EMP04');

/*
================= 데이터 구분을 위한 PRIMARY KEY 제약 조건 ================

유일키 제약 조건을 지정한 칼럼은 
중복된 데이터를 저장하지는 못하지만 NULL 값을 저장하는 것은 허용

INSERT INTO EMP03
VALUES(NULL, 'JHON', 'MANAGER', 20);

INSERT INTO EMP03
VALUES(NULL, 'JHON', 'SALESMAN', 10);

위와 같이 동명이인이 입사를 했다면 이를 구분할 수 있는 유일한 키가 있어야 하는데 
사원번호에 NULL 값이 저장되는 바람에 이들을 구분할 수 없게 됨.

테이블 내의 해당 행을 다른 행과 구분할 수 있도록 하는 칼럼은 반드시 존재해야 함.

식별 기능을 갖는 칼럼은 유일하면서도 NULL 값을 허용하지 말아야 함.

즉, UNIQUE 제약 조건과 NOT NULL 제약 조건을 모두 갖고 있어야 하는데 
이러한 두 가지 제약 조건을 모두 갖는 것이 기본 키(PRIMARY KEY) 제약 조건.      

제약 조건은 칼럼명과 자료형을 기술한 후에 연이어서 PRIMARY KEY를 기술하면 됨.

*/

-- 1. 지금까지 실습에 사용했던 사원 테이블과 유사한 구조의 
--    사원번호, 사원명, 직급, 부서번호 4개의 칼럼으로 구성된 테이블을 생성하되 
--    기본 키 제약 조건을 설정해보기

CREATE TABLE EMP05( 
EMPNO NUMBER(4) CONSTRAINT EMP05_EMPNO_PK PRIMARY KEY ,
ENAME VARCHAR2(10) CONSTRAINT EMP05_ENAME_NN NOT NULL, 
JOB VARCHAR2(9),
DEPTNO NUMBER(2)
); 

-- 2. 위에서 생성한 테이블에 데이터를 추가해보기

INSERT INTO EMP05
VALUES(7499, 'ALLEN', 'SALESMAN', 30);

-- 3. 다음은 기본 키로 지정된 사원번호에 동일한 값을 저장해 보도록 하기

INSERT INTO EMP05
VALUES(7499, 'JONES', 'MANAGER', 20);

-- 4. 이번에는 기본 키로 지정된 사원번호에 NULL 값을 저장해 보도록 하기

INSERT INTO EMP05
VALUES(NULL, 'JONES', 'MANAGER', 20);

/*
================ 참조 무결성을 위한 FOREIGN KEY 제약 조건 ================

참조의 무결성이란 개념을 알아야 FOREIGN KEY 제약 조건을 설명할 수 있음.

참조의 무결성은 테이블 사이의 관계에서 발생하는 개념이므로 
우리가 지금까지 학습했던 사원 테이블과 부서 테이블의 관계를 예를 들어 설명.

우선 부서 테이블을 살펴보면 
부서 테이블에는 부서에 대한 정보를 구분하기 위해서 
유일하고 NULL이 아닌 값만 저장하도록 
부서 번호 컬럼(DEPTNO)를 기본 키로 설정하고 있음.

부서 테이블을 살펴보면 부서 번호가 10, 20, 30, 40인 부서만 존재함.
부서 테이블의 부서 번호 컬럼(DEPTNO)와 동일한 이름의 컬럼이 사원(EMP) 테이블에도 존재.

사원 테이블에 존재하는 부서 번호는 
부서 테이블에 존재하는 부서 번호인 10, 20, 30으로만 기록되어 있음.

해당 회사에 부서가 4개 존재한다면 
그 회사에 다니는 사원들도 그 4개의 부서 중에 한곳에 소속되어 있어야 하기 때문.

만일 부서 테이블에 존재하지 않는 부서 번호가 특정 사원의 부서로 지정되어 있다면 
이치에 맞지 않게 됨. 

조인이나 서브 쿼리를 학습할 때 살펴보았듯이 
사원 테이블에 없는 상세 정보는 부서 테이블에서 찾아오는데 
사원 테이블에 저장된 부서번호가 테이블에 없다면 
참조할 때 무결해야 한다는 조건(참조의 무결성)에 위배되는 것.

그러므로 사원 테이블에 부서번호 입력 할 때 
부서 테이블에 존재하는 부서번호만 입력하도록 하면 참조의 무결성이 지켜지는 것. 

이를 위해서는 사원 테이블의 부서번호 컬럼에 외래 키 제약조건을 명시해야 함. 
외래 키 제약조건은 
사원 테이블의 부서 번호는 반드시 부서 테이블에 존재하는 부서 번호만 입력하도록 함으로서 
사원 테이블이 부서 테이블을 부서 번호로 참조 가능하도록 하는 것을 의미. 

다음은 ERD(Entity Relation Diagram)로서 테이블을 생성하기에 앞서 
데이터베이스 모델링 과정에서 업무를 분석한 후 
얻어낸 개체와 관계를 다이어그램으로 나타낸 것.
                        / \
                      /    \
|---------|          /      \           |---------|
|   부서   |----------  소속   ----------|   사원   |
|---------|          \      /           |---------|
                      \    /
                       \  /





