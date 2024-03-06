-- 데이터 딕셔너리 TAB     tab====================
-- TAB == TABLE 테이블의 정보를 알려주는 데이터 딕셔너리

SELECT * FROM TAB;

-- 테이블 구조를 살펴보기 위한 DESC (DESCRIBE)  desc=============

-- DESC 명령어는 테이블의 컬럼 이름, 데이터 형, 길이와 NULL 허용유무 등
-- 특정 테이블의 정보를 알려줌
-- DEPT 테이블의 구조 살피기

DESC DEPT

-- 오라클의 데이터 형=========================

-- NUMBER (데이터 형은 숫자 데이터를 저장하기 위해 제공)
-- NUMBER(precision , scale)
-- precision == 소수점을 포함한 전체 자리수를 의미
-- scale == 소수점 이하 자리수를 지정
-- scale 을 생략한채 precision만 지정하면 소수점 이하는 반올림되어 정수값만 저장
-- precision과 scale을 모두 생략하면 입력한 데이터 값만큼 공간이 할당

-- DATA (세기,년,월,일,시간,분,초의 날짜 및 시간 데이터를 저장하기 위한 데이터 형)
-- 날짜 타입 안에는 세기, 년, 월, 일, 시, 분, 초, 요일 등 여러가지 정보가 들어 있음
-- 별다른 설정이 없으면 년, 월, 일 만 출력
-- 기본 날짜 형식은 "YY/MM/DD" 로 출력

-- CHAR (문자 데이터를 저장하기 위한 자료형)
-- 고정 길이 문자 데이터를 저장
-- 입력된 자료의 길이와는 상관없이 정해진 길이만큼 저장 영역을 차지
-- 최소 크기는 1
-- 주어진 크기만큼 저장공간이 할당되므로 편차가 심한 데이터를 입력하면 저장공간 낭비

-- VARCHAR2 (가변적인 길이의 문자열을 저장하기 위한 데이터 형)
-- 저장되는 데이터에 의해서 저장공간이 할당
-- 메모리 낭비를 줄일 수 있음

-- 데이터를 조회하기 위한 SELECT문===========================

-- SQL 명령어는 하나의 문장으로 구성
-- 여러 개의 절이 모여서 문장이 되는 것
-- 반드시 세미콜론(;)으로 마침표
-- SELECT는 반드시 FROM과 함께 구성
-- SELECT 절은 출력하고자 하는 칼럼 이름을 기술
-- 특정 칼럼 이름 대신 * 가능
-- * 는 테이블 내의 모든 컬럼을 출력하고자 할 경우 사용
-- FROM절 다음에는 조회하고자 하는 테이블 이름을 기술
-- SQL문에서 사용하는 명령어들은 대소문자를 구분하지 않음

SELECT * FROM EMP;

select * from emp;

SELECT * FROM DEPT;

SELECT EMPNO, ENAEM
FROM EMP;

SELECT ENAME, SAL, HIREDATE
FROM EMP;

-- 산술 연산자       arithmetic operators
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

-- 칼럼 이름에 별칭 지정하기     

SELECT ENAME, SAL*12+NVL(COMM,0)
FROM EMP;

-- 컬럼 바로 뒤에 AS 키워드      as

SELECT ENAME, SAL*12+NVL(COMM,0) AS ANNSAL
FROM EMP;

-- " " 로 별칭 부여하기
-- AS 는 일괄적으로 대문자로 출력
-- 대소문자를 구별하고 싶으면 " " 사용
-- " " 은 별칭에 공백문자나 특수 문자를 포함시킬 수 있음

SELECT ENAME,SAL*12+NVL(COMM,0) " A N N S A L "
FROM EMP;

-- 별칭 한글로 사용
-- 테이블을 생성할 때 컬럼을 설정하면서 컬럼 이름도 한글로 부여 가능

SELECT ENAME, SAL*12+NVL(COMM,0) "연봉"
FROM EMP;

SELECT DEPTNO,DNAME
FROM DEPT;

-- 별칭 사용

SELECT DEPTNO "부서번호", DNAME "부서명"
FROM DEPT;

-- Concatenation 연산자의 정의와 사용        concatenation
-- Concatenation 의 사전적 의미는 연결
-- 여러 개의 컬럼을 연결할 때 사용
-- 연산자로 " || " 수직바 사용
-- 영어 문장처럼 보이도록 하기 위해 “||”를 컬럼과 문자열 사이에 기술하여 하나로 연결하여 출력

