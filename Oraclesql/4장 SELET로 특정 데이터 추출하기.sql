-- WHERE 조건과 비교 연산자    ==================== where
-- 원하는 로우만 얻으려면 다음과 같이 로우를 제한하는 조건을
-- SELECT 문에 WHERE 절을 추가하여 제시

SELECT *
FROM EMP
WHERE DEPTNO = 10;

-- 조건절은 세 부분으로 구성이 됨

--      WHERE       SAL        >=       3000;
--                  컬럼      연산자     비교대상값

-- 비교 연산자

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

-- WHERE 절을 이용한 조건 검색           where

SELECT * FROM EMP
WHERE DEPTNO = 10;

-- 급여가 1500 이하인 사원의 사원번호, 사원 이름, 급여를 출력하는 SQL 문을 작성

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL <= 1500;

-- 문자데이터 조회 
-- 급여가 아닌 사원 이름 같은 문자 데이터를 조회

-- 이름이 FORD인 사원의 사원번호(EMPNO)과 사원이름(ENAME)과 급여(SAL)을 출력

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME = 'FORD';

-- 문자열이나 날짜는 반드시 단일 따옴표(single quotation)  '  ' 안에 표시
-- SQL문에 사용되는 키워드인 SELECT 나 FROM 이나 WHERE 등은 대소문자를 구별하지 않지만 
-- 테이블 내에 저장된 데이터 값은 대소문자를 구분

-- 사원이름이 SCOTT 인 사원의 사원번호, 사원 이름, 급여를 출력하는 SQL 문을 작성

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME = 'SCOTT';

-- 날짜 데이터 조회            date
-- 날짜는 문자열과 마찬가지로 단일 따옴표 안에 기술

-- 1982년 1월 1일 이전에 입사한 사원을 출력하는 예제

SELECT *
FROM EMP
WHERE HIREDATE <= '1982/01/01';

-- 논리 연산자

--    AND     두 가지 조건을 모두 만족해야만 검색 가능

SELECT *
FROM EMP
WHERE DEPTNO = 10 AND JOB = 'MANAGER';

--    OR      두 가지 조건 중에서 한 가지만 만족하더라고 검색 가능

SELECT *
FROM EMP
WHERE DEPTNO = 10 OR JOB = 'MANAGER';
    
--    NOT     조건에 만족하지 못하는 것만 검색     

SELECT *
FROM EMP
WHERE NOT DEPTNO = 10;

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