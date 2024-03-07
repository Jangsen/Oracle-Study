/*
CHAPTER01
1.1_데이터베이스 관리 시스템이란?
1.2_관계형 데이터베이스
1.3_데이터타입
1.4_데이터 무결성 제약 조건
1.5_SQL 문의 종류
1.5-_데이터 딕셔너리 TAB
1.5+_테이블 구조를 살펴보기 위한 DESC
1.6_데이터를 조회하기 위한 SELECT문
1.7_산술 연산자
1.8_칼럼 이름에 별칭 지정하기
1.8-_Concatenation 연산자의 정의와 사용
1.8+_중복되는 번호를 한번씩만 출력하기 위한 키워드 DISTINCT
1.9_SQL*PLUS 명령어의 개념
1.10_SQL*PLUS 파일 명령어
1.11_DUAL 테이블

========================= 1.1_데이터 베이스 관리 시스템이란? =============================

기업이나 기관은 정보를 필요로함.

회사에서는 사원, 부서, 급여 등 정보를 관리
도서관에서는 회원, 도서, 반납일 등 정보를 관리

이러한 정보를 '데이터'라고함.

이러한 데이터를 담고 있는 것이 '데이터 베이스'

데이터 베이스 == 조직화된 정보의 집합.

데이터 베이스를 관리하려면 데이터 베이스 관리 시스템이 필요.

데이터 베이스 관리시스템 (DBMS: Data Management System)은

연관성 있는 데이터들의 집합을 효율적으로 응용하기 위해 구성된 소프트 웨어들의 집합체.

데이터와 응용 프로그램 중간에서 응용 프로그램이 요구하는

데이터를 정의하고, 읽고, 쓰고, 갱신하는 등

데이터를 조작하고 이들을 효율적으로 관리하는 프로그램들을 지칭.

데이터 베이스 관리시스템은 사용자가 새로운 데이터베이스를 생성하고,
데이터베이스의 구조를 명시할 수 있게 하고,
사용자가 데이터를 효율적으로 질의하고 수정할 수 있도록함.

시스템의 고장이나 권한이 없는 사용자로부터
데이터를 안전하게 보호하며,
동시에 여러 사용자가 데이터베이스를 접근하는 것을 제어하는 소프트웨어 패키지.
(사용자나 어플리케이션 프로그램들이 데이터를 공유할 수 있도록하는 소프트웨어 패키지)

데이터 베이스 내에 정보를 생성, 변경, 조회, 저장 할 수 있도록 하는
시스템적인 방법을 제공해줌.

일반적으로 데이터 일치, 접근, 통제, 자동 롤백, 복구를 담당함

                    데이터베이스 관리 시스템 제품

              오라클 , MS-SQL , My-SQL , Informis , DB2

============================= 1.2_관계형 데이터베이스 =================================

관계형 데이터베이스는 정보 저장을 위해 관계나 2차원 테이블을 이용함.

예를들어, 회사 내의 모든 사원에 대한 정보를 저장해야 할 경우
관계형 데이터베이스에서는 
사원의 신상 정보와 사원이 소속된 부서 정보와 급여 정보를 테이블에 저장함.

오라클은 관계형 데이터베이스를 기본으로함.

데이터를 저장하기 위한 구조로 테이블을 사용함.

테이블은 표처럼 볼 수 있도록 로우(ROW, 행)와 칼럼(COLUMN, 열) 으로 구성.
                    
                        칼럼명
        칼럼 -- DNO     DNAME           LOC
    
        로우 -- 10      ACCOUNTING      NEW YORK
          |     20      RESEARCH        DALLAS
          |     30      SALES           CHICAGO
             -- 40      OPERATIONS      BOSTON
                    
        < 4개의 로우와 3개의 칼럼으로 구성된 테이블 >
                    
현재 테이블은 4개의 부서 정보가 저장되어 있음.
개별적인 부서 정보가 '로우' 에 해당됨

        파일 시스템에서는 '레코드' 라고 칭함.
        
부서 정보는 DNO, DNAME, LOC 라는 서로 구분되는 속성들로 구성 되었는데
이러한 속성을 '칼럼' 이라고 부름.

=========================== 1.3_데이터 타입 =====================================

    데이터 타입의 종류              의미 
    
    CHAR(size)                    SIZE 크기의 고정 길이 문자 데이터 타입
                                  최대크기: 2,000 바이트
                                  최소크기:     1 바이트
    
    VARCHAR2(size)                SIZE 크기의 가변 길이 문자 데이터 타입
                                  최대크기: 4,000 바이트
                                  최소크기:     1 바이트
                                  
    NVARCHAR2(size)               국가별 문자 집합에 따른 SIZE
                                  크기의 문자 또는 바이트의 가변 길이 문자 데이터 타입
                                  최대크기: 4,000 바이트
                                  최소크기:     1 바이트

    NUMBER(p,s)                   정밀도(p)와 스케일(s)로 표현되는 숫자 데이터 타입
                                  p : 1 ~ 38
                                  s : -84 ~ 127
    
    DATE                          날짜 형식을 저장하기 위한 데이터 타입
    
    ROWID                         테이블 내 행의 고유 주소를 가지는 64진수 문자 타입
                                  해당 6 바이트(제한된 ROWID) OR 10 바이트(확장된 ROWID)
    
    BLOB                          대용량의 바이너리 데이터를 저장하기 위한 데이터 타입
                                  최대크기: 4GB
                                  
    CLOB                          대용량의 텍스트 데이터를 저장하기 위한 데이터 타입
                                  최대크기: 4GB
    
    BFILE                         대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 타입
                                  최대크기: 4GB

    TIMESTAMP(n)                  DATE 데이터 타입의 확장된 형태
                                  n은 milli second 자리수로 최대 9자리까지 표현 가능
    
    INTERVAL YEAR TO MONTH        년과 월을 이용하여 기간을 저장
    
    INTERVAL DAY TO SECOND        일, 시, 분, 초를 이용하여 기간을 저장
                                  두 날짜값의 정확한 차이를 표현하는데 유용
    
    < CHAR > 데이터 타입
    문자열을 저장하기 위한 데이터 타입
    
    1. 고정 길이의 문자열 저장
    2. 입력된 자료의 길이와는 상관없이 정해진 길이만큼 저장 영역을 차지.
    3. 최소 크기는 1 바이트 , 최대 크기는 2,000 바이트 까지 저장 가능
    
    < VARCHAR2 > 데이터 타입
    주소처럼 입력될 데이터의 길이의 편차가 심한 데이터를 저장
    
    1. 가변 길이의 문자열 저장
    2. 데이터에 의해 저장공간이 할당됨.
    3.최소 크기는 1 바이트 , 최대 크기는 4,000 바이트 까지 저장 가능
    
    < NUMBER > 데이터 타입
    수치를 저장하기 위한 데이터 타입
    
    NUMBER(precision, scale)
    
    1. precision 은 소수점을 포함한 전체 자리수를 지정함.
    ( NUMBER(5)처럼 precision 만 지정한 경우 정수 형태의 값이 저장 됨. )
    
    2. scale 은 소수점 이하 자리수를 지정함.
    ( NUMBER(8,2)처럼 모두 지정한 경우에는 실수 형태의 값이 저장됨. )
    
    3. precision과 scale 모두 생략하면 입력한 데이터 값만큼 공간이 할당 됨.
    
    < DATE > 데이터 타입
    시간 데이터를 저장하기위한 데이터 타입
    
    1. 날짜 타입 안에는 세기, 년. 월, 일, 시, 분, 초, 요일 등 정보가 들어 있음
    2. 별다른 설정이 없을경우 ( 년, 월, 일 ) 만 출력.
    3. 기본 날짜 형식 "YY/MM/DD"형식 "년/월/일"
    
    ( 한글판과 영문판의 형식이 다름 )
    EX) 2024년 3월 7일
    
    영문판                                 한글판
    "DD/MON/YY"                           "YY/MM/DD"
    "07/MAR/24"                           "24/03/07"
    
======================== 1.4_데이터 무결성 제약 조건 ================================

제약조건은 칼럼에 들어가는 값을 제한하여
데이터의 정확성과 일관성을 보장.

EX) 고등학생 학년을 저장하기 위한 칼럼에는 

1, 2, 3 중 하나의 값만을 저장 할 수 있어야 한다는 조건을 만족해야함.

    < NOT NULL > 제약 조건

    < NULL >                          예를들어 인사과가 신설되었는데 
                                      어느 지역에 위치하게 될지 확정되지 않았다면?
    1. 할당 받지 않은 값,               정해지지 않은 값을 의미하는 NULL 값을 할당.
    2. 아직 무엇인지 모르는 값,
    3. 숫자 0이나 공백(스페이스)과는 다른 값.
    
    부서의 정보가 불확실하다고 모든 칼럼을 NULL로 지정하게 되면 
    특정 부서를 검색해 올 수 없게됨.
    
    이러한 문제가 발생되지 않도록 테이블 내에서
    반드시 입력해야 하는 필수 입력 칼럼에 NULL 값을 저장하지 못하도록
    NOT NULL 제약 조건을 걸어야함.
    
    NOT NULL 조건이 지정된 칼럼은 
    NULL 값이 아닌 확실한 정보가 저장되어야 하기때문에
    필수적으로 데이터가 입력되어야 하는 칼럼이 됨.
    
    
    < 기본 키 제약 조건 >
    
    기본 키란?
    >> 한 테이블 내에서 칼럼이 동일한 값을 가질 수 없게
       제약 조건을 지정하는 것
       테이블의 로우를 식별(구분) 할 수 있도록 함.
    
    같은 이름의 사원이 존재하더라도 사원번호에 기본 키 제약 조건을 설정해두면
    이를 통해 원하는 사원을 검색 할 수 있게됨.
    
    < 외래 키 제약 조건 >
    
    DBMS는 데이터가 중복되는 것을 막기 위해
    여러 테이블에 나눠서 저장해 두었다가 원하는 정보를 얻기 위해
    여러 테이블을 연결하여 사용함.
    
    이를 위해서 특정 테이블의 칼럼이 다른 테이블의 칼럼을 참조하게 됨.
    
    다른 테이블의 칼럼 값을 참조하는 테이블을 '자식 테이블' , 
    다른 테이블에 의해 참조되는 테이블을 '부모 테이블' 이라고 함.
 
    사원 테이블을 보게되면 어떤 부서 소속인지를 알려주기 위한 부서번호 칼럼이 존재함.
    상세한 부서 정보는 사원 테이블에는 없고 부서 테이블에 존재하기 때문에
    사원 테이블의 부서번호와 일치되는 값을 부서 테이블에서 찾아와야만 상세 정보를 알 수 있음.
    
    사원 테이블의 부서번호와 일치되는 부서번호가 부서 테이블에 존재하지 않는다면
    부서 정보를 얻어올 수 없는 문제가 발생함.
    
    그렇기 때문에 사원의 정보를 추가, 수정할 때 
    입력한 부서번호가 부서테이블에 존재하는지 살펴본 뒤
    추가 또는 수정할 수 있도록 하기 위해서
    사원 테이블의 부서번호가 부서 테이블의 부서번호를 참조하도록
    제약을 걸어 둘 때 사용되는 것이 외래 키 제약 조건.
    
    ( 이해될 때까지 여러번 읽어보기 )
    

========================== 1.5_SQL 문의 종류 ===============================

    SQL(Structure Query Language)은 
    DBMS(관계형 데이터베이스)를 조작하기 위한 표준 언어
    
    데이터베이스의 구조를 정의하거나
    데이터베이스에 저장된 데이터를 조회, 입력, 수정, 삭제 하기 위한 목적으로 사용
                            
                            SQL문 종류
    
  질의어                                     SELECT              데이터 검색
  DQL(Data Query Language)                                        
    
    
  데이터 조작어                              INSERT            데이터 입력
  DML(Data Manipulation Language)           UPDATE            데이터 수정
                                            DELETE            데이터 삭제
                                              
  데이터 정의어                              CREATE            데이터베이스 객체 생성
  DDL(Data Defunition Language)             ALTER             데이터베이스 객체 변경
                                            DROP              데이터베이스 객체 삭제
                                            RENAME            데이터베이스 객체 이름 변경
                                            TRUNCATE          데이터 및 저장 공간 삭제
    
  트랜잭션 처리어                            COMMIT            트랜잭션의 정상적인 종료 처리
  TCL(Transaction Control Language)         ROLLBACK          트랜잭션 취소
                                            SAVEPOINT         트랜잭션 내에 임시 저장점 설정
                                              
  데이터 제어어                              GRANT              데이터베이스 객체에 대한
  DCL(Data Control Language)                                   접근 권한 부여
                                            REVOKE             데이터베이스 객체에 대한
                                                               접근 권한 취소

 ===================== 1.5-_데이터 딕셔너리 TAB =========================


TAB == TABLE 테이블의 정보를 알려주는 데이터 딕셔너리                     */

SELECT * FROM TAB;


/* =================== 1.5+_테이블 구조를 살펴보기 위한 DESC ==================

    DESCRIBE(DESC)은 
    테이블 구조(칼럼몇, 데이터 형, 길이와 NULL 허용 유무 등) 확인하기 위한 명령어

DESC[RIBE] 테이블명
*/

DESC DEPT;

/*
==================== 1.6_데이터를 조회하기 위한 SELECT문 ======================

    SELECT 문은
    테이블에 저장된 데이터를 검색하기 위한 명령문
    
SELECT  [DITINCT]   { * | Column[alias]... }
FROM    TABLE
[WHRE   CONDITION]
[GROUP BY   GROUP_BY_EXPRESSION]
[HAVINH     GROUP_CONDITION]
[ORDER BY   COLUMN]

    SQL문에서 사용하는 명령어들은 대문자와 소문자를 구분하지 않음.
    
    1. SELECT 문은 여러 개의 절로 구성됨.
    2. 절은 줄을 구분하여 작성.
    3. 읽기 쉽게하기 위해서 들여쓰기 사용. (가독성 UP)
    
       절                                     기능
       
    SELECT 절                    조회하고자 하는 칼럼명의 리스트를 나열
    
    DISTINCT 절                  동일한 내용을 한번씩만 출력하여 중복을 제거
    
    FROM 절                      조회하고자 하는 테이블명의 리스트를 나열
    
    WHERE 절                     조회하고자 하는 로우의 조건을 나열
    
    GROUP BY 절                  동일한 값을 갖는 로우들을 한 그룹으로 묶음
    
    HAVING 절                    로우들의 그룹이 만족해야 하는 조건을 제시    

    ORDER BY 절                  로우들의 정렬 순서를 제시
    
    반드시 세미콜론(;)으로 마침표
*/

-- SELECT 문 사용 예제

SELECT *
FROM EMP;

-- * (에스테리스크) == ' 모든(all) ' 칼럼의 데이터를 대상으로 선정하고자 할 때 사용

SELECT EMPNO
FROM EMP;

/*
    < SELECT 절 >
    SELECT 절 다음에는 조회하고자 하는 칼럼명을 기술.
    
    < FROM 절 >
    FROM 절 다음에는 조회하고자 하는 내용을 저장하고 있는 테이블명을 기술.

*/

SELECT EMPNO, ENAME
FROM EMP;

-- SELECT 절에 출력하고자 하는 칼럼명인 EMPNO과 ENAME을 콤마( , ) 로 구분하여 나열.



SELECT * FROM EMP;

select * from emp;

SELECT * FROM DEPT;

SELECT EMPNO, ENAEM
FROM EMP;

SELECT ENAME, SAL, HIREDATE
FROM EMP;


-- ============================ 1.7_산술 연산자 ================================

-- +    SELECT SAL + COMM FROM EMP;
-- -    SELECT SAL - COMM FROM EMP;
-- *    SELECT SAL * COMM FROM EMP;
-- /    SELECT SLA / COMM FROM EMP;

SELECT ENAME, SAL, SAL*12
FROM EMP;

-- NULL 도 데이터다!!        null
-- NULL == 0 이 아니다. 
-- NULL == 빈 공간이 아니다.
-- NULL == 미확정(해당 사항 없음),알 수 없는(UNKNOWN) 값을 의미
-- 연산 , 할당, 비교 불가능

SELECT ENAME,SAL,JOB,COMM,SAL*12,SAL*12+COMM
FROM EMP;

-- NVL ==> NULL VALUE       nvl
-- NULL을 0 또는 다른 값으로 변환하기 위해 사용하는 함수

SELECT ENAME, COMM, SAL*12+COMM,
NVL(COMM,0), SAL*12+NVL(COMM,0)
FROM EMP;

-- ================== 1.8_칼럼 이름에 별칭 지정하기 ======================     
/*      ALIAS == AS
    칼럼명에 별칭을 부여하기 위한 3가지 방법
    
    1. 칼럼명과 별칭 사이에 공백을 추가하는 방법
    2. 칼럼명과 별칭 사이에 AS를 추가하는 방법
    3. 큰 따옴표를 사용하는 방법
    
*/

-- 1. 칼럼명과 별칭 사이에 공백을 추가하는 방법

SELECT ENAME, SAL*12+NVL(COMM,0) 연봉
FROM EMP;

-- 2. 칼럼명과 별칭 사이에 AS를 추가하는 방법

SELECT ENAME, SAL*12+NVL(COMM,0) AS 연봉
FROM EMP;

-- 3. " " 큰 따옴표를 사용하는 방법

-- AS 는 일괄적으로 대문자로 출력
-- 대소문자를 구별하고 싶으면 " " 사용
-- " " 은 별칭에 공백문자나 특수 문자도 포함시킬 수 있음

SELECT ENAME,SAL*12+NVL(COMM,0) " A N N S A L "
FROM EMP;

SELECT ENAME, SAL*12+NVL(COMM,0) "연$_#봉"
FROM EMP;

-- 별칭 사용

SELECT DEPTNO "부서번호", DNAME "부서명"
FROM DEPT;
/*
====================== 1.8-_Concatenation 연산자의 정의와 사용 ====================

Concatenation 의 사전적 의미는 연결
여러 개의 컬럼을 연결할 때 사용
연산자로 " || " 수직바 사용
영어 문장처럼 보이도록 하기 위해 “||”를 컬럼과 문자열 사이에 기술하여 하나로 연결하여 출력

*/

SELECT ENAME  ||' IS A '||JOB
FROM EMP;

/*
==================  1.8+_중복되는 번호를 한번씩만 출력하기 위한 키워드 DISTINCT ============
*/

SELECT DEPTNO
FROM EMP;

-- DISTINCT 사용

SELECT DISTINCT DEPTNO
FROM EMP;

-- ------------------------------------------------------------------------
SELECT JOB
FROM EMP;

-- DISTINCT 사용

SELECT DISTINCT JOB
FROM EMP;

/*
====================== 1.9_SQL*PLUS 명령어의 개념 ==========================

    SQL문을 실행시키고 그 결과를 볼 수 있도록 오라클에서 제공하는 툴
    SQL은 데이터베이스에서 자료를 검색, 수정, 삭제 하는 데이터베이스 언어
    SQL*PLUS는 툴에서 출력 형식을 지정하는 환경을 설정

    LIST (L, list)           버퍼에 저장된 SQL문의 편집 명령
    RUN(R) , @ , /           SQL문 또는 PL/SQL을 실행하는 명령
    SAVE, GET, EDIT, SPOOL   스크립트 파일을 저장하는 명령
    HOST, EXIT               데이터베이스 접속 및 종료
    LINE, PAGE               검색결과에 대한 보고서 형태의 출력 형식 설정

    LIST (L)                 버퍼에 저장된 모든 SQL 문 또는 검색한 라인의 SQL 문을 나타냄
    /                        SQL문을 보여주지 않고 바로 실행
    RUN(R)                   버퍼에 저장된 SQL문을 보여주고 실행
    HOST                     DOS 환경으로 나가도록하는 명령
    EXIT                     SQL*PLUS 로 돌아가기 위한 명령
*/

--    연봉을 계산하기 위한 쿼리문을 작성
--    다시 한번 출력하기 위한 LIST 명령어를 수행

SELECT ENAME, SAL*12+NVL(COMM,0)
FROM EMP;
LIST
/
R

/*
========================== 1.10_SQL*PLUS 파일 명령어 ===========================

    보관중인 명령 버퍼의 내용을 영구적으로 기록하기 위해 파일에 저장하는 명령어

    EDIT(ED)     파일의 내용을 vi(유닉스)나 notepad(윈도우즈)와 같은 에디터로 읽어 편집

    HOST         오라클을 종료하지 않고 OS 명령을 수행할 수 있도록 
                 OS 환경으로 잠시 빠져나갈 수 있도록 함.
                 OS Prompt 상에서 EXIT 하면 다시 오라클 환경으로 돌아옴
             
    SAVE         SQL 버퍼 내의 현재 내용을 실제 파일로 저장
    
    SAVE TEMP REPLACE    이미 존재하는 파일에 새로운 내용을 덮어씀
    
    SVAE TEMP APPEND     명령문을 추가

    @            SQL 파일에 저장된 내용을 실행
    
    SPOOL        오라클 화면을 갈무리하여 파일로 저장
    EX)SPOOL B001 -> SELECT * FROM DEPT; -> SELECT * FROM EMP; -> 
                     SPOOL OFF -> HOST -> DIR -> EXIT

    GET          파일의 내용을 SQL 버퍼로 읽어들임.

    EXIT         오라클을 종료

    HEADING      SELECT 명령어를 수행한 후 실행결과가 출력될 때 
    (ON | OFF)    컬럼의 제목을 출력할 것인지의 여부를 제어

    LINESIZE     SELECT 명령어를 수행한 후 
                 결과를 출력할 때 한 라인에 출력할 최대 문자(Character) 수   

    PAGESIZE     SELECT 명령어를 수행한 후 
                 결과를 출력할 때 한 페이지에 출력할 최대 라인 수를 결정

    COLUMN FORMAT    칼럼 데이터에 대한 출력 형식을 다양하게 지정하기 위한 명령어
                     문자형식 컬럼의 출력 길이 조정                          */
    
    COLUMN ENAME FORMAT A25;

--  숫자 7자리로 설정하되 남는 자리는 공란으로 채우도록 하고,
    COLUMN SAL FORMAT 9,999,999;
-- 커미션 컬럼을 7자리로 주되 남는 자리는 0으로 채우도록 함
    COLUMN COMM FORMAT 0,000,000;

/* =========================== 1.11_DUAL 테이블 ==============================
    
    DUAL 테이블은 항 행으로 결과를 출력하기 위해 제공되는 테이블.
    (오라클에서 자동으로 생성)
    
    DUAL 테이블은 VARCHAR2(1)로 정의된 
    DUMMY 라는 단 하나의 칼럼으로 구성되어 있으며, 한 개의 행을 포함하고 있음.

*/

-- DUAL 테이블 구조 살펴보기

DESC DUAL;

-- DUMMY 칼럼 값 확인해보기

SELECT *
FROM DUAL;

/*  DUAL 테이블의 유일한 칼럼인 DUMMY는 X라는 데이터만 저장하고 있음
    
    DUMMY 칼럼에 저장된 값은 아무런 의미가 없음.
    
    사용자가 계산이나 함수를 실행하고 나서
    결과값을 한번 표시하고 싶을 때 사용하기 위해서 단행으로 구성해 놓은것.
    
    EX) 오늘이 몇일인지 알아보기 위해 오라클이 제공해주는 SYSDATE 함수 사용해보기.
        
        "SYSDATE"와 같이 함수만 SQL에서 입력해서는 원하는 결과를 얻을 수 없음.
        SELECT 문에서 SYSDATE 함수를 사용해야함.
        
        SELECT 문이 SELECT 절과 FROM 절로 구성되어 있으면
        SELECT 절 다음에 함수를 기술하고
        FROM 절 다음에 테이블명을 기술해야 함.

*/
-- 부서 테이블을 FROM 절 다음에 기술하면 오늘 날짜가 4번 출력됨.

SELECT SYSDATE
FROM DEPT;

-- 사원 테이블을 기술하면 14번 출력됨.

SELECT SYSDATE
FROM EMP;

-- 오늘 날짜가 한 번 출력되길 원한다면 FROM 절 다음에 DUAL 테이블 사용.

SELECT SYSDATE
FROM DUAL;





/* ====================== 2.1_WHERE 절을 이용한 조건 검색 ======================
    
    테이블에 저장된 데이터 중에서 원하는 데이터만 선택적으로 추출하기 위해 사용
    
    원하는 로우만 얻으려면 다음과 같이 로우를 제한하는 조건을
    SELECT 문에 WHERE 절을 추가하여 제시

SELECT * [column1, column2, ... , column]
FROM    TABLE_NAME
WHERE   CONDITION;

*/

-- 부서 번호가 10번인 사원 출력하기

SELECT *
FROM EMP
WHERE DEPTNO = 10;

-- 급여가 1500 이상인 사원 출력하기

SELECT *
FROM EMP
WHERE SAL >= 1500;


/*  조건절은 세 부분으로 구성이 됨

    WHERE       SAL        >=       3000;
               (컬럼)    (연산자)  (비교대상값)                   */
               

/* =========================== 2.2_비교 연산자 ===========================

WHERE 절에 숫자, 문자, 날짜의 크기나 순서를 비교하기 위해 사용하는 연산자

= (같다), > (크다), < (작다), >= (크거나 같다), <= (작거나 같다), <> (같지 않다)

    각각 예시로 확인 해보기                                               */

--    =       같다.

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL = 3000;

--    >       보다 크다.

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 3000;    

--    <       보다 작다.

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < 3000;

--    >=      보다 크거나 같다.

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >= 3000;

--    <=      보다 작거나 같다.

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL <= 3000;

-- <>, !=, ^=      다르다.

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL <> 3000;

-- 10번 부서 소속 사원 출력해보기

SELECT * FROM EMP
WHERE DEPTNO = 10;

-- 급여가 1500 이하인 사원의 사원번호, 사원 이름, 급여를 출력하는 SQL 문을 작성해보기

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL <= 1500;

/* ========================== 2.2-_문자데이터 조회 ========================= 

    1. 문자와 날짜 타입의 상수 값은 반드시 작은 따옴표 ( ' ' )로 묶어 표현해야 함.
    2. 대소문자를 구분함.

*/

-- SCOTT을 칼럼으로 간주하고 오류를 발생한 예

SELECT * FROM EMP
WHERE ENAME = SCOTT;

-- 이름이 SCOTT 인 사원 출력해보기

SELECT * FROM EMP
WHERE ENAME = 'SCOTT';

-- 이름이 FORD인 사원의 사원번호(EMPNO)과 사원이름(ENAME)과 급여(SAL)을 출력해보기

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME = 'FORD';

-- 사원이름이 SCOTT 인 사원의 사원번호, 사원 이름, 급여를 출력해보기

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME = 'SCOTT';

/* ======================== 2.2+_날짜 데이터 조회 ==========================

    날짜 역시 문자열과 마찬가지로 작은따옴표로 묶어 주어야 함.                      */

-- 입사일이 '1981/01/01' 이전인 사원만 출력하기

SELECT *
FROM EMP
WHERE HIREDATE <= '1981/01/01';

/* ============================ 2.3_논리 연산자 ================================
    
    논리 연산자는 조건을 여러 개 조합해서 결과를 얻어야 할 경우
    조건을 연결해 주는 역할.
    
                             < 연산자 의미 및 예제 >                          */

--    AND     두 가지 조건을 모두 만족해야만 검색 가능
            
-- 부서번호가 10이고 직급이 'MANAGER'인 사원만 출력해보기

SELECT *
FROM EMP
WHERE DEPTNO = 10 AND JOB = 'MANAGER';



--    OR      두 가지 조건 중에서 한 가지만 만족하더라도 검색 가능
              모두 만족하지 않으면 거짓

-- 부서번호가 10이거나 직급이 'MANAGER'인 사원만 출력해보기

SELECT *
FROM EMP
WHERE DEPTNO = 10 OR JOB = 'MANAGER';

    
--    NOT     반대되는 논리값을 구하는 연산자 

-- NOT 을 이용한 조건 지정해보기

SELECT *
FROM EMP
WHERE NOT DEPTNO = 10;

-- <> 를 이용한 조건 지정하기

SELECT *
FROM EMP
WHERE DEPTNO <> 10;

-- 급여가 1000에서 1500 사이인 사원 출력해보기

SELECT *
FROM EMP
WHERE SAL >= 1000 AND SAL <= 1500;

-- 급여가 1000 미만이거나 1500 초과인 사원 출력해보기

SELECT *
FROM EMP
WHERE SAL < 1000 OR SAL > 1500;

-- 커미션이 300 이거나 500이거나 1400인 사원 출력해보기

SELECT *
FROM EMP
WHERE COMM = 300 OR COMM = 500 OR COMM = 1400;

-- 10번 부서 소속인 사원들 중에서 직급이 MANAGER인 사람을 검색하여 
-- 사원명, 부서번호, 직급을 출력

SELECT ENAME,DEPTNO,JOB
FROM EMP
WHERE DEPTNO = 10 AND JOB = 'MANAGER';

-- 10번 부서에 소속된 사원이거나 직급이 MANAGER인 사람을 검색하여 
-- 사원명, 부서번호, 직급을 출력 

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO = 10 OR JOB = 'MANAGER';

-- 부서번호가 10번이 아닌 사원의 사원이름, 부서번호, 직급을 출력

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE NOT DEPTNO = 10;

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO <> 10;

