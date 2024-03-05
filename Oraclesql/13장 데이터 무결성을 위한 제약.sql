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


                        / \
                      /    \
|---------|          /      \           |---------|
|   부서   |----------  소속   ----------|   사원   |
|---------|          \      /           |---------|
                      \    /
                       \  /

다음은 ERD(Entity Relation Diagram)로서 테이블을 생성하기에 앞서 
데이터베이스 모델링 과정에서 업무를 분석한 후 
얻어낸 개체와 관계를 다이어그램으로 나타낸 것.

참조의 무결성은 두 테이블 사이(사원 테이블, 부서 테이블)의 주종 관계에 의해서 결정.

주체가 되는 테이블은 부모 테이블이 되고 종속이 되는 테이블은 자식 테이블이 됨.

사원은 회사 내에 존재하는 부서에 소속되어 있어야 함.

사원과 부서의 소속 관계가 위와 같이 표현된다면 부서가 주체(부모 테이블)
사원이 종속(자식 테이블)이 됨

주체 관계가 애매모호한 경우에는 어느 테이블의 데이터가 먼저 정의되어야 하는가를 기준으로
부모 테이블과 자식 테이블을 구분할 수 있음

먼저 정의되어야 하는 테이블이 부모 테이블이고 나중에 정의되어야 하는 테이블이 자식 테이블

회사를 설립하고 어떤 부서를 구성하여 운영할지 정한 후에,
그 부서에서 일할 사원을 뽑아야 소속이란 관계가 성립되므로
부서가 부모테이블이 되고 사원이 자식 테이블이 됨.

외래 키(FOREIGN KEY) 제약 조건은 
자식 테이블인 사원 테이블(EMP)의 부서번호(DEPTNO) 칼럼에 
부모 테이블인 부서 테이블(DEPT)의 부서번호(DEPTNO)를 부모 키로 설정하는 것. 

이때 주의할 점은 부모 키가 되기 위한 칼럼은 
반드시 부모 테이블의 기본 키(PRIMARY KEY)나 유일키(UNIQUE)로 설정되어 있어야 한다.

부모 테이블                              자식 테이블
Primary Key                                             Foreign Key
    |                                                         Λ
    |                                                         |
    |=========================================================|



우리가 지금까지 학습할 때 사용한 오라클이 제공해주는 EMP 테이블과 DEPT 테이블을 보면 
부모 테이블인 부서 테이블(DEPT)의 부서번호(DEPTNO)는 
기본 키(PRIMARY KEY)로 설정되어 있고, 
이를 참조할 수 있도록 하기 위해서 
자식 테이블인 사원 테이블(EMP)에서 부서번호(DEPTNO)에 
외래 키(FOREIGN KEY) 제약조건을 설정해 놓은 상태.                      */

-- 부서(dept) 테이블의 기본 키인 부서 번호(deptno) 컬럼을 부모 키라고 함 
SELECT * FROM DEPT;
DESC DEPT;

-- 사원(emp) 테이블의 부서 번호(deptno)컬럼은 외래 키로 지정해야 참조의 무결성이 설정됨
SELECT * FROM EMP;
DESC EMP;

/*
자식 테이블(EMP)에 참조의 무결성을 위해 특정 컬럼에 외래 키를 설정하였다면 
새로운 데이터를 추가할 때마다 부모 테이블에 부모 키로 설정된 컬럼을 살펴야 한다.

부모 키로 설정된 컬럼에 존재하는 값만 추가하고 
존재하지 않는 값이라면 추가하지 않는다.

이렇게 함으로서 자식 테이블이 부모 테이블을 참조하는데 아무런 문제가 없도록 하기.

외래 키 제약 조건이 지정된 
사원 테이블에 부서 테이블에 존재하지 않은 50번 부서 번호를 저장해보기    */

-- 자식이 붙어있기 때문에 삭제 불가
DELETE FROM DEPT
WHERE DEPTNO = 10;


SELECT * FROM DEPT;

INSERT INTO EMP
VALUES(8100, 'SUJAN', 'CLERK', 7839, '92/03/03', 3000, 800, 50);

