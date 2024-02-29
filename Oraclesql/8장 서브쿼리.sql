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