-- 논리 연산자의 다양한 활용

-- 2000에서 3000 사이의 급여를 받는 사원을 조회

SELECT *
FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;

-- 커미션이 300 이거나 500 이거나 1400 인 사원을 검색

SELECT *
FROM EMP
WHERE COMM = 300 OR COMM = 500 OR COMM = 1400;

SELECT *
FROM EMP
WHERE COMM IN(300,500,1400);

-- 사원번호(EMPNO)가 7521 이거나 7654 이거나 7844 인 사원들의 
-- 사원 번호와 급여를 검색하는 쿼리문을 비교 연산자와 OR 논리 연산자 사용

SELECT EMPNO, SAL
FROM EMP
WHERE EMPNO = 7521 OR EMPNO = 7654 OR EMPNO = 7844;

SELECT EMPNO, SAL
FROM EMP
WHERE EMPNO IN (7521, 7654, 7844);

-- BETWEEN AND 연산자      between and

-- 2000에서 3000 사이의 급여를 받는 사원과 같이 
-- 특정 범위 내에 속하는 데이터인지를 알아보기 위해서 
-- 비교연산자와 논리 연산자를 결합하여 표현할 수 있음

SELECT * 
FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;

-- BETWEEN AND 사용 

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

-- 급여가 급여가 2000 미만이거나 3000 초과인 사원을 검색

SELECT *
FROM EMP
WHERE SAL < 2000 OR SAL > 3000;

-- BETWEEN AND 사용

SELECT *
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- BETWEEN AND 연산자는 숫자형뿐만 아니라 문자형, 날짜형에도 사용할 수 있음
-- 주의할 점은 비교 대상이 되는 값을 단일 따옴표로 둘러싸야 한다!!

-- 1987년에 입사한 사원을 출력

SELECT *
FROM EMP
WHERE HIREDATE 
BETWEEN '1987/01/01' AND '1987/12/31';

-- IN 연산자           in

-- 커미션이 300 이거나 500 이거나 1400 인 사원을 검색하기 위해서는 OR 연산자를 활용했지만

SELECT *
FROM EMP
WHERE COMM = 300 OR COMM = 500 OR COMM = 1400;

-- OR 연산자로 묶인 비교 연산자 내의 컬럼이 이처럼 COMM 으로 동일할 때
-- IN 연산자를 사용할 수 있음

SELECT *
FROM EMP
WHERE COMM IN (300,500,1400);

-- 사원번호가 7521 이거나 7654 이거나 7844 인 사원들을 검색

SELECT *
FROM EMP
WHERE EMPNO IN (7521, 7654, 7844);

-- NOT IN 연산자           not in

-- COMM이 300, 500, 1400이 모두 아닌 사원을 검색

SELECT *
FROM EMP
WHERE COMM NOT IN(300, 500, 1400);

-- 사원 번호가 7521도 아니고 7654도 아니고 7844도 아닌 사원들을 검색
-- NOT IN 연산자 활용

SELECT *
FROM EMP
WHERE EMPNO NOT IN (7521, 7654, 7844);

-- 비교 연산자와 논리 연산자 AND를 사용하여 작성

SELECT *
FROM EMP
WHERE EMPNO <> 7521 AND EMPNO <> 7654 AND EMPNO <> 7844;

-- LIKE 연산자와 와일드 카드         like     wildcard      %      _

-- LIKE 연산자는 검색하고자 하는 값을 정확히 모를 경우에
-- 와일드카드와 함께 사용하여 원하는 내용을 검색할 수 있음

-- LIKE 다음에 PATTERN을 기술

-- 찾으려는 이름이 F로 시작 하는 것은 알지만 그 뒤의 문자는 모를 경우
-- ename = 'F'로 검색하게 되면 
-- ename = 'F' 표현은 이름이 정확히 F인 사람만을 검색하겠다는 의미
-- 이름이 'F' 로 시작하는 사원을 검색하지 못함
-- 검색하고자 하는 값을 정확히 모를 경우 LIKE 연산자와 함께 %를 사용

SELECT *
FROM EMP
WHERE ENAME LIKE 'F%';

-- 사원들 중에서 이름이 J로 시작하는 사람만을 찾는 쿼리문을 작성

SELECT *
FROM EMP
WHERE ENAME LIKE 'J%';

-- 이름 중 A를 포함하는 사원을 검색

SELECT *
FROM EMP
WHERE ENAME LIKE '%A%';

-- 문자열의 앞에 어떤 문자열이 몇 개가 오든 상관없이 N으로 끝나는 데이터 찾기

SELECT *
FROM EMP
WHERE ENAME LIKE '%N';

-- 이름이 K로 시작하는 사원의 사원번호와 사원이름을 출력

SELECT EMPNO,ENAME
FROM EMP
WHERE ENAME LIKE 'K%';

-- 이름 중에 K를 포함하는 사원의 사원번호와 사원이름을 출력

SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '%K%';

-- 이름이 K로 끝나는 사원의 사원번호와 사원이름을 출력

SELECT EMPNO, ENAME 
FROM EMP
WHERE ENAME LIKE '%K';

-- 와일드 카드 ( _ ) 사용하기        _

-- 이름의 두 번째 글자가 A인 사원을 찾는 예제

SELECT *
FROM EMP
WHERE ENAME LIKE '_A%';

-- 세 번째 글자가 A인 자료를 검색

SELECT *
FROM EMP
WHERE ENAME LIKE '__A%';

-- NOT LIKE 연산자             not like
-- 이름에 A를 포함하지 않은 사람만을 검색하려고 할 경우에 NOT LIKE 연산자를 사용

SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%A%';

-- NULL을 위한 연산자 IS NULL 과 IS NOT NULL          is null   is not null

SELECT *
FROM EMP
WHERE COMM IS NULL;

SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

-- 상관이 없는 사원(CEO 가 되겠지요!)을 검색하기 위한 SQL 문을 작성

SELECT *
FROM EMP
WHERE MGR IS NULL;

-- 정렬을 위한 ORDER BY 절

-- 정렬이란 크기 순서대로 나열하는 것을 의미

-- 오름차순(ascending) 정렬 방식    작은 값이 위에 출력되고 아래로 갈수록 큰 값이 출력

SELECT *
FROM EMP
ORDER BY SAL ASC;

-- 정렬방식을 지정하지 않은 경우에는 디폴트로 오름차순으로 정렬함.

SELECT *
FROM EMP
ORDER BY SAL;

-- 내림차순(descending) 정렬 방식   큰 값이 위에 출력되고 아래로 갈수록 작은 값이 출력

SELECT *
FROM EMP
ORDER BY SAL DESC;

-- EMP 테이블의 자료를 입사일 기준으로 오름차순으로 정렬하여 
-- 최근 입사한 직원을 나중에 출력하되 사원번호, 사원명, 직급, 입사일 칼럼을 출력

SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE ASC;

-- EMP 테이블의 자료를 사원번호를 기준으로 내림차순으로 정렬하여 
-- 사원번호와 사원명 칼럼을 표시

SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO DESC;

-- 문자 순으로 출력

-- 크기에 대한 비교는 수치 데이터 뿐만 아니라 문자 데이터나 날짜 데이터에 대해서도 가능
-- 문자 데이터의 경우 아스키 코드 값으로 저장되므로 아스키 코드 값을 기준으로 정렬
-- 오름차순인 경우에는 A, B, . . . Z 순으로 출력되고 
-- 내림차순인 경우에는 Z, Y, . . . A 순으로 출력

SELECT *
FROM EMP
ORDER BY ENAME;

-- 날짜 순으로 출력

-- 날짜도 오름차순 혹은 내림차순으로 출력 가능
-- 오름차순으로 지정하면 가장 오래된 시점이 가장 위에 출력 
-- 아래로 갈수록 최근 시점이 출력

-- 내림차순은 최근 시점부터 출력

SELECT *
FROM EMP
ORDER BY HIREDATE DESC;

SELECT *
FROM EMP
ORDER BY HIREDATE ASC;

-- 정렬 방식에 여러 가지 조건 제시
-- 급여가 같은 사람이 존재할 경우 이름의 철자가 빠른 사람부터 출력되도록 
-- 정렬 방식을 여러가지로 지정 할 수 있음

SELECT *
FROM EMP
ORDER BY SAL DESC, ENAME ASC;

-- 부서 번호가 빠른 사원부터 출력하되 같은 부서내의 사원을 출력할 경우 이름순으로 출력

SELECT *
FROM EMP
ORDER BY DEPTNO ASC, ENAME ASC;

-- DUAL 테이블과 SQL 함수 분루  dual

-- DUAL 테이블의 구조를 살펴보기 위해서 DESC 명령어를 사용

DESC DUAL;

-- DUAL 테이블은 DUMMY라는 단 하나의 컬럼으로 구성          dummy
-- 이 컬럼의 최대 길이는 1

-- DUMMY 컬럼엔 어떤 값이 저장?

SELECT *
FROM DUAL;

-- DUAL 테이블은 DUMMY라는 단 하나의 컬럼에 X라는 단 하나의 로우만을 저장하고 있음
-- 이 값은 아무런 의미가 없음
-- 쿼리문의 수행 결과가 하나의 로우로 출력되도록 하기 위해서
-- 단 하나의 로우를 구성하고 있을뿐임.

-- 숫자 함수    
/*
    
    ABS             절대값을 구함
    abs
    
    COS             COSINE 값을 반환
    cos
    
    EXP             e(2.71828183...) 의  n승을 반환
    exp
    
    FLOOR           소수점 아래를 잘라냄 (버림)
    floor
    
    LOG             LOG값을 반환
    log
    
    POWER           POWER(m,n) m의 n승을 반환
    power
    
    SIGN            SIGN (n) n < 0 이면 -1 ,
    sign                     n = 0 이면 0, 
                             n > 0 이면 1     을 반환
    
    SIN             SINE 값을 반환
    sin
    
    TAN             TANGENT 값을 반환
    tan
    
    ROUND           특정 자릿수에서 반올림
    round
    
    TRUNC           특정 자릿수에서 잘라냄 (버림)
    trunc
    
    MOD             입력 받은 수를 나눈 나머지 값을 반환
    mod
*/

-- 절대값 구하는 ABS 함수   abs

SELECT -10, ABS(-10)
FROM DUAL;

-- 소수점 아래를 버리는 FLOOR 함수

SELECT 34.5678, FLOOR(34.5678)
FROM DUAL;

-- 특정 자릿수에서 반올림하는 ROUND 함수

SELECT 34.5678, ROUND(34.5678)
FROM DUAL;

-- ROUND(대상, 자릿수)
-- 두 번째 인자 값이 2이면 소수점 이하 세번째 자리에서 반올림하여
-- 소수점 이하 두 번째 자리까지 표시

SELECT 34.5678,ROUND(34.5678,2)
FROM DUAL;

-- 두번째 인자 값에 음수를 지정 할 경우
-- 일단위, 십단위, 백단위 순으로 거슬러 올라감
-- 양수일때와 달리 해당 자리에서 반올림이 일어남

SELECT 34.5678,ROUND(34.5678,-1)
FROM DUAL;

-- 특정 자릿수에서 잘라내는 TRUNC 함수        trunc
-- 지정한 자리 수 이하를 버린 결과를 구해주는 함수

SELECT TRUNC(34.5678,2),TRUNC(34.5678,-1),TRUNC(34.5678)
FROM DUAL;

-- 나머지를 구하는 MOD 함수      mod

SELECT MOD(27,2),MOD(27,5),MOD(27,7)
FROM DUAL;

-- 사번이 홀수인 사람들을 검색하기

SELECT *
FROM EMP
WHERE MOD(EMPNO,2) = 1;

-- 문자 처리 함수
/*
    LOWER           소문자로 변환
    lower
    
    UPPER           대문자로 변환
    upper
    
    INITCAP         첫 글자만 대문자로 나머지 글자는 소문자로 변환
    initcap
    
    CONCAT          문자의 값을 연결
    concat
    
    SUBSTR          문자를 잘라 추출 ( 한글 1Byte )
    substr
    
    SUBSTRB         문자를 잘라 추출 ( 한글 2Byte )
    substrb
    
    LENGTH          문자의 길이를 잘라 반환 ( 한글 1Byte )
    length
    
    LENGTHB         문자의 길이를 잘라 반환 ( 한글 2Byte )
    lengthb

    LPAD, RPAD      입력 받은 문자열과 기호를 정렬하여 특정 길이의 문자열로 반환
    lpad, rpad
    
    TRIM            잘라내고 남은 문자를 표시
    trim
    
    CONVERT         CHAR SET을 변환
    convert
    
    CHR             ASCII 코드 값으로 변환
    chr
    
    ASCII           ASCII 코드 값을 문자로 변환
    ascii
    
    REPLACE         문자열에서 특정 문자를 변경
    replace
    
*/

-- 대문자로 변환하는 UPPER 함수           upper

SELECT 'Welcome to Oracle', UPPER('Welcome to Oracle')
FROM DUAL;

-- 소문자로 변환하는 LOWER 함수           lower

SELECT 'WELCOME TO ORACLE', LOWER('WLECOME TO ORACLE')
FROM DUAL;

-- 이니셜만 대문자로 변환하는 INITCAP 함수

SELECT 'WELCOME TO ORACLE',
INITCAP('WELCOME TO ORACLE')
FROM DUAL;

-- 소문자('manager')로 데이터를 검색해야 한다면 
-- LOWER 함수를 사용해서 원하는 결과를 얻을 수 있음

SELECT JOB
FROM EMP
WHERE LOWER(JOB) = 'manager';

-- 문자의 길이를 구하는 LENGTH           length
-- 몇 개의 문자로 구성되었는지 길이를 알려주는 함수

SELECT LENGTH('ORACLE'), LENGTH('오라클')
FROM DUAL;

-- 바이트 수를 알려주는 LENGTHB 함수           lengthb
-- 한글은 2Byts 또는 3Byte 로 계산하므로 주의!!

SELECT LENGTHB('ORACLE'), LENGTHB('오라클')
FROM DUAL;

-- 문자열 일부만 추출하는 SUBSTR 함수

-- SUBSTR 과 SUBSTRB 함수는 대상 문자열이나 칼럼의 자료에서 
-- 시작위치부터 선택 개수만큼의 문자를 추출함

-- SUBSTR(대상, 시작위치, 추출할 개수)

SELECT SUBSTR('WELCOME TO ORACLE',4,3)
FROM DUAL;

-- 시작위치 인자 값을 음수 값으로 줄 수 있는데 이때는 문자열의 앞쪽이 아닌 뒤쪽부터 세어짐

SELECT SUBSTR('WELCOME TO ORACLE',-4,3)
FROM DUAL;

-- 시작위치: -4(뒤쪽에서 4번째) 추출 글자수: 3개

-- 사원들의 입사년도만 출력하려면?

SELECT SUBSTR(HIREDATE,1,2) 년도 ,SUBSTR(HIREDATE,4,2) 달
FROM EMP;

-- 9월에 입사한 사원을 출력

SELECT *
FROM EMP
WHERE SUBSTR(HIREDATE,4,2) = '09';

-- 82년도에 입사한 직원을 알아내기 위해 SUBSTR 함수를 이용하여 
-- HIREDATE 컬럼에서 첫 글자부터 2개를 추출하여 그 값이 82인지를 체크

SELECT *
FROM EMP
WHERE SUBSTR(HIREDATE,1,2) = '82';

-- 이름이 E로 끝나는 사원을 검색
-- SUBSTR 함수를 이용하여 
-- ENAME 컬럼의 마지막 문자 한개만 추출해서 이름이 E로 끝나는 사원을 검색

SELECT *
FROM EMP
WHERE SUBSTR(ENAME,-1,1) = 'E';

-- 바이트 수를 기준으로 문자열 일부만 추출하는 SUBSTRB 함수
-- 메모리에 저장되는 바이트 수를 셈
-- 영문자 1자는 메모리에 1바이트로 저장

SELECT SUBSTR('WELCOME TO ORACLE',4,3),
       SUBSTRB('WELCOME TO ORACLE',4,3)
FROM DUAL;

-- 한글 1자는 3바이트를 차지하기 때문에 SUBSTR 함수와 SUBSTRB 함수의 결과는 달라짐

SELECT SUBSTR('웰컴투오라클',1,6),
       SUBSTRB('웰컴투오라클',1,6)
FROM DUAL;

-- 인코딩 방식에 따라 한글 한 글자의 바이트수가 달라짐!!

-- * KO16KSC5601, KO16MSWIN949, EUR-KR : 한글 한 글자 2바이트
-- * UTF8, AL32UTF8 : 한 글자 3바이트

-- 특정 문자의 위치를 구하는 INSTR 함수      instr

-- 대상 문자열이나 컬럼에서 특정 문자가 나타내는 위치를 알려줌
-- 문자열 'Welcome To Oracle' 에서 'O' 가 저장된 위치가 얼마인지 알고 싶을때
-- INSTR 함수를 사용

SELECT INSTR('WELCOME TO ORACLE','O')
FROM DUAL;

-- INSTR(대상, 찾을글자, 시작위치, 몇번째발견)

SELECT INSTR('WELCOME TO ORACLE','O',6,2)
FROM DUAL;

-- 공백도 문자로 취급하기 때문에 12 로 결과가 나옴.

-- INSTRB 함수            instrb  
-- 영문자는 1글자가 1바이트, 한글은 1글자가 3바이트

SELECT INSTR('데이터베이스','이',3,1),
       INSTRB('데이터베이스','이',3,1)
FROM DUAL;

-- 이름의 세 번째 자리가 R로 끝나는 사원을 검색하기 위해서 
-- 와일드카드 _ 와 LIKE 연산자를 사용하여 다음과 같이 표현할 수 있음

SELECT *
FROM EMP
WHERE SUBSTR(ENAME, 3, 1) = 'R';

SELECT *
FROM EMP
WHERE ENAME LIKE '__R%';

-- 특정 기호로 채우는 LPAD/RPAD 함수      lpad, rpad

-- LPAD(LEFT PADDING) 함수는 
-- 칼럼이나 대상 문자열을 명시된 자릿수에서 오른쪽에 나타내고, 
-- 남은 왼쪽 자리를 특정 기호로 채움

SELECT LPAD('ORACLE',20,'#')
FROM DUAL;

-- 총 20글자중 ORACLE 6글자 왼쪽으로 14글자를 #로 표시

-- RPAD(RIGHT PADDING) 함수는
-- LPAD와 반대로 칼럼이나 대상 문자열을 명시된 자릿수에서 왼쪽에 나타내고,
-- 남은 오른쪽 자리를 특정 기호로 채움

SELECT RPAD('ORACLE',20,'#')
FROM DUAL;

-- 총 20글자중 ORACLE 6글자 오른쪽으로 14글자를 #로 표시

-- 공백 문자를 삭제하는 TRIM 함수  trim

-- LTRIM 함수는 문자열의 왼쪽(앞)의 공백 문자들을 삭제     ltrim

SELECT LTRIM('                         ORACLE')
FROM DUAL;

-- RTRIM 함수는 문자열의 오른쪽(뒤)의 공백 문자들을 삭제    rtrim

SELECT RTRIM('ORACLE                         ')
FROM DUAL;

-- TRIM 함수는 컬럼이나 대상 문자열에서 특정 문자가
-- 첫 번째 글자이거나 마지막 글자이면 잘라내고 남은 문자열만 반환

SELECT TRIM('A' FROM 'AAAAAAAAAAAORACLEAAAAAAAAAAAA')
FROM DUAL;

-- 첫번째 'A' 자리는 생략 가능
-- 생략했을 경우는 공백 문자를 삭제함

SELECT TRIM ('               ORACLE                ')
FROM DUAL;

-- 날짜 함수            date
/*

    SYSDATE                 시스템 저장된 현재 날짜를 반환
    
    MONTHS_BETWEEN          두 날짜 사이가 몇 개월인지를 반환
    
    ADD_MONTH               특정 날짜에 개월 수를 더함
    
    NEXT_DAY                특정 날짜에서 최초로 도래하는 인자로 받은 요일의 날짜를 반환
    
    LAST_DAY                해당 달의 마지막 날짜를 반환
    
    ROUND                   인자로 받은 날짜를 특정 기준으로 반올림
    
    TRUNC                   인자로 받은 날짜를 특정 기준으로 버림

*/

-- 현재 날짜를 반환하는 SYSDATE 함수       sysdate

SELECT SYSDATE
FROM DUAL;

-- 날짜 연산

-- 날짜 형 데이터에 숫자를 더하면 (날짜 + 숫자) 그 날짜로부터
-- 그 기간만큼 지난 날짜를 계산
-- 날짜형 데이터에 숫자를 빼면 (날짜 - 숫자) 그 날짜로부터
-- 그 기간만큼 이전 날짜를 구함

SELECT SYSDATE - 1 어제, SYSDATE 오늘, SYSDATE + 1 내일
FROM DUAL;

-- 각 사원들의 현재까지의 근무 일수를 구하기

SELECT TRUNC(SYSDATE - HIREDATE) 근무일수
FROM EMP;

-- 특정 기준으로 반올림하는 ROUND 함수         round

-- ROUND(date, format)

-- 포맷 모델
/*

    CC, SCC                 단위
    
    SYYY, YYYY, YEAR        4자리 연도의 끝 두 글자 기준으로 반올림
    SYEAR, YYY, YY, Y
    
    DDD, D, J               년(7월 1일부터 반올림)
    
    HH, HH12, HH24          일을 기준
    
    Q                       시를 기준
    
    MONTH, MON, MM, RM      한 분기의 두 번째 달의 16일을 기준으로 반올림
    
    DAY, DY, D              월(16일을 기준으로 반올림)
    
    MI                      분을 기준
    
*/


-- 입사일을 달을 기준으로 반올림한 예제

SELECT HIREDATE, ROUND(HIREDATE,'MONTH')
FROM EMP;

-- 특정 기준으로 버리는 TRUNC 함수         trunc

-- 숫자를 잘라내는 것 뿐만 아니라 날짜를 잘라 낼 수 있음
-- ROUND 함수와 마찬가지로 포맷 형식을 주어 다양한 기준으로 날짜를 잘라낼 수 있음

-- TRUNC (date, format)

-- 특정 날짜(DATE)를 달(MONTH)을 기준으로 버림한 날짜를 구할 때 TRUNC를 사용

SELECT HIREDATE, TRUNC(HIREDATE,'MONTH')
FROM EMP;

-- 두 날짜 사이 간격을 MONTHS_BETWEEN 함수    month_between

-- 날짜와 날짜 사이의 개월 수를 구하는 함수

-- MONTHS_BETWEEN(date1, date2)

-- 직원들의 근무한 개월 수를 구하는 예제

SELECT ENAME, SYSDATE, HIREDATE,
       MONTHS_BETWEEN(SYSDATE, HIREDATE)
FROM EMP;

-- 소수점 이하까지 결과가 구해짐
-- 소수점 이하자리는 한 달이 되지 못한 일수를 나타냄
-- TRUNC 함수를 사용하면 소수점 이하를 삭제할 수 있음

SELECT ENAME, HIREDATE,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))
FROM EMP;

-- 개월 수를 더하는 ADD_MONTHS 함수

-- ADD_MONTH(date, number)

-- 입사 날짜에 6개월을 추가하기

SELECT ENAME, HIREDATE,
       ADD_MONTHS(HIREDATE,6)
FROM EMP;

-- 해당 요일의 가장 가까운 날짜를 반환하는 NEXT_DAY 함수

-- NEXT_DAY(date, 요일)

-- 오늘을 기준으로 최초로 다가오는 수요일은 언제인지 알아보는 예제

SELECT SYSDATE,
       NEXT_DAY(SYSDATE, '수')
FROM DUAL;

-- 해당 달의 마지막 날짜를 반환하는 LAST_DAY 함수

-- 입사한 달의 마지막 날을 구하는 예제

SELECT HIREDATE,
       LAST_DAY(HIREDATE)
FROM EMP;

-- 형 변환 함수  ===================================
-- 오라클을 사용하다 보면 숫자, 문자, 날짜의 데이터 형을 
-- 다른 데이터 형으로 변환해야 하는 경우가 생김
-- 이럴 때 사용하는 함수가 형 변환 함수
-- 형 변환 함수로는 TO_NUMBER, TO_CHAR, TO_DATE 가 있음

/*
            <- TO_NUMBER            <- TO_CHAE
    Number                Character                 Date
               TO_CHAR ->              TO_DATE ->
               
*/

-- 문자형으로 변환하는 TO_CHAR 함수
-- 날짜형을 문자형으로 변환하기

-- DATE 형태의 데이터를 지정한 양식에 의해 VARCHAR2 형의 문자로 변환

-- TO_CHAR(날짜 데이터, '출력형식')

/* 날짜 출력 형식의 종류         의미
    YYYY                       년도 표현(4자리)
    YY                         년도 표현(2자리)
    MM                         월을 숫자로 표현
    MON                        월을 알파벳으로 표현
    DAY                        요일 표현
    DY                         요일을 약어로 표현
    DD                         일을 숫자로 표현
*/

-- 현재 날짜를 기본 형식과 다른 형태로 출력

SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD')
FROM DUAL;

-- 사원들의 입사일을 출력하되 요일까지 함께 출력

SELECT HIREDATE, TO_CHAR(HIREDATE,'YYYY/MM/DD DAY')
FROM EMP;

-- 년도를 2자리(YY)로 출력하고 월은 문자(MON)로 표시하고 요일을 약어(DY)로 표시

SELECT HIREDATE, TO_CHAR(HIREDATE,'YY/MM/DD DY')
FROM EMP;

/* 시간 출력 형식의 종류         의미
    AM Or PM                   오전(AM), 오후(PM) 시각 표시
    
    HH Or HH12                 시간 ( 1 ~ 12 )
    
    HH24                       24시간으로 표현 ( 0 ~ 23 )
    
    MI                         분 표현
    
    SS                         초 표현
*/

-- 현재 날짜와 시간을 출력

SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD, HH24:MI:SS')
FROM DUAL;

-- 1230000 숫자를 문자 형태로 출력

SELECT TO_CHAR(1230000)
FROM DUAL;

/* 숫자 출력 형식 
    0       자릿수를 나타내며 자릿수가 맞지 않을 경우 0으로 채움
    
    9       자릿수를 나타내며 자릿수가 맞지 않아도 채우지 않음
    
    L       각 지역별 통화 기호를 앞에 표시
    
    .       소수점
    
    ,       천 단위 자리 구분
*/