-- EMP 테이블에 DEPTNO 컬럼 값을 50으로 하여 새로운 사원을 추가하려하면
-- 참조의 무결성을 위배했다는 오류 메세지가 출력
-- DEPT 테이블에는 DEPTNO 컬럼 값으로 10, 20, 30, 40만 존재하고 50은 존재하지 않기 때문
-- EMP 테이블에서 참조하는 DEPT 테이블의 DEPTNO 컬럼을 부모 키라고 하므로
-- 부모 키가 없다라는 오류 메세지도 함께 출력 됨.

-- 오라클에서 제공해주는 EMP 테이블과 DEPT 테이블의 제약 조건을 살펴보기

SELECT TABLE_NAME, CONSTRAINT_TYPE,
CONSTRAINT_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('DEPT', 'EMP');

-- R_CONSTRAINT == 참조

/*
R_CONSTRAINT_NAME 컬럼에 대해서 언급해보면. 
R_CONSTRAINT_NAME 컬럼은 
FOREIGN KEY인 경우 
어떤 PRIMARY KEY를 참조했는지에 대한 정보를 갖습니다.

EMP 테이블의 제약조건 
FK_DEPTNO의 
R_CONSTRAINT_NAME 컬럼값이 
PK_DEPT으로 설정되어 있음. 
이는 EMP 테이블의 
FK_DEPTNO는 외래 키 제약 조건으로
PK_DEPT 제약조건을 참조하고 있다는 내용. 

PK_DEPT 제약조건은 
DEPT 테이블의 기본 키 제약 조건이므로 
EMP 테이블은 DEPT 테이블을 참조하고 있는 셈. 
*/

-- 외래키 제약 조건 설정해 보기
-- 1. 지금까지 실습에 사용했던 사원 테이블과 유사한 구조의 
-- 사원번호, 사원명, 직급, 부서번호 4개의 칼럼으로 구성된 테이블을 생성하되 
-- 기본 키 제약 조건은 물론 외래키 제약 조건도 설정하기

CREATE TABLE EMP06(
EMPNIO NUMBER(4)
CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR(10)
CONSTRAINT EMP06_ENAME_NN NOT NULL,
JOB VARCHAR(9),
DEPTNO NUMBER(2)
CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO)
);

DESC EMP06;

-- 2. 현재 EMP06 테이블에 부서 테이블에 존재하지 않는 부서번호를 갖는 사원 정보를 추가

INSERT INTO EMP06
VALUES(7566, 'JONES', 'MANAGER', 50);

/*

======================== CHECK 제약 조건    ============================ check

CHECK 제약 조건은 입력되는 값을 체크하여 설정된 값 이외의 값이 들어오면 
오류 메시지와 함께 명령이 수행되지 못하게 하는 것입. 

조건으로 데이터의 값의 범위나 특정 패턴의 숫자나 문자 값을 설정할 수 있음. 

예를 들어 사원 테이블에 급여 컬럼을 생성하되 
급여 컬럼 값은 500에서 5000사이의 값만 저장할 수 있도록 하거나 
성별을 저장하는 컬럼으로 GENDER 를 정의하고, 
이 컬럼에는 남자는 M, 여자는 F 둘 중의 하나만 저장할 수 있도록 제약을 주려면
CHECK 제약조건을 지정해야 함. 

*/

-- 사원 테이블에 급여 컬럼을 생성하되 
-- 급여 컬럼 값은 500에서 5000사이의 값만 저장할 수 있도록 하고 
-- 성별을 저장하는 컬럼으로 GENDER 를 정의하고, 
-- 이 컬럼에는 남자는 M, 여자는 F 둘 중의 하나만 저장할 수 있도록 CHECK 제약조건을 지정

-- 1. 사원번호, 사원명, 직급, 부서번호, 성별 5개의 칼럼으로 구성된 테이블을 생성하되 
-- 기본 키 제약 조건, 외래키 제약 조건은 물로 CHECK 제약 조건도 설정

