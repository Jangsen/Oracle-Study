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