-- 각 지역별 통화 기호를 앞에 붙이고 천 단위마다 콤마를 붙여서 출력
-- (예 : \1,230,000）

SELECT ENAME, SAL, TO_CHAR(SAL,'L999,999')
FROM EMP;

-- 날짜형으로 변환하는 TO_DATE 함수    to_date

-- 오라클 기본 날짜 형식 'YY/MM/DD' 형식으로 '년/월/일' 

-- TO_DATE( '문자', 'format' )

-- 숫자 형태인 19810220을 TO_DATE함수를 사용하여
-- 날짜형으로 변환 

SELECT ENAME,HIREDATE
FROM EMP
WHERE HIREDATE = TO_DATE(19810220,'YYYYMMDD');

-- 올해 며칠이 지났는지 현재 날짜에서 올해 1월 1일을 뺀 결과를 출력

SELECT TRUNC(SYSDATE - TO_DATE('2024/01/01','YYYY/MM/DD'))
FROM DUAL;

-- 숫자형으로 변환하는 TO_NUMBER 함수      to_number

-- 특정 데이터를 숫자형으로 변환해주는 함수

-- '20,000’과 '10,000'의 차이를 알아보기 위해서 빼기를 해보기.
-- 산술 연산을 하려면 문자형을 숫자형으로 변환한 후에 실행

SELECT TO_NUMBER('20,000','99,999') - TO_NUMBER('10,000','99,999')
FROM DUAL;

-- NULL을 다른 값으로 변환하는 NVL 함수         nvl

SELECT ENAME, SAL, COMM, SAL*12+COMM,
       NVL(COMM,0),SAL*12+NVL(COMM,0)
FROM EMP
ORDER BY JOB;

-- 상관이 없는 사원만 출력하되 MGR 칼럼 값 NULL 대신 CEO로 출력

SELECT EMPNO, ENAME, NVL(TO_CHAR(MGR,'9999'),'CEO') "MANAGER"
FROM EMP
WHERE MGR IS NULL;

-- NVL2 함수는 expr1의 값이 NULL이 아니면 
--            expr2, NULL이면 
--            expr3 값으로 변환하기 위해서 사용하는 함수

-- NVL2(expr1, expr2, expr3)
-- NVL2(COMM, SAL*12+COMM, SAL*12)

-- 선택을 위한 DECODE 함수             decode  ==============================

-- DECODE 함수는 프로그램 언어에서 가장 많이 사용되는 SWITCH CASE문과 같은 기능

-- DECODE( 표현식, 조건1, 결과1,
--                조건2, 결과2
--                조건3, 결과3
--                기본결과n
-- )


-- 부서번호에 해당되는 부서명을 구하는 예제 (DECODE 함수 사용)

SELECT ENAME, DEPTNO,
       DECODE(DEPTNO, 10, 'ACCOUNTING',
                      20, 'RESEARCH',
                      30, 'SALES',
                      40, 'OPERATIONS')
        AS DNAME
FROM EMP;

-- 직급에 따라 급여를 인상
-- 직급이 ANALYST인 사원은 5%
--       SALESMAN인 사원은 10%
--       MANAGER인 사원은 15%
--       CLERK인 사원은 20% 인상

SELECT ENAME, JOB, SAL,
        DECODE(JOB, 'ANALYST', SAL*1.05,
                    'SALESMAN',SAL*1.1,
                    'MANAGER',SAL*1.15,
                    'CLERK',SAL*1.20)
        AS UpSal
FROM EMP;

-- 조건에 따라 서로 다른 처리가 가능한 CASE 함수         case    ==================

-- CASE 함수 역시 여러 가지 경우에 대해서 하나를 선택하는 함수
-- DECODE 함수와 차이점이 있다면
-- DECODE 함수는 조건이 일치(= 비교연산자) 하는 경우에 대해서만 적용되는 반면,
-- CASE 함수는 다양한 비교 연산자를 이용하여 조건을 제시할 수 있음.

-- CASE 함수는 프로그램 언어의 IF ELSE IF ELSE 와 유사한 구조

-- CASE 표현식 WHEN 조건1 THEN 결과1
--            WHEN 조건2 THEN 결과2
--            WHEN 조건3 THEN 결과3
--            ELSE 결과n
-- END

-- 부서번호에 해당되는 부서명을 구하기

SELECT ENAME, DEPTNO,
      CASE WHEN DEPTNO = 10 THEN 'ACCOUNTING'
           WHEN DEPTNO = 20 THEN 'RESEARCH'
           WHEN DEPTNO = 30 THEN 'SALES'
           WHEN DEPTNO = 40 THEN 'CLERK'
      END AS DNAME
FROM EMP;

-- 그룹 함수
-- SUM      그룹의 누적 합계
-- AVG      그룹의 평균
-- COUNT    그룹의 총 개수
-- MAX      그룹의 최대값
-- MIN      그룹의 최소값
-- STDDEV   그룹의 표준편차
-- VARIANCE 그룹의 분산

-- 합계를 구하는 SUM 함수
-- SUM 함수는 해당 칼럼 값들에 대한 총합을 구하는 함수(SCOTT.SQL)

SELECT SUM(SAL)
FROM EMP;

-- 커미션 총액 구하기

SELECT SUM(COMM)
FROM EMP;

-- NULL은 블랙홀 NULL을 저장한 컬럼과 연산한 결과도 NULL이라고 함
-- 커미션의 총합을 구해도 NULL 값으로 출력 되지 않음
-- WHY? 그룹 함수는 다른 연산자와는 달리 해당 컬럼 값이 NULL 인 것을 제외하고 계산

-- 평균을 구하는 AVG 함수
-- AVG 함수는 해당 칼럼 값들에 대해 평균을 구하는 함수
-- 이때 해당 칼럼 값이 NULL 인 것에 대해서는 제외하고 계산

-- 급여 평균 구하기(avg)
SELECT AVG(SAL)
FROM EMP;

-- 최대값을 구하는 MAX , 최소값을 구하는 MIN (max, min)
-- 가장 높은 급여와 가장 낮은 급여를 구하기

SELECT MAX(SAL),MIN(SAL)
FROM EMP;

-- 그룹함수와 단순 컬럼

-- 사원들의 최대 급여
SELECT MAX(SAL)
FROM EMP;

-- ENAME 컬럼만 추가하면 오류 발생
SELECT ENAME, MAX(SAL)
FROM EMP;

-- 가장 최근에 입사한 사원의 입사일과 입사한지 가장 오래된 사원의 입사일을 출력
SELECT MAX(HIREDATE)"최근 입사일",MIN(HIREDATE)"최초 입사일"
FROM EMP;

-- 로우(ROW) 개수 구하는 COUNT 함수 (count)
-- COUNT 함수는 테이블에서 조건을 만족하는 행의 개수를 반환하는 함수
-- COUNT 함수에 특정 칼럼을 기술하면 해당 칼럼 값을 갖고 있는 로우의 개수를 계산
-- COUNT 함수는 NULL 값에 대해서는 개수를 세지 않음
-- COUNT 함수에 COUNT(*)처럼 *를 적용하면 테이블의 전체 로우 수를 구하게 됨

-- 사원 테이블의 사원들 중에서 커미션을 받은 사원의 수 구하기
SELECT COUNT(COMM)
FROM EMP;

-- 전체 사원의 수와 커미션을 받는 사원의 수를 구하기
SELECT COUNT(*),COUNT(COMM)
FROM EMP;

-- 탄탄히 다지기
-- 10번 부서 소속 사원중에서 커미션을 받는 사원의 수 구하기
SELECT COUNT(COMM)
FROM EMP
WHERE DEPTNO = 10;

-- 사원 테이블에서 사원들의 직업의 개수를 카운트
SELECT COUNT(JOB)
FROM EMP;

-- 종류가 몇개인지, 중복되지 않은 직업의 개수를 카운트
-- 중복 행 제거 키워드 DISTINCT

SELECT COUNT(DISTINCT JOB)"직급 수"
FROM EMP;

-- GROUP BY 절 (group by)
-- 그룹함수를 쓰되 어떤 칼럼 값을 기준으로 그룹함수를 적용할 경우
-- GROUP BY 절 뒤에 해당 컬럼을 기술

/*  SELECT 컬럼명, 그룹함수
    FROM 테이블명
    WHERE 조건(연산자)
    GROUP BY 컬럼명 */
    
-- 합계, 평군, 최대값, 최소값 등을 어떤 컬럼을 기준으로 그 컬럼의 값 별로 보고자 할 때
-- GROUP BY 절 뒤에 해당 컬럼을 기술
-- GROUP BY 절을 사용할 때 주의할 점
-- 컬럼의 별칭 사용 불가
-- 반드시 컬럼명을 기술

-- 사원 테이블을 부서 번호로 그룹짓기
-- 그룹짓지 않은 부서번호 테이블
SELECT DEPTNO
FROM EMP;

-- 그룹지은 부서번호 테이블
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO;

-- 부서별 평균 급여를 구하기
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

-- 부서별 최대 급여와 최소 급여 구하기
SELECT DEPTNO, MAX(SAL),MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

-- 부서별 사원 수와 커미션을 받는 사원 수 계산
SELECT DEPTNO, COUNT(*),COUNT(COMM)
FROM EMP
GROUP BY DEPTNO;

SELECT * FROM EMP;

-- HAVING 조건 (having)
-- WHERE == SELECT 절에 조건을 사용하여 결과를 제한할 때
-- HAVING == 그룹의 결과를 제한할 때

/*  부서별로 그룹을 지은 후(GROUP BY)
    그룹 지어진 부서별 평균 급여(AVG(SAL))각 2000 이상인 (HAVING AVG(SAL) >= 2000)
    부서번호와 부서별 평균 급여를 출력 */
    
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;

-- 부서별 최대급여와 최소급여를 구하고, 최대 급여가 2900 이상인 부서만 출력하기

SELECT DEPTNO,MAX(SAL),
              MIN(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) >= 2900;

-- JOIN 조인의 필요성
-- 특정 부서 번호에 대한 부서이름은 무엇인지는 부서(DEPT) 테이블에 있음
-- 특정 사원에 대한 부서명을 알아내기 위해서는 부서 테이블에서 정보를 얻어와야함
-- SCOTT 사원이 소속되어 있는 부서의 이름이 무엇인지 알아보자.
-- SCOTT이란 사원의 부서명을 알아내는 일은
-- 사원 테이블에서 SCOTT이 소속된 부서 번호를 알아낸 후
-- 부서 테이블에서 해당 부서 번호에 대한 부서명을 얻어 와야함
-- JOIN 은 두 개 이상의 테이블을 결합해야 원하는 결과를 얻을 수 있을때
-- 한번의 질의로 원하는 결과를 얻을 수 있는 기능

-- CROSS JOIN (cross join)
-- Cross Join으로 
-- 특별한 키워드 없이 SELECT 문의 
-- FROM 절에 사원(EMP) 테이블과 부서(DEPT) 테이블을 
-- 콤마로 연결하여 연속하여 기술할 수 있음

SELECT *
FROM EMP, DEPT;

-- Cross Join의 결과 얻어지는 컬럼의 수는 
-- 사원 테이블의 컬럼의 수(8)와 부서 테이블의 컬럼의 수를 더한 것이므로 11이 됨
-- Cross Joim의 결과를 보면
-- 사원 테이블의 부서에 대한 상세정보가 결합이 되었음.
-- 하지만, 조인이 될 때 아무런 조건을 제시하지 않았기 때문에
-- 사원 한명에 대한 DEPT 테이블의 4개의 로우와 결합된 형태로 만들어짐
-- 그렇기 때문에 Cross Join은 아무런 의미를 갖지 못함
-- JOIN 결과가 의미를 갖기위해서는 조건을 꼭 지정해야함.

-- JOIN의 종류 (join)
-- Equi Join        동일 컬럼을 기준으로 조인
-- Non-Equi Join    동일 컬럼 없이 다른 조건을 사용하여 조인
-- Outer Join       조인 조건에 만족하지 않는 행도 포함해서 나타냄
-- Seif Join        한 테이블 내에서 조인

-- EQUI JOIN은 가장 많이 사용하는 조인 방법 (equi join)
/* 조인 대상이 되는 두 테이블에서 
   공통적으로 존재하는 컬럼의 값이 일치되는 행을 연결하여 결과를 생성 */

/* 사원(EMP) 테이블과 부서(DEPT) 테이블의 공통 컬럼인 DEPTNO의 값이 
   일치(=)되는 조건을 WHERE 절에 기술하여 사용 */
-- 테이블을 조인하려면 일치되는 공통 컬럼을 사용
-- 컬럼의 이름이 같게 되면 혼동이 오기 때문에 컬럼 이름 앞에 테이블 이름을 기술

SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT E.ENAME 사원명, E.DEPTNO 부서번호, D.DNAME 부서이름
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.ENAME = 'SCOTT';

-- 두 테이블을 조인한 결과
/* 결과를 살펴보면 다음과 같이 부서 번호를 기준으로 같은 값을 가진 사원 테이블의 컬럼과 
   부서 테이블의 컬럼이 결합 */

-- Equi Join에 AND 연산하기 (and)

-- 이름이 SCOTT인 사람의 부서명을 출력하기

SELECT ENAME, DNAME
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND ENAME = 'SCOTT';

-- 컬럼명의 모호성 해결

-- 두 테이블에 동일한 이름의 컬럼을 사용하면 어느 테이블 소속인지 불분명함
-- 그렇기 때문에 애매모호한 상태라는 오류 메세지가 출력됨

SELECT ENAME, DANAME, EMP.DEPTNO
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND ENAME = 'SCOTT';

-- 이러한 문제를 해결하기 위한 방법
-- 동일한 이름의 컬럼은 컬럼 명 앞에 테이블 명을 명시적으로 기술해서
-- 컬럼이 어느 테이블 소속인지 구분할 수 있게 됨

SELECT EMP.ENAME, DEPT.DNAME, EMP.DEPTNO
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND ENAME = 'SCOTT';

-- 테이블에 별칭 부여하기
-- 테이블 이름에 별칭을 붙이는 방법
-- FROM 절 다음에 테이블 이름을 명시하고 공백을 둔 다음에 별칭을 지정

SELECT E.ENAME, D.DNAME, E.DEPTNO, D.DEPTNO
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.ENAME = 'SCOTT';

-- 뉴욕에서 근무하는 사원의 이름과 급여를 출력하기

SELECT E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.LOC = 'NEW YORK';

-- ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력

SELECT E.ENAME, E.HIREDATE
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.DNAME = 'ACCOUNTING';

-- 직급이 MANAGER인 사원의 이름, 부서명을 출력

SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.JOB = 'MANAGER';

-- Non-Equi Join
-- Non-Equi Join은 조인 조건에 특정 범위 내에 있는지를 조사하기 위해서
-- WHERE 절에 조인 조건을 = 연산자 이외의 비교 연산자를 사용

SELECT * FROM SALGRADE;

SELECT ENAME,SAL,GRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL;

-- Self Join (self join)
-- 두 개 이상의 서로 다른 테이블을 서로 연결하는 것뿐만 아니라,
-- 하나의 테이블 내에서 조인을 해야만 원하는 자료를 얻는 경우가 생김
-- Self Join이란 말 그대로 자기 자신과 조인을 맺는 것

-- SMITH의 매니저 이름이 무엇인지 알아내려면 어떻게 구해야 할까?

SELECT ENAME, MGR
FROM EMP;

SELECT EMPNO, ENAME
FROM EMP;

SELECT ENAME, MGR
FROM EMP
WHERE ENAME = 'SMITH';

SELECT E2.EMPNO, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
AND E1.ENAME = 'SMITH';
--        SELECT MGR
--        FROM EMP
--        WHERE ENAME = 'SMITH');

-- 매니저가 KING인 사원들의 이름과 직급을 출력
SELECT E1.ENAME, E1.JOB
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
AND E2.ENAME = 'KING';
--        SELECT EMPNO, ENAME
--        FROM EMP
--        WHERE ENAME = 'KING');

SELECT MGR,EMPNO
FROM EMP;



SELECT E1.ENAME, E1.JOB
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
AND E2.ENAME = 'KING';

-- SCOTT과 동일한 근무지에서 근무하는 사원의 이름을 출력

SELECT E1.ENAME, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.DEPTNO = E2.DEPTNO
AND E1.ENAME = 'SCOTT';

SELECT E1.ENAME, E1.EMPNO "관리자 사번", E2.ENAME "관리자 이름"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

-- Outer Join (outer join)
-- Self Join에서 KING인 사원의 정보가 빠져있음
-- MGR 컬럼의 값이 NULL 이기 때문
-- 시원 번호(EMPNO)가 NULL 인 사원은 없으므로 JOIN조건에 만족하지 않기 때문
-- JOIN조건에 만족하지 못하였더라도 해당 로우를 나타내고 싶을때 사용하는 것이
-- 외부 조인 (OUTER JOIN) 
-- 외부 조인은 NULL 값이기에 배제된 행을 결과에 포함시킬수 있음
-- "(+)" 기호를 조인 조건에서 정보가 부족한 컬럼 이름뒤에 덧붙임

SELECT E1.ENAME, E1.EMPNO "관리자 사번", E2.ENAME "관리자 이름"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

SELECT E.ENAME || '의 매니저는'
              || MANAGER.ENAME ||'입니다'
FROM EMP E,EMP MANAGER
WHERE E.MGR = MANAGER.EMPNO(+);

-- 사원 테이블과 부서 테이블을 조인
-- 사원이름과 부서번호와 부서명을 출력
-- 부서 테이블의 40번 부서와 조인할 사원 테이블의 부서번호가 없지만
-- 40번 부서의 부서 이름도 출력되도록 쿼리문을 작성

SELECT E.ENAME,D.DEPTNO,D.DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;

select * from emp;
select * from dept;
select e.ename, d.deptno, d.dname from emp e, dept d where e.deptno(+) = d.deptno;

-- ANSI Join

SELECT *
FROM EMP CROSS JOIN DEPT;

-- ANSI Inner Join (ansi inner join)
-- FROM 다음에 INNER JOIN이란 단어를 사용
-- 조인할 테이블 이름을 명시
-- ON 절을 사용하여 조인 조건을 명시

-- SELECT *
-- FROM TABLE1 INNER JOIN TABLE2
-- ON TABLE1.COLUMN1 = TABLE2.COLUMN2;

SELECT ENAME, DNAME
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE ENAME = 'SCOTT';


-- USING을 이용한 조인 조건 지정하기 (using)
-- 두 테이블에 각각 조인을 정의한 컬럼의 이름이 동일하다면 
-- USING절에서 조인할 컬럼을 지정하여 구문을 더 간단하게 표한 할 수 있음

-- SELECT * FROM TABLE1 JOIN TABLE2
-- USING (DEPTNO);

-- EMP와 DEPT에 DEPTNO 이라는 같은 이름의 컬럼이 있기때문에 USING을 사용할 수 있음

SELECT E.ENAME, D.DNAME
FROM EMP E INNER JOIN DEPT D
USING (DEPTNO);

-- ANSI NATURAL JOIN (ansi natural join)

-- SELECT *
-- FROM TABL1 NATURAL JOIN TABLE2

-- EMP와 DEPT에 DEPTNO 라는 같은 이름의 컬럼이 있기 때문에 
-- 간단하게 조인문을 기술할 수 있음. 

SELECT E.ENAME, D.DNAME
FROM EMP E NATURAL JOIN DEPT D;

-- ANSI Outer Join (ansi outer join)
-- Outer Join은 세 가지 타입의 조인을 제공 
-- LEFT Outer Join, 
-- RIGHT Outer Join 
-- FULL Outer Join

-- SELECT *
-- FROM TABLE1
-- [LEFT | RIGHT | FULL] OUTER JOIN TABLE2

--Outer Join은 어느 한쪽 테이블에는 해당하는 데이터가 존재하는데
-- 다른 쪽 테이블에는 데이터가 존재하지 않을 경우 
-- 그 데이터가 출력되지 않는 문제점을 해결

-- 부서번호와 부서명을 컬럼으로 갖는 DEPT01 테이블을 생성
CREATE TABLE DEPT01( 
DEPTNO NUMBER(2), 
DNAME VARCHAR2(14)); 
-- 데이터 추가
INSERT INTO DEPT01 VALUES(10,'ACCOUNTING');
INSERT INTO DEPT01 VALUES(20,'SALES');

-- 부서번호와 부서명을 컬럼으로 갖는 DEPT02 테이블을 생성

CREATE TABLE DEPT02( 
DEPTNO NUMBER(2), 
DNAME VARCHAR2(14)); 
-- 데이터 추가
INSERT INTO DEPT02 VALUES(10,'ACCOUNTING');
INSERT INTO DEPT02 VALUES(30,'SALES');

-- LEFT OUTER JOIN(left outer join)
SELECT *
FROM DEPT01 LEFT OUTER JOIN DEPT02
USING(DEPTNO);

-- RIGHT OUTER JOIN(right outer join)
SELECT *
FROM DEPT01 RIGHT OUTER JOIN DEPT02
USING(DEPTNO);

-- FUll OUTER JOIN == LEFT + RIGHT (full outer join)
SELECT *
FROM DEPT01 FULL OUTER JOIN DEPT02
USING(DEPTNO);
-- 서브 쿼리의 기본 개념
-- SCOTT의 부서명을 알아내기 위한 서브 쿼리문

-- 메인 쿼리
-- ( ) 서브쿼리

SELECT DNAME FROM DEPT
WHERE DEPTNO = ( SELECT DEPTNO
                 FROM EMP
                 WHERE ENAME = 'SCOTT');
                 
-- 서브 쿼리는 하나의 SELECT 문장의 절 안에 포함된 또 하나의 SELECT 문장
-- 서브 쿼리를 포함하고 있는 쿼리문을 메인 쿼리, 포함된 또 하나의 쿼리를 서브 쿼리
-- 서브 쿼리는 비교 연산자의 오른쪽에 기술해야 하고 반드시 괄호로 둘러쌓아야 함
-- 서브 쿼리는 메인 쿼리가 실행되기 이전에 한번만 실행

-- 단일 행 서브 쿼리 (singlr row)
-- 단일 행(Single Row) 서브 쿼리는 수행 결과가 
-- 오직 하나의 로우(행, row)만을 반환하는 서브 쿼리를 갖는 것
-- 단일 행 서브 쿼리문에서는
-- 오직 하나의 로우(행, row)로 반환되는 서브 쿼리의 결과는 메인 쿼리에 보내게 됨
-- 메인 쿼리의 WHERE 절에서는 단일 행 비교 연산자인 =, >, >=, <, <=, <>를 사용해야 함

-- SCOTT과 같은 부서에서 근무하는 사원의 이름과 부서 번호를 출력하는 SQL 문을 작성

SELECT *
FROM EMP
WHERE JOB = ( SELECT JOB
              FROM EMP
              WHERE ENAME = 'SCOTT');

-- SCOTT와 동일한 직급을 가진 사원을 출력하는 SQL 문을 작성

SELECT ENAME, JOB -- 메인쿼리문
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'SCOTT' ); -- 서브쿼리문
              
-- SCOTT의 급여와 동일하거나 더 많이 받는 사원 명과 급여를 출력

SELECT *
FROM EMP
WHERE SAL >= (SELECT SAL
              FROM EMP
              WHERE ENAME = 'SCOTT');
              
-- DALLAS에서 근무하는 사원의 이름, 부서 번호를 출력하시오

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                 FROM DEPT
                 WHERE LOC = 'DALLAS');

-- SALES(영업부) 부서에서 근무하는 모든 사원의 이름과 급여를 출력

SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');
                
-- 직속상관이 KING인 사원의 이름과 급여를 출력

SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');
             
-- 서브 쿼리에서 그룹 함수의 사용
-- 평균 급여를 구하는 쿼리문을 서브 쿼리로 사용
-- 평균 급여보다 더 많은 급여를 받는 사원을 검색하는 문장

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ( SELECT AVG(SAL)
              FROM EMP);
              
              
-- 다중 행 서브 쿼리

-- 서브 쿼리에서 반환되는 결과가 하나 이상의 행일 때 사용하는 서브 쿼리
-- 다중 행 서브 쿼리는 반드시 다중 행 연산자(Multiple Row Operator)와 함께 사용

--  in
-- IN           메인 쿼리의 비교 조건(‘=’ 연산자로 비교할 경우)이 
--              서브 쿼리의 결과 중에서 하나라도 일치하면 참

--  any, some
-- ANY, SOME    메인 쿼리의 비교 조건이 
--              서브 쿼리의 검색 결과와 하나 이상이 일치하면 참
-- ANY는 찾아진 값에 대해서 하나라도 크면 참이 되는 셈
-- 찾아진 값 중에서 가장 작은 값 즉, 최소값 보다 크면 참

-- all
-- ALL          메인 쿼리의 비교 조건이
--              서브 쿼리의 검색 결과와 모든 값이 일치하면 참
-- 찾아진 값에 대해서 AND 연산을 해서 모두 참이면 참이 되는 셈
-- > ALL 은 “모든 비교값 보다 크냐” 고 묻는 것이 되므로 최대값보다 더 크면 참

-- exist
-- EXIST        메인 쿼리의 비교 조건이
--              서브 쿼리의 결과 중에서 만족하는 값이 하나라도 존재하면 참

-- 결과가 2개 이상 구해지는 쿼리문을 서브 쿼리로 기술할 경우
-- 다중 행 연산자와 함께 사용

/* 주어진 문제가 3000 이상 받는 사원이 소속된 부서(10번, 20번)와 
   동일한 부서에서 근무하는 사원이기에 서브 쿼리의 결과 중에서
   하나라도 일치하면 참인 결과를 구하는 IN 연산자와 함계 사용되어야함 */

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DISTINCT DEPTNO
                 FROM EMP
                 WHERE SAL >= 3000);
                 
-- 부서별로 가장 급여를 많이 받는 사원의 정보(사원 번호, 사원이름, 급여, 부서번호)를 출력

SELECT EMPNO, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
              FROM EMP
              GROUP BY DEPTNO);

-- 직급(JOB)이 MANAGER인 사람이 속한 부서의 부서 번호와 부서명과 지역을 출력

SELECT *
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE JOB = 'MANAGER');

-- 30번 소속 사원들 중에서 
-- 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사람의 이름, 급여를 출력

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL
                 FROM EMP
                 WHERE DEPTNO = 30);

-- 영업 사원들보다 급여를 많이 받는 사원들의 이름과 급여를 출력 / 분석가는 출력X

SELECT ENAME ,SAL, JOB
FROM EMP
WHERE SAL > ALL (SELECT SAL
                 FROM EMP
                 WHERE JOB = 'SALESMAN')
AND JOB <> 'ANALYST';

-- 다음은 부서번호가 30번인 사원들의 급여 중 
-- 가장 작은 값(950)보다 많은 급여를 받는 사원의 이름, 급여를 출력

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL
                 FROM EMP
                 WHERE DEPTNO = 30);
                 
-- 영업 사원들의 최소 급여 보다 많이 받는 사원들의 이름과 급여와 직급(담당 업무)를 출력
-- 영업 사원은 출력X

SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL >= ANY (SELECT SAL
                  FROM EMP
                  WHERE JOB = 'SALESMAN')
                  AND JOB <> 'SALEMAN';
-- 8장 실습문제           
-- 사원번호가 7788인 사원과 담당 업무가 같은 사원을 표시 (사원 이름과 담당 업무)

SELECT ENAME, JOB, EMPNO    -- MAIN
FROM EMP
WHERE JOB = (SELECT JOB     -- SUB
             FROM EMP
             WHERE EMPNO = 7788)
AND EMPNO <> 7788;

-- 사원번호가 7499인 사원보다 급여가 많은 사원의 이름과 담당 업무를 표시 
SELECT SAL, ENAME, JOB, EMPNO
FROM EMP
WHERE EMPNO = 7499;

SELECT ENAME, JOB, SAL, EMPNO
FROM EMP
WHERE SAL > (SELECT SAL
             FROM EMP
             WHERE EMPNO = 7499);
             
-- 최소 급여를 받는 사원의 이름, 담당 업무 및 급여를 표시 (그룹함수 사용)
SELECT ENAME, JOB, SAL          --메인
FROM EMP
WHERE SAL = (SELECT MIN(SAL)    --서브
             FROM EMP);

-- 업무별 평균 급여가 가장 적은 담당 업무를 찾아 업무와 평균 급여를 표시
SELECT JOB 업무, AVG(SAL) 평균급여
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) = (SELECT MIN(AVG(SAL))
                   FROM EMP
                   GROUP BY JOB);

SELECT JOB, ROUND(AVG(SAL),1)
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) = (SELECT MIN(ROUND(AVG(SAL),1))
                          FROM EMP
                          GROUP BY JOB);


-- 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시

SELECT E.ENAME 사원이름, E.SAL 급여, E.DEPTNO 부서번호
FROM EMP E
WHERE SAL IN (SELECT MIN(SAL)       --MIN == 그룹함수 == GROUP BY 컬럼
              FROM EMP E            --IN
              GROUP BY E.DEPTNO);

SELECT MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

              
-- 담당업무가 분석가(analyst)인 사원보다 급여가 적으면서 
-- 업무가 영업사원이 아닌 사원들의 사원번호,이름,담당업무를 표시

SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE SAL < ANY (SELECT SAL
                 FROM EMP
                 WHERE JOB = 'ANALYST')
AND JOB <> 'SALESMAN';

-- "ANY" 키워드는 비교 연산자와 함께 사용
-- EX) " = ANY " , " <> ANY " , " > ANY "

-- 부하직원이 없는 사원의 이름을 표시

SELECT MGR
FROM EMP
WHERE MGR IS NOT NULL;

SELECT DISTINCT MGR
FROM EMP
WHERE MGR IS NOT NULL;

SELECT ENAME
FROM EMP
WHERE EMPNO NOT IN (SELECT MGR
                FROM EMP
                WHERE MGR IS NOT NULL);
                
SELECT * FROM EMP;


-- "IN" 키워드는 외부 쿼리의 결과에 서브쿼리의 결과 중 하나라도 일치하는 경우를 선택

-- 부하직원이 있는 사원의 이름을 표시

SELECT ENAME
FROM EMP
WHERE EMPNO  IN (SELECT EMPNO
                FROM EMP
                WHERE MGR IS NOT NULL);

-- BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성

SELECT ENAME 이름, HIREDATE 입사일, DEPTNO 부서
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'BLAKE')
AND ENAME <> 'BLAKE';

-- 급여가 평균급여 보다 많은 사원들의 사원번호와 이름을 표시,
-- 결과를 급여에 대해서 오름차순 정렬

SELECT EMPNO 사원번호,ENAME 이름, SAL 급여
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP)
ORDER BY SAL DESC;


SELECT EMPNO 사원번호, ENAME 사원이름, SAL 급여
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP)
ORDER BY SAL ASC;
             

-- 이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의 사원번호와 이름을 표시
SELECT * FROM EMP;

SELECT EMPNO 사원번호,ENAME 사원이름
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE ENAME LIKE '%K%')
AND ENAME NOT LIKE '%K%';

-- 부서 위치가 DALLAS인 사원의 이름과 부서번호 및 담당 업무를 표시

SELECT E.ENAME 이름, E.DEPTNO 부서번호, E.JOB 업무,D.LOC 부서위치
FROM EMP E, DEPT D
WHERE E.DEPTNO IN (SELECT DEPTNO
                  FROM DEPT
                  WHERE D.LOC = 'DALLAS')
AND D.LOC LIKE 'DALLAS';

--  " = " 비교 대상이 하나 일때, " IN " 비교 대상이 하나 이상일때
SELECT * FROM EMP;
SELECT * FROM DEPT;

-- KING 에게 보고하는 사원의 이름과 급여를 표시

SELECT ENAME 사원이름,SAL 급여
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');
             
-- RESEARCH 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시
SELECT * FROM DEPT;


SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
               FROM DEPT
               WHERE DNAME = 'RESEARCH');

-- 평균 급여보다 많은 급여를 받으면서 전체 사원 중 이름에 M이 포함된 사원과
-- 같은 부서에서 근무하는 사원의 사원번호, 이름, 급여를 표시