CREATE TABLE EMP07(
EMPNO NUMBER(4)
CONSTRAINT EMP07_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR(10)
CONSTRAINT EMP07_ENAME_NN NOT NULL,
SAL NUMBER(7, 2)
CONSTRAINT EMP07_SAL_CK CHECK(SAL BETWEEN 500 AND 5000),
GENDER VARCHAR(1)
CONSTRAINT EMP07_GENDER_CK CHECK(GENDER IN('M', 'F'))
);

DESC EMP07;

--  ====================== DEFAULT 제약 조건    ===========================

-- 디폴트는 아무런 값을 입력하지 않았을 때 디폴트제약의 값이 입력이됨.

-- 만약 지역명(LOC)라는 컬럼에 아무런 값도 입력 안했을 때 
-- 디폴트의 값인 'SEOUL'이 들어가도록 하고 싶을 경우 디폴트 제약 조건을 지정

-- 1. 다음과 같이 부서 테이블을 생성
DROP TABLE DEPT01;

CREATE TABLE DEPT01(
DEPTNO NUMBER(2) PRIMARY KEY,
DNAME VARCHAR(14),
LOC VARCHAR(13) DEFAULT 'SEOUL'
);

-- 2. 만약 지역명(LOC) 라는 컬럼에 아무런 값도 입력하지 않았을 때 디폴트의 값인
--    'SEOUL'이 들어감을 확인할 수 있음

INSERT INTO DEPT01
(DEPTNO, DNAME)
VALUES(10, 'ACCOUNTING');

SELECT * FROM DEPT01;

/*
========= 테이블 레벨 방식으로 제약 조건 지정하기 ==================

지금까지 제약 조건을 지정하는 방식을 컬럼 레벨의 제약 조건지정 이라고함.

   *컬럼 레벨 제약 조건

    CREATE TABLE로 테이블을 생성하면서 컬럼을 정의하게 되는데
    하나의 컬럼 정의가 다 마무리되기 전에 컬럼 명 다음에 타입을 지정하고
    그 뒤에 연이어서 제약 조건을 지정하는 방식
   
   *테이블 레벨의 제약 조건
   
    컬럼을 모두 정의하고 나서 테이블 정의를 마무리 짓기 전에
    따로 생성된 컬럼들에 대한 제약 조건을 한꺼번에 지정하는 것
    
    일반적으로 컬럼 레벨 방식으로 제약조건을 지정하는 것이 훨씬 간편할텐데
    굳이 테이블 레벨의 지정 방식을 사용하는 데는 2가지 이유가 있음
    
    1. 복합키로 기본키를 지정할 경우
    
        지금까지는 한 개의 컬럼으로 기본키를 지정했음
        하지만 경우에따라 2개 이상의 컬럼이 하나의 기본키를 구성하는 경우가 있는데
        이를 복합키 라고 함.
        복합키 형태로 제약조건을 지정할 경우에는
        컬럼 레벨 형식으로는 불가능하고
        반드시 테이블 레벨 방식을 사용해야 함.
        
    2. ALTER TABLE로 제약 조건을 추가할 때
    
        테이블의 정의가 완료되어서 이미 테이블의 구조가 결정된 후에
        나중에 테이블에 제약 조건을 추가하고 할 때는 
        테이블 레벨 방식으로 제약 조건을 지정해야 함.
        
        테이블 레벨 정의 방식의 기본 형식
        
        CREATE TABLE table_name
        (column_name1 datatype1,
        column_name2 datatype2,
        . . . 
        [CONSTRAINT constraint_name] constraint_type (column_name)
        )
        
        테이블 레벨에서 컬럼의 제약 조건을 정의할 때 주의할 점
        
        NOT NULL 조건은 테이블 레벨 정의 방법으로 제약조건을 지정할 수 없다는 점.
        
    
    컬럼 레벨로 제약 조건과 테이블 레벨로 제약 조건을 지정하는 방법의 차이점을 살펴보기
*/
--   1. 테이블 레벨로 제약 조건을 지정하기 앞서
--      컬럼 레벨로 제약 조건을 지정하는 방법을 살펴보기
DROP TABLE EMP02;
DESC EMP02;    
        
