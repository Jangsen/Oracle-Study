-- ======================= CHAPTER.2_혼자 해보기 ================================

-- 1. 덧셈 연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 개산한 후
--    사원의 이름, 급여, 인상된 급여를 출력

SELECT ENAME, SAL ,SAL+300
FROM EMP;

-- 2. 사원의 이름, 급여, 연간 총수입을 총 수입이 많은 것부터 작은 순으로 출력.
--    연간 총수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산

SELECT ENAME 이름, SAL 급여, SAL*12 "연간 총수입", SAL*12+100 "연간 총수입 + 100"
FROM EMP
ORDER BY SAL DESC;

-- 3. 급여가 2000을 넘는 사원의 이름과 급여를 출력
--    (급여가 많은것부터 작은순)

SELECT ENAME, SAL
FROM EMP
WHERE SAL > 2000
ORDER BY SAL DESC;

-- 4. 사원 번호가 7788인 사원의 이름과 부서번호를 출력

SELECT ENAME, DEPTNO
FROM EMP
WHERE EMPNO = 7788;

-- 5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력

SELECT ENAME, SAL
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- 6. 1981년 2월 20일 부터 1981년 5월 1일 사이에 입사한 사원의 이름, 담당 업무, 입사일을 출력

SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981/02/20' AND '1981/05/01';

-- 7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력하되,
--    이름을 기준(내림차순)으로 영문자 순으로 출력

SELECT ENAME,DEPTNO
FROM EMP
WHERE DEPTNO IN(20,30)
ORDER BY ENAME DESC;

SELECT ENAME,DEPTNO
FROM EMP
WHERE DEPTNO=20 OR DEPTNO=30
ORDER BY ENAME DESC;

-- 8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20또는 30인 사원의
--    이름 ,급여, 부서번호를 출력하되 이름 순(오름차순)으로 출력

SELECT ENAME,SAL,DEPTNO
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000
AND DEPTNO IN(20,30)
ORDER BY ENAME ASC;

-- ASC 생략 가능

-- 9. 1981년도에 입사한 사원의 이름과 입사일을 출력(like 연산자와 와일드 카드 사용)

SELECT ENAME,HIREDATE
FROM EMP
WHERE HIREDATE LIKE '81%';

-- 10. 관리자가 없는 사원의 이름과 담당 업무를 출력

SELECT ENAME, JOB
FROM EMP
WHERE MGR IS NULL;

-- 11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되
--     급여 및 커미션을 기준으로 내림차순 정렬하여 표시

SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY COMM DESC;

-- 12. 이름의 세 번째 문자가 R인 사원의 이름을 표시

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__R%';

-- 13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시

SELECT ENAME
FROM EMP
WHERE ENAME LIKE'%A%'
AND ENAME LIKE'%E%';

-- 14. 담당 업무가 사무원(CLERK) 또는 영업사원(SALESMAN)이면서
--     급여가 $1600,$950 또는 $1300이 아닌 사원의 이름, 담당 업무, 급여를 출력

SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB IN('CLERK','SALESMAN')
AND SAL NOT IN(1600,950,1300);

-- 15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력

SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM >= 500;

-- 16. 커미션이 없는 사원 출력

SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NULL;