SELECT EMPNO,ENAME,SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP)
AND DEPTNO IN (SELECT DEPTNO
               FROM EMP
               WHERE ENAME LIKE '%M%');

-- 평균 급여가 가장 적은 업무 찾기

SELECT JOB 업무, AVG(SAL) 평균급여
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) = (SELECT MIN(AVG(SAL))
                   FROM EMP
                   GROUP BY JOB);
SELECT AVG(SAL)
FROM EMP
GROUP BY JOB;   -- 그룹별 평균

-- 그룹과 그룹 == HAVING 절 사용

SELECT MIN(AVG(SAL))
FROM EMP
GROUP BY JOB;   -- 평균 급여가 가장 적은 업무 SUB

SELECT JOB,AVG(SAL)
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) = (SELECT MIN(AVG(SAL))
FROM EMP
GROUP BY JOB);

-- 담당 업무가 MANAGER가 아니면서 부하직원이 있는 사원의 이름

SELECT ENAME, JOB
FROM EMP
WHERE EMPNO IN(SELECT MGR
               FROM EMP
               WHERE MGR IS NOT NULL)
AND JOB <> 'MANAGER';

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

-- 트랜잭션     =========================================
/*
데이터베이스에서 트랜잭션(Transaction)은 데이터 처리의 한 단위. 

오라클에서 발생하는 여러 개의 SQL 명령문들을 하나의 논리적인 작업 단위로 처리
하는데 이를 트랜잭션이라고 함. 

하나의 트랜잭션은 All-OR-Nothing 방식으로 처리. 

여러 개의 명령어의 집합이 정상적으로 처리되면 정상 종료하도록 하고 
여러 개의 명령어 중에서 하나의 명령어라도 잘못되었다면 전체를 취소.

데이터베이스에서 작업의 단위로 트랜잭션이란 개념을 도입한 이유는 
데이터의 일관성을 유지하면서 안정적으로 데이터를 복구시키기 위해서 
*/

-- 은행 현금인출기(ATM)에서 돈을 인출하는 과정으로 트랜잭션을 설명

--1. 현금을 인출하겠다고 기계에게 알려줌
--2. 현금 카드를 넣어서 본인임을 인증받음
--3. 인출할 금액을 선택하면 은행 현금인출기는 돈을 내어줌
--4. 계좌에서 인출된 금액만큼 잔액에서 차감함

/*
이러한 거래에 있어서 지켜져야 할 중요한 것이 있음. 

기계의 오동작 등으로 인하여 전산 상으로는 돈을 인출한 것으로 입력이 되었는데 
돈은 안 나온다거나, 돈은 나왔는데 일련의 에러나 문제로 인하여서 
돈을 인출한 것이 전산 상으로 입력이 안 되면 상당히 심각한 문제가 발생.

이 때문에 전산 상으로도 입력이 정상적으로 잘 되고, 
돈도 인출이 정상적으로 잘 됨을 확인하고 나서야, 
인출하는 하나의 과정이 정상적으로 처리되었음을 확인할 수 있음.

여기서 돈을 인출하는 일련의 과정이 하나의 묶음으로 처리되어야 한다는 것을 이해.

그리고 혹시 처리도중 중간에 무슨 문제가 발생한다면 
진행되던 인출과정 전체를 취소하고 다시 처음부터 시작해야 함.

이것을 트랜잭션이라고 함.
*/

-- 트랜잭션 제어를 위한 명령어 (Transaction Control Language)

-- COMMIT
-- SAVEPOINT
-- ROLLBACK

-- COMMIT 과 ROLLBACK   ============================== commit, rollback

/*
앞장에서 데이터를 추가, 수정, 삭제하는 작업들을 학습했는데, 
이러한 데이터를 조작하는 명령어인 DML(Data Manipulation Language)은 
이들이 실행됨과 동시에 트랜잭션이 진행됨.

DML 작업이 성공적으로 처리되도록 하기 위해서는 COMMIT 명령을, 
작업을 취소하기 위해서는 ROLLBACK 명령으로 종료.

COMMIT은 모든 작업들을 정상적으로 처리하겠다고 확정하는 명령어로 
트랜잭션의 처리 과정을 데이터베이스에 모두 반영하기 위해서 변경된 내용을 모두 영구 저장.

COMMIT 명령어를 수행하게 되면 하나의 트랜잭션 과정을 종료하게 됨.

ROLLBACK은 
작업 중 문제가 발생되어서 트랜잭션의 처리 과정에서 발생한 변경사항을 취소하는 명령어.

ROLLBACK 명령어 역시 트랜잭션 과정을 종료하게 됨.

ROLLBACK은 트랜잭션으로 인한 하나의 묶음 처리가 시작되기 이전의 상태로 되돌림.

트랜잭션은 여러 개의 물리적인 작업(DML 명령어)들이 모여서 이루어지는데 
이러한 과정에서 하나의 물리적인 작업이라도 문제가 발생하게 되면 
모든 작업을 취소해야 하므로 이들을 하나의 논리적인 작업 단위(트랜잭션)로 구성해 놓는다.

문제가 발생하게 되면 이 논리적인 작업 단위를 취소해 버리면 되기 때문.
*/

-- 여러 개의 DML 명령어들을 어떻게 하나의 논리적인 단위인 트랜잭션으로 묶을 수 있을까?

-- 트랜잭션은 마지막으로 실핸한 커밋(혹은 롤백) 명령어 이후부터
-- 새로운 커밋(혹은 롤백) 명령을 실행하는 시점까지 수행된 모든 DML 명령들을 의미함.

/*

(3)UPDATE 문으로 데이터를 갱신하고,
(4)DELETE 문으로 데이터를 삭제하고,
(5)INSERT 문으로 데이터를 삽입함

만약 이 모든 과정이 오류없이 수행되었다면 지금까지 실행한 모든 작업 (3, 4, 5)을
"데이터베이스에 영구 저장하라" 는 명령으로 커밋을 수행함.

                          |---------- Transction -----------|
(1)INSERT -> (2)DELETE -> (3)UPDATE -> (4)DELETE -> (5)INSERT
                          |                                 |
                        commit                            commit
                    
롤백 명령은 마지막으로 수행한 커밋 명령까지만 정상 처리(1 , 2) 된 상태로 유지하고
그 이후에 수행했던 모든 DML 명령어 작업(3, 4, 5)들을 취소시켜 이전 상태로 원상 복귀시킴.

                          |---------- Transction -----------|
(1)INSERT -> (2)DELETE -> (3)UPDATE -> (4)DELETE -> (5)INSERT
                          | <------------------------------ |
                        commit                            commit

트랜잭션은 이렇듯 ALL-OR-Nothing 방식으로 DML 명령어들을 처리함.

*/
/*
COMMIT 과 ROLLBACK 명령어의 장점

- 데이터 무결성이 보장됨
- 영구적인 변경 전에 데이터의 변경 사항을 확인할 수 있음
- 논리적으로 연관된 작업을 그룹화할 수 있음

- COMMIT 명령어

- Transaction(INSERT, UPDATE, DELETE) 작업 내용을 실제 DB에 저장
- 이전 데이터가 완전히 UPDATE 됨
- 모든 사용자가 변경된 데이터의 결과를 볼 수 있음

- ROLLBACK 명령어

- Transaction(INSERT, UPDATE, DELETE) 작업 내용을 취소
- 이전 COMMIT한 곳 까지만 복구함

데이터베이스 사용자가 COMMIT이나 ROLLBACK 명령어를 명시적으로 수행시키지 않더라도 
다음과 같은 경우에 자동 커밋 혹은 자동 롤백이 발생

- 자동 COMMIT 명령과 자동 ROLLBACK 명령이 되는 경우

-   SQL* PLUS가 정상 종료되었다면 자동으로 COMMIT되지만, 
    비정상 종료되었다면 자동으로 ROLLBACK 합니다.
    
-   DDL과 DCL 명령문이 수행된 경우 자동으로 COMMIT 됨.

-   정전이 발생했거나 컴퓨터 Down시(컴퓨터의 전원이 끊긴) 자동으로 ROLLBACK 됨. 

*/

-- 부서번호가 10번인 부서에 대해서만 삭제하려고 했는데 
-- 테이블 내의 모든 로우가 삭제되어 아무런 데이터도 찾을 수 없게 되었더라도 
-- ROLLBACK 문을 사용하여 이전 상태로 되돌릴 수 있음

-- 1. DELETE문으로 테이블의 레코드들을 삭제

DELETE FROM DEPT01;

-- 2. 만일 부서번호가 20번인 부서에 대해서만 삭제하려고 했는데 
-- 위와 같은 명령을 수행했다면 테이블 내의 모든 로우가 삭제되어 
-- 다음과 같이 아무런 데이터도 찾을 수 없게 됩니다. 
-- 이전 상태로 되돌리기 위해서 ROLLBACK 문을 수행

ROLLBACK;

-- 원래하려고 했던 부서번호가 20번인 부서만 삭제

-- 1. 부서번호 20번 사원에 대한 정보만 삭제한 후, 확인

DELETE FROM DEPT01
WHERE DEPTNO = 20;

-- 2. 데이터를 삭제한 결과를 물리적으로 영구히 저장하기 위해서 커밋을 수행

COMMIT;

-- 자동 커밋 (AUTO COMMIT)============================= auto commit

/*
DDL 문에는 CREATE, ALTER, DROP, RENAME, TRUNCATE 등이 있음. 

이러한 DDL문은 자동으로 커밋(AUTO COMMIT)이 발생됨
*/

-- CREATE문에 의한 자동 커밋에 의해서 이전에 수행했던 DML 명령어가 자동 커밋됨을 확인

-- 1. 부서 번호가 40번인 부서를 삭제

DELETE FROM DEPT02
WHERE DEPTNO = 40;

-- 2. 삭제 후 부서 테이블(DEPT)과 동일한 내용을 갖는 새로운 테이블(DEPT03)을 생성

CREATE TABLE DEPT03
AS
SELECT * FROM DEPT;

-- 3. DEPT02 테이블의 부서번호가 40번인 부서를 다시 되살리기 위해서 
--    ROLLBACK 명령문을 수행하여도 
--    이미 수행한 CREATE 문 때문에 자동으로 커밋이 발생하였으므로 되살릴 수 없다.

-- TRUNCATE 문이  truncate
-- 실패되더라도 자동 커밋되어 이전에 수행했던 DML 명령어가 자동 커밋됨을 확인

-- 1. 부서 테이블(DEPT03)에서 부서 번호가 20번인 부서를 삭제

DELETE FROM DEPT03
WHERE DEPTNO = 20;

-- 2. TRUNCATE 문을 실행시키되 테이블 명을 일부러 잘못 적어서 에러를 유도

TRUNCATE TABLE DEPTPPP;

-- 3. 부서번호가 20번인 부서를 다시 되살리기 위해서 
--    ROLLBACK 명령문을 수행하여도 
--    TRUNCATE 문이 수행되면서 자동으로 커밋이 발생하였으므로 되살릴 수 없다.

-- 트랜잭션을 작게 분할하는 SAVEPOINT  ============================== savepoint
/*
SAVEPOINT 명령을 써서 현재의 트랜잭션을 작게 분할할 수 있음.

저장된 SAVEPOINT는
ROLLBACK TO SAVEPOINT 문을 사용하여 표시한 곳까지 ROLLBACK할 수 있음.

여러 개의 SQL 문의 실행을 수반하는 트랜잭션의 경우, 
사용자가 트랜잭션 중간 단계에서 세이브포인트를 지정할 수 있음. 

이 세이브포인트는 차후 롤백과 함께 사용해서 
현재 트랜잭션 내의 특정 세이브포인트까지 롤백할 수 있게 됨.

아래 그림을 보면 COMMIT 명령이 내려진 후 
다음 COMMIT 명령이 나타날 때까지가 하나의 트랜잭션으로 구성되므로 
(2)번에서 (4)번까지가 하나의 트랜잭션이 됨. 

이렇게 트랙잭션을 구성할 때 
중간 중간 SAVEPOINT 명령으로 위치를 지정해 놓으면
(예를 들어 C) 하나의 트랜잭션 내에서도 
ROLLBACK TO C(SAVEPOINT 문을 사용하여 표시한 곳)까지 ROLLBACK할 수 있음.

                      |======================= Transaction =========================|
(1) DELETE FROM DEPT     DELETE FROM DEPT     DELETE FROM DEPT     DELETE FROM DEPT
    WHERE DEPTNO = 40    WHERE DEPTNO = 30    WHERE DEPTNO = 20    WHERE DEPTNO = 10    
                      |<---------------------|-------------------- | ---------------- ROLLBACK
                      |                      |<------------------- | ---------------- ROLLBACK TO C1 
                      |                      |                     |<-----------------ROLLBACK TO C2
                   COMMIT                SAVEPOINT C1           SAVEPOINT C2

*/

-- SAVEPOINT로 특정 위치를 지정하기 위한 사용 형식

-- SAVEPOINT LABEL_NAME;

-- SAVEPOINT로 지정해 놓은 특정 위치로 되돌아가기 위한 사용 형식

-- ROLLBACK TO LABEL_NAME;

-- 다음과 같이 트랜잭션 중간 단계에서 세이브포인트를 지정
/*
    40번 부서 삭제
                        <--------------- COMMIT
    30번 부서 삭제
                        <--------------- 세이브포인트 C1 설정
    20번 부서 삭제
                        <--------------- 세이브포인트 C2 설정
    10번 부서 삭제
*/

-- 1. 부서번호가 40번인 부서를 삭제한 후에 커밋을 수행하여 새롭게 트랜잭션을 시작

DELETE FROM DEPT01 WHERE DEPTNO=40;
COMMIT;

-- 2. 이번엔 부서번호가 30번인 부서를 삭제

DELETE FROM DEPT01 WHERE DEPTNO=30; 

-- 3. 세이브포인트 C1를 설정한 후, 부서번호가 20번인 사원을 삭제

SAVEPOINT C1; 
DELETE FROM DEPT01 WHERE DEPTNO =20; 

-- 4. 세이브포인트 C2를 설정한 후, 부서번호가 10번인 사원을 삭제

SAVEPOINT C2; 
DELETE FROM DEPT01 WHERE DEPTNO =10;

-- 이제 부서번호가 10번인 사원을 삭제하기 바로 전으로 되돌리려면 어떻게 해야 할까? 
-- 세이브 포인트를 이용해서 트랜잭션 중간 단계로 되돌려보기

-- 1. 지금 ROLLBACK 명령을 내리게 된다면 이전 COMMIT 지점으로 되돌아가므로 
--    10, 20, 30번 부서의 삭제가 모두 취소됨. 
--    따라서 원했던 10번 부서의 삭제 이전까지만 되돌리려면 
--    다시 30, 20번의 부서를 삭제해 주어야 할 것입니다.

ROLLBACK TO C2; 

-- 2. 위 결과 화면을 보면 세이브포인트 C2 지점으로 이동되어 
--    10번 부서의 삭제 이전으로 되돌려진 것을 확인할 수 있음

ROLLBACK TO C1; 

-- 3. 마지막으로 이전 트랜잭션까지 롤백한 후의 결과 확인

ROLLBACK; 

-- 데이터 읽기 일관성과 락
/*
오라클이 데이터 읽기의 일관성을 제공해 준다는 것을 증명을 하기 위해서 
우선 다음과 같은 가정. 
오라클 서버가 서울 본사에 설치되어 있고 
이 데이터베이스를 서울 본사 직원과 대전 지사 직원이 공용하고 있다. 
어느 날 서울 본사 직원과 대전 지사 직원이 
동일한 테이블을 같은 시간에 접근해서 사용할 경우 
어떤 일이 일어날 수 있는지 살펴보기.

======================락 Lock    ===========================
사용자    서울본사직원(철수)         대전지사직원(영희)

① SELECT * FROM EMP01 
    WHERE ENAME='SCOTT';
                                 ② DELETE FROM EMP01
                                    WHERE ENAME='SCOTT';    오라클은 SCOTT 사원이 
                                                            삭제되기 전에 자동으로 
                                                            롤백 세그먼트에 이 행의 정보를 
                                                            Before Image(복사 본)로 복사해둔다. 

영희에 의해 삭제된 행을 철수가 접근해서 
그 내용을 변경한다는 것은 
이치에 맞지 않기 때문에 
락이 걸려 무한 대기 상태가 된다.

③ UPDATE EMP01 
   SET SAL=200 
   WHERE ENAME='SCOTT';
LOCKING(무한대기상태)....
                                 ④ ROLLBACK;        영희가 SCOTT 사원을 삭제하는 
                                                     쿼리문에 대해 커밋이나 롤백을 해야만 
                                                     철수가 SCOTT 사원의 정보를 
                                                     변경할 수 있게 된다. 
                                                     철수가 롤백을 수행하면 
                                                     SCOTT 사원을 삭제하겠다는 
                                                     명령문을 해제하게 되어 
                                                     롤백 세그먼트에 
                                                     저장된 복사 본이 원상 복귀된다.


⑤ 무한대기에서 벗어남 

영희가 트랙잭션을 종료하였기에 
무한 대기에서 벗어나게 되고 
철수에 의해 SCOTT 사원의 급여가
200으로 변경된다.

============= 데드 락 Dead Lock    ===================

사용자    서울본사직원(철수)         대전지사직원(영희)

① UPDATE emp SET sal=100
  WHERE ename ='SCOTT';
                                    ② UPDATE emp SET sal=20
                                       WHERE ENAME='SMITH';


③ UPDATE emp SET sal=300 
   WHERE ename ='SMITH';
LOCKING(무한대기상태)....

Ename이 SMITH인 행이 
영희에 의해 갱신명령어를 수행했기에 
철수가 락에 걸림 .
                                    ④ UPDATE emp SET sal=400 
                                       WHERE ename ='SCOTT';
                                      LOCKING(무한대기상태)....
                                    
                                    영희가 커밋이나 롤백을 하지 않고 
                                    철수가 사용중인 SCOTT에 접근하려고 하면 
                                    어느 한쪽의 작업도 완료할 수 없는 상태인 
                                    데드 락에 빠지게 됨.

서로의 행에 대한 접근을 하려 하고 있으므로 
결과적으로 어느 한 쪽도 작업을 완료할 수 없는 상태에 빠지게 된다.

Oracle에서는 이 상태를 방지하기 위한 해결책으로 
다음과 같은 메시지를 보내면서 비정상적인 종료를 하고 그로 인한 자동 롤백이 이루어진다.

ORA-00060:?deadlock detected while waiting for resource
(자원 대기 중 교착상태가 검출되었습니다.)

결과적으로 철수의 3번 명령을 취소시킴으로써 데드락 상태에서 빠져 나오게 된다.
명령문마다 암시적인 세이브 포인터를 지니고 있다가 
데드락 을 벗어나기 위해서 세이브포인터까지 롤백하게 되는 것이다.

=================== LOCK 과 TCL  ============================

    커밋(Commit)                          롤백(RollBck)
    
    트랜잭션을 데이터베이스에 반영           트랜잭션을 데이터베이스에 취소
    락을 해제                              락을 해제
    트랜잭션이 종료                        트랜잭션이 종료
    자동 커밋(Auto Commit)은 정상 종료      자동 롤백(Auto Rollback)은 비정상 종료
    

테이블 갱신 시 발생한 락 해결 방법

문제 제시

  ALTER TABLE  테이블명  DROP  COLUMN  컬럼명;

삭제가 진행되는 시점에서 다른 사용자가 DML명령어로 접근한다면 락이 걸림

SET UNUSED

근무시간에 다른 사용자가 접근하지 못하도록 제한만 둔다

ALTER TABLE 테이블명 SET UNUSED(컬럼명);

시스템 사용 빈도가 적을 때 실질적인 삭제를 한다. 

ALTER TABLE 테이블명 DROP UNUSED COLUMN;

================DDL 명령의 롤백  =========================

자동 커밋

DDL 문은 자동 커밋이 발생하므로 이전 상태로 롤백할 수 없다.  

테이블을 복사해두었다가 
변경된 내용의 테이블을 작성 후 복사해 두었던 테이블의 이름을 변경한다. 


================TRUNCATE와 DELETE 차이  =========================

TRUNCATE
DDL 문으로 자동 커밋 발생, 삭제 이전으로 롤백 할 수 없다.
테이블의 구조만 남고 모든 레코드가 삭제된다. 

DELETE
DML 문으로 삭제 이전으로 롤백 할 수 있다.
삭제하고자 하는 레코드를 선택할 수 있다. 

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
    
    /*
============== 뷰의 개념    ==========================

뷰(View)는 
한마디로 물리적인 테이블을 근거한 논리적인 가상 테이블이라고 정의할 수 있음. 
뷰를 가상 테이블이라고 하는 이유를 살펴보면 
가상이란 단어는 실질적으로 데이터를 저장하고 있지 않기 때문에 붙인 것이고,
테이블이란 단어는 실질적으로 데이터를 저장하고 있지 않더라도 
사용자는 마치 테이블을 사용하는 것과 동일하게 뷰를 사용할 수 있기 때문에 붙인 것.

뷰는 기본 테이블에서 파생된 객체로서 기본 테이블에 대한 하나의 쿼리문.

뷰(View)란 ‘보다’란 의미를 갖고 있는 점을 감안해 보면 알 수 있듯이 
실제 테이블에 저장된 데이터를 뷰를 통해서 볼 수 있도록 함. 

사용자에게 주어진 뷰를 통해서 기본 테이블을 제한적으로 사용하게 됨. 

=============== 뷰의 기본 테이블   =========================

뷰는 이미 존재하고 있는 테이블에 제한적으로 접근하도록 함. 
뷰를 생성하기 위해서는 
실질적으로 데이터를 저장하고 있는 물리적인 테이블이 존재해야 하는데 
이 테이블을 기본 테이블이라고 함. 

우선 시스템에서 제공하는 dept 테이블과 emp 테이블의 
내용이 변경되는 것을 막기 위해서 
테이블의 내용을 복사한 새로운 테이블을 생성한 후에 이를 기본 테이블로 사용해보기.

*/

-- 뷰의 기본 테이블을 생성

-- 1.DEPT_COPY를 DETP 테이블의 복사본으로 생성

CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPT;

-- 2. EMP 테이블의 복사본으로 EMP_COPY를 생성

CREATE TABLE EMP_COPY
AS
SELECT * FROM EMP;

DROP TABLE EMP_COPY;
/*
뷰를 생성하여 자주 사용되는 SELECT 문을 간단하게 접근하는 방법을 학습

뷰를 생성하기 위한 기본 형식

CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name
[(alias, alias, alias, ...)]
AS subquery
[WITH CHECK OPTION]
[WITH READ ONLY];

테이블을 생성하기 위해서 CREATE TABLE 로 시작하지만, 
뷰를 생성하기 위해서는 CREATE VIEW로 시작

AS 다음은 마치 서브 쿼리문과 유사함

subquery에는 우리가 지금까지 사용하였던 SELECT 문을 기술하면 됨

================= CREATE OR RELPACE VIEW ======================
뷰를 만들 때 CREATE OR RELPACE VIEW 대신 
그냥 CREATE VIEW만 사용해도 됨. 

그러나 그냥 CREATE VIEW를 통해 만들어진 뷰의 구조를 바꾸려면 
뷰를 삭제하고 다시 만들어야 되는 반면, 

CREATE OR REPLACE VIEW는 
새로운 뷰를 만들 수 있을 뿐만 아니라 
기존에 뷰가 존재하더라도 삭제하지 않고 
새로운 구조의 뷰로 변경(REPLACE)할 수 있음. 

그래서 대부분 뷰를 만들 때는 
CREATE VIEW 대신 CREATE OR REPLACE VIEW를 사용하는 편.

================ FORCE =========================

FORCE를 사용하면, 기본 테이블의 존재 여부에 상관없이 뷰를 생성. 

=============== WITH CHECK OPTION ================

WITH CHECK OPTION을 사용하면, 
해당 뷰를 통해서 볼 수 있는 범위 내에서만 
UPDATE 또는 INSERT가 가능.

================ WITH READ ONLY =====================

WITH READ ONLY를 사용하면 
해당 뷰를 통해서는 SELECT만 가능하며 
INSERT/UPDATE/DELETE를 할 수 없게 됨. 

만약 이것을 생략한다면, 
뷰를 사용하여 추가, 수정, 삭제(INSERT/UPDATE/DELETE)가 모두 가능.

================= 뷰 정의하기 ==========================

뷰를 만들기 전에 어떤 경우에 뷰를 사용하게 되는지 
다음 예를 통해서 뷰가 필요한 이유를 살펴보기

*/

-- 만일, 30번 부서에 소속된 사원들의 
-- 사번과 이름과 부서번호를 자주 검색한다고 한다면
-- 다음과 같은 SELECT 문을 여러 번 입력해야 함.

SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;

-- 위와 같은 결과를 출력하기위해서 매번 SELECT 문을 입력하기란 번거로운 일임.

-- 뷰는 이와 같이 번거로운 SELECT 문을 매번 입력하는 대신 
-- 보다 쉽게 원하는 결과를 얻고자 하는 바램에서 출발한 개념

-- 자주 사용되는 30번 부서에 소속된 사원들의 사번과 이름과 부서번호를 출력하기 위한 
-- SELECT문을 하나의 뷰로 정의해보기

CREATE VIEW EMP_VIEW30
AS
SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30;

-- insufficient privileges
-- GRANT CREATE VIEW TO SCOTT; 으로 해결

-- 뷰는 테이블에 접근(SELECT)한 것과 동일한 방법으로 결과를 얻을 수 있음. 

SELECT * FROM EMP_VIEW30;

-- 30번 부서에 소속된 사원들의 사번과 이름과 부서번호를 출력하기 위한 
-- SELECT문을 하나의 뷰로 정의

-- 1. 뷰를 생성하려는데 다음과 같이 권한이 불충분하다고 오류가 발생할 경우가 있음

-- 2. 이럴 경우에는 DBA인 SYSTEM 계정으로 로그인하여 뷰를 생성할 권한을 부여. 
--    특정 사용자에 대해서 아무 문제없이 뷰가 생성된다면 괜찮지만, 
--    그렇지 않을 경우 GRANT 명령어로 특정 사용자에게 권한을 부여해야 함. 

--    아래 문장은 SCOTT 사용자에게 테이블을 생성할 CREATE VIEW 권한을 부여하는 명령어.

--    이 명령어는 DBA 권한이 있는 사용자만이 부여할 수 있으므로 SYSTEM 계정으로 접속

--CONN system/manager

--GRANT CREATE VIEW TO scott;

-- 1. 뷰를 생성하려는데 다음과 같이 권한을 설정하였다면 
--    30번 부서에 소속된 사원들의 사번과 이름과 부서번호를 출력하기 위한 
--    SELECT문을 하나의 뷰로 다시 정의해 보기

CREATE VIEW EMP_VIEW30
AS 
SELECT EMPNO, ENAME, DEPTNO
FROM EMP_COPY
WHERE DEPTNO=30;

-- 2.뷰를 생성할 때 컬럼 이름을 명시하지 않으면 
-- 뷰(EMP_VIEW30)를 정의하는 기본 테이블(EMP_COPY)의 컬럼 명을 상속받아 사용

DESC EMP_VIEW30;

-- 3. 뷰의 내용을 출력해보기. 
--    테이블의 내용을 출력하는 것과 동일한 방식으로 수행하면 됨.
--    SELECT * FROM 다음에 테이블 명 대신에 뷰 이름을 기술

SELECT * FROM EMP_VIEW30;

-- 기본 테이블은 EMP_COPY로 하여 
-- 20번 부서에 소속된 사원들의 사번과 이름과 부서번호와 상관의 사번을 출력하기 위한
-- SELECT문을 EMP_VIEW20 이란 이름의 뷰로 정의해보기

CREATE VIEW EMP_VIEW20
AS
SELECT EMPNO, ENAME, DEPTNO, MGR
FROM EMP_COPY
WHERE DEPTNO = 20;

/*
=============== 뷰의 내부구조와 USER_VIEWS 데이터 딕셔너리 ===============

뷰는 물리적으로 데이터를 저장하고 있지 않다고 하였음. 
그런데도 다음과 같은 질의 문을 수행할 수 있는 이유가 무엇일까?

SELECT * FROM EMP_VIEW30;

EMP_VIEW30라는 뷰는 데이터를 물리적으로 저장하고 있지 않음.

CREATE VIEW 명령어로 뷰를 정의할 때 
AS 절 다음에 기술한 쿼리 문장 자체를 저장하고 있음. 

뷰 정의할 때 기술한 쿼리문이 궁금하다면
데이터 딕셔너리 USER_VIEWS 테이블의 TEXT 컬럼 값을 살펴보면 됨.

*/

-- USER_VIEWS에서 테이블 이름과 텍스트만 출력해보기

SELECT VIEW_NAME, TEXT
FROM USER_VIEWS;