CREATE TABLE EMP01(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR(10) NOT NULL,
JOB VARCHAR(9) UNIQUE,
DEPTNO NUMBER(4) REFERENCES DEPT(DEPTNO)
);

--    2. 위는 컬럼 레벨 방식, 이번에는 테이블 레벨 방식과 비교해보기

CREATE TABLE EMP02( 
EMPNO NUMBER(4),
ENAME VARCHAR2(10) NOT NULL, 
JOB VARCHAR2(9),
DEPTNO NUMBER(4),
PRIMARY KEY(EMPNO),
UNIQUE(JOB),
FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO)
);

--     3. 명시적으로 제약 조건 명을 지정하여 테이블 레벨 방식으로 제약 조건 지정하기
DROP TABLE EMP03;

CREATE TABLE EMP03(
EMPNO NUMBER(4) CONSTRAINT EMP03_ENAME_NN NOT NULL,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
DEPTNO NUMBER(4),
CONSTRAINT EMP03_EMPNO_PK PRIMARY KEY(EMPNO),
CONSTRAINT EMP03_JOB_UK UNIQUE(JOB),
CONSTRAINT EMP03_DEPTNO_FK FOREIGN KEY(DEPTNO)
REFERENCES DEPT(DEPTNO)
);

--      이번에는 복합키를 기본 키로 지정하는 방법 살펴보기

--     1. 일련 번호를 따로 두지 않고 이름과 핸드폰 번호를 복합하여 이를 기본 키로 지정

CREATE TABLE MEMBER01(
NAME VARCHAR2(10),
ADDRESS VARCHAR2(30),
HPHONE VARCHAR2(16),
CONSTRAINT MEMBER01_COMBO_PK PRIMARY KEY(NAME, HPHONE)
);

/*
===================제약 조건 추가하기 ==========================================

테이블 구조를 결정하는 DDL을 학습하면서
테이블이 이미 생성된 이후에 테이블의 구조를 변경하기 위한 명령어로
ALTER TABLE을 사용한다는 것을 이미 학습했음

제약 조건 역시 이미 테이블을 생성하면서 지정해주는 것이었기에
테이블 생성이 끝난 후에 제약 조건을 추가하기 위해서는
ALTER TABLE로 추가해 주어야 함.

제약조건을 추가하기 위한 형식

ALTER TABLE table_name 
ADD [CONSTRAINT constraint_name] 
constraint_type (column_name);

새로운 제약 조건을 추가하려면 ALTER TABLE 문에 ADD 절을 사용해야 함.
*/

-- 제약조건 없이 테이블을 생성한 후 제약 조건을 추가해보기
-- 1. 사원 테이블과 유사한 구조의 
-- 사원번호, 사원명, 직급, 부서번호 4개의 칼럼으로 구성된 EMP01 테이블을 
-- 제약조건을 하나도 설정하지 않은 채 생성

DROP TABLE EMP01;

CREATE TABLE EMP01(
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
);

-- 2. 이제 이미 생성이 완료된 EMP01 테이블에 2가지 제약조건을 설정해보기
--    첫 번째는 EMPNO 컬럼에 기본키를 설정하고
--    두 번째는 DEPTNO 컬럼에 외래키를 설정해 보기

DESC EMP01;

ALTER TABLE EMP01
ADD CONSTRAINT EMP01_EMPNO_PK PRIMARY KEY(EMPNO);

ALTER TABLE EMP01
ADD CONSTRAINT EMP01_DEPTNO_FK
FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);

/*
=================== MODIFY로 NOT NULL 제약 조건 추가하기 ==================

NOT NULL 제약 조건을 이미 존재하는 테이블에 추가해 보도록하기

이미 존재하는 테이블에 무결성 제약 조건을 추가로 생성하기 위해서
ALTER TABLE ... ADD ... 명령문을 사용

하지만 NOT NULL 제약 조건은 ADD 대신 MODIFY 명령문을 사용하므로 사용에 주의!!

이는 'NULL을 허용하는 상태' 에서 'NULL을 허용하지 않는 상태' 
로 변경하겠다는 의미로 이해하기

*/

