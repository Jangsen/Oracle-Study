-- ���� ������ �⺻ ����
-- SCOTT�� �μ����� �˾Ƴ��� ���� ���� ������

-- ���� ����
-- ( ) ��������

SELECT DNAME FROM DEPT
WHERE DEPTNO = ( SELECT DEPTNO
                 FROM EMP
                 WHERE ENAME = 'SCOTT');
                 
-- ���� ������ �ϳ��� SELECT ������ �� �ȿ� ���Ե� �� �ϳ��� SELECT ����
-- ���� ������ �����ϰ� �ִ� �������� ���� ����, ���Ե� �� �ϳ��� ������ ���� ����
-- ���� ������ �� �������� �����ʿ� ����ؾ� �ϰ� �ݵ�� ��ȣ�� �ѷ��׾ƾ� ��
-- ���� ������ ���� ������ ����Ǳ� ������ �ѹ��� ����

-- ���� �� ���� ���� (singlr row)
-- ���� ��(Single Row) ���� ������ ���� ����� 
-- ���� �ϳ��� �ο�(��, row)���� ��ȯ�ϴ� ���� ������ ���� ��
-- ���� �� ���� ������������
-- ���� �ϳ��� �ο�(��, row)�� ��ȯ�Ǵ� ���� ������ ����� ���� ������ ������ ��
-- ���� ������ WHERE �������� ���� �� �� �������� =, >, >=, <, <=, <>�� ����ؾ� ��

-- SCOTT�� ���� �μ����� �ٹ��ϴ� ����� �̸��� �μ� ��ȣ�� ����ϴ� SQL ���� �ۼ�

SELECT *
FROM EMP
WHERE JOB = ( SELECT JOB
              FROM EMP
              WHERE ENAME = 'SCOTT');

-- SCOTT�� ������ ������ ���� ����� ����ϴ� SQL ���� �ۼ�

SELECT ENAME, JOB -- ����������
FROM EMP
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'SCOTT' ); -- ����������
              
-- SCOTT�� �޿��� �����ϰų� �� ���� �޴� ��� ��� �޿��� ���

SELECT *
FROM EMP
WHERE SAL >= (SELECT SAL
              FROM EMP
              WHERE ENAME = 'SCOTT');
              
-- DALLAS���� �ٹ��ϴ� ����� �̸�, �μ� ��ȣ�� ����Ͻÿ�

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                 FROM DEPT
                 WHERE LOC = 'DALLAS');

-- SALES(������) �μ����� �ٹ��ϴ� ��� ����� �̸��� �޿��� ���

SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');
                
-- ���ӻ���� KING�� ����� �̸��� �޿��� ���

SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');
             
-- ���� �������� �׷� �Լ��� ���
-- ��� �޿��� ���ϴ� �������� ���� ������ ���
-- ��� �޿����� �� ���� �޿��� �޴� ����� �˻��ϴ� ����

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ( SELECT AVG(SAL)
              FROM EMP);
              
              
-- ���� �� ���� ����

-- ���� �������� ��ȯ�Ǵ� ����� �ϳ� �̻��� ���� �� ����ϴ� ���� ����
-- ���� �� ���� ������ �ݵ�� ���� �� ������(Multiple Row Operator)�� �Բ� ���

--  in
-- IN           ���� ������ �� ����(��=�� �����ڷ� ���� ���)�� 
--              ���� ������ ��� �߿��� �ϳ��� ��ġ�ϸ� ��

--  any, some
-- ANY, SOME    ���� ������ �� ������ 
--              ���� ������ �˻� ����� �ϳ� �̻��� ��ġ�ϸ� ��
-- ANY�� ã���� ���� ���ؼ� �ϳ��� ũ�� ���� �Ǵ� ��
-- ã���� �� �߿��� ���� ���� �� ��, �ּҰ� ���� ũ�� ��

-- all
-- ALL          ���� ������ �� ������
--              ���� ������ �˻� ����� ��� ���� ��ġ�ϸ� ��
-- ã���� ���� ���ؼ� AND ������ �ؼ� ��� ���̸� ���� �Ǵ� ��
-- > ALL �� ����� �񱳰� ���� ũ�ġ� �� ���� ���� �ǹǷ� �ִ밪���� �� ũ�� ��

