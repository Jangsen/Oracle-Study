-- �׷� �Լ�
-- SUM      �׷��� ���� �հ�
-- AVG      �׷��� ���
-- COUNT    �׷��� �� ����
-- MAX      �׷��� �ִ밪
-- MIN      �׷��� �ּҰ�
-- STDDEV   �׷��� ǥ������
-- VARIANCE �׷��� �л�

-- �հ踦 ���ϴ� SUM �Լ�
-- SUM �Լ��� �ش� Į�� ���鿡 ���� ������ ���ϴ� �Լ�(SCOTT.SQL)

SELECT SUM(SAL)
FROM EMP;

-- Ŀ�̼� �Ѿ� ���ϱ�

SELECT SUM(COMM)
FROM EMP;

-- NULL�� ��Ȧ NULL�� ������ �÷��� ������ ����� NULL�̶�� ��
-- Ŀ�̼��� ������ ���ص� NULL ������ ��� ���� ����
-- WHY? �׷� �Լ��� �ٸ� �����ڿʹ� �޸� �ش� �÷� ���� NULL �� ���� �����ϰ� ���

-- ����� ���ϴ� AVG �Լ�
-- AVG �Լ��� �ش� Į�� ���鿡 ���� ����� ���ϴ� �Լ�
-- �̶� �ش� Į�� ���� NULL �� �Ϳ� ���ؼ��� �����ϰ� ���

-- �޿� ��� ���ϱ�(avg)
SELECT AVG(SAL)
FROM EMP;

-- �ִ밪�� ���ϴ� MAX , �ּҰ��� ���ϴ� MIN (max, min)
-- ���� ���� �޿��� ���� ���� �޿��� ���ϱ�

SELECT MAX(SAL),MIN(SAL)
FROM EMP;

-- �׷��Լ��� �ܼ� �÷�

-- ������� �ִ� �޿�
SELECT MAX(SAL)
FROM EMP;

-- ENAME �÷��� �߰��ϸ� ���� �߻�
SELECT ENAME, MAX(SAL)
FROM EMP;

-- ���� �ֱٿ� �Ի��� ����� �Ի��ϰ� �Ի����� ���� ������ ����� �Ի����� ���
SELECT MAX(HIREDATE)"�ֱ� �Ի���",MIN(HIREDATE)"���� �Ի���"
FROM EMP;

-- �ο�(ROW) ���� ���ϴ� COUNT �Լ� (count)
-- COUNT �Լ��� ���̺��� ������ �����ϴ� ���� ������ ��ȯ�ϴ� �Լ�
-- COUNT �Լ��� Ư�� Į���� ����ϸ� �ش� Į�� ���� ���� �ִ� �ο��� ������ ���
-- COUNT �Լ��� NULL ���� ���ؼ��� ������ ���� ����
-- COUNT �Լ��� COUNT(*)ó�� *�� �����ϸ� ���̺��� ��ü �ο� ���� ���ϰ� ��

-- ��� ���̺��� ����� �߿��� Ŀ�̼��� ���� ����� �� ���ϱ�
SELECT COUNT(COMM)
FROM EMP;

-- ��ü ����� ���� Ŀ�̼��� �޴� ����� ���� ���ϱ�
SELECT COUNT(*),COUNT(COMM)
FROM EMP;

-- źź�� ������
-- 10�� �μ� �Ҽ� ����߿��� Ŀ�̼��� �޴� ����� �� ���ϱ�
SELECT COUNT(COMM)
FROM EMP
WHERE DEPTNO = 10;

-- ��� ���̺��� ������� ������ ������ ī��Ʈ
SELECT COUNT(JOB)
FROM EMP;

-- ������ �����, �ߺ����� ���� ������ ������ ī��Ʈ
-- �ߺ� �� ���� Ű���� DISTINCT

SELECT COUNT(DISTINCT JOB)"���� ��"
FROM EMP;

-- GROUP BY �� (group by)
-- �׷��Լ��� ���� � Į�� ���� �������� �׷��Լ��� ������ ���
-- GROUP BY �� �ڿ� �ش� �÷��� ���

/*  SELECT �÷���, �׷��Լ�
    FROM ���̺��
    WHERE ����(������)
    GROUP BY �÷��� */
    