-- 이미 존재하는 테이블에 NOT NULL 제약 조건을 추가해 보기.

-- 1. MODIFY 명령어로 NOT NULL 제약 조건을 설정해 보기
DESC EMP01;

ALTER TABLE EMP01
MODIFY ENAME CONSTRAINT EMP01_ENAME_NN NOT NULL;


/*
================= 제약 조건 제거하기 ===========================

제약 조건을 제거하기 위해서 DROP CONSTRAINT 다음에 제거하고자 하는 제약 조건 명 명시

제약 조건을 제거하기 위한 형식

ALTER TABLE table_name 
DROP [CONSTRAINT constraint_name];

제약 조건을 제거하기 위해서는 제약 조건명을 반드시 제시해야 한다!!

제약 조건을 CONSTRAINT 문을 사용하여 지정했을 경우
제약 조건 명을 기억하기 쉽지만,

CONSTRAINT 문을 사용하지 않았으면
특정 테이블의 특정 컬럼에 명시된 제약 조건을
USER_CONSTRAINTS 데이터 딕셔너리 뷰에서 찾아봐야 하는 불편함이 있음.

그렇기 때문에 제약 조건을 지정할 때에는 제약 조건명을 명시적으로 주는 것이 바람직함.
*/

-- 사원 테이블에 지정한 제약 조건들을 제거해 보기

-- 1. 기본 키 제약 조건을 제거
DESC EMP01;

ALTER TABLE EMP01
DROP CONSTRAINT EMP01_EMPNO_PK;

-- 2. 사원명에 NULL이 저장될 수 있도록 NOT NULL 제약 조건을 제거해보기

ALTER TABLE EMP01
DROP CONSTRAINT EMP01_ENAME_NN;

/*
================ 제약 조건의 비활성화와 CASECADE =================== casecade

제약 조건이 설정되면 항상 그 규칙에 따라 데이터 무결성이 보장됨.

특별한 업무를 수행하는 과정에서 
이러한 제약 조건 때문에 작업이 진행되지 못하는 경우가 생김

그렇다고 제약 조건을 삭제해 버리면 데이터 무결성을 보장받지 못하게 됨.

그래서 오라클에서는 제약 조건을 비활성화 시킴으로서
제약 조건을 삭제하지 않고도 제약 조건 사용을 잠시 보류할 수 있는 방법을 제공

비활성화된 제약 조건은 원하는 작업을 한 후에는 다시 활성화 상태로 만들어야 함!

제약 조건을 비활성화, 활성화하는 방법을 살펴보기.
*/

-- 제약 조건 비활성화를 위한 실습을 위해서 부서 테이블을 만들기.
-- 그 후 부서 테이블을 부모 테이블로 하는 사원 테이블을 작성
-- 부서테이블의 부서번호가 기본 키로 설정되어 있고,
-- 사원 테이블의 부서번호가 부서 테이블의 부서번호를 참조할 수 있도록 외래 키를 설정

-- 1. 부서 테이블에 부서번호를 기본 키로 지정하여 새로운 테이블 생성
DROP TABLE DEPT01;

CREATE TABLE DEPT01(
DEPTNO NUMBER(2) CONSTRAINT DEPT01_DEPTNO_PK PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13)
);
SELECT * FROM DEPT;
INSERT INTO DEPT01
VALUES(10, 'ACCOUTING', 'NEW YORK');
INSERT INTO DEPT01
VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO DEPT01
VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO DEPT01
VALUES(40, 'OPERATIONS', 'BOSTON');

-- 2. 부서 테이블을 만들었으므로 이제 부서 테이블을 부모 테이블로 하는 
--    사원 테이블을 작성하기 위해서 사원 테이블의 부서번호가 
--    부서 테이블의 부서번호를 참조할 수 있도록 외래 키를 설정
DROP TABLE EMP01;