/*
기본 테이블은 디스크 공간을 할당 받아서 실질적으로 데이터를 저장하고 있지만, 
뷰는 데이터 딕셔너리USER_VIEWS 에 사용자가 뷰를 정의할 때 기술한 
서브 쿼리문(SELECT 문)만을 문자열 형태로 저장하고 있음.

뷰의 동작 원리를 이해하기 위해서 
뷰에 대한 질의가 어떻게 내부적으로 처리되는지 자세히 살펴보기

                           뷰      쿼리 수행
조회/수정/삭제 ========> SELECT 문 ==========> 쿼리 수행 결과
    Λ                                               |
    |___ ____ ____ ____ ____ ____ ____ ____ ___ ____|

1. 사용자가 뷰에 대해서 질의를 하면 USER_VIEWS에서 뷰에 대한 정의를 조회.
2. 기본 테이블에 대한 뷰의 접근 권한을 살핀다.
3. 뷰에 대한 질의를 기본 테이블에 대한 질의로 변환.
4. 기본 테이블에 대한 질의를 통해 데이터를 검색.
5. 검색된 결과를 출력.

우리가 앞에서 생성한 뷰인 
EMP_VIEW30를 SELECT문의 FROM절 다음에 기술하여 질의를 하면 
오라클 서버는 USER_VIEWS에서 EMP_VIEW30를 찾아 이를 정의할 때 
기술한 서브 쿼리문이 저장된 TEXT 값을 EMP_VIEW30 위치로 가져감.

SELECT *
FROM EMP_VIEW30;
       Λ  
       |
       SELECT EMPNO, ENAME, SAL, DEPTNO
       FROM EMP_COPY
       WHERE DEPTNO = 30;
       
질의는 기본 테이블인 EMP_COPY를 통해 일어남. 
즉, 기본 테이블인 EMP_COPY 에 대해서 서브 쿼리문을 수행하게 됨. 
이러한 동작 원리 덕분에 뷰가 실질적으로 데이터를 저장하고 있지 않더라도 
데이터를 검색할 수 있는 것임.
*/

-- 1. 기본 테이블을 가져다가 쿼리문을 수행한다는 것을 증명하기 위해서 
--    간단한 예를 살펴보기

INSERT INTO EMP_VIEW30
VALUES(1111, 'AAAA', 30);

-- 2. INSERT 문으로 뷰에 새로운 행을 추가하였음. 
--    뷰의 내용을 출력해 보면 추가된 행이 뷰에 존재하고 있음을 확인할 수 있음

SELECT *
FROM EMP_VIEW30;

-- 3. 뷰 뿐만 아니라 기본 테이블의 내용을 출력해 보면 
--    INSERT 문에 의해서 뷰에 추가한 행이 테이블에도 존재함을 확인할 수 있음

SELECT * FROM EMP_COPY;

/*
INSERT 문에 뷰(EMP_VIEW30)를 사용하였지만,
뷰는 쿼리문에 대한 이름일 뿐이기 때문에 
새로운 행은 기본 테이블(EMP_COPY)에 실질적으로 추가되는 것임을 알 수 있음.

뷰(EMP_VIEW30)의 내용을 확인하기 위해
SELECT문을 수행하면 변경된 기본 테이블(EMP_COPY)의 내용에서 일부를 
서브 쿼리한 결과를 보여줌.

뷰는 실질적인 데이터를 저장한 기본 테이블을 볼 수 있도록 한 투명한 창,
기본 테이블의 모양이 바뀐 것이고 그 바뀐 내용을 뷰라는 창을 통해서 볼 뿐.

뷰에 INSERT 뿐만 아니라 UPDATE, DELETE 모두 사용할 수 있는데,
UPDATE, DELETE 쿼리문 역시 뷰의 텍스트에 저장되어 있는 기본 테이블이 변경하는 것.

뷰가 물리적인 테이블을 근거로 한 
논리적인 가상 테이블이란 말의 의미를 이해할 수 있어야 한다.

=================== 뷰를 사용하는 이유 =======================

    뷰를 사용하는 두 가지 이유

1. 복잡하고 긴 쿼리문을 뷰로 정의하면 접근을 단순화시킬 수 있음. 
2. 보안에 유리함.

1. 번의 경우는 이미 위에서 살펴본 내용 
2. 번의 경우만 이해해 보기. 

사용자마다 특정 객체만 조회할 수 있도록 권한을 부여를 할 수 있기에 
동일한 테이블을 접근하는 사용자마다에 따라 서로 다르게 보도록 
여러 개의 뷰를 정의해 놓고 특정 사용자만이 해당 뷰에 접근할 수 있도록 하기.

예를 들어 사원 테이블에
개인 적인 정보인 급여와 커미션은 부서에 따라 접근을 제한해야 함.

급여나 커미션 모두에 대해서 인사과에서는 조회할 수 없도록 하고,

경리과에서는 이 모두가 조회될 수 있도록 하지만,

영업부서에서는 
경쟁심을 유발하기 위해서 다른 사원의 커미션을 조회할 수 있도록 해야 함

============================ 뷰의 종류 =========================

뷰는 뷰를 정의하기 위해서 사용되는 기본 테이블의 수에 따라 
단순 뷰(Simple View)와 복합 뷰(Complex View)로 나뉨

단순 뷰                            복합 뷰

하나의 테이블로 생성                 여러 개의 테이블로 생성
그룹 함수의 사용이 불가능            그룹 함수의 사용이 가능
DISTINCT 사용이 불가능              DISTINCT 사용이 가능
DML 사용 가능                       DML 사용 불가능

*/

-- =================== 단순 뷰에 대한 데이터 조작 ===================

-- 단순 뷰에 대해서 DML 
-- 즉,INSERT/UPDATE/DELETE 문을 사용할 수 있음을 확인해보기

-- 1. EMP_VIEW30 뷰에 데이터를 추가해보기

INSERT INTO EMP_VIEW30
VALUES(8000, 'ANGEL', 30);

SELECT * FROM EMP_VIEW30;

-- 2. 단순 뷰를 대상으로 실행한 DML 명령문의 치리 결과는 
--    뷰를 정의할 때 사용한 기본 테이블에 적용됨

SELECT * FROM EMP_COPY;

-- ================= 단순 뷰의 칼럼에 별칭 부여하기 =======================

-- 기본 테이블(EMP_COPY)의 컬럼 명을 상속받지 않고 한글화 하여 
-- 컬럼 명이 사원번호, 사원명, 급여, 부서번호로 구성되도록 하기

-- 1. EMP_VIEW30 뷰에 데이터를 추가해보기

CREATE OR REPLACE
VIEW EMP_VIEW(사원번호,사원명,급여,부서번호)
AS
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP_COPY;

-- 2. EMP_VIEW는 전체 사원에 대해서 특정 컬럼만 보여주도록 작성하였음.
--    다음과 같이 EMP_VIEW 를 SELECT 하면서 WHERE 절을 추가하여 
--    30번 부서 소속 사원들의 정보만 볼 수 있음

SELECT * FROM EMP_VIEW
WHERE 부서번호 = 30;

-- EMP_VIEW 뷰는 칼럼에 별칭을 주게 되면 
-- 기본 테이블의 칼럼 명을 더 이상 상속받지 못하므로 
-- 30번 부서를 검색하기 위해서는 
-- 뷰를 생성할 때 준 칼럼 별칭(부서번호)을 사용해야 함

-- ==================== 그룹 함수를 사용한 단순 뷰 ====================
/*
그룹 함수 SUM과 AVG를 사용해서 각 부서별 급여 총액과 평균을 구하는 뷰를 작성해 보기.

뷰를 작성하기 위해서 SELECT 절 다음에 SUM이란 그룹 함수를 사용하면 
결과를 뷰의 특정 컬럼처럼 사용하는 것. 

따라서 물리적인 칼럼이 존재하지 않는 가상 칼럼이기에 
칼럼 명도 상속 받을 수 없음. 

뷰를 생성할 때 가상 칼럼을 사용하려면 
사용자가 반드시 이름을 따로 설정해야 한다는 것을 명심해야함!!!
*/

-- 1. 부서별 급여 총액과 평균을 구하기 위한 뷰를 생성하기

CREATE VIEW VIEW_SAL
AS
SELECT DEPTNO, SUM(SAL) AS "SalSum",
AVG(SAL) AS "SalAvg"
FROM EMP_COPY
GROUP BY DEPTNO;

/*
단순 뷰에 대해서 DML 명령어를 사용하여 조작이 가능하다고 하였음

하지만, 다음과 같은 몇 가지의 경우에는 조작이 불가능

1. 뷰 정의에 포함되지 않은 컬럼 중에 
   기본 테이블의 칼럼이 NOT NULL 제약 조건이 지정되어 있는 경우 
   INSERT 문이 사용 불가능. 
   왜냐하면 
   뷰에 대한 INSERT 문은 기본 테이블에 NULL 값을 입력하는 형태가 되기 때문. 

2. SAL*12와 같이 산술 표현식으로 정의된 가상 칼럼이 뷰에 정의되면 
   INSERT나 UPDATE가 불가능.
   
3. DISTINCT을 포함한 경우에도 DML 명령을 사용할 수 없음.

4. 그룹 함수나 GROUP BY 절을 포함한 경우에도 DML 명령을 사용할 수 없음.

=========================== 복합 뷰 ===========================

뷰를 사용하는 이유 중의 하나가 
복잡하고 자주 사용하는 질의를 보다 쉽고 간단하게 사용하기 위해서라고 했음. 

이를 살펴보기 위해서 사원 테이블과 부서 테이블을 자주 조인한다고 하면,
사원 테이블과 부서 테이블을 조인하기 위해서는 
다음과 같이 복잡한 SELECT 문을 매번 작성해야 할 것임.

SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO DESC;

위에 작성한 조인문에 
"CREATE VIEW EMP_VIEW_DEPT AS" 만 추가해서 뷰로 작성해 놓으면 
“SELECT * FROM EMP_VIEW_DEPT; " 와 같이 간단하게 질의 결과를 얻을 수 있음
*/

-- 사원 테이블과 부서 테이블을 조인하기 위해서 복합 뷰를 생성하기

-- 1. 다음은 사번, 이름, 급여, 부서번호, 부서명, 지역명을 출력하기 위한 복합 뷰

CREATE VIEW EMP_VIEW_DEPT
AS
SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO DESC;

-- 2. 뷰를 생성한 후, 이를 활용하면 복잡한 질의를 쉽게 처리할 수 있음

SELECT * FROM EMP_VIEW_DEPT;

-- 각 부서별 최대 급여와 최소 급여를 출력하는 뷰를 SAL_VIEW 란 이름으로 작성해보기

CREATE OR REPLACE VIEW SAL_VIEW
AS
SELECT D.DNAME, MAX(E.SAL) MAX_SAL, MIN(E.SAL) MIN_SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME;

SELECT * FROM SAL_VIEW;

-- 뷰는 실체가 없는 가상 테이블이기 때문에 뷰를 삭제한다는 것은 
-- USER_VIEWS 데이터 딕셔너리에 저장되어 있는 뷰의 정의를 삭제하는 것을 의미.

-- 따라서 뷰를 삭제해도 
-- 뷰를 정의한 기본 테이블의 구조나 데이터에는 전혀 영향을 주지 않음

-- ==================== 뷰 삭제하기 ====================================

DROP VIEW VIEW_SAL;

/*
====================== 뷰 생성에 사용되는 다양한 옵션 =====================

뷰 정의하는 방법을 살펴보면서 
뷰를 생성하기 위한 사용되는 옵션에 대해서 대략적으로 설명 했음

CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name
[(alias, alias, alias, ...)]
AS subquery
[WITH CHECK OPTION]
[WITH READ ONLY];

옵션에 대해서 예를 들어가면서 보다 자세히 살펴보기

======================= 뷰 수정을 위한 OR REPLACE 옵션 =====================

CREATE OR REPLACE VIEW 를 사용하면 
존재하지 않은 뷰이면 새로운 뷰를 생성하고, 
기존에 존재하는 뷰이면 그 내용을 변경함

이전에 작성한 EMP_VIEW30 뷰는 
“EMPNO, ENAME, SAL, DEPTNO” 4 개의 컬럼을 출력하는 형태였는데
커미션 칼럼을 추가로 출력할 수 있도록 하기 위해서 뷰의 구조를 변경해보기

*/
SELECT * FROM EMP_VIEW30;

CREATE OR REPLACE VIEW EMP_VIEW30
AS 
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO 
FROM EMP_COPY
WHERE DEPTNO=30;

-- 작성한 뷰에 다음과 같은 결과를 얻을 수 있도록 컬럼 별칭을 추가하여 뷰를 변경해보기
-- (힌트: OR REPLACE 옵션 사용)

SELECT * FROM EMP_VIEW20;

CREATE OR REPLACE VIEW EMP_VIEW20
AS
SELECT EMPNO EMP_NO, ENAME EMP_NAME, DEPTNO DEPT_NO, MGR MANAGER
FROM EMP_COPY
WHERE DEPTNO = 20;

/*
================ 기본 테이블 없이 뷰를 생성하기 위한 FORCE 옵션 =============

뷰를 생성하는 경우에 일반적으로 기본 테이블이 존재한다는 가정 하에서 쿼리문을 작성.

극히 드물기는 하지만, 
기본 테이블이 존재하지 않는 경우에도 뷰를 생성해야 할 경우가 있음.
이럴 경우에 사용하는 것이 FORCE 옵션!! 

FORCE 옵션과 반대로 동작하는 것으로서 NOFORCE 옵션이 있음.

NOFORCE 옵션은 반드시 기본 테이블이 존재해야 할 경우에만 뷰가 생성됨.

지금까지 뷰를 생성하면서 FORCE/NOFORCE 옵션을 지정하지 않았음. 
이렇게 특별한 설정이 없으면 디폴트로 NOFORCE 옵션이 지정된 것이므로 간주됨. 
*/

-- FORCE 옵션으로 기본 테이블 없이 뷰 생성하기

-- FORCE/NOFORCE 옵션이 어떤 역할을 하는지 살펴보기

-- 1. 존재하지 않는 테이블인 EMPLOYEES를 사용하여 뷰를 생성

CREATE OR REPLACE VIEW EMPLOYEES_VIEW
AS
SELECT EMPNO, ENAME, DEPTNO
FROM EMPLOYEES
WHERE DEPTNO = 30;

-- 존재하지 않는 EMPLOYEES를 
-- 기본 테이블로 하여 뷰를 생성하게 되면 다음과 같이 오류가 발생

-- 특별한 설정이 없으면 NOFORCE 옵션이 지정된 것이므로 
-- 반드시 존재하는 기본 테이블을 이용한 쿼리문으로 뷰를 생성해야 한다!!

-- 2. 기본 테이블이 존재하기 않는 경우에도 뷰를 생성하기 위해서 FORCE 옵션 적용해보기

CREATE OR REPLACE FORCE VIEW NOTABLE_VIEW
AS
SELECT EMPNO, ENAME, DEPTNO
FROM EMPLOYEES
WHERE DEPTNO = 30;

-- 존재하지 않는 테이블을 기본 테이블로 지정했다는 경고 메시지는 출력되지만, 
-- USER_VIEWS의 내용을 살펴보면 뷰가 생성된 것을 확인할 수 있음

-- 3. FORCE의 반대 기능을 가진 옵션인 NOFORCE 옵견도 적용해보기

CREATE OR REPLACE NOFORCE EXISTTABLE_VIEW
AS
SELECT EMPNO, ENAME, DEPTNO
FROM EMPLOYEES
WHERE DEPTNO = 30;

-- NOFORCE 옵션을 사용하면 뷰를 생성할 때 
-- 존재하지 않는 테이블을 기본 테이블로 지정하면 오류 메시지와 함께 뷰가 생성되지 않음

/*
============ 조건 컬럼 값 변경 못하게 하는 WITH CHECK OPTION ===============

뷰를 정의하는 서브 쿼리문에 WHERE 절을 추가하여 
기본 테이블 중 특정 조건에 만족하는 로우(행)만으로 구성된 뷰를 생성할 수 있음.

*/

-- 다음은 30 번 부서 소속 사원들의 정보만으로 구성된 뷰

CREATE OR REPLACE VIEW EMP_VIEW30
AS
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP_COPY
WHERE DEPTNO = 30;

SELECT * FROM EMP_VIEW30;

-- 뷰는 마치 테이블처럼 SELECT문으로 조회할 수 있음은 물론이고 
-- DML 문으로 내용을 조작할 수 있음을 이미 학습했으므로 
-- UPDATE 문으로 30번 부서에 소속된 사원 중에 급여가 1200 이상인 사원은 
-- 20번 부서로 이동시켜 보기

UPDATE EMP_VIEW30 SET DEPTNO=20
WHERE SAL>=1200;

-- EMP_VIEW30 뷰를 여러 사람들이 공유해서 사용하는데 
-- 뷰의 부서번호를 변경하지 않은 사용자가 EMP_VIEW30 뷰를 사용하면 무척 혼돈스러울 것

-- 이러한 결과는 뷰를 공유해서 사용할 경우 혼돈을 초래할 수 있으므로 방지해야 함

-- 다행히 오라클에서는 WITH CHECK OPTION 으로 이러한 혼돈을 막을 수 있도록 함

-- WITH CHECK OPTION을 기술하면 뷰를 정의할 때 
-- 조건에 사용되어진 칼럼 값을 뷰를 통해서는 변경하지 못하도록 하여 
-- 혼동을 초래할 만한 일이 생기지 않게 함

-- 1. WITH CHECK OPTION 옵션으로 뷰 생성

CREATE OR REPLACE VIEW VIEW_CHK30
AS
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30 WITH CHECK OPTION;

DROP VIEW VIEW_CHK30;

-- 2. 급여가 5000이상인 사원은 20번 부서로 이동시켜보기

UPDATE VIEW_CHK30 
SET DEPTNO = 20
WHERE SAL >= 1200;

-- WITH CHECK OPTION 때문에 바꿀수 없음.

SELECT * FROM VIEW_CHK30;

-- =========== 뷰를 통해 기본 테이블 변경 막는 WITH READ ONLY 옵션 ===============

-- WITH READ ONLY 옵션은 뷰를 통해서 
-- 기본 테이블의 어떤 컬럼에 대해서도 내용을 절대 변경할 수 없도록 하는 것

-- =============== WITH CHECK OPTION과 WITH READ ONLY 비교하기 =================

-- 1. WITH CHECK OPTION을 기술한 VIEW_CHK30 뷰의 커미션을 
--    모두 1000으로 변경해보도록 하기.

UPDATE VIEW_CHK30 SET COMM = 1000;

-- WITH CHECK OPTION은 뷰를 설정할 때 조건으로 설정한 컬럼이 아닌 컬럼에 대해서는 
-- 변경 가능하므로 커미션이 성공적으로 변경됨

-- 2. WITH READ ONLY 옵션을 지정한 뷰를 정의하기

CREATE OR REPLACE VIEW VIEW_READ30
AS
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30 WITH READ ONLY;

SELECT * FROM VIEW_READ30;

-- 3. WITH READ ONLY 옵션을 기술한 VIEW_READ30 뷰의 커미션을 모두 2000으로 변경

UPDATE VIEW_READ30 SET COMM = 2000;

-- WITH READ ONLY은 뷰를 설정할 때 조건으로 
-- 설정한 컬럼이 아닌 컬럼에 대해서도 변경 불가능하므로 
-- 켜미션 컬럼 값 역시 변경에 실패. 
-- 뷰를 통해서 기본 테이블을 절대 변경할 수 없게 됩니다

/*
===================== 인라인 뷰 ===========================

사원 중에서 입사일이 빠른 사람 5명(TOP-5)만을 얻어 오는 질의문을 작성해보기. 

TOP-N을 구하기 위해서는 ROWNUM과 인라인 뷰가 사용됨. 

인라인 뷰는 조금 후에 다루어 보도록 하고, 
우선 ROWNUM 칼럼에 대해서 살펴보도록 하기.

ROWNUM 칼럼

- 오라클에서 지원하는 가상컬럼으로 쿼리의 결과에 1부터 하나씩 증가하여 붙는 컬럼
- row의 주소 순대로 출력되어지는 순서대로 부여된다.
- 주로 여러개의 결과를 출력하는 쿼리문을 실행 후 결과의 개수를 제한하여 가져오는데 쓰임

ROWID

- 주소로서 row가 실제로 저장되어있는 공간(tree형 구조) 테이블 내의 고유주소
SELECT rowid, rownum, empno FROM emp;

*/

-- =================== ROWNUM 컬럼 성격 파악하기 ========================

-- 1. 다음은 ROWNUM 칼럼 값을 출력하기 위한 쿼리문

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM EMP;

-- 2. 입사일이 빠른 사람 5명만(TOP-N)을 얻어오기 위해서는 
--    일련의 출력 데이터를 일단 임의의 순서로 정렬한 후
--    그 중 일부의 데이터만 출력할 수 있도록 해야 하므로 
--    ORDER BY 절을 사용하여 입사일을 기준으로 오름차순 정렬해보기

SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;

-- 3. 이번에는 입사일을 기준으로 오름차순 정렬을 하는 쿼리문에 ROWNUM 칼럼을 출력해보기

SELECT ROWNUM ,EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;

-- 위 결과를 보면 입사일을 기준으로 오름차순 정렬을 하였기에 
-- 출력되는 행의 순서는 바뀌더라도 
-- 해당 행의 ROWNUM 칼럼 값은 바뀌지 않는다는 것을 알 수 있음. 

-- ROWNUM 칼럼은 오라클의 내부적으로 부여되는데 
-- INSERT 문을 이용하여 입력하면 
-- 입력한 순서에 따라 1씩 증가되면서 값이 지정되어 바뀌지 않음. 

-- 정렬된 순서대로 ROWNUM 칼럼 값이 매겨지도록 하려면 
-- 새로운 테이블이나 뷰로 새롭게 데이터를 저장해야만 함. 

-- ================ 뷰와 ROWNUM 칼럼으로 TON-N 구하기 ================

-- ROWNUM 칼럼의 성격은 파악했으므로 이제 뷰와 함께 사용하여 TOP-N을 구해보기
-- TOP-N은 일련의 출력 데이터를 일단 임의의 순서로 정렬한 후에 
-- 그 중 일부의 데이터만 출력할 수 있도록 하여 구함

-- 1. 입사일을 기준으로 오름차순 정렬한 쿼리문으로 새로운 뷰를 생성해보기

CREATE OR REPLACE VIEW VIEW_HIRE
AS
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;

--  2. 입사일을 기준으로 오름차순 정렬을 하는 뷰에 ROWNUM 칼럼을 함께 출력해보기.

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM VIEW_HIRE;

--  3. 입사일이 빠른 사람 5명만을 얻어와 봅시다.

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM VIEW_HIRE
WHERE ROWNUM <= 5;

/*
======================== 인라인 뷰로 TOP-N 구하기 ====================

인라인 뷰는 SQL 문장에서 사용하는 서브 쿼리의 일종으로 
보통 FROM 절에 위치해서 테이블처럼 사용하는 것

Main Query(바깥쪽 쿼리문)
SELECT...
FROM...         (SELECT ...
                 ...) ALIAS
                 Sub Query(안쪽 쿼리문) 
                 = 인라인 뷰
                 
인라인 뷰란?

메인 쿼리의 SELECT 문의 FROM 절 내부에 사용된 서브 쿼리문을 말함. 

우리가 지금까지 생성한 뷰는 
CREATE 명령어로 뷰를 생성했지만, 
인라인 뷰는 SQL 문 내부에 뷰를 정의하고 이를 테이블처럼 사용함.

*/

-- 인라인 뷰를 사용해서 입사일이 빠른 사람 5명만을 얻어오기
-- 아래 문장을 보면 FROM 절 다음인 VIEW_HIRE 위치에 
-- VIEW_HIRE를 정의할 때 사용한 서브 쿼리문을 기술한 것뿐

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM ( SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE)
WHERE ROWNUM <= 5;

-- 인라인 뷰를 사용하여 급여를 많이 받는 
-- 순서대로 3명만 출력하는 뷰(SAL_TOP3_VIEW)를 작성해보기

CREATE OR REPLACE VIEW SAL_TOP3_VIEW
AS
SELECT ROWNUM AS "RANGKING", EMPNO, ENAME, SAL
FROM ( SELECT EMPNO, ENAME, SAL
FROM EMP
ORDER BY SAL DESC)
WHERE ROWNUM < 4;

SELECT * FROM SAL_TOP3_VIEW;

CREATE OR REPLACE VIEW V_EM_DNO
AS
SELECT EMPNO, ENAME, DEPTNO, SAL
FROM EMP
WHERE DEPTNO = 20;

SELECT * FROM V_EM_DNO;

DROP VIEW V_EM_DNO;

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

/*
================== 조회를 빠르게 하는 인덱스 ====================

인덱스를 왜 사용하는 것일까? 

이에 대한 답은 “빠른 검색을 위해서 인덱스를 사용.”

테이블 생성 방법을 책에서 찾으려고 할 때 어떻게 할까? 

책 첫 페이지부터 한 장씩 넘겨가면서 테이블 생성 방법이 
기술되어 있는지 일일이 살펴보는 사람은 드물 것. 

일반적으로 책 맨 뒤에 있는 색인(인덱스, 찾아보기)에서 
해당 단어(테이블)를 찾아 그 페이지로 이동. 

이렇게 원하는 단어를 쉽게 찾는 방법으로 색인, 인덱스가 사용되는 것처럼 
오라클의 인덱스 역시 원하는 데이터를 빨리 찾기 위해서 사용. 

*********   중요 문구  ********************************************************
인덱스란 SQL 명령문의 처리 속도를 향상시키기 위해서 컬럼에 대해서 생성하는 오라클 객체.
*******************************************************************************

하지만 인덱스는 장점만 있는 것이 아님. 

오라클에서의 인덱스의 내부 구조는 B* 트리 형식으로 구성되어 있음. 

트리란 나무의 뿌리 모양을 생각해 보시면 쉽게 이해할 수 있음. 

뿌리(루트)를 근거로 아래로 나무뿌리 들이 뻗어 있는 모양을 하고 있음. 

컬럼에 인덱스를 설정하면 이를 위한 B* 트리도 생성되어야 하기 때문에 
인덱스를 생성하기 위한 시간도 필요하고 인덱스를 위한 추가적인 공간이 필요하게 됨. 

인덱스가 생성된 후에 새로운 행을 추가하거나 삭제할 경우 
인덱스로 사용된 컬럼 값도 함께 변경되는 경우가 발생.

인덱스로 사용된 컬럼 값이 변경되는 
이를 위한 내부 구조(B* 트리) 역시 함께 수정되어야 함. 

이 작업은 오라클 서버에 의해 자동으로 일어나는데 
그렇기 때문에 인덱스가 없는 경우 보다 인덱스가 있는 경우에 
DML 작업이 훨씬 무거워지게 됨. 

======================= 인덱스의 장점 ===========================

검색 속도가 빨라진다. 

시스템에 걸리는 부하를 줄여서 시스템 전체 성능을 향상시킨다.

======================== 인덱스의 단점 ===========================

인덱스를 위한 추가적인 공간이 필요하다.

인덱스를 생성하는데 시간이 걸린다.

데이터의 변경 작업(INSERT/UPDATE/DELETE)이 자주 일어날 경우에는 
오히려 성능이 저하된다.

========================= 인덱스 정보 조회 ==========================

책의 색인란과 같이 동일한 역할인 쿼리를 빠르게 수행하기 위한 용도로 사용되는 인덱스는 
기본 키나 유일 키와 같은 제약 조건을 지정하면 따로 생성하지 않더라도 자동으로 생성해줌

기본 키나 유일 키는 데이터 무결성을 확인하기 위해하기 위해서 
수시로 데이터를 검색하기 때문에 
빠른 조회를 목적으로 오라클에서 내부적으로 해당 컬럼에 인덱스를 자동으로 생성하는 것임.

======================= 인덱스 관련 데이터 딕셔너리 =====================
*/

-- USER_IND_COLUMNS 데이터 딕셔너리 뷰로 인덱스의 생성 유무를 확인해보기

SELECT INDEX_NAME, TABLE_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN('EMP','DEPT');

/*
위 쿼리문의 결과 화면을 통해서 사용자가 인덱스를 생성하지 않았어도 
오라클에서 기본 키나 유일 키에 대해서 자동으로 인덱스를 생성한다는 것을 확인할 수 있음. 

인덱스 역시 테이블이나 뷰나 시퀀스와 같이 오라클 객체의 일종이고 
모든 객체들은 이름이 있어야 함. 

기본 키나 유일 키에 대한 인덱스는 오라클이 생성한 것이기에 
인덱스의 이름 역시 오라클에서 자동 부여해 줌. 

자동으로 생성되는 인덱스 이름은 제약 조건(CONSTRAINT)명을 사용함을 확인할 수 있음. 

======================== 조회 속도 비교하기 =========================

인덱스가 조회 속도를 빠르게 해 준다는 것을 증명하기 위해서 
기본 키나 유일 키로 지정하지 않는 컬럼인 사원 이름으로 검색해 보기.

아마도 시간이 어느 정도 소요될 것임...

검색을 위해서 WHERE 절에 사용되는 컬럼인 사원 이름 컬럼을 인덱스로 생성한 후에 
다시 한번 사원 이름으로 검색해보면 검색시간이 현저하게 줄어드는 것을 확인할 수 있음.

========================= 사원 테이블 복사하기 ========================
*/

-- 인덱스로 인해 검색시간이 현저하게 줄어드는 것을 증명하기 위한 실습을 위해 
-- 사원 테이블을 복사해서 새로운 테이블을 생성해보기

-- 1. 사원(emp) 테이블을 복사해서 새로운 테이블을 생성.