-- �հ�, ��, �ִ밪, �ּҰ� ���� � �÷��� �������� �� �÷��� �� ���� ������ �� ��
-- GROUP BY �� �ڿ� �ش� �÷��� ���
-- GROUP BY ���� ����� �� ������ ��
-- �÷��� ��Ī ��� �Ұ�
-- �ݵ�� �÷����� ���

-- ��� ���̺��� �μ� ��ȣ�� �׷�����
-- �׷����� ���� �μ���ȣ ���̺�
SELECT DEPTNO
FROM EMP;

-- �׷����� �μ���ȣ ���̺�
SELECT DEPTNO
FROM EMP
GROUP BY DEPTNO;

-- �μ��� ��� �޿��� ���ϱ�
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

-- �μ��� �ִ� �޿��� �ּ� �޿� ���ϱ�
SELECT DEPTNO, MAX(SAL),MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

-- �μ��� ��� ���� Ŀ�̼��� �޴� ��� �� ���
SELECT DEPTNO, COUNT(*),COUNT(COMM)
FROM EMP
GROUP BY DEPTNO;

SELECT * FROM EMP;

-- HAVING ���� (having)
-- WHERE == SELECT ���� ������ ����Ͽ� ����� ������ ��
-- HAVING == �׷��� ����� ������ ��

/*  �μ����� �׷��� ���� ��(GROUP BY)
    �׷� ������ �μ��� ��� �޿�(AVG(SAL))�� 2000 �̻��� (HAVING AVG(SAL) >= 2000)
    �μ���ȣ�� �μ��� ��� �޿��� ��� */
    
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;

-- �μ��� �ִ�޿��� �ּұ޿��� ���ϰ�, �ִ� �޿��� 2900 �̻��� �μ��� ����ϱ�

SELECT DEPTNO,MAX(SAL),
              MIN(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) >= 2900;

-- JOIN ������ �ʿ伺
-- Ư�� �μ� ��ȣ�� ���� �μ��̸��� ���������� �μ�(DEPT) ���̺� ����
-- Ư�� ����� ���� �μ����� �˾Ƴ��� ���ؼ��� �μ� ���̺��� ������ ���;���
-- SCOTT ����� �ҼӵǾ� �ִ� �μ��� �̸��� �������� �˾ƺ���.
-- SCOTT�̶� ����� �μ����� �˾Ƴ��� ����
-- ��� ���̺��� SCOTT�� �Ҽӵ� �μ� ��ȣ�� �˾Ƴ� ��
-- �μ� ���̺��� �ش� �μ� ��ȣ�� ���� �μ����� ��� �;���
-- JOIN �� �� �� �̻��� ���̺��� �����ؾ� ���ϴ� ����� ���� �� ������
-- �ѹ��� ���Ƿ� ���ϴ� ����� ���� �� �ִ� ���

-- CROSS JOIN (cross join)
-- Cross Join���� 
-- Ư���� Ű���� ���� SELECT ���� 
-- FROM ���� ���(EMP) ���̺�� �μ�(DEPT) ���̺��� 
-- �޸��� �����Ͽ� �����Ͽ� ����� �� ����

SELECT *
FROM EMP, DEPT;

-- Cross Join�� ��� ������� �÷��� ���� 
-- ��� ���̺��� �÷��� ��(8)�� �μ� ���̺��� �÷��� ���� ���� ���̹Ƿ� 11�� ��
-- Cross Joim�� ����� ����
-- ��� ���̺��� �μ��� ���� �������� ������ �Ǿ���.
-- ������, ������ �� �� �ƹ��� ������ �������� �ʾұ� ������
-- ��� �Ѹ� ���� DEPT ���̺��� 4���� �ο�� ���յ� ���·� �������
-- �׷��� ������ Cross Join�� �ƹ��� �ǹ̸� ���� ����
-- JOIN ����� �ǹ̸� �������ؼ��� ������ �� �����ؾ���.

-- JOIN�� ���� (join)
-- Equi Join        ���� �÷��� �������� ����
-- Non-Equi Join    ���� �÷� ���� �ٸ� ������ ����Ͽ� ����
-- Outer Join       ���� ���ǿ� �������� �ʴ� �൵ �����ؼ� ��Ÿ��
-- Seif Join        �� ���̺� ������ ����

-- EQUI JOIN�� ���� ���� ����ϴ� ���� ��� (equi join)
/* ���� ����� �Ǵ� �� ���̺��� 
   ���������� �����ϴ� �÷��� ���� ��ġ�Ǵ� ���� �����Ͽ� ����� ���� */

/* ���(EMP) ���̺�� �μ�(DEPT) ���̺��� ���� �÷��� DEPTNO�� ���� 
   ��ġ(=)�Ǵ� ������ WHERE ���� ����Ͽ� ��� */
-- ���̺��� �����Ϸ��� ��ġ�Ǵ� ���� �÷��� ���
-- �÷��� �̸��� ���� �Ǹ� ȥ���� ���� ������ �÷� �̸� �տ� ���̺� �̸��� ���

SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT E.ENAME �����, E.DEPTNO �μ���ȣ, D.DNAME �μ��̸�
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.ENAME = 'SCOTT';

-- �� ���̺��� ������ ���
/* ����� ���캸�� ������ ���� �μ� ��ȣ�� �������� ���� ���� ���� ��� ���̺��� �÷��� 
   �μ� ���̺��� �÷��� ���� */

-- Equi Join�� AND �����ϱ� (and)

-- �̸��� SCOTT�� ����� �μ����� ����ϱ�

SELECT ENAME, DNAME
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND ENAME = 'SCOTT';

-- �÷����� ��ȣ�� �ذ�

-- �� ���̺� ������ �̸��� �÷��� ����ϸ� ��� ���̺� �Ҽ����� �Һи���
-- �׷��� ������ �ָŸ�ȣ�� ���¶�� ���� �޼����� ��µ�

SELECT ENAME, DANAME, EMP.DEPTNO
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND ENAME = 'SCOTT';

-- �̷��� ������ �ذ��ϱ� ���� ���
-- ������ �̸��� �÷��� �÷� �� �տ� ���̺� ���� ��������� ����ؼ�
-- �÷��� ��� ���̺� �Ҽ����� ������ �� �ְ� ��

SELECT EMP.ENAME, DEPT.DNAME, EMP.DEPTNO
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND ENAME = 'SCOTT';

-- ���̺� ��Ī �ο��ϱ�
-- ���̺� �̸��� ��Ī�� ���̴� ���
-- FROM �� ������ ���̺� �̸��� ����ϰ� ������ �� ������ ��Ī�� ����

SELECT E.ENAME, D.DNAME, E.DEPTNO, D.DEPTNO
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.ENAME = 'SCOTT';

-- ���忡�� �ٹ��ϴ� ����� �̸��� �޿��� ����ϱ�

SELECT E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.LOC = 'NEW YORK';

-- ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ���

SELECT E.ENAME, E.HIREDATE
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.DNAME = 'ACCOUNTING';

-- ������ MANAGER�� ����� �̸�, �μ����� ���

SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.JOB = 'MANAGER';

-- Non-Equi Join
-- Non-Equi Join�� ���� ���ǿ� Ư�� ���� ���� �ִ����� �����ϱ� ���ؼ�
-- WHERE ���� ���� ������ = ������ �̿��� �� �����ڸ� ���

SELECT * FROM SALGRADE;

SELECT ENAME,SAL,GRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL;

-- Self Join (self join)
-- �� �� �̻��� ���� �ٸ� ���̺��� ���� �����ϴ� �ͻӸ� �ƴ϶�,
-- �ϳ��� ���̺� ������ ������ �ؾ߸� ���ϴ� �ڷḦ ��� ��찡 ����
-- Self Join�̶� �� �״�� �ڱ� �ڽŰ� ������ �δ� ��

-- SMITH�� �Ŵ��� �̸��� �������� �˾Ƴ����� ��� ���ؾ� �ұ�?

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

-- �Ŵ����� KING�� ������� �̸��� ������ ���
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

-- SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸��� ���

SELECT E1.ENAME, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.DEPTNO = E2.DEPTNO
AND E1.ENAME = 'SCOTT';

SELECT E1.ENAME, E1.EMPNO "������ ���", E2.ENAME "������ �̸�"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

