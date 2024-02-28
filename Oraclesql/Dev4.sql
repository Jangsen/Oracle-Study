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