CREATE TABLE EMP01
AS
SELECT * FROM EMP;

-- 2. EMP와 EMP01 테이블에 인덱스가 설정되어 있는지 확인

SELECT TABLE_NAME, INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN('EMP','EMP01');

-- 결과 화면의 USER_IND_COLUMNS 를 살펴보면 EMP 테이블은 EMPNO 칼럼에 
-- 인덱스가 존재하지만 EMP를 서브 쿼리로 복사한 EMP01 테이블에 대해서는 
-- 어떠한 인덱스도 존재하지 않음을 확인할 수 있음.
-- 서브 쿼리문으로 복사한 테이블은 구조와 내용만 복사될 뿐 제약 조건은 복사되지 않기 때문

-- EMP01 테이블은 인덱스 설정이 되어 있지 않기때문에 검색하는데 시간이 걸림.
-- 이를 증명하기 위해서 EMP01 테이블에 수많은 데이터가 저장되어 있어야 함.
-- 서브 쿼리문으로 INSERT 문을 여러 번 반복해서 EMP01 테이블의 데이터를 늘린 후에 
-- 사원이름으로 특정 사원을 찾아보도록 하기.
-- 속도의 차이가 현저하게 난다는 것을 느낄 수 있음.

-- 1. 서브 쿼리문으로 INSERT 문을 여러 번 반복

INSERT INTO EMP01 SELECT * FROM EMP01;

-- 테이블 복사를 여러 번 반복해서 많은 양의 행을 생성

-- 2. 이제 검색용으로 사용할 행을 새롭게 하나 추가하기.

INSERT INTO EMP01
(EMPNO, ENAME)
VALUES(1111, 'SYJ');

-- 3. 시간을 체크하기 위해 SET TIMING ON 입력

SET TIMING ON

-- 4. 사원 이름이 'SYJ'인 행을 검색

SELECT DISTINCT EMPNO, ENAME
FROM EMP01
WHERE ENAME = 'SYJ';

-- 컴퓨터의 성능에 따라 검색하는데 소요되는 시간이 다르겠지만, 
-- 어느 정도의 시간은 소요됨을 확인할 수 있음

--======================== 인덱스 생성하기 =============================

-- 제약 조건에 의해 자동으로 생성되는 인덱스 외에 
-- CREATE INDEX 명령어로 직접 인덱스를 생성할 수도 있음

-- 다음은 인덱스를 생성하기 위한 기본 형식

CREATE INDEX index_name
ON table_name (column_name);

-- CREATE INDEX 다음에 인덱스 객체 이름을 지정. 
-- 어떤 테이블의 어떤 컬럼에 인덱스를 설정할 것인지를 결정하기위해서 
-- ON 절 다음에 테이블 이름과 컬럼 이름을 기술

-- ========================== 인덱스 설정하기 ===========================

-- 인덱스가 지정하지 않은 컬럼인 ENAME 으로 조회하여 
-- 어느 정도의 시간은 소요됨을 확인하였으므로 
-- 이번에는 ENAME 컴럼으로 인덱스를 지정하여 조회 시간이 단축됨을 확인

-- 1. 테이블 EMP01의 컬럼 중에서 이름(ENAME)에 대해서 인덱스를 생성해보기

CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);

-- 2. 사원 이름이 ‘SYJ'인 행을 검색해보기. 

SELECT DISTINCT EMPNO, ENAME 
FROM EMP01 
WHERE ENAME='SYJ';

-- 인덱스를 생성한 후에 사원 이름이 ‘SYJ'인 행을 다시 검색하면 
-- 수행속도가 느려진 것을 알 수 있음

-- ========================== 인덱스 제거하기 =============================
 
-- 이번에는 인덱스를 삭제해보기. 
-- 오라클은 DROP INDEX 명령어를 제공함.

-- DROP INDEX index_name;

-- 1. EMP01 테이블의 직급 컬럼을 인덱스로 설정하고 인덱스 이름을 IDX_EMP01_JOB로 주기

SELECT INDEX_NAME, TABLE_NAME , COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN('EMP01');

-- EMP01 테이블의 IDX_EMP01_ENAME만 사용자가 인덱스를 생성한 것. 
-- 이를 제거해 보기. 
-- 생성된 인덱스 객체를 제거하기 위해서는 DROP INDEX 문을 사용

DROP INDEX IDX_EMP01_ENAME;

-- ===================== 인덱스를 사용해야 하는 경우 판단하기 ======================
/*
    인덱스는 검색을 위한 처리 속도만 향상시킨다고 했음.
    하지만, 무조건 인덱스를 사용한다고 검색 속도가 향상 될까?
    
    그것은 아님.
    
    계획없이 너무 많은 인덱스를 지정하면 오히려 성능이 낮아질 수도 있음.
    
    그럼 언제 인덱스를 사용해야 할까?
    
===인덱스를 사용해야 하는 경우===               ===인덱스를 사용하지 말아야 하는 경우===

테이블에 행의 수가 많을 때                         테이블에 행의 수가 적을때

WHERE 문에 해당 컬럼이 많이 사용 될 때             WHERE 문에 해당 컬럼이 자주 사용되지 않을때

검색 결과가 전체 데이터의 2 ~ 4% 정도 일때          검색 결과가 전체 데이터의 10 ~ 15% 이상 일때

JOIN에 자주 사용되는 컬럼이나                      테이블에 DML 작업이 많은 경우
NULL을 포함하는 컬럼이 많은 경우                   입력, 수정, 삭제 등이 자주 일어 날 때


다음과 같은 조건에서 사원 테이블의 부서 번호에 인덱스를 거는 것이 좋을까?

테이블에 전체 행의 수는 10000 건이다.

위의 쿼리문을 전체 쿼리문 들 중에서 95% 사용된다.

쿼리문의 결과로 구해지는 행은 10건 정도이다. 

DEPTNO 컬럼을 인덱스로 사용하기에 알맞다는 결론

CREATE INDEX IDX_EMP01_DEPTNO
ON EMP01(DEPTNO);

================== 인덱스의 물리적인 구조와 인덱스의 재생성 ====================

오라클에서 인덱스의 내부 구조는 B-트리 형식으로 구성되어 있음.

트리란, 나무의 뿌리 모양을 생각해 보면 쉽게 이해 가능.

뿌리(루트)를 근거로 아래로 나무뿌리 들이 뻗어 있는 모양을 하고 있음.

B-트리 형식의 인덱스를 B-트리 인덱스라고 함.

B-트리 인덱스를 보다 정확하게 말하자면 
인덱스 키에 대해 각각의 인덱스 엔트리로 구성되어 있으며 
인덱스 엔트리에 로우 아이디를 저장하고 있음. 

인덱스가 생성된 후에 새로운 행이 추가되거나 삭제될 수도 있고 
인덱스로 사용된 컬럼 값이 변경될 수 있음.

이럴 경우는 본 테이블에서 추가, 삭제, 갱신 작업이 일어날 때 
해당 테이블에 걸린 인덱스의 내용도 함께 수정 되어야 함. 

이 작업은 오라클 서버에 의해 자동으로 일어나는데 
삭제, 갱신 작업이 일어날 경우에 해당 인덱스 엔트리가 바로 인덱스로부터 제거 될까? 

DELETE 문이 실행되면 논리적인 삭제 과정만 일어남. 

DML 작업 특히 DELETE 명령을 수행한 경우에는 
해당 인덱스 엔트리가 논리적으로만 제거 되고 
실제 인덱스 엔트리는 그냥 남아 있게 됨.

인덱스에 제거된 엔트리가 많아질 경우에는 
제거된 인덱스들이 필요 없는 공간을 차지하고 있기 때문에 
종종 인덱스를 재생성시켜야 함.

인덱스를 재생성할 때 사용하는 기본 형식

ALTER INDEX index_name REBUILD;

IDX_EMP01_DEPTNO를 재생성 해보기

ALTER INDEX IDX_EMP01_DEPTNO REBUILD;

=========================== 인덱스의 종류 ==================================

1. 고유 인덱스(Unique Index)
2. 비 고유 인덱스(NonUnique Index)
3. 단일 인덱스(Single Index)
4. 결합 인덱스(Composite Index)
5. 함수 기반 인덱스(Function Based Index)

=========================== 고유 | 비 고유 인덱스 ===========================

비 고유 인덱스를 이해하려면 고유 인덱스와 비교를 해봐야 함.

고유 인덱스(유일 인덱스라고도 부름)는 
기본키나 유일키처럼 유일한 값을 갖는 컬럼에 대해서 생성하는 인덱스

비고유 인덱스는 중복된 데이터를 갖는 컬럼에 대해서 인덱스를 생성하는 경우를 말함

지금까지 사용한 인덱스는 비고유 인덱스임.

고유 인덱스를 설정하려면 UNIQUE 옵션을 추가해서 인덱스를 생성해야함.

CREATE UNIQUE INDEX index_name
ON table_name (column_name);

========================== 비 고유 인덱스 =================================

                    DEPTNO   DNAME        LOC
                        10   인사과        서울
                        20   총무과        대전
                        30   교육팀        대전

부서 테이블에 다음과 같은 데이터가 존재한다면 
DEPTNO 컬럼과 LOC 컬럼에 대해 
고유와 비고유 인덱스 중 어떤 것을 지정할 수 있는지 살펴보기.

LOC 컬럼에는 중복된 지역 명이 저장되어 있으므로 
고유 인덱스로 설정할 수 없고 
비 고유 인덱스만 설정할 수 있음.

DEPTNO 컬럼에는 부서번호가 중복되어 저장되어 있지 않고 
유일한 값만을 갖고 있으므로 
비 고유 인덱스와 고유 인덱스 둘 다 설정할 수 있음.
*/
-- ======================== 고유 인덱스와 비 고유 인덱스 정의하기 ==================

-- 고유 인덱스와 비고유 인덱스를 비교하기 위해서 
-- 중복된 데이터가 없는 컬럼(DEPTNO)과 
-- 중복된 데이터가 있는 컬럼(LOC)으로 구성된 부서 테이블을 만들기

-- 1. 부서 테이블 생성.

DESC DEPT_COPY;

-- 2. 데이터를 입력

INSERT INTO DEPT_COPY VALUES(10, '인사과', '서울');
INSERT INTO DEPT_COPY VALUES(20, '총무과', '대전');
INSERT INTO DEPT_COPY VALUES(30, '교육팀', '대전');

-- 3. 고유 인덱스를 지정하려면 UNIQUE 옵션을 지정해야 함. 
-- 다음은 부서 테이블의 DEPTNO 컬럼을 고유 인덱스로 지정

CREATE UNIQUE INDEX IDX_DEPT_COPY_DEPTNO
ON DEPT_COPY(DEPTNO);

-- DEPTNO 컬럼에는 부서번호가 중복되어 저장되어 있지 않고 
-- 유일한 값만을 갖고 있으므로 비 고유 인덱스는 물론 고유 인덱스도 설정할 수 있음

-- 4. UNIQUE 옵션을 지정했는데 중복된 데이터를 갖는 컬럼을 인덱스로 지정하면 오류가 발생

CREATE UNIQUE INDEX IDX_DEPT_COPY_LOC
ON DEPT_COPY(LOC);

-- 5. 중복된 데이터가 저장된 컬럼을 인덱스로 지정할 경우 비고유 인덱스로 저정해야 함. 
--    비고유 인덱스 는 UNIQUE 옵션을 생략한 채 인덱스를 생성

CREATE INDEX IDX_DEPT_COPY_LOC
ON DEPT_COPY(LOC);

/*
============================= 결합 인덱스  =================================

한 개의 컬럼으로 구성한 인덱스는 단일 인덱스

두 개 이상의 컬럼으로 인덱스를 구성하는 것을 결합 인덱스

============================ 결합 인덱스 정의하기 ============================

부서 번호와 부서명을 결합하여 결합 인덱스를 설정해보기
*/

-- 1. 부서 번호와 부서명을 결합하여 인덱스를 설정할 수 있는데 이를 결합 인덱스라고 함.

CREATE INDEX IDX_DEPT_COPY_COM
ON DEPT_COPY01(DEPTNO, DNAME);

-- 2. 데이터 딕셔너리인 USER_IND_COLUMNS 테이블에서 
--    IDX_DEPT01_COM 인덱스는 
--    DEPTNO와 DNAME 두 개의 컬럼이 결합된 것임을 확인할 수 있음

SELECT INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'DEPT_COPY';

/*
=========================== 함수 기반 인덱스  ===============================

검색조건으로 WHERE SAL = 300이 아니라 
WHERE SAL*12 = 3600와 같이 SELECT 문 WHERE 절에 
산술 표현 또는 함수를 사용하는 경우가 있음

이 경우 만약 SAL 컬럼에 인덱스가 걸려 있다면 
인덱스를 타서 빠르리라 생각 할 수도 있지만 
실상은 SAL 컬럼에 인덱스가 있어도 SAL*12는 인덱스를 타지 못함

왜냐하면?

인덱스 걸린 컬럼이 수식으로 정의 되어 있거나
SUBSTR 등의 함수를 사용해서 변형이 일어난 경우는 
인덱스를 타지 못하기 때문

이러한 수식으로 검색하는 경우가 많다면 
아예 수식이나 함수를 적용하여 인덱스를 만들 수 있음.

SAL*12로 인덱스를 만들어 놓으면 
SAL*12가 검색 조건으로 사용될 때 해당 인덱스를 타게 됨.
*/
--========================== 함수 기반 인덱스 정의하기 ==========================

-- 사원 테이블에서 급여 컬럼에 저장된 데이터로 
-- 연봉을 인덱스로 지정하기 위한 산술 표현을 인덱스로 지정해보기

-- 1. 함수 기반 인덱스 생성하기.

CREATE INDEX IDX_EMP01_ANNSAL
ON EMP01(SAL*12);

-- 2.데이터 딕셔너리인 USER_IND_COLUMNS에 
--   함수 기반 인덱스가 기록되어 있는 것을 확인하기 위한 쿼리문

SELECT INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'EMP01';