-- Outer Join (outer join)
-- Self Join���� KING�� ����� ������ ��������
-- MGR �÷��� ���� NULL �̱� ����
-- �ÿ� ��ȣ(EMPNO)�� NULL �� ����� �����Ƿ� JOIN���ǿ� �������� �ʱ� ����
-- JOIN���ǿ� �������� ���Ͽ����� �ش� �ο츦 ��Ÿ���� ������ ����ϴ� ����
-- �ܺ� ���� (OUTER JOIN) 
-- �ܺ� ������ NULL ���̱⿡ ������ ���� ����� ���Խ�ų�� ����
-- "(+)" ��ȣ�� ���� ���ǿ��� ������ ������ �÷� �̸��ڿ� ������

SELECT E1.ENAME, E1.EMPNO "������ ���", E2.ENAME "������ �̸�"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

SELECT E.ENAME || '�� �Ŵ�����'
              || MANAGER.ENAME ||'�Դϴ�'
FROM EMP E,EMP MANAGER
WHERE E.MGR = MANAGER.EMPNO(+);

-- ��� ���̺�� �μ� ���̺��� ����
-- ����̸��� �μ���ȣ�� �μ����� ���
-- �μ� ���̺��� 40�� �μ��� ������ ��� ���̺��� �μ���ȣ�� ������
-- 40�� �μ��� �μ� �̸��� ��µǵ��� �������� �ۼ�

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
-- FROM ������ INNER JOIN�̶� �ܾ ���
-- ������ ���̺� �̸��� ���
-- ON ���� ����Ͽ� ���� ������ ���

-- SELECT *
-- FROM TABLE1 INNER JOIN TABLE2
-- ON TABLE1.COLUMN1 = TABLE2.COLUMN2;

SELECT ENAME, DNAME
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE ENAME = 'SCOTT';


-- USING�� �̿��� ���� ���� �����ϱ� (using)
-- �� ���̺� ���� ������ ������ �÷��� �̸��� �����ϴٸ� 
-- USING������ ������ �÷��� �����Ͽ� ������ �� �����ϰ� ǥ�� �� �� ����

-- SELECT * FROM TABLE1 JOIN TABLE2
-- USING (DEPTNO);

-- EMP�� DEPT�� DEPTNO �̶�� ���� �̸��� �÷��� �ֱ⶧���� USING�� ����� �� ����

SELECT E.ENAME, D.DNAME
FROM EMP E INNER JOIN DEPT D
USING (DEPTNO);

-- ANSI NATURAL JOIN (ansi natural join)

-- SELECT *
-- FROM TABL1 NATURAL JOIN TABLE2

-- EMP�� DEPT�� DEPTNO ��� ���� �̸��� �÷��� �ֱ� ������ 
-- �����ϰ� ���ι��� ����� �� ����. 

SELECT E.ENAME, D.DNAME
FROM EMP E NATURAL JOIN DEPT D;

-- ANSI Outer Join (ansi outer join)
-- Outer Join�� �� ���� Ÿ���� ������ ���� 
-- LEFT Outer Join, 
-- RIGHT Outer Join 
-- FULL Outer Join

-- SELECT *
-- FROM TABLE1
-- [LEFT | RIGHT | FULL] OUTER JOIN TABLE2

--Outer Join�� ��� ���� ���̺��� �ش��ϴ� �����Ͱ� �����ϴµ�
-- �ٸ� �� ���̺��� �����Ͱ� �������� ���� ��� 
-- �� �����Ͱ� ��µ��� �ʴ� �������� �ذ�

-- �μ���ȣ�� �μ����� �÷����� ���� DEPT01 ���̺��� ����
CREATE TABLE DEPT01( 
DEPTNO NUMBER(2), 
DNAME VARCHAR2(14)); 
-- ������ �߰�
INSERT INTO DEPT01 VALUES(10,'ACCOUNTING');
INSERT INTO DEPT01 VALUES(20,'SALES');

-- �μ���ȣ�� �μ����� �÷����� ���� DEPT02 ���̺��� ����

CREATE TABLE DEPT02( 
DEPTNO NUMBER(2), 
DNAME VARCHAR2(14)); 
-- ������ �߰�
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