SELECT ENAME ||' IS A '||JOB
FROM EMP;

-- DISTINCT 키워드                         distinct
-- 중복되는 번호를 한번씩만 출력하기 위한 키워드

SELECT DEPTNO
FROM EMP;

-- DISTINCT 사용

SELECT DISTINCT DEPTNO
FROM EMP;

SELECT JOB
FROM EMP;

-- DISTINCT 사용

SELECT DISTINCT JOB
FROM EMP;

-- SQL*PLUS 명령어의 개념
-- SQL문을 실행시키고 그 결과를 볼 수 있도록 오라클에서 제공하는 툴
-- SQL은 데이터베이스에서 자료를 검색, 수정, 삭제 하는 데이터베이스 언어
-- SQL*PLUS는 툴에서 출력 형식을 지정하는 환경을 설정

-- LIST (L, list)           버퍼에 저장된 SQL문의 편집 명령
-- RUN(R) , @ , /           SQL문 또는 PL/SQL을 실행하는 명령
-- SAVE, GET, EDIT, SPOOL   스크립트 파일을 저장하는 명령
-- HOST, EXIT               데이터베이스 접속 및 종료
-- LINE, PAGE               검색결과에 대한 보고서 형태의 출력 형식 설정

-- LIST (L)                 버퍼에 저장된 모든 SQL 문 또는 검색한 라인의 SQL 문을 나타냄
-- /                        SQL문을 보여주지 않고 바로 실행
-- RUN(R)                   버퍼에 저장된 SQL문을 보여주고 실행
-- HOST                     DOS 환경으로 나가도록하는 명령
-- EXIT                     SQL*PLUS 로 돌아가기 위한 명령

--  연봉을 계산하기 위한 쿼리문을 작성
--  다시 한번 출력하기 위한 LIST 명령어를 수행


SELECT ENAME, SAL*12+NVL(COMM,0)
FROM EMP;

-- SQL*PLUS 명령어
-- LIST
--  /
--  R

-- SQL*PLUS 파일 명령어
-- 보관중인 명령 버퍼의 내용을 영구적으로 기록하기 위해 파일에 저장하는 명령어

-- EDIT(ED)     파일의 내용을 vi(유닉스)나 notepad(윈도우즈)와 같은 에디터로 읽어 편집
/* HOST         오라클을 종료하지 않고 OS 명령을 수행할 수 있도록 
                OS 환경으로 잠시 빠져나갈 수 있도록 함.
                OS Prompt 상에서 EXIT 하면 다시 오라클 환경으로 돌아옴 */
-- SAVE         SQL 버퍼 내의 현재 내용을 실제 파일로 저장
-- SAVE TEMP REPLACE    이미 존재하는 파일에 새로운 내용을 덮어씀
-- SVAE TEMP APPEND     명령문을 추가

-- @            SQL 파일에 저장된 내용을 실행
-- SPOOL        오라클 화면을 갈무리하여 파일로 저장
-- EX)SPOOL B001 -> SELECT * FROM DEPT; -> SELECT * FROM EMP; -> 
--                  SPOOL OFF -> HOST -> DIR -> EXIT
-- GET          파일의 내용을 SQL 버퍼로 읽어들임.
-- EXIT         오라클을 종료

-- HEADING      SELECT 명령어를 수행한 후 실행결과가 출력될 때 
--(ON | OFF)    컬럼의 제목을 출력할 것인지의 여부를 제어

-- LINESIZE     SELECT 명령어를 수행한 후 
--              결과를 출력할 때 한 라인에 출력할 최대 문자(Character) 수   

-- PAGESIZE     SELECT 명령어를 수행한 후 
--              결과를 출력할 때 한 페이지에 출력할 최대 라인 수를 결정

-- COLUMN FORMAT    칼럼 데이터에 대한 출력 형식을 다양하게 지정하기 위한 명령어
-- 문자형식 컬럼의 출력 길이 조정
-- COLUMN ENAME FORMAT A25
-- 숫자 7자리로 설정하되 남는 자리는 공란으로 채우도록 하고,
-- COLUMN SAL FORMAT 9,999,999
-- 커미션 컬럼을 7자리로 주되 남는 자리는 0으로 채우도록 함
-- COLUMN COMM FORMAT 0,000,000