CREATE TABLE EMP01(
EMPNO NUMBER(4)
CONSTRAINT EMP01_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10)
CONSTRAINT EMP01_ENAME_NN NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(4)
CONSTRAINT EMP01_DEPNO_FK REFERENCES DEPT01(DEPTNO)
);

-- 3. 사원 테이블로서 사원의 정보를 추가할 때 부서 테이블을 참조하므로 
--    부서 테이블에 존재하는 부서번호를 입력

INSERT INTO EMP01 VALUES(7499, 'ALLEN', 'SALESMAN', 10);
INSERT INTO EMP01 VALUES(7369, 'SMITH', 'CLERK', 20);

SELECT * FROM EMP01;

-- 4. DEPT01 테이블에서 10번 부서를 ALLEN이란 사람이 참조하고 있는 상태에서 삭제

DELETE FROM DEPT01
WHERE DEPTNO = 10;

-- 자식 레코드가 발견되어 무결성 제약조건 위배

/*
================= 제약 조건의 비활성화   =======================

자식 테이블인 사원 테이블(EMP01)은 부모 테이블인 부서 테이블(DEPT01)에
기본 키인 부서번호를 참조하고 있음

부서 테이블의 10번 부서는 사원 테이블에 근무하는 10번 사원이 존재하기에 삭제 불가

부모 테이블(DEPT01)의 부서번호 10번이 삭제되면
자식 테이블(EMP01)에서 자신이 참조하는 부모를 잃어버리게 되므로 삭제할 수 없는 것

부서번호가 10인 자료가 삭제되도록 하기 위해서는 아래 방법이 있음

1) 사원 테이블(EMP01)의 10번 부서에서 근무하는 사원을 삭제한 후  
   부서 테이블(DEPT01)에서 10번 부서를 삭제.

2) 참조 무결성 때문에 삭제가 불가능하므로 EMP01 테이블의 외래키
   제약 조건을 제거한 후에 10번 부서를 삭제.
   
테이블에서 제약 조건을 삭제하지 않고 일시적으로 적용시키지 않도록 하는 방법으로
제약 조건을 비활성화 하는 방법이 있음

제약조건을 비활성화 하는 방법

오라클은 작업 상황에 따라 비활성화시키거나 다시 활성화시키면서 유연하게 작업 가능

DISABLE CONSTRAINT : 제약 조건의 일시 비활성화
ENABLE CONSTRAINT : 비활성화된 제약 조건을 해제하여 다시 활성화

비활성화는 DISABLE 예약어를 사용하여 다음과 같이 지정

ALTER TABLE table_name 
DISABLE [CONSTRAINT constraint_name];

EMP01 테이블에 지정한 제약 조건 중에서 외래키 제약 조건이 있음

이 제약 조건 때문에 DEPT01 테이블에서 10번 부서를 삭제할 수 없었음

왜냐하면 EMP01 테이블의 ALLEN 이란 사람이 
DEPT01테이블에서 10번 부서를 참조하고 있는 상태였기 때문

EMP01 테이블에 지정한 외래키 제약 조건을 비활성화 시키고 나면
EMP01 테이블과 DEPT01 테이블이 아무런 관계도 없는 상태가 되기에
DEP01 테이블에서 10번 부서를 삭제하는 데 아무런 문제가 없음.

*/

-- EMP01 테이블에 지정한 외래키 제약 조건을 비활성화한 후에 
-- DEPT01 테이블에서 10번 부서를 삭제해 보기.

-- 1. EMP01 테이블에 지정한 외래키 제약 조건을 비활성화 시키기
DESC EMP01;
DESC DEPT01;
SELECT * FROM EMP01;

ALTER TABLE EMP01
DISABLE CONSTRAINT EMP01_DEPTNO_FK;

-- 제약 조건의 상태를 확인하기 위해서 
-- USER_CONSTRAINTS 데이터 딕셔너리의 STATUS 칼럼값을 살펴보면 
-- EMP01_DEPTNO_FK 제약 조건에 대해서 
-- STATUS 칼럼값이 DISABLED로 지정되어 있음을 확인할 수 있음

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, 
TABLE_NAME, R_CONSTRAINT_NAME, STATUS
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP01';