-- exist
-- EXIST        ���� ������ �� ������
--              ���� ������ ��� �߿��� �����ϴ� ���� �ϳ��� �����ϸ� ��

-- ����� 2�� �̻� �������� �������� ���� ������ ����� ���
-- ���� �� �����ڿ� �Բ� ���

/* �־��� ������ 3000 �̻� �޴� ����� �Ҽӵ� �μ�(10��, 20��)�� 
   ������ �μ����� �ٹ��ϴ� ����̱⿡ ���� ������ ��� �߿���
   �ϳ��� ��ġ�ϸ� ���� ����� ���ϴ� IN �����ڿ� �԰� ���Ǿ���� */

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DISTINCT DEPTNO
                 FROM EMP
                 WHERE SAL >= 3000);
                 
-- �μ����� ���� �޿��� ���� �޴� ����� ����(��� ��ȣ, ����̸�, �޿�, �μ���ȣ)�� ���

SELECT EMPNO, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
              FROM EMP
              GROUP BY DEPTNO);

-- ����(JOB)�� MANAGER�� ����� ���� �μ��� �μ� ��ȣ�� �μ���� ������ ���

SELECT *
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE JOB = 'MANAGER');

-- 30�� �Ҽ� ����� �߿��� 
-- �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸�, �޿��� ���

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL (SELECT SAL
                 FROM EMP
                 WHERE DEPTNO = 30);

-- ���� ����麸�� �޿��� ���� �޴� ������� �̸��� �޿��� ��� / �м����� ���X

SELECT ENAME ,SAL, JOB
FROM EMP
WHERE SAL > ALL (SELECT SAL
                 FROM EMP
                 WHERE JOB = 'SALESMAN')
AND JOB <> 'ANALYST';

-- ������ �μ���ȣ�� 30���� ������� �޿� �� 
-- ���� ���� ��(950)���� ���� �޿��� �޴� ����� �̸�, �޿��� ���

SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL
                 FROM EMP
                 WHERE DEPTNO = 30);
                 
-- ���� ������� �ּ� �޿� ���� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ���
-- ���� ����� ���X

SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL >= ANY (SELECT SAL
                  FROM EMP
                  WHERE JOB = 'SALESMAN')
                  AND JOB <> 'SALEMAN';
-- 8�� �ǽ�����           
-- �����ȣ�� 7788�� ����� ��� ������ ���� ����� ǥ�� (��� �̸��� ��� ����)

SELECT ENAME, JOB, EMPNO    -- MAIN
FROM EMP
WHERE JOB = (SELECT JOB     -- SUB
             FROM EMP
             WHERE EMPNO = 7788)
AND EMPNO <> 7788;

-- �����ȣ�� 7499�� ������� �޿��� ���� ����� �̸��� ��� ������ ǥ�� 
SELECT SAL, ENAME, JOB, EMPNO
FROM EMP
WHERE EMPNO = 7499;

SELECT ENAME, JOB, SAL, EMPNO
FROM EMP
WHERE SAL > (SELECT SAL
             FROM EMP
             WHERE EMPNO = 7499);
             
-- �ּ� �޿��� �޴� ����� �̸�, ��� ���� �� �޿��� ǥ�� (�׷��Լ� ���)
SELECT ENAME, JOB, SAL          --����
FROM EMP
WHERE SAL = (SELECT MIN(SAL)    --����
             FROM EMP);

-- ������ ��� �޿��� ���� ���� ��� ������ ã�� ������ ��� �޿��� ǥ��
SELECT JOB ����, AVG(SAL) ��ձ޿�
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


-- �� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ��

SELECT E.ENAME ����̸�, E.SAL �޿�, E.DEPTNO �μ���ȣ
FROM EMP E
WHERE SAL IN (SELECT MIN(SAL)       --MIN == �׷��Լ� == GROUP BY �÷�
              FROM EMP E            --IN
              GROUP BY E.DEPTNO);