/*
==================== 데이터베이스 보안을 위한 권한  ====================

기업에서 보유하고 있는 데이터들은 자료 이상의 가치가 있으므로 
외부에 노출되지 않도록 보안을 해야 함. 

데이터베이스를 운영하려면 데이터베이스에 대한 적절한 보안 대책을 마련해야 함. 

오라클은 다수의 사용자들이 데이터베이스에 저장된 정보를 공유해서 사용. 

하지만 정보의 유출이나 불법적인 접근을 방지하기 위해서 철저한 보안 대책이 필요함. 
이러한 보안 대책을 위해서 데이터베이스 관리자가 있어야 함.

데이터베이스 관리자는 
사용자가 데이터베이스의 객체(테이블, 뷰 등)에 대한 특정 권한을 가질 수 있도록 함으로서 
다수의 사용자가 데이터베이스에 저장된 정보를 공유하면서도 
정보에 대한 보안이 이루어지도록 함. 

데이터베이스에 접근하기 위해서는 
사용자가 이름과 암호를 입력해서 로그인 인증을 받아야 함. 

이렇게 데이터베이스에 접속하는 사용자로부터 어떻게 데이터를 보안할 수 있을까? 

사용자마다 서로 다른 권한과 롤을 부여함으로서 보안을 설정할 수 있음.

========================= 권한의 역할과 종류  =============================

권한은 사용자가 특정 테이블을 접근할 수 있도록 하거나 
해당 테이블에 SQL(SELECT/INSERT/UPDATE/DELETE) 문을 사용할 수 있도록 
제한을 두는 것을 말함.

데이터베이스 보안을 위한 권한

시스템 권한(System Privileges)과 
객체 권한(Object Privileges)으로 나뉨.

시스템 권한은 사용자의 생성과 제거, DB 접근 및 각종 객체를 생성할 수 있는 권한 등 
주로 DBA에 의해 부여되며 그 권한의 수가 80 가지가 넘기에 
대표적인 시스템 권한만 정리하고 넘어가기.

시스템 권한                                  기능

CREATE USER                                 새롭게 사용자를 생성하는 권한

DROP USER                                   사용자를 삭제하는 권한

DROP ANY TABLE                              임의의 테이블을 삭제할 수 있는 권한

QUERY REWRITE                               함수 기반 인덱스를 생성하는 권한

BACKUP ANY TABLE                            임의의 테이블을 백업할 수 있는 권한

데이터베이스를 관리하는 권한으로 다음과 같은 것이 있음.

이러한 권한은 시스템 관리자가 사용자에게 부여하는 권한임.

시스템 권한                                  기능

CREATE SESSION                              데이터베이스에 접속할 수 있는 권한

CREATE TABLE                                사용자 스키마에서 테이블을 생성할 수 있는 권한

CREATE VIEW                                 사용자 스키마에서 뷰를 생성할 수 있는 권한

CREATE SEQUENCE                             사용자 스키마에서 시퀀스를 생성할 수 있는 권한

CREATE PROCEDURE                            사용자 스키마에서 함수를 생성할 수 있는 권한

객체 권한은 객체를 조작할 수 있는 권한.
객체는 테이블, 뷰 등을 예로 들 수 있고, 
시퀀스, 인덱스 등과 앞으로 배울 동의어가 모두 객체에 해당.

============================ 사용자 생성 =============================

회사에 새로운 사원이 입사하게 되면 시스템에 접속하도록 관리자가 계정을 하나 발급해 줌.

지금까지는 SCOTT 사용자로 접속해서 오라클 데이터베이스를 사용했지만, 
사실은 부서별이나 사원의 직무에 따라 사용 가능한 테이블을 고려해서 
오라클 데이터베이스에서도 사용자 계정을 발급해야 함.

권한은 사용자한테 부여하는 것이므로 사용자를 생성하는 것부터 살펴보도록 하기.

다음은 사용자 생성을 위한 CREATE USER 명령어의 형식

CREATE USER user_name
IDENTIFIED BY password;

사용자의 생성은 사용자의 이름과 암호를 지정하여 생성. 

사용자를 생성하기 위해서도 권한이 필요함. 

우리가 지금까지 주로 사용해 왔던 SCOTT이란 사용자는 사용자를 생성할 권한이 없음. 

새로운 사용자 계정을 발급받기 전에 주의할 점이 있음.

(1장에서 언급)
사용자를 생성하기 위해서는 시스템 권한을 가지고 있어야 함. 

오라클 데이터베이스를 설치할 때 자동으로 생성되는 디폴트 사용자 가운데 
시스템 권한을 가진 데이터베이스 관리자인 DBA는 SYS, SYSTEM. 

그러므로 사용자 계정을 발급 받기 위해서 시스템 권한을 가진 SYSTEM으로 접속해야 함. 

CREATE USER 명령어를 사용하여 사용자명은 USER01 암호는 TIGER로 사용자를 생성해보기

1. 오라클 설치할 때 system 사용자의 암호를 manager 로 지정하였기 때문에 
   위와 같이 입력했음.
    
    CONN SYSTEM/MANAGER

2. 사용자명은 USER01 암호는 TIGER로 사용자를 생성. 
   사용자를 생성하기 위해서는 CREATE USER 명령어를 사용. 
   
   CREATE USER USER01 IDENTIFIED BY TIGER;

3. 새롭게 생성된 사용자로 접속
   
    CONN USER01/TIGER

====================== 권한 부여하는 GRANT 명령어 =======================

사용자에게 시스템 권한 부여하기 위해서는 GRANT 명령어를 사용

GRANT privilege_name, …
TO user_name;

만일 user_name 대신 PUBLIC을 기술하면 모든 사용자에게 해당 시스템 권한이 부여됨. 

PUBLIC 이란 DB 내에 있는 모든 계정 즉, 모든 계정을 의미. 

우선 데이터베이스 관리자로 접속. 

새로 생성된 user01에 데이터베이스에 접속할 수 있는 권한인 CREATE SESSION를 부여. 

다시 user01 사용자로 접속을 시도하면 이번에는 데이터베이스에 성공적으로 접속하게 됨.

====================== CREATE SESSION 권한 부여하기 =======================

새로 생성된 user01에 데이터베이스에 접속할 수 있는 권한인 CREATE SESSION를 부여. 
다시 user01 사용자로 접속을 시도하면 이번에는 데이터베이스에 성공적으로 접속하게 됨

1.CREATE SESSION 권한 역시 DBA 만이 부여할 수 있으므로 system 으로 로그인. 

CONN system/manager

2. SYSTEM으로 로그인한 후에 다음과 같이 USER01 사용자에게 CREATE SESSION 권한을 부여

GRANT CREATE SESSION TO USER01;

3.  USER01 사용자에 데이터베이스에 연결할 수 있는 권한인 
    CREATE SESSION이 성공적으로 부여되었기에
    USER01 사용자로 데이터베이스에 접속을 시도하면 성공적으로 접속
    
CONN USER01/TIGER;

============================= WITH ADMIN OPTION 옵션 ==========================

사용자에게 시스템 권한을 WITH ADMIN OPTION과 함께 부여하면 
그 사용자는 데이터베이스 관리자가 아닌데도 불구하고 부여받은 시스템 권한을 
다른 사용자에게 부여할 수 있는 권한도 함께 부여 받게 됨.

데이터베이스 관리자로 로그인해서 사용자 USER02 와 USER03 를 생성.

역시 데이터베이스 관리자에서 USER02 와 USER03 에 데이터베이스에 접속할 수 있는 권한인 
CREATE SESSION 권한을 부여하는데 
USER02 는 WITH ADMIN OPTION을 지정하고 
USER03 은 WITH ADMIN OPTION을 지정하지 않은 채 권한 부여를 할 것. 

USER02 사용자로 로그인하면 CREATE SESSION 권한을 USER01 사용자에게 부여할 수 있음.

이것이 가능해진 것은 USER02에게 WITH GRANT OPTION을 사용하여 
CREATE SESSION 권한을 부여하여 
그 권한을 다른 사용자에게도 부여할 수 있도록 허용하였기 때문.

USER03 사용자는 단순히 CREATE SESSION 권한만을 부여받았으므로 
그 권한을 다른 사용자에게 부여할 수 없음.

======================== WITH ADMIN OPTION을 지정하여 권한 부여 ===================

WITH ADMIN OPTION과 함께 권한을 부여하여 그 권한을 다른 사용자에게 부여할 수 있도록 하기.

1. DBA 권한을 가진 system 사용자로 접속.

2. 사용자명은 USER02 암호는 TIGER로 사용자를 생성해보기.
   사용자를 생성하기 위해서는 CREATE USER 명령어를 사용.

CREATE USER USER02 IDENTIFIED BY TIGER;

3. USER02에게 CREATE SESSION 권한을 WITH ADMIN OPTION을 지정하여 부여

GRANT CREATE SESSION TO USER02
WITH ADMIN OPTION;

USER02 사용자로 접속

CONN USER02/TIGER;

4. USER02 사용자는 자기가 받은 권한을 다른 사용자에게 부여할 수 있음.

GRANT CREATE SESSION TO USER01;

================== WITH ADMIN OPTION을 지정하지 않고 권한 부여 ===============

WITH ADMIN OPTION을 지정하지 않으면 
부여 받은 권한을 다른 사용자에게 부여할 수 없음을 확인해보기

1. 사용자명은 USER03 암호는 TIGER로 사용자를 생성. 
   사용자를 생성하기 위해서는 CREATE USER 명령어를 사용.
   
2. USER03에게 WITH ADMIN OPTION을 지정하지 않고 CREATE SESSION 권한을 부여.

GRANT CREATE SESSION TO USER03; 

3. USER03 사용자로 접속.

CONN USER03/TIGER;

4. USER03 사용자는 자기가 받은 권한을 다른 사용자에게 부여할 수 없음.

GRANT CREATE SESSION TO USER01;

============================ 객체 권한 ================================

객체 권한은 특정 객체에 조작을 할 수 있는 권한. 
객체의 소유자는 객체에 대한 모든 권한을 가짐.

        객체와 권한 설정할 수 있는 명령어를 매핑시켜 놓은 표

권한          TABLE           VIEW            SEQUENCS            PROCEDURE

ALTER           V                               V

DELETE          V               V

EXECUTE                                                            V

INDEX           V               

INSERT          V               V

REFERENCES      V

SELECT          V               V                V

UPDATE          V               V


객체 권한은 테이블이나 뷰나 시퀀스나 함수 등과 같은 
객체별로 DML문(SELECT, INSERT, DELETE)을 사용할 수 있는 권한을 설정하는 것

객체에 권한을 부여하기 위한 형식

GRANT privilege_name [(column_name)] | ALL ①
ON object_name | role_name | PUBLIC ②
TO user_name; ③

GRANT 명령어의 형식은 

어떤 객체(②)에 
어떠한 권한(①)을 
어느 사용자(③)에게 부여하는가를 설정. 

시스템 권한과 차이점이 있다면 ON 옵션이 추가된다는 점. 

ON 다음에 테이블 객체나 뷰 객체 등을 기술함.

======================== 다른 유저의 객체 접근하기 ===========================

객체 권한을 부여해야 하는 필요성을 살펴보기 위해서 
새롭게 생성한 USER01 객체로 EMP 테이블의 내용을 조회해 보기

1. USER01로 접속.

2. EMP 테이블을 조회. 

SELECT * FROM EMP;

ORA-00942: 테이블 또는 뷰가 존재하지 않는다는 오류 발생

특정 객체에 대한 권한은 그 객체를 만든 사용자에게만 기본적으로 주어짐.

우리가 지금까지 사용했던 EMP 테이블은 SCOTT 사용자 소유의 테이블임.

그러므로 다음과 같이 SCOTT 사용자로 로그인해서 
USER01 사용자가 테이블 객체 EMP를 조회할 수 있도록 권한 부여를 해야 함. 

==================== 테이블 객체에 대한 SELECT 권한 부여하기 ====================

특정 객체에 대한 권한은 그 객체를 만든 사용자에게만 기본적으로 주어짐.

우리가 지금까지 사용했던 EMP 테이블은 SCOTT 사용자 소유의 테이블.

그러므로 SCOTT 사용자로 로그인해서 
USER01 사용자가 테이블 객체 EMP를 조회할 수 있도록 권한 부여를 해야 함.

1. SCOTT으로 접속합니다

CONN scott/tiger

2. SCOTT 사용자 소유의 EMP 테이블을 조회(SELECT)할 수 있는 권한을 
   USER01이란 사용자에게 부여.
   
GRANT SELECT ON EMP TO USER01;

3. 권한 부여가 되었다면 다시 USER01로 로그인하여 EMP 테이블에 접속해보기

CONN USER01/TIGER
SHOW USER
SELECT * FROM EMP;

권한 부여가 되었는데도 USER01은 EMP 테이블 객체를 조회할 수 없음.

그 이유는 객체의 소유자인 스키마를 지정하지 않았기 때문. 

스키마에 대해 개념을 학습한 후에 
특정 소유자의 테이블에 접근해보도록 하기 위해서 어떻게 해야 하는지 살펴보도록 하기


============================= 스키마 ================================

스키마(SCHEMA)란?

객체를 소유한 사용자명을 의미. 

객체 명 앞에 소속 사용자명을 기술해서 사용.

SELECT * FROM SCOTT.EMP;

EMP 앞에 SCOTT은 EMP 테이블 객체를 소유한 사용자명임.

지금까지 객체를 기술할 때 다음과 같이 기술해서 사용했음.

SELECT * FROM EMP;

왜냐하면 현재 사용자가 SCOTT일 경우 자신이 소유한 객체를 언급할 때 
객체 명 앞에 스키마를 생략할 수 있기 때문.

하지만 USER01 계정에서 다음과 같이 기술하면 
자기 자신인 USER01 사용자가 소유한 EMP 테이블을 조회하려고 하다가 
USER01 사용자는 EMP 테이블을 소유하지 않았기 때문에 다음과 같은 에러가 발생하는 것.

CONN USER01/TIGER
SHOW USER
SELECT * FROM EMP;

자신이 소유한 객체가 아닌 경우에는 그 객체를 소유한 사용자명을 반드시 기술해야 함.

CONN USER01/TIGER
SHOW USER
SELECT * FROM SCOTT.EMP;

======================= 사용자에게 부여된 권한 조회 =========================

사용자 권한과 관련된 데이터 딕셔너리 중에서
USER_TAB_PRIVS_MADE 데이터 딕셔너리는 
현재 사용자가 다른 사용자에게 부여한 권한 정보를 알려줌.

만일 자신에게 부여된 사용자 권한을 알고 싶을 때에는 
USER_TAB_PRIVS_RECD 데이터 딕셔너리를 조회하면 됨. 
USER01과 SCOTT 사용자가 부여한 권한과 부여된 권한을 살펴보기. 

CONN USER01/TIGER
SELECT * FROM USER_TAB_PRIVS_MADE;      USER1 사용자가 부여한 권한을 살펴봄
SELECT * FROM USER_TAB_PRIVS_RECD;      USER1 사용자가 부여된 권한을 살펴봄

CONN scott/tiger
SELECT * FROM USER_TAB_PRIVS_MADE;      SCOTT 사용자가 부여한 권한을 살펴봄
SELECT * FROM USER_TAB_PRIVS_RECD;      SCOTT 사용자에게 부여된 권한을 살펴봄

====================== 사용자에게서 권한을 뺏기 위한 REVOKE 명령어 ====================

사용자에게 부여한 객체 권한을 데이터베이스 관리자나 
객체 소유자로부터 절회하기 위해서는 REVOKE 명령어를 사용

REVOKE 명령어의 형식

REVOKE {privilege_name | all}
ON object_name
FROM {user_name | role_name | public};

REVOKE 명령어 다음에는 철회하고자하는 객체 권한을 기술하고 
ON 다음에는 어떤 테이블에 부여된 권한인지 해당 테이블명을 기술하고 
FROM 다음에는 어떤 사용자에게 부여한 권한인지 사용자명을 기술함.

============================= 객체 권한 제거하기 ============================

SELECT 권한을 철회해 보기. 

1. SCOTT 계정으로 로그인. 

2. SELECT 권한을 철회하기 전에 SCOTT 계정에 설정된 권한을 살펴보기.

SELECT * FROM USER_TAB_PRIVS_MADE;

3. REVOKE SELECT ON EMP FROM USER01; 명령문은 
   USER01 사용자에게 부여된 EMP 테이블에 대한 SELECT 권한을 철회함.
   
REVOKE SELECT ON EMP FROM USER01;

4. 권한이 철회되고 나면 데이터 딕셔너리에 객체 권한에 대한 정보도 함께 사라짐.

SELECT * FROM USER_TAB_PRIVS_MADE;

5. USER01 사용자에게 부여된 EMP 테이블에 대한 SELECT 권한을 철회하였기에 
   USER01 사용자 계정으로 로그인해서 SCOTT 사용자의 EMP 테이블을 사용할 수 없음
   
CONN USER01/TIGER
SELECT * FROM SCOTT.EMP;
  
========================= WITH GRANT OPTION =============================

사용자에게 객체 권한을 WITH GRANT OPTION과 함께 부여하면 
그 사용자는 그 객체를 접근할 권한을 부여 받으면서 
그 권한을 다른 사용자에게 부여 할 수 있는 권한도 함께 부여받게 됨.

SCOTT 사용자로 로그인해서 사용자 USER02와 USER03에게 
EMP 테이블 객체를 SELECT 할 수 있는 권한을 부여하는데
USER02는 WITH GRANT OPTION을 지정하고 
USER03은 WITH GRANT OPTION을 지정하지 않아서 차이점을 확인해 보기.

USER02는 WITH GRANT OPTION을 지정하였기에 
USER02로 로그인해서 객체권한을 또 다른 사용자에게 부여할 수 있음. 

USER03는 WITH GRANT OPTION을 지정하지 않았기에 
USER03으로 로그인해서 객체 권한을 또 다른 사용자에게 부여할 수 없음.

===============WITH GRANT OPTION을 지정하여 객체 권한 부여하기=================

WITH GRANT OPTION을 지정하였기에 다른 사용자에게 객체권한을 부여할 수 있음

1. SCOTT 사용자로 접속

2. USER02에게 SCOTT.EMP를 SELECT하는 권한을 WITH GRANT OPTION으로 부여하기

GRANT SELECT ON SCOTT.EMP TO USER02
WITH GRANT OPTION;

3. USER02 사용자로 접속

CONN USER02/TIGER;

4. USER02 사용자가 자기가 받은 권한을 다른 사용자에게 부여할 수 있음

GRANT SELECT ON SCOTT.EMP TO USER01;

예제의 마지막 부분을 보면 USER02 사용자로 로그인하여 
SCOTT.EMP 테이블을 SELECT 할 수 있는 권한을 
USER01 사용자에게 부여하고 있음. 

이것이 가능해진 것은 USER02에게 WITH GRANT OPTION을 사용하여 
SCOTT.EMP 테이블 객체를 SELECT 할 수 있는 권한뿐만 아니라 
그 권한을 다른 사용자에게도 부여할 수 있도록 허용하였기 때문.

============ WITH GRANT OPTION을 지정하지 않고 객체 권한 부여하기 ================

WITH GRANT OPTION을 지정하지 않고 
USER03 사용자가 단순히 SCOTT.EMP에 SELECT 할 수 있는 권한만을 부여하면 
그 권한을 다른 사용자에게 부여할 수 없음을 확인해보기

1. SCOTT 사용자로 접속. 

2. 단순히 SCOTT.EMP에 SELECT 할 수 있는 권한만을 부여받음

GRANT SELECT ON SCOTT.EMP TO USER03; 

3. USER03 사용자로 접속.

CONN USER03/TIGER;

4. USER02 사용자가 자기가 받은 권한을 다른 사용자에게 부여할 수 없음

GRANT SELECT ON SCOTT.EMP TO USER01;

/*
======================== 롤이란 ==============================

롤은 사용자에게 보다 효율적으로 권한을 부여할 수 있도록 
여러 개의 권한을 묶어 놓은 것이라고 생각하면 됨. 

사용자를 생성했으면 그 사용자에게 각종 권한을 부여해야만 
생성된 사용자가 데이터베이스를 사용할 수 있음. 

데이터베이스의 
접속 권한(CREATE SESSION), 
테이블 생성 권한(CREATE TABLE),
테이블 수정(UPDATE), 
삭제(DELETE), 
조회(SELECT) 

등과 같은 권한은 사용자에게 기본적으로 필요한 권한들인데
사용자를 생성할 때마다 일일이 이러한 권한을 부여하는 것은 번거로움. 

이 때문에 다수의 사용자에게 공통적으로 필요한 권한들을 
롤에 하나의 그룹으로 묶어두고 사용자에게는 특정 롤에 대한 권한 부여를 함으로서 
간단하게 권한 부여를 할 수 있도록 함.

또한 여러 사용자에게 부여된 권한을 수정하고 싶을 때에도 
일일이 사용자마다 권한을 수정하지 않고 
롤만 수정하면 그 롤에 대한 권한 부여를 한 사용자들의 권한이 자동 수정됨.

이 밖에 롤을 활성화 비활성화 함으로서 일시적으로 권한을 부여했다가
철회할 수 있으므로 사용자 관리를 간편하고 효율적으로 할 수 있음

======================== 롤의 종류 =============================

롤은 오라클 데이터베이스를 설치하면 
기본적으로 제공되는 사전 정의된 롤과 사용자가 정의한 롤로 구분됨

사용자가 직접 롤을 정의하는 방법은 복잡하므로 사전에 정의된 롤부터 살펴보기

========================= 사전 정의된 롤의 종류 ========================

다음과 사전 정의된 시스템에서 제공해주는 롤.

CONNECT 롤

사용자가 데이터베이스에 접속 가능하도록 하기 위해서 
다음과 같이 가장 기본적인 시스템 권한 8가지를 묶어 놓았음.

ALTER SESSION, CREATE CLUSTER, CREATE DATABASE LINK,
CREATE SEQUENCE, CREATE SESSION, CREATE SYNONYM, 
CREATE TABLE, CREATE VIEW

CREATE CLUSTER 와 CREATE SEQUENCE 는 둘 CONNECT롤과 RESCOUCE롤에 포함

RESOURCE 롤

사용자가 객체(테이블, 뷰, 인덱스)를 생성할 수 있도록 하기 위해서 
시스템 권한을 묶어 놓았음. 

CREATE CLUSTER, CREATE PROCEDURE, CREATE SEQUENCE, 
CREATE TABLE, CREATE TRIGGER

DBA 롤

사용자들이 소유한 데이터베이스객체를 관리하고 
사용자들을 작성하고 변경하고 제거할 수 있도록 하는 모든 권한을 가짐.
즉, 시스템 자원을 무제한적으로 사용하며 
시스템 관리에 필요한 모든 권한을 부여할 수 있는 강력한 권한을 보유한 롤. 

======================== 롤 부여하기  ===========================

일반적으로 데이터베이스 관리자는 새로운 사용자를 생성할 때 
CONNECT 롤과 RESOURCE 롤을 부여함.

USER04 사용자를 생성하여 CONNECT 롤과 RESOURCE 롤을 부여함

1. 데이터베이스 관리자로 접속

CONN system/12341234

2. 새롭게 사용자를 생성

CREATE USER USER04 IDENTIFIED BY TIGER;

3. 생성된 생성자로 로그인을 시도

CONN USER04/TIGER

새롭게 생성된 사용자에는 데이터베이스의 접속 권한인 
CREATE SESSION 권한이 부여 되지 않았으므로 로그인에 실패

4. 새로운 사용자에게 권한 부여를 하기 위해서는 다시 데이터베이스 관리자로 접속해야 함

CONN system/12341234

5. 데이터베이스 관리자로 접속했으면 이제 CONNECT롤과 RESOURCE롤을 부여

GRANT CONNECT, RESOURCE TO USER04;

6. 권한이 부여가 되었으면 다시 USER04 사용자로 로그인 시도

CONN USER04/TIGER

CONNECT롤에 데이터베이스의 접속 권한에 CREATE SESSION 권한이 포함되어 있으므로 

로그인에 성공

======================== 롤 관련 데이터 딕셔너리 =============================

다음은 사용자에게 부여된 롤을 확인해 보기.

롤을 확인하기 위한 데이터 딕셔너리는 무수히 많음

SELECT * FROM DICT WHERE TABLE_NAME LIKE '%ROLE%';

조회 결과로 얻어진 데이터 딕셔너리를 통해서 부여된 권한에 대한 정보를 확인할 수 있음


                    롤 관련 데이터 딕셔너리를 정리한 표
                    
 딕셔너리 명                         설명
 
ORLE_SYS_PRIVS                      롤에 부여된 시스템 권한 정보

ROLE_TAB_PRIVS                      롤에 부여된 테이블 관련 권한 정보

USER_ROLE_PRIVS                     접근 가능한 롤 정보

USER_TAB_PRIVS_MADE                 해당 사용자 소유의 오브젝트에 대한 오브젝트 권한 정보

USER_TAB_PRIVS_RECD                 사용자에게 부여된 오브젝트 권한 정보

USER_COL_PRIVS_MADE                 사용자 소유의 오브젝트 중 칼럼에 부여된 오브젝트 권한 정보

USER_COL_PRIVS_REDC                 사용자에게 부여된 특정 칼럼에 대한 오브젝트 권한 정보


======================== 롤을 확인하기  ==========================

롤 관련 데이터 딕셔너리 중에서
현재 사용자에게 부여된 롤을 확인하기 위한 데이터 딕셔너리는 USER_ROLE_PRIVS
USER04로 로그인 하였으므로 다음과 같이 입력하면 
사용자 USER04에 부여된 롤에 대한 정보를 확인할 수 있음

CONN USER04/TIGER
SELECT * FROM USER_ROLE_PRIVS;

========================= 사용자 롤 정의 ===========================

CONNECT, RESOURCE 롤과 같은 기본적으로 제공되는 사전 정의된 롤을 
사용자에게 부여해 보았음. 

이번에는 사용자가 정의해서 사용하는 롤에 대해 살펴볼 것.
사용자는 CREATE ROLE 명령어로 다음 형식에 따라 롤을 생성해야 함.

CREATE ROLE role_name;
GRANT privilege_name TO role_name;

새로 생성된 USER04로 로그인해서 SCOTT 사용자의 EMP 테이블에 접근해 보도록 하기

CONN USER04/TIGER;
SELECT * FROM SCOTT.EMP;

사용자 USER04는 SCOTT 사용자 소속인 EMP 테이블 객체를 조회할 수 없음.
USER04는 SCOTT 사용자 소속인 EMP 테이블 객체를 조회할 수 있도록 
권한을 부여 해야만 함.

이번에는 사용자 USER04에 객체 권한을 직접 부여하지 않고 롤을 이용해 보도록하기

다음과 같은 순서로 작업을 진행할 것

1) 롤을 생성한다. (데이터베이스 관리자)

2) 롤에 권한을 부여한다. (데이터베이스 관리자 혹은 특정 사용자)

3) 사용자에 롤을 부여한다. (데이터베이스 관리자)

① 롤을 생성하기 위한 DBA에서 이루어짐. 

CREATE ROLE ROLE_NAME; 

②롤에 부여할 퀀한의 종류에 따라서 DBA에서 부여할 수도 있고, 
객체를 소유한 사용자로 접속한 후 부여해야 함.

다음과 같이 시스템 권한 일 경우에는 DBA에서 이루어짐. 

GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO ROLE_NAME;

다음과 같이 객체 권한일 경우에는 특졍 객체로 접근해서 부여해야 함. 

GRANT OBJECT_PRIV TO ROLE_NAME;

③ 사용자에 롤을 부여하는 작업 역시 DBA에서 이루어짐.

GRANT ROLE_NAME TO USER_NAME;

====================== 롤 생성하여 시스템 권한 할당하기 ======================

1. 롤을 생성할 수 있는 사용자는 반드시 DBA 권한이 있는 사용자여야만 하기에 
   롤을 생성하기 앞서서 반드시 DBA 권한을 가진 사용자로 접속해야만 함
   
CONN system/manager
CREATE ROLE MROLE;

2. 생성된 롤에게 권한을 부여

GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO MROLE;

3. 사용자를 생성하여 롤을 부여

CREATE USER USER05 IDENTIFIED BY TIGER;
GRANT MROLE TO USER05;

===================== 롤 생성하여 객체 권한 할당하기 =======================

롤을 생성하여 할당하는 객체 권한을 할당해보기

1. 롤을 생성할 수 있는 사용자는 반드시 DBA 권한이 있는 사용자여야만 하기에 
   롤을 생성하기 앞서서 반드시 DBA 권한을 가진 사용자로 접속해야만 함.
   CREATE ROLE 명령문을 사용하여 MROLE02 를 생성.

CONN system/manager
CREATE ROLE MROLE02;

2. 생성한 롤에 권한 부여를 하기 위해서 
   EMP 테이블 객체를 소유하고 있는 SCOTT 사용자로 로그인. 
   MRLOE02 에게 EMP 테이블 객체를 조회할 수 있도록 SELECT 권한을 주기.

CONN scott/tiger
GRANT SELECT ON EMP TO MROLE02;

3. MRLOE02 에 EMP 테이블 객체를 조회할 수 있도록 SELECT 권한을 주었음. 
   생성된 롤을 사용자에게 부여하기 위해서 
   다시 데이터베이스 관리자로 로그인하여 사용자 USER05 에게 롤에 대한 권한 부여하기

CONN system/manager
GRANT MROLE02 TO USER05;

4. 사용자 USER05 에게 롤에 대한 권한 부여를 마쳤으면 
   사용자 USER05 로 로그인하여 롤에 대한 권한이 부여되었는지 확인하기
   
CONN USER05/TIGER
SELECT * FROM USER_ROLE_PRIVS;

================ WITH ADMIN OPTION을 지정하지 않고 권한 부여 ===================

WITH ADMIN OPTION을 지정하지 않으면 
부여 받은 권한을 다른 사용자에게 부여할 수 없음을 확인해보기

1. 사용자명은 USER03 암호는 TIGER로 사용자를 생성해보기. 
   사용자를 생성하기 위해서는 CREATE USER 명령어를 사용. 
   
2. USER03에게 WITH ADMIN OPTION을 지정하지 않고 CREATE SESSION 권한을 부여.

GRANT CREATE SESSION TO USER03; 

3. USER03 사용자로 접속

CONN USER03/TIGER;

4. USER03 사용자는 자기가 받은 권한을 다른 사용자에게 부여할 수 없음

GRANT CREATE SESSION TO USER01;

========================= 롤 회수하기 ============================

롤 역시 권한처럼 사용하지 않게 되었을 경우 이를 회수할 수 있음. 
다음은 롤을 회수하기 위한 DROP ROLE 명령어의 형식

DROP ROLE role_name FROM user_name;

이번에는 REVOKE 문을 사용하여 롤을 회수해 보도록 하기

1. 현재 사용자에게 부여된 롤 권한을 확인하기 위해서 
   다음과 같이 명령문을 수행해 보도록하기

CONN USER05/TIGER
SELECT * FROM USER_ROLE_PRIVS;

2. 데이터베이스 관리자로 접속한 후에 롤을 회수하기

CONN system/manager
REVOKE MROLE FROM USER05;

3. 다시 USER05로 접속하여 USER05에 부여된 롤을 확인해보면
   MROLE 롤이 회수된 것을 확인할 수 있음

CONN USER05/TIGER
SELECT * FROM USER_ROLE_PRIVS;
 
 ============================== 롤 제거하기 ================================
 
1. 사용자 USER05 에게 부여되었던 롤에 대한 권한만을 회수할 뿐, 
롤 MROLE02 은 아직 존재함.
SYSTEM 계정에서 롤을 생성하였으므로 
SYSTEM 계정으로 접속하여 데이터 딕셔너리 USER_ROLE_PRIVS의 내용을 출력하여 
MROLE02이 존재함을 확인하기

CONN system/manager
SELECT * FROM USER_ROLE_PRIVS;

=============================== 롤의 장점 =================================

롤을 사용하여 권한 부여함으로서 생기는 장점에 대해서 살펴볼 것.

시스템권한이나 객체 권한을 사용자마다 일일이 부여하게 되면 번거로움.

CREATE SESSION      CREATE TABLE        UPDATE      DELETE      SELECT
                            
                            사용자 1
                            
CREATE SESSION      CREATE TABLE        UPDATE      DELETE      SELECT
                            
                            사용자 2
                            
CREATE SESSION      CREATE TABLE        UPDATE      DELETE      SELECT
                            
                            사용자 3
                            

3명의 사용자에게 일일이 권한 부여하는 명령어를 부여하려면 굉장히 번거로움
이러한 단점을 롤로 보안할 수 있음
우선 롤에 시스템 권한과 객체 권한을 부여함.
그런 후에 롤을 사용자에 대해 권한 부여함으로서 작업을 간소화할 수 있음.

=============== 디폴트 롤을 생성하여 여러 사용자에게 부여하기 =================

롤에 시스템 권한과 객체 권한을 부여한 후에 롤을 사용자에 대해 권한 부여함으로서
작업을 간소화 해보기.

1. 데이터베이스 관리자로 접속하여 롤(DEF_ROLE) 생성해보기

CONN system/manager
CREATE ROLE DEF_ROLE;

2. 생성된 롤 DEF_ROLE에 시스템 권한인 
   CREATE SESSION과 CREATE TABLE을 부여하기. 

GRANT CREATE SESSION TO DEF_ROLE;
GRANT CREATE TABLE TO DEF_ROLE;

3. 생성된 롤 DEF_ROLE에 SCOTT 사용자로 접속해서 
   EMP 테이블을 수정, 삭제, 조회할 수 있도록 객체 권한을 부여하기.

CONN SCOTT/TIGER
GRANT UPDATE ON EMP TO DEF_ROLE;
GRANT DELETE ON EMP TO DEF_ROLE;
GRANT SELECT ON EMP TO DEF_ROLE;

4. 데이터베이스 관리자인 SYSTEM으로 접속해서 사용자 계정을 3개 만들기

CONN system/manager
CREATE USER USERA1 IDENTIFIED BY A1234;
CREATE USER USERA2 IDENTIFIED BY A1234;
CREATE USER USERA3 IDENTIFIED BY A1234;

5. 생성된 사용자 계정에 각각 DEF_ROLE에 대한 권한 설정하기

SHOW USER
GRANT DEF_ROLE TO USERA1;
GRANT DEF_ROLE TO USERA2;
GRANT DEF_ROLE TO USERA3;

6. ROLE_SYS_PRIVS은 시스템 권한에 대한 정보를 저장한 데이터 딕셔너리이고,
   ROLE_TAB_PRIVS은 객체 권한에 대한 정보를 저장한 데이터 딕셔너리임. 
   두 데이터 딕셔너리의 내용을 출력함으로서 
   롤에 권한 설정이 제대로 되어 있는지 확인해보기

SHOW USER
SELECT * FROM ROLE_SYS_PRIVS WHERE ROLE='DEF_ROLE';
SELECT * FROM ROLE_TAB_PRIVS WHERE ROLE='DEF_ROLE';

이렇게 자주 사용되는 권한을 롤에 부여해 놓으면 
언제 어느 때 새로운 사용자가 생기더라도 쉽게 권한 부여를 할 수 있게 됨.

/*
================== 동의어 개념과 종류 ====================

데이터베이스의 객체에 대한 소유권은 해당 객체를 생성한 사용자에게 있음. 

따라서 다른 사용자가 객체에 접근하기 위해서는 소유자로부터 접근 권한을 부여받아야 함.

또한 다른 사용자가 소유한 객체에 접근하기 위해서는 소유자의 이름을 객체 앞에 지정해야 함.

이렇게 객체를 조회할 때마다 일일이 객체의 소유자를 지정하는 것이 
번거로울 경우 동의어를 정의하면 긴 이름 대신 간단한 이름으로 접근할 수 있게 됨.

동의어는 개별 사용자를 대상으로 하는 비공개 동의어와 
전체 사용자를 대상으로 한 공개 동의어가 있음

======================= 동의어의  종류 ===========================

=========비공개 동의어

객체에 대한 접근 권한을 부여받은 사용자가 정의한 동의어로 해당 사용자만 사용할 수 있음. 

=========공개 동의어 

권한을 주는 사용자가 정의한 동의어로 누구나 사용할 수 있음.

공개 동의어는 DBA 권한을 가진 사용자만이 생성할 수 있음.

SYNONYM 앞에 PUBLIC를 붙여서 정의함. 

======================== 동의어의 사용 예 =============================

DUAL은 원래 SYS가 소유하는 테이블 명이므로 
다른 사용자가 DUAL 테이블에 접근하려면 SYS.DUAL로 표현해야 하는 것이 원칙. 

그럼에도 불구하고 지금까지 모든 사용자가 SYS.을 생략하고 
DUAL이라고 간단하게 사용하였음.

이럴 수 있었던 이유는 공개 동의어로 지정되어있기 때문!!

======================= 동의어 생성 ============================

동의어를 정의하기 위한 CREATE SYNONYM 명령어의 기본 형식

CREATE [PUBLIC] SYNONYM synonym_name
FOR user_name.object_name;

synonym_name은 user_name.object_name에 대한 별칭.

user_name은 객체를 소요한 오라클 사용자이고 
object_name는 동의어를 만들려는 데이터베이스 객체 이름임.

==================== 테이블 생성후 객체 권한 부여하기 ====================

SYSTEM 사용자 계정으로 접속해서 테이블을 생성한 후 
이를 SCOTT 사용자가 사용할 수 있도록 권한을 부여하기

1. SYSTEM으로 접속합니다.

CONN system/12341234
SHOW USER

2. SYSTBL 이란 테이블이 생성

CREATE TABLE SYSTBL (
ENAME VARCHAR2(20)
);

3. 로우를 2개 추가

INSERT INTO SYSTBL VALUES('전수빈');
INSERT INTO SYSTBL VALUES('전원지');

4. SCOTT 사용자에게 SYSTBL 이란 테이블을 SELECT 할 권한을 부여

GRANT SELECT ON SYSTBL TO SCOTT;

5. SCOTT 사용자에서 SYSTBL 테이블을 접근해보기

CONN scott/tiger
SELECT * FROM SYSTBL;

5. SCOTT 사용자에서 SYSTBL 테이블에 접근하려면 
   반드시 SYSTBL 테이블의 소유자인 SYSTEM을 SYSTBL 앞에 기술해야함
   
======================== 동의어 생성하기 =========================

SCOTT 사용자에서 SYSTBL 테이블을 [소유자의 이름].SYSTBL로 접근하는 것뿐만 아니라 
SYSTBL 이란 이름으로 접근할 수 있게끔 비공개 동의어를 생성해 보기

1. 비공개 동의어는 권한을 부여받는 사용자인 SCOTT이 정의해야 함으로
   SCOTT 계정으로 접속하여 비공개 동의어를 생성.

CONN scott/tiger
CREATE SYNONYM PriSYSTBL FOR system.SYSTBL;
SELECT * FROM PriSYSTBL;

CREATE SYNONYM 권한이 부여되지 않았기에 비공개 동의어를 생성하지 못한 것.

2. CREATE SYNONYM 권한이 불충분할 경우에는 DBA 관리자에서 권한을 부여해야 함

CONN system/manager
GRANT CREATE SYNONYM TO scott;

3. 다시 SCOTT 계정으로 접속하여 비공개 동의어를 생성

CONN scott/tiger
CREATE SYNONYM PriSYSTBL FOR system.SYSTBL;
SELECT * FROM PriSYSTBL;

================== 비공개 동의어 의미 파악하기 ======================

비공개 동의어는 동의어를 생성한 소유자만이 접근할 수 있음. 

이를 위한 예제를 만들어 보기

1. 데이터베이스의 객체에 대한 소유권은 해당 객체를 생성한 사용자가 가지고 있으므로 
   다른 사용자가 소유한 객체를 접근하기 위해서는 소유자로부터 접근 권한을 받아야 함. 
   우선 데이터베이스 관리자인 SYSTEM으로 접속한 후에 
   사용자 정의 롤을 생성한 후에 
   사용자 정의 롤에 CONNECT, RESOURCE 롤과 CREATE SYNONYM 권한과 
   SCOTT 소유자의 EMP 테이블과 DEPT 테이블에 대한 SELECT 객체 권한을 롤에 부여함
   
CONN system/manager
CREATE ROLE TEST_ROLE;
GRANT CONNECT, RESOURCE, CREATE SYNONYM TO TEST_ROLE;
GRANT SELECT ON scott.DEPT TO TEST_ROLE;

2. 사용자를 생성.

CREATE USER USERB1 IDENTIFIED BY B1234;
CREATE USER USERB2 IDENTIFIED BY B1234;

3. 생성한 사용자에게 롤을 부여

GRANT TEST_ROLE TO USERB1;
GRANT TEST_ROLE TO USERB2;

4. 접근 권한만 부여받았다고 다른 사용자가 소유한 객체를 무조건 접근하지 못하고 
   사용자명.객체명으로 접근해야 함
   
CONN USERB1/B1234
SELECT * FROM SCOTT.DEPT;
SELECT * FROM SCOTT.EMP;

CONN USERB2/B1234
SELECT * FROM SCOTT.DEPT;
SELECT * FROM SCOTT.EMP;

5. 소유자를 지정하지 않고도 다른 사용자(SCOTT) 소유의 객체(EMP)에 접근하기 위해서는 
   동의어를 생성. USERB1과 USERB2 계정으로 접속하여 DEPT로 테이블을 조회해보기

CONN USERB1/B1234
CREATE SYNONYM DEPT FOR SCOTT.DEPT;

USERB1으로 접속해서 동의어 DEPT를 정의하고 DEPT로 테이블을 접근하면 조회에 성공.

하지만 동의어 DEPT는 USERB1의 비공개 동의어기 때문에 USER02로 접속하면 
DEPT로 테이블을 조회하지 못함.


=================== 공개 동의어 정의하기 =======================

만일 USERB1과 USERB2에서 
모두 사용할 수 있는 동의어를 선언하려면 공개 동의어로 선언해야 함.
이번에는 USERB1 사용자로 접속해서 공개 동의어를 정의해보기

1. USERB1는 DBA 롤이 부여되지 않은 사용자이기 때문에 
   공개 동의어를 생성하지 못함. 
   공개 동의어를 생성하기 위해서는 DBA 롤이 부여된 데이터베이스 관리자인 
   SYSTEM으로 접속.

CONN system/manager
CREATE PUBLIC SYNONYM PUBDEPT FOR SCOTT.DEPT;

2. USERB1과 USERB2 계정으로 접속하여 DEPT로 테이블을 조회.

CONN USERB1/B1234
SELECT * FROM PUBDEPT;

CONN USERB1/B1234
SELECT * FROM PUBEMP;

CONN USERB2/B1234
SELECT * FROM PUBDEPT;

CONN USERB2/B1234
SELECT * FROM PUBEMP;

조회 가능.

========================= 비공개 동의어의 제거하기 ======================

1. 비공개 동의어인 DEPT는 동의어를 소유한 사용자로 접속한 후에 제거해야 함을 증명하기 위해서
비공개 동의어의 소유자가 사용자로 접속해서 제거해 보도록 하기

CONN system/12341234
DROP SYNONYM DEPT;

동의어 DEPT는 USERB1에서 생성하였으므로 
USERB1이 아닌 사용자로 접속하였을 때에는 오류가 발생

2. 동의어를 소유한 사용자로 접속해야만 제거가 가능

CONN USERB1/B1234
DROP SYNONYM DEPT;

동의어 DEPT는 USERB1에서 생성하였으므로 
USERB1 사용자로 접속하여 동의어 DEPT를 삭제하는데 성공

====================== 공개 동의어 제거하기 ========================

이번에는 공개 동의어인 PubDEPT 를 삭제해보기.
공개 동의어는 DBA 롤이 부여된 사용자에서 생성과 제거가 가능함으로 
데이터베이스 관리자인 SYSTEM으로 접속한 후에 제거해야함. 
또한 제거할 때 반드시 PUBLIC 예약어를 명시해야한다.

1. USERB1 사용자에게는 DBA 롤이 없으므로 공개 동의어를 제거할 수 없음

CONN USERB1/B1234
DROP SYNONYM PUBDEPT; 

2. SYSTEM 사용자이므로 DBA 롤이 있지만 공개 동의어를 제거하는데, 
   예약어 PUBLIC를 기술하지 않았기 때문에 오류가 발생

CONN system/12341234
DROP SYNONYM PUBDEPT; 

3. SYSTEM 사용자이므로 DBA 롤에 대한 권한도 있고 
   예약어 PUBLIC 역시 기술하였기 때문에 공개 동의어를 제거가능
   
DROP PUBLIC SYNONYM PUBDEPT; 

/*
======================= PL/SQL 구조 ===========================

PL/SQL 은 Oracle's Procedural Language extension to SQL의 약자. 

SQL문장에서 변수정의, 조건처리(IF), 반복처리(LOOP, WHILE, FOR)등을 지원하며,

오라클 자체에 내장되어 있는 절차적 언어(Procedure Language)로서 
SQL의 단점을 보완해줌.

오라클 사에서는 데이터베이스 내의 데이터를 조작하기 위해서 
SQL과 함께 PL/SQL을 제공. 

C나 자바와 같은 프로그래밍 언어에 익숙한 사람이라면 
절차적 언어인 PL/SQL을 쉽게 이해할 수 있을 것. 

============= PL/SQL은 SQL에 없는 다음과 같은 기능이 제공===============

- 변수 선언을 할 수 있음.
- 비교 처리를 할 수 있음. 
- 반복 처리를 할 수 있음.

위에 언급한 기능은 절차적 언어에서 제공되는 것으로 
효율적으로 SQL 문을 사용할 수 있게 해줌

PL/SQL은 PASCAL과 유사한 구조로서 DECLARE~BEGIN~EXCEPTION~END 순서를 갖고 있음

PL/SQL은 다음과 같은 블록(BLOCK) 구조의 언어로서 크게 3 부분으로 나눌 수 있음

DECLARE SECTION(선언부)

EXECUTABLE SECTION(실행부)

EXCEOTION SECTION(예외 처리부)

======================== 선언부(DECLARE SECTION) =======================

PL/SQL에서 사용하는 모든 변수나 상수를 선언하는 부분으로서 DECLARE로 시작. 

======================== 실행부(EXECUTABLE SECTION)======================

절차적 형식으로 SQL문을 실행할 수 있도록 절차적 언어의 요소인
제어문, 반복문, 함수 정의 등 로직을 기술할 수 있는 부분으로 
BEGIN으로 시작.

======================== 예외 처리(EXCEPTION SECTION) ===================

PL/SQL 문이 실행되는 중에 에러가 발생할 수 있는데 
이를 예외 사항이라고 함. 

이러한 예외 사항이 발생했을 때 이를 해결하기 위한 문장을 기술할 수 있는 부분으로 
EXCEPTION 으로 시작.

======================== PL/SQL 프로그램의 작성 요령 ============================

1. PL/SQL 블록내에서는 한 문장이 종료할 때마다 세미콜론(;)을 사용.

2. END뒤에 ;을 사용하여 하나의 블록이 끝났다는 것을 명시.

3. PL/SQL 블록의 작성은 편집기를 통해 파일로 작성할 수도 있고, 
   프롬프트에서 바로 작성할 수도 있음.
   
4. SQL*PLUS환경에서는 DELCLARE나 BEGIN이라는 키워드로 
   PL/SQL블럭이 시작하는 것을 알 수 있음.
   
5. 단일행 주석은 --이고 여러행 주석 /* */                                /*

6. 쿼리문을 수행하기 위해서 /가 반드시 입력되어야 
   PL/SQL 블록은 행에 / 가 있으면 종결된 것으로 간주.

===================== 간단한 메시지 출력하기 =======================

'Hello World!'를 출력하는 PL/SQL 문을 작성해 보기

1. 오라클의 환경 변수 SERVEROUTPUT는 오라클에서 제공해주는 프로시저를 사용하여  
   출력해 주는 내용을 화면에 보여주도록 설정하는 환경 변수인데 
   디폴트값 OFF이기에 ON으로 변경해야만 함.
   
SET SERVEROUTPUT ON

2. 화면 출력을 위해서는 PUT_LINE이란 프로시저를 이용. 
   PUT_LINE은 오라클이 제공해주는 프로시저로 DBMS_OUTPUT 패키지에 묶여 있음. 
   따라서 DBMS_OUTPUT.PUT_LINE과 같이 사용해야 함.
   
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello World!'); 
END;
/

============================= 변수선언과 대입문 ===========================

PL/SQL의 선언부에서는 실행부에서 사용할 변수를 선언. 

변수를 선언할 때 변수명 다음에 자료형을 기술해야 함.

PL/SOL에서 변수 선언할 때 사용되는 자료형은 SQL에서 사용하던 자료형과 거의 유사함.

identifier [CONSTANT] datatype [NOT NULL]
[:= | DEFAULT expression];


구문                      설명

IDENTIFIER                변수의 이름

CONSTANT                  변수의 값을 변경할 수 없도록 제약함

DATATYPE                  자료형을 기술

NOT NULL                  값을 반드시 포함하도록 하기 위해 변수를 제약

EXPRESSION                LITERAL, 다른 변수, 연산자나 함수를 포함하는 표현식


쿼리문을 수행하고 난 후에 얻어진 결과를 컬럼 단위로 변수에 저장할 경우 다음과 같이 선언

VEMPNO NUMBER(4);
VENAME VARCHAR2(10);

PL/SOL에서 변수를 선언할 때 위와 같이 
SQL에서 사용하던 자료형과 유사하게 선언하는 것을 
스칼라(SCALAR) 변수라고 함.

숫자를 저장하기 위해서 
VEMPNO 변수는 NUMBER로 선언하였고,

문자를 저장하기 위해서
VENAME 변수는  VARCHAR2를 사용해서 선언하였음.

===================== 대입문으로 변수에 값 지정하기 ==========================

PL/SQL에서는 변수의 값을 지정하거나 재지정하기 위해서 :=를 사용

:= 의 좌측에 새 값을 받기 위한 변수를 기술하고 우측에 저장할 값을 기술

identifier := expression;

선언부에서 선언한 변수에 값을 할당하기 위해서는 :=를 사용해보기.

VEMPNO := 7788;
VENAME := 'SCOTT'; 

======================== 변수 사용하기 ===============================

변수의 선언및 할당을 하고 그 변수 값을 출력해 보기.

1. ED EXAM01을 입력하여 새로 생긴 EXAM01.sql 파일에 다음과 같이 입력.

SET SERVEROUTPUT ON
DECLARE
	VEMPNO NUMBER(4);
	VENAME VARCHAR(10);
BEGIN
	VEMPNO := 7788;
	VENAME := 'SCOTT';
	DBMS_OUTPUT.PUT_LINE('사번 / 이름');
	DBMS_OUTPUT.PUT_LINE('------------------');
	DBMS_OUTPUT.PUT_LINE(VEMPNO || ' / ' || VENAME);
END;

2. 작성이 완료한 후에 파일을 저장.
   SQL> 프롬프트에 @EXAM01을 입력하면 
   EXAM01.sql 파일 내부에 기술한
   PL/SQL 이 실행된 후 결과가 출력됨.

======================= 스칼라 변수/레퍼런스 변수 ==============================

PL/SQL에서 변수를 선언하기 위해 사용할 수 있는 데이터형은 크게 
스칼라(Scalar)와 레퍼런스(Reference)로 나눌 수 있음.

=============================== 스칼라 ======================================

PL/SOL에서 변수를 선언할 때 사용되는 자료형은 
SQL에서 사용하던 자료형과 거의 유사함.
숫자를 저장하려면 NUMBER를 사용하고 
문자를 저장하려면 VARCHAR2를 사용해서 선언

=============================== 레퍼런스 =====================================

이전에 선언된 다른 변수 또는 데이터베이스 컬럼에 맞추어 변수를 선언하기 위해 
%TYPE속성을 사용할 수 있음

VEMPNO EMP.EMPNO%TYPE;
        ①    ② 
VENAME EMP.ENAME%TYPE;
        ①    ②

%TYPE속성을 사용하여 선언한 VEMPNO 변수는 

해당 테이블(①EMP)의 해당 칼럼(①EMPNO 혹은 ②)의 자료형과 크기를 
그대로 참조해서 정의함.

모든 개발자가 테이블에 정의된 칼럼의 자료형과 크기를 모두 파악하고 있다면 
별 문제가 없겠지만, 
대부분은 그렇지 못하기 때문에 오라클에서는 레퍼런스(REFERENCES) 변수를 제공함.

컬럼의 자료형이 변경되더라도 
칼럼의 자료형과 크기를 그대로 참조하기 때문에 
굳이 레퍼런스 변수 선언을 수정할 필요가 없다는 장점이 있음.

%TYPE == 컴럼 단위로 참조한다면 

로우(행) 단위로 참조하는 %ROWTYPE가 있음.

데이터베이스의 테이블 또는 VIEW의 일련의 컬럼을 RECORD로 선언하기 위하여
%ROWTYPE를 사용. 

데이터베이스 테이블 이름을 %ROWTYPE 앞에 접두어를 붙여 RECORD를 선언하고
FIELD는 테이블이나 VIEW의 COLUMN명과 데이터 타입과 LENGTH을 그대로 가져올 수 있음.

VEMP EMP%ROWTYPE;

%ROWTYPE을 사용 시 장점은 
특정 테이블의 컬럼의 개수와 데이터 형식을 모르더라도 지정할 수 있음.

SELECT 문장으로 로우를 검색할 때 유리함.

======================== PL/SQL에서 SELECT 문 ==========================

데이터베이스에서 정보를 추출할 필요가 있을 때 
또는 데이터베이스로 변경된 내용을 적용할 필요가 있을 때 SQL을 사용. 

PL/SQL은 SQL에 있는 DML 명령을 지원함.

테이블의 행에서 질의된 값을 변수에 할당시키기 위해 SELECT문장을 사용.

PL/SQL의 SELECT 문은 INTO절이 필요한데, 
INTO절에는 데이터를 저장할 변수를 기술함. 

SELECT 절에 있는 컬럼은 INTO절에 있는 변수와 1대1대응을 하기에 
개수와 데이터의 형, 길이가 일치하여야 함. 

SELECT 문은 INTO절에 의해 하나의 행만을 저장할 수 있음. 

SELECT select_list
INTO {variable_name1[,variable_name2,..] | record_name}
FROM table_name
WHERE condition;

구문              설명

SELECT_LIST       열의 목록이며 행 함수, 그룹 함수, 표현식을 기술할 수 있음.

VARIABLE_NAME     읽어들인 값을 저장하기 위한 스칼라 변수

RECORD_NAME       읽어 들인 값을 저장하기 위한 PL/SQL RECORD 변수

CONDITION         PL/SQL 변수와 상수를 포함하여 
                  열명,표현식,상수,비교 연산자로 구성되며 
                  오직 하나의 값을 RETURN할 수 있는 조건이어야 함.
                  
SELECT EMPNO, ENAME INTO VEMPNO, VENAME
FROM EMP
WHERE ENAME='SCOTT';

VEMPNO, VENAME 변수는 
컬럼(EMPNO, ENAME)과 동일한 데이터형을 갖도록 하기 위해서 
%TYPE 속성을 사용함.

INTO 절의 변수는 SELECT에서 기술한 컬럼의 데이터형뿐만 아니라 
컬럼의 수와도 일치해야 함.

== 사번과 이름 검색하기

PL/SQL의 SELECT 문으로 EMP 테이블에서 사원번호와 이름을 조회하기

1. ED 다음에 파일이름을 입력하여 새로 생긴 SQL 파일에 다음과 같이 입력하시오.
   (파일이름:EXAM02.sql)

2. 작성이 완료한 후에 파일을 저장. 
   SQL> 프롬프트에 @파일명을 입력하면 
   SQL 파일 내부에 기술한 PL/SQL 이 실행된 후 결과가 출력됨.
   
============================ PL/SQL 테이블 =============================

PL/SQL 테이블은 로우에 대해 배열처럼 액세스하기 위해 기본키를 사용. 

배열과 유사하고 PL/SQL 테이블을 액세스하기 위해 
BINARY_INTEGER 데이터형의 기본키와 PL/SQL 테이블 요소를 저장하는 
스칼라 또는 레코드 데이터형의 컬럼을 포함해야 함.

또한 이들은 동적으로 자유롭게 증가할 수 있음.

TYPE table_type_name IS TABLE OF
{column_type | variable%TYPE | table.column%TYPE} [NOT NULL]
[INDEX BY BINARY_INTEGER];
identifier table_type_name;


구문                  설명
TABLE_TYPE_NAME       테이블형의 이름
COLUMN_TYPE           VARCHAR2, DATE, NUMBER 와 같은 스칼라 데이터형
IDENTIFIER            전체 PL/SQL 테이블을 나타내는 식별자의 이름

========================== TABLE 변수 사용하기 ===============================

TABLE 변수를 사용하여 EMP 테이블에서 이름과 업무를 출력해 보기

1. ED 다음에 파일이름을 입력하여 새로 생긴 SQL 파일에 다음과 같이 입력하시오.
   (파일이름:EXAM03.sql)
   
SET SERVEROUTPUT ON
DECLARE

-- 테이블 타입을 정의 
TYPE  ENAME_TABLE_TYPE IS TABLE OF EMP.ENAME%TYPE
INDEX BY BINARY_INTEGER;
TYPE  JOB_TABLE_TYPE IS TABLE OF EMP.JOB%TYPE
INDEX BY BINARY_INTEGER;

-- 테이블 타입으로 변수 선언
ENAME_TABLE  ENAME_TABLE_TYPE;
JOB_TABLE  JOB_TABLE_TYPE;
  
I BINARY_INTEGER := 0;
  
-- 선언부 끝

BEGIN  
  -- EMP 테이블에서 사원이름과 직급을 얻어옴
  FOR  K IN (SELECT ENAME, JOB FROM EMP) 
  LOOP
    I := I + 1;                --인덱스 증가
    ENAME_TABLE(I) := K.ENAME; --사원이름과 
    JOB_TABLE(I) := K.JOB;     --직급을 저장. 
  END LOOP;

  --테이블에 저장된 내용을 출력
  FOR J IN 1..I LOOP          
    DBMS_OUTPUT.PUT_LINE(RPAD(ENAME_TABLE(J),12) 
       || ' / ' ||  RPAD(JOB_TABLE(J),9));
  END LOOP;
END;
/

=================== PL/SQL RECORD TYPE =======================

PL/SQL RECORD TYPE은 프로그램 언어의 구조체와 유사함

PL/SQL RECORD는FIELD(ITEM)들의 집합을 하나의 논리적 단위로 처리할 수 있게 해 주므로 
테이블의 ROW를 읽어올 때 편리함.

TYPE type_name IS RECORD
(field_name1 {scalar_datatype|record_type} 
[NOT NULL] [{:= | DEFAULT} expr],
field_name2 {scalar_datatype|record_type} 
[NOT NULL] [{:= | DEFAULT} expr],
. . . . . . .);
identifiee_name type_name;


TYPE_NAME       RECODE 형의 이름, 이 식별자는 RECODE를 선언하기 위해 사용.


FIELD_NAME      RECODE내의 필드명.

개별 필드를 참조하거나 초기화하기 위해 "."을 사이에 뒤고 레코드 이름과 필드 이름을 기술

Record_name.field_name

=================== RECORD TYPE 사용하기 ============================

EMP 테이블에서 SCOTT 사원의 정보를 출력해보기

1. ED 다음에 파일이름을 입력하여 새로 생긴 SQL 파일에 다음과 같이 입력하시오.
   (파일이름:EXAM04.sql)

SET SERVEROUTPUT ON
DECLARE
  -- 레코드 타입을 정의
  TYPE emp_record_type IS RECORD(
    v_empno    emp.empno%TYPE,
    v_ename    emp.ename%TYPE,
    v_job    emp.job%TYPE,
    v_deptno  emp.deptno%TYPE);

  -- 레코드로 변수 선언
  emp_record  emp_record_type;
================================================ 선언부 끝
BEGIN
  -- SCOTT 사원의 정보를 레코드 변수에 저장
  SELECT empno,ename, job, deptno
    INTO emp_record
    FROM emp
    WHERE ename = UPPER('SCOTT');

  -- 레코드 변수에 저장된 사원 정보를 출력
  DBMS_OUTPUT.PUT_LINE('사원번호 : ' || 
     TO_CHAR(emp_record.v_empno));
  DBMS_OUTPUT.PUT_LINE('이    름: ' || 
     emp_record.v_ename);
  DBMS_OUTPUT.PUT_LINE('담당업무 : ' || 
     emp_record.v_job);
  DBMS_OUTPUT.PUT_LINE('부서번호 : ' || 
     TO_CHAR(emp_record.v_deptno));
END;
/

============================ 선택문 ==============================

기본적으로 모든 문장들은 나열된 순서대로 순차적으로 수행됨.

하지만 경우에 따라서는 문장의 흐름을 변경할 필요가 있음. 

이때 사용하는 것이 IF 문.

IF 문은 조건을 제시해서 만족하느냐 하지 않느냐에 따라 
문장을 선택적으로 수행하기 때문에 선택문이라고 함. 

오라클에서는 3가지 형태의 선택문이 제공됩니다.

if 라는 단어의 사전적인 의미는 “만약 ~ 라면”. 

이러한 의미처럼 if문은 조건에 따라 
어떤 명령을 선택적으로 처리하기 위해 사용하는 가장 대표적인 구문. 

“어떤 경우에 어떤 행동을 해라!”와 같은 간단한 처리를 할 때 사용.

IF condition THEN ..... 조건문
statements; .............. 조건에 만족할 경우 실행되는 문장
END IF

조건이 TRUE이면 THEN이하의 문장을 실행하고 
조건이 FALSE나 NULL이면 END IF다음 문장을 수행

====================== 부서번호로 부서명 알아내기 =======================

다음은 사원 번호가 7788인 사원의 부서 번호를 얻어 와서
부서 번호에 따른 부서명을 구하는 예제. 

IF문이 끝났을 때에는 반드시 END IF를 기술해야 한다는 점에 주의

1. ED 다음에 파일이름을 입력하여 새로 생긴 SQL 파일에 다음과 같이 입력하시오.
   (파일이름:EXAM05.sql)
   
SET SERVEROUTPUT ON
DECLARE
   VEMPNO 	 NUMBER(4);
   VENAME 	 VARCHAR2(20);
   VDEPTNO       EMP.DEPTNO%TYPE;
   VDNAME 	 VARCHAR2(20) := NULL;
BEGIN
 SELECT EMPNO, ENAME, DEPTNO INTO VEMPNO,
               VENAME, VDEPTNO 
 FROM  EMP
 WHERE EMPNO=7788;
 IF (VDEPTNO = 10)  THEN
      VDNAME := 'ACCOUNTING';
 END IF;
 IF (VDEPTNO = 20)  THEN
     VDNAME := 'RESEARCH';
 END IF;
 IF (VDEPTNO = 30)  THEN
      VDNAME := 'SALES';
 END IF;
 IF (VDEPTNO = 40) THEN  
      VDNAME := 'OPERATIONS';
 END IF;

 DBMS_OUTPUT.PUT_LINE('사번    이름    부서명');
 DBMS_OUTPUT.PUT_LINE(VEMPNO||'    '||VENAME
  ||'    '||VDNAME);
END;
/

=== 다음은 연봉을 구하는 예제. 
연봉 계산을 위해 “급여*12+커미션”이란 공식을 사용하. 
(CH20_QUIZ_01.sql)


SET SERVEROUTPUT ON
DECLARE
-- %ROWTYPE 속성으로 로우 전체를 저장할 수 있는 레퍼런스 변수 선언 
VEMP EMP%ROWTYPE; 
ANNSAL NUMBER(7,2);
BEGIN
DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 연봉'); 
DBMS_OUTPUT.PUT_LINE('-------------------------');
-- SCOTT 사원의 전체 정보를 로우 단위로 얻어와 VEMP에 저장한다. 
SELECT * INTO VEMP
FROM EMP
WHERE ENAME='SCOTT';
-- 커미션이 NULL일 경우 0으로 변경해야 올바른 연봉 계산

IF(VEMP.COMM IS NULL) THEN
   VEMP.COMM := 0;
END IF;                  

-- 스칼라 변수에 연봉을 계산할 결과를 저장한다.
ANNSAL:=VEMP.SAL*12+VEMP.COMM ; 
-- 결과 출력 
DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||' /‘
   ||VEMP.ENAME||' /'||ANNSAL); 
END;
/

위 결과를 보면 연봉으로 아무런 내용도 출력되지 않음을 확인할 수 있음.

왜냐하면 COMM 칼럼 값이 NULL이기에 값과의 연산 결과인 연봉 역시 NULL이 구해지기 때문.

따라서 커미션 칼럼이 NULL 값일 때는 0 값으로 바꿔줘야 올바른 연봉 계산을 할 수 있게 됨.

==================== IF ~ THEN ~ ELSE ~ END IF ===========================

IF 문 계열 중 가장 일반적으로 많이 사용되는 형식이 
IF ~ THEN ~ ELSE ~ END IF 문. 

이 문장은 참일 때와 거짓일 때 각각 다른 문장을 수행하도록 지정할 수 있음.

[문장1]
IF condition THEN ....... 조건문
statements; ...... 조건에 만족할 경우 실행되는 문장[문장2]
ELSE
statements; ...... 조건에 만족하지 않을 경우 실행되는 문장[문장3]
END IF
[문장4]


[문장1]을 수행하고 if 문을 만나면 조건문을 검사. 

그리고 그 결과가 참이면 [문장2]를 수행하고, 거짓이면 [문장3]을 수행.

그런 후에는 [문장4]를 수행하게 됨.

======================= 연봉 구하는 예제 ==========================

커미션을 받는 직원은 급여에 12를 곱한 후 커미션과 합산하여 연봉을 구하고 
커미션을 받지 않는 직원은 급여에 12를 곱한 것으로만 연봉을 구함

1. ED 다음에 파일이름을 입력하여 새로 생긴 SQL 파일에 다음과 같이 입력하시오.
   (파일이름:EXAM06.sql)
   
   SET SERVEROUTPUT ON
DECLARE
  VEMP EMP%ROWTYPE;
  ANNSAL NUMBER(7,2);
BEGIN
 -- SCOTT 사원의 전체 정보를 로우 단위로 얻어와 VEMP에 저장한다.   
  SELECT * INTO VEMP
  FROM EMP
  WHERE ENAME='SCOTT';
IF (VEMP.COMM IS NULL)THEN        -- 커미션이 NULL 이면 
    ANNSAL:=VEMP.SAL*12;          -- 급여에 12를 곱한다.
  ELSE                            -- 커미션이 NULL이 아니면 
    ANNSAL:=VEMP.SAL*12+VEMP.COMM;
    -- 급여에 12를 곱한 후 커미션과 합산
  END IF;

  DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 연봉'); 
  DBMS_OUTPUT.PUT_LINE('----------------------');
  DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||'/ '
                 ||VEMP.ENAME||'/'||ANNSAL); 
END;
/

=================== IF ~ THEN ~ ELSIF ~ ELSE ~ END IF ==================

IF ~ THEN ~ ELSE ~ END IF 문은 참 거짓을 선택하는 과정에서 한번만 사용되었지만, 
이럴 경우 둘 중에 하나를 선택할 수 있음

만일 그 경우의 수가 둘이 아닌 셋 이상에서 하나를 선택해야 할 경우에는 
IF ~ THEN ~ ELSIF ~ ELSE ~ END IF 문을 사용해야 함.

IF condition THEN
statements;
ELSIF condition THEN
statements;
ELSIF condition THEN
statements;
ELSE
statements;
END IF

=============== 부서번호로 부서명 알아내기 =====================

SQL 함수에서 선택을 위한 DECODE 함수를 학습하면서 
부서번호에 대해서 부서명을 지정해 보았음

이곳 PL/SQL에서는 DECODE 함수 대신 
IF ~ THEN ~ ELSIF ~ ELSE ~ END IF 구문으로 부서번호에 대한 부서명을 구해보기

1. ED 다음에 파일이름을 입력하여 새로 생긴 SQL 파일에 다음과 같이 입력하시오.
   (파일이름:EXAM07.sql)

SET SERVEROUTPUT ON
DECLARE
  VEMP EMP%ROWTYPE;
  VDNAME VARCHAR2(14);
BEGIN
  DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 부서명'); 
  DBMS_OUTPUT.PUT_LINE('--------------------');

  SELECT * INTO VEMP
  FROM EMP
  WHERE ENAME='SCOTT';

  IF (VEMP.DEPTNO = 10)  THEN
    VDNAME := 'ACCOUNTING';
  ELSIF (VEMP.DEPTNO = 20)  THEN
    VDNAME := 'RESEARCH‘;
ELSIF (VEMP.DEPTNO = 30)  THEN
    VDNAME := 'SALES';
  ELSIF (VEMP.DEPTNO = 40) THEN  
    VDNAME := 'OPERATIONS';
  END IF;

  DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||'/'||
  VEMP.ENAME||'/'||VDNAME); 
END;
/

=========================== 반복문 ============================

반복문은 SQL 문을 반복적으로 여러 번 실행하고자 할 때 사용. 

PL/SQL에서는 다음과 같이 다양한 반복문이 사용

1. 조건 없이 반복 작업을 제공하기 위한 BASIC LOOP문

2. COUNT를 기본으로 작업의 반복 제어를 제공하는 FOR LOOP문

3. 조건을 기본으로 작업의 반복 제어를 제공하기 위한 WHILE LOOP문

4. LOOP를 종료하기 위한 EXIT문

========================= BASIC LOOP문 =========================

지금 소개할 구문은 가장 간단한 루프로 구분 문자로 LOOP와 END LOOP가 사용됨.

LOOP
statement1;
statement2;
. . . . . .
EXIT [WHERE condition];
END LOOP

실행 상의 흐름이 END LOOP에 도달할 때마다 그와 짝을 이루는 LOOP 문으로 제어가 되돌아감.

이러한 루프를 무한 루프라 하며, 여기서 빠져나가려면 EXIT문을 사용

기본 LOOP는 LOOP에 들어갈 때 조건이 이미 일치했다 할지라도 적어도 한번은 문장이 실행됨

================= BASIC LOOP 문으로 1부터 5까지 출력하기 =====================

다음은 BASIC LOOP 문으로 1부터 5까지 출력하는 예제

1. ED 다음에 파일이름을 입력하여 새로 생긴 SQL 파일에 다음과 같이 입력하시오.
   (파일이름:EXAM08.sql)
   
SET SERVEROUTPUT ON
DECLARE
N NUMBER := 1;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE( N );
N := N + 1;
IF N > 5 THEN
EXIT;
END IF;
END LOOP;
END;
/
SET SERVEROUTPUT ON
DECLARE
N NUMBER := 1;
BEGIN
WHILE N <= 5 LOOP
DBMS_OUTPUT.PUT_LINE( N );
N := N + 1;
END LOOP;
END;
/

============================= FOR LOOP 문 ==============================

FOR LOOP는 반복되는 횟수가 정해진 반목문을 처리하기에 용이

FOR index_counter 
IN [REVERSE] lower_bound..upper_bound LOOP
statement1;
statement2;
. . . . . .
END LOOP


구문                          설명

INDEX_COUNTER                 UPPER_BOUND나 LOWER_BOUND에 도달할 때까지 LOOP를 반복함으로써 
                              1씩 자동적으로 증가하거나 감소되는 값을 가진 
                              암시적으로 선언된 정수.

REVERSE                       UPPER_BOUND에서 LOWER_BOUN까지 반복함으로써 인덱스가 1씩 감소되도록 함.              

LOWER_BOUN                    INDEX_COUNTER 값의 범위에 대한 하단 바운드값을 지정        

UPPER_BOUND                   INDEX_COUNTER 값의 범위에 대한 상단 바운드값을 지정 


FOR LOOP 문에서 사용되는 인덱스는 
정수로 자동 선언되므로 따로 선언할 필요가 없음.

FOR LOOP 문은 LOOP을 반복할 때마다 자동적으로 1씩 증가 또는 감소함.

REVERSE는 1씩 감소함을 의미.


============================= WHILE LOOP문 ===================================

제어 조건이 TRUE인 동안만 일련의 문장을 반복하기 위해 WHILE LOOP 문장을 사용. 

조건은 반복이 시작될 때 체크하게 되어 LOOP내의 문장이 한 번도 수행되지 않을 경우도 있음.

LOOP을 시작할 때 조건이 FALSE면 반복 문장을 탈출하게 됨

WHILE condition LOOP
statement1;
statement2;
. . . . . .
END LOOP

다음은 WHILE LOOP 문으로 1부터 5까지 출력하는 예제. 
1. ED 다음에 파일이름을 입력하여 새로 생긴 SQL 파일에 다음과 같이 입력하시오.
   (파일이름:EXAM10.sql)

SET SERVEROUTPUT ON
DECLARE
N NUMBER := 1;
BEGIN
WHILE N <= 5 LOOP
DBMS_OUTPUT.PUT_LINE( N );
N := N + 1;
END LOOP;
END;
/

2. WHILE LOOP 문으로 별을 삼각형 구도로 출력하는 예입니다. 
   (CH20_QUIZ_04.sql)
   
   SET SERVEROUTPUT ON
DECLARE
V_CNT NUMBER := 1;
V_STR VARCHAR2(10) := NULL;
BEGIN
WHILE V_CNT <=5 LOOP
V_STR := V_STR || '*';
DBMS_OUTPUT.PUT_LINE(V_STR);
V_CNT := V_CNT +1;      
END LOOP;               
END;
/