-- 2. 이제 EMP01 테이블에 지정한 외래키 제약 조건을 비활성화하였기 때문에 
--    DEPT01 테이블에서 10번 부서를 삭제할 수 있게 됨

-- 성공적으로 10번 부서가 삭제되었음을 확인할 수 있습니다. 
-- 이는 DEPTNO 칼럼의 FOREIGN KEY 제약 조건이 비활성화되었기 때문에 
-- 10번 부서의 자료 삭제가 가능해진 것

/*
====================== 제약 조건의 활성화   =========================

제약 조건을 비활성화 했으므로 이번에는 제약 조건을 활성화 해보기.

활성화는 ENABLE 예약어를 사용하여 지정

ALTER TABLE table_name 
ENABLE [CONSTRAINT constraint_name];
*/

-- EMP01 테이블에 지정한 제약 조건 중에서 외래키 제약 조건을 비활성화 했음.
-- 비활성화된 제약 조건은 다시 활성화 해야함.

-- 1. DISABLE CONSTRAINT 문에 의해 비활성화된 제약 조건을 되살리려면 
--    다음과 같이 ENABLE 을 사용

ALTER TABLE EMP01
ENABLE CONSTRAINT EMP01_DEPTNO_FK;

-- 하지만, 부서 테이블의 10번 부서가 삭제된 상태에서는 
-- 외래키 제약 조건을 활성화 시킬 수 없습니다.  
-- 왜냐하면 외래키 제약 조건은 
-- 참조의 무결성을 위배하지 않은 상태에서만 지정할 수 있는데, 
-- 사원 테이블(EMP01)에서 부서 테이블(DEPT01)의 10번 부서를 참조하고 있고 
-- 부서 테이블에 10번 부서가 존재하지 않기 때문에 참조의 무결성에 위배되기 때문

-- 2. 그러므로 외래키 제약 조건을 활성화시키기 전에 
-- 먼저 삭제된 부서 테이블의 10번 부서를 새로 입력해 놓아야 함.

INSERT INTO DEPT01
VALUES(10, 'ACCOUNTING', 'NEW YORK');
SELECT * FROM DEPT01;

-- 3. 10번 부서를 새로 입력해 놓았으므로 이제 외래키 제약 조건을 활성화

ALTER TABLE EMP01
ENABLE CONSTRAINT EMP01_DEPTNO_FK;

/*
==================== CASECODE 옵션   ===============================

CASCADE 옵션은 부모 테이블과 자식 테이블 간의 참조 설정이 되어 있을 때 
부모 테이블의 제약 조건을 비활성화하면 
이를 참조하고 있는 자식 테이블의 제약 조건까지 
같이 비활성화시켜 주는 옵션

또한 제약 조건의 비활성화뿐만 아니라 제약 조건이 삭제에도 활용되며, 
역시 같은 이치로 부모 테이블의 제약 조건을 삭제하면 
이를 참조하고 있는 자식 테이블의 제약 조건도 같이 삭제됨
*/
-- 부서 테이블(DEPT01)의 기본 키 제약 조건을 비활성화해보기

-- 1. 부서 테이블(DEPT01)의 기본 키 제약 조건을 
--    "DISABLE PRIMARY KEY"로 비 활성화하려고 시도

ALTER TABLE DEPT01
DISABLE PRIMARY KEY;

-- 부서 테이블의 기본 키는 사원 테이블(EMP01)의 외래 키에서 참조하고 있기 때문에 
-- 제약 조건을 비활성화할 수 없습니다