SELECT MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

              
-- �������� �м���(analyst)�� ������� �޿��� �����鼭 
-- ������ ��������� �ƴ� ������� �����ȣ,�̸�,�������� ǥ��

SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE SAL < ANY (SELECT SAL
                 FROM EMP
                 WHERE JOB = 'ANALYST')
AND JOB <> 'SALESMAN';

-- "ANY" Ű����� �� �����ڿ� �Բ� ���
-- EX) " = ANY " , " <> ANY " , " > ANY "

-- ���������� ���� ����� �̸��� ǥ��

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


-- "IN" Ű����� �ܺ� ������ ����� ���������� ��� �� �ϳ��� ��ġ�ϴ� ��츦 ����

-- ���������� �ִ� ����� �̸��� ǥ��

SELECT ENAME
FROM EMP
WHERE EMPNO  IN (SELECT EMPNO
                FROM EMP
                WHERE MGR IS NOT NULL);

-- BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ�

SELECT ENAME �̸�, HIREDATE �Ի���, DEPTNO �μ�
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'BLAKE')
AND ENAME <> 'BLAKE';

-- �޿��� ��ձ޿� ���� ���� ������� �����ȣ�� �̸��� ǥ��,
-- ����� �޿��� ���ؼ� �������� ����

SELECT EMPNO �����ȣ,ENAME �̸�, SAL �޿�
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP)
ORDER BY SAL DESC;


SELECT EMPNO �����ȣ, ENAME ����̸�, SAL �޿�
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP)
ORDER BY SAL ASC;
             

-- �̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� �̸��� ǥ��
SELECT * FROM EMP;

SELECT EMPNO �����ȣ,ENAME ����̸�
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                 FROM EMP
                 WHERE ENAME LIKE '%K%')
AND ENAME NOT LIKE '%K%';

-- �μ� ��ġ�� DALLAS�� ����� �̸��� �μ���ȣ �� ��� ������ ǥ��

SELECT E.ENAME �̸�, E.DEPTNO �μ���ȣ, E.JOB ����,D.LOC �μ���ġ
FROM EMP E, DEPT D
WHERE E.DEPTNO IN (SELECT DEPTNO
                  FROM DEPT
                  WHERE D.LOC = 'DALLAS')
AND D.LOC LIKE 'DALLAS';

--  " = " �� ����� �ϳ� �϶�, " IN " �� ����� �ϳ� �̻��϶�
SELECT * FROM EMP;
SELECT * FROM DEPT;

-- KING ���� �����ϴ� ����� �̸��� �޿��� ǥ��

SELECT ENAME ����̸�,SAL �޿�
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');
             
-- RESEARCH �μ��� ����� ���� �μ���ȣ, ����̸� �� ��� ������ ǥ��
SELECT * FROM DEPT;


SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
               FROM DEPT
               WHERE DNAME = 'RESEARCH');

-- ��� �޿����� ���� �޿��� �����鼭 ��ü ��� �� �̸��� M�� ���Ե� �����
-- ���� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �޿��� ǥ��

SELECT EMPNO,ENAME,SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP)
AND DEPTNO IN (SELECT DEPTNO
               FROM EMP
               WHERE ENAME LIKE '%M%');

-- ��� �޿��� ���� ���� ���� ã��

SELECT JOB ����, AVG(SAL) ��ձ޿�
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) = (SELECT MIN(AVG(SAL))
                   FROM EMP
                   GROUP BY JOB);
SELECT AVG(SAL)
FROM EMP
GROUP BY JOB;   -- �׷캰 ���

-- �׷�� �׷� == HAVING �� ���

SELECT MIN(AVG(SAL))
FROM EMP
GROUP BY JOB;   -- ��� �޿��� ���� ���� ���� SUB

SELECT JOB,AVG(SAL)
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) = (SELECT MIN(AVG(SAL))
FROM EMP
GROUP BY JOB);

-- ��� ������ MANAGER�� �ƴϸ鼭 ���������� �ִ� ����� �̸�

SELECT ENAME, JOB
FROM EMP
WHERE EMPNO IN(SELECT MGR
               FROM EMP
               WHERE MGR IS NOT NULL)
AND JOB <> 'MANAGER';