/*
부모 테이블(부서)의 기본 키에 대한 제약조건을 비활성화하고자 하는 것인데 
자식 테이블(사원)에서 이를 외래 키 제약조건으로 지정한 컬럼이라면 
절대 비활성화할 수 없음. 

만일 비활성화될 수 있다고 가정하면 
기본 키가 더 이상 아닌 상태의 
일반 컬럼을 자식 테이블이 외래 키 제약조건으로 지정하고 있는 아이러니 한 상태가 되기 때문.

그렇기 때문에 부모 테이블(부서)의 기본 키에 대한 제약조건을 비활성화하려면 
자식 테이블(사원)의 외래 키에 대한 제약조건을 비활성화하는 작업이 선행되어야 함.

두 테이블 사이에 아무런 관련이 없어야 만 
즉, 부서 테이블이 더 이상 부모 테이블로서의 역할을 하지 않고 있어야만 
기본 키 제약 조건을 비활성화 시킬 수 있음. 

부모 테이블(부서)의 
기본 키에 대한 제약조건을 비활성화하기 위한 작업을 
순서대로 정리

1) 부모 테이블의 기본 키를 
   참조하는 자식 테이블의 외래 키에 대한 제약 조건을 비활성화해야 함. 
   
2) 부모 테이블의 기본 키에 대한 제약 조건을 비활성화해야 함. 

위 순서대로 제약조건을 
여러 번에 걸쳐 비활성화 시키기는 번거로움을 없애주는 것이 
CASCADE 옵션. 

CASCADE 옵션을 지정하여 기본 키 제약 조건을 비활성화하면 
이를 참조하는 외래 키 제약 조건도 연속적으로 비활성화되기 때문에 
한 번만 비활성화 해 주면 됨.
*/

-- CASCADE 옵션을 지정하여 기본 키 제약 조건을 비활성화하면 
-- 이를 참조하는 외래 키 제약 조건도 연속적으로 비활성화하기

-- 1. 부서 테이블(DEPT01)의 기본 키 제약 조건을 CASCADE 옵션을 지정하여 비활성화

ALTER TABLE DEPT01
DISABLE PRIMARY KEY CASECADE;

-- 2. 데이터 딕셔너리 USER_CONSTRAINTS를 살펴보기

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, 
TABLE_NAME, R_CONSTRAINT_NAME, STATUS
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('DEPT01', 'EMP01');

-- DEPT01 테이블의 기본 키 제약 조건이 비활성화된 것을 확인할 수 있음.
-- DEPT01 테이블뿐만 아니라 
-- DEPT01 테이블의 기본 키를 참조하고 있는 
-- EMP01 테이블의 외래 키 제약 조건도 비활성화된 것을 확인 할 수 있음.

-- CASCADE 옵션을 지정하여 기본 키 제약 조건을 제거하면 
-- 이를 참조하는 외래 키 제약 조건도 연속적으로 제거됨

-- 1. 이번에는 부서 테이블(DEPT01)의 기본 키 제약 조건을 삭제해 보기.

ALTER TABLE DEPT01
DROP PRIMARY KEY;

-- 부서 테이블의 기본 키는 
-- 사원 테이블의 외래 키에서 참조하고 있기 때문에 제약 조건을 삭제할 수 없음. 

-- CASCADE 옵션을 지정하여 기본 키 제약 조건을 삭제하게 되면 
-- 이를 참조하는 외래 키 제약 조건도 연속적으로 삭제됨

ALTER TABLE DEPT01
DROP PRIMARY KEY CASCADE;

-- 데이터 딕셔너리 USER_CONSTRAINTS를 살펴보기

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, 
TABLE_NAME, R_CONSTRAINT_NAME, STATUS
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN('DEPT01', 'EMP01');

-- USER_CONSTRAINTS 데이터 딕셔너리를 살펴보면 
-- DEPT01 테이블의 기본 키 제약 조건은 
-- 물론 이를 참조하는 EMP01 테이블의 외래 키 제약 조건도 삭제되었음을 확인할 수 있음

-- <실습문제 답>
CREATE TABLE EMP_SAMPLE
AS
SELECT * FROM EMP
WHERE 1 = 0;

ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_pk PRIMARY KEY(EMPNO);

ALTER TABLE DEPT01
ADD CONSTRAINT my_dept_pk PRIMARY KEY(DEPTNO);

ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_emp_dept_fk
    FOREIGN KEY(DEPTNO)
    REFERENCES DEPT01(DEPTNO);
    
ALTER TABLE EMP_SAMPLE
ADD CONSTRAINT my_comm_ck
    CHECK(COMM>0);
    
