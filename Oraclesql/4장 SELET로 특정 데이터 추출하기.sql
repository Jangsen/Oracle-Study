-- WHERE ���ǰ� �� ������    ==================== where
-- ���ϴ� �ο츸 �������� ������ ���� �ο츦 �����ϴ� ������
-- SELECT ���� WHERE ���� �߰��Ͽ� ����

SELECT *
FROM EMP
WHERE DEPTNO = 10;

-- �������� �� �κ����� ������ ��

--      WHERE       SAL        >=       3000;
--                  �÷�      ������     �񱳴��

-- �� ������

--    =       ����.

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL = 3000;

--    >       ���� ũ��.

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > 3000;    

--    <       ���� �۴�.

    SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < 3000;

--    >=      ���� ũ�ų� ����.

    SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL >= 3000;

--    <=      ���� �۰ų� ����.

    SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL <= 3000;

-- <>, !=, ^=      �ٸ���.

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL <> 3000;

-- WHERE ���� �̿��� ���� �˻�           where

SELECT * FROM EMP
WHERE DEPTNO = 10;

-- �޿��� 1500 ������ ����� �����ȣ, ��� �̸�, �޿��� ����ϴ� SQL ���� �ۼ�

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL <= 1500;

-- ���ڵ����� ��ȸ 
-- �޿��� �ƴ� ��� �̸� ���� ���� �����͸� ��ȸ

-- �̸��� FORD�� ����� �����ȣ(EMPNO)�� ����̸�(ENAME)�� �޿�(SAL)�� ���

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME = 'FORD';

-- ���ڿ��̳� ��¥�� �ݵ�� ���� ����ǥ(single quotation)  '  ' �ȿ� ǥ��
-- SQL���� ���Ǵ� Ű������ SELECT �� FROM �̳� WHERE ���� ��ҹ��ڸ� �������� ������ 
-- ���̺� ���� ����� ������ ���� ��ҹ��ڸ� ����

-- ����̸��� SCOTT �� ����� �����ȣ, ��� �̸�, �޿��� ����ϴ� SQL ���� �ۼ�

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME = 'SCOTT';

-- ��¥ ������ ��ȸ            date
-- ��¥�� ���ڿ��� ���������� ���� ����ǥ �ȿ� ���

-- 1982�� 1�� 1�� ������ �Ի��� ����� ����ϴ� ����

SELECT *
FROM EMP
WHERE HIREDATE <= '1982/01/01';

-- �� ������

--    AND     �� ���� ������ ��� �����ؾ߸� �˻� ����

SELECT *
FROM EMP
WHERE DEPTNO = 10 AND JOB = 'MANAGER';

--    OR      �� ���� ���� �߿��� �� ������ �����ϴ���� �˻� ����

SELECT *
FROM EMP
WHERE DEPTNO = 10 OR JOB = 'MANAGER';
    
--    NOT     ���ǿ� �������� ���ϴ� �͸� �˻�     

SELECT *
FROM EMP
WHERE NOT DEPTNO = 10;

-- 10�� �μ� �Ҽ��� ����� �߿��� ������ MANAGER�� ����� �˻��Ͽ� 
-- �����, �μ���ȣ, ������ ���

SELECT ENAME,DEPTNO,JOB
FROM EMP
WHERE DEPTNO = 10 AND JOB = 'MANAGER';

-- 10�� �μ��� �Ҽӵ� ����̰ų� ������ MANAGER�� ����� �˻��Ͽ� 
-- �����, �μ���ȣ, ������ ��� 

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO = 10 OR JOB = 'MANAGER';

-- �μ���ȣ�� 10���� �ƴ� ����� ����̸�, �μ���ȣ, ������ ���

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE NOT DEPTNO = 10;

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO <> 10;

-- �� �������� �پ��� Ȱ��

-- 2000���� 3000 ������ �޿��� �޴� ����� ��ȸ

SELECT *
FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;

-- Ŀ�̼��� 300 �̰ų� 500 �̰ų� 1400 �� ����� �˻�

SELECT *
FROM EMP
WHERE COMM = 300 OR COMM = 500 OR COMM = 1400;

SELECT *
FROM EMP
WHERE COMM IN(300,500,1400);

-- �����ȣ(EMPNO)�� 7521 �̰ų� 7654 �̰ų� 7844 �� ������� 
-- ��� ��ȣ�� �޿��� �˻��ϴ� �������� �� �����ڿ� OR �� ������ ���

SELECT EMPNO, SAL
FROM EMP
WHERE EMPNO = 7521 OR EMPNO = 7654 OR EMPNO = 7844;

SELECT EMPNO, SAL
FROM EMP
WHERE EMPNO IN (7521, 7654, 7844);

-- BETWEEN AND ������      between and

-- 2000���� 3000 ������ �޿��� �޴� ����� ���� 
-- Ư�� ���� ���� ���ϴ� ������������ �˾ƺ��� ���ؼ� 
-- �񱳿����ڿ� �� �����ڸ� �����Ͽ� ǥ���� �� ����

SELECT * 
FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;

-- BETWEEN AND ��� 

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

-- �޿��� �޿��� 2000 �̸��̰ų� 3000 �ʰ��� ����� �˻�

SELECT *
FROM EMP
WHERE SAL < 2000 OR SAL > 3000;

-- BETWEEN AND ���

SELECT *
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- BETWEEN AND �����ڴ� �������Ӹ� �ƴ϶� ������, ��¥������ ����� �� ����
-- ������ ���� �� ����� �Ǵ� ���� ���� ����ǥ�� �ѷ��ξ� �Ѵ�!!

-- 1987�⿡ �Ի��� ����� ���

SELECT *
FROM EMP
WHERE HIREDATE 
BETWEEN '1987/01/01' AND '1987/12/31';

-- IN ������           in

-- Ŀ�̼��� 300 �̰ų� 500 �̰ų� 1400 �� ����� �˻��ϱ� ���ؼ��� OR �����ڸ� Ȱ��������

SELECT *
FROM EMP
WHERE COMM = 300 OR COMM = 500 OR COMM = 1400;

-- OR �����ڷ� ���� �� ������ ���� �÷��� ��ó�� COMM ���� ������ ��
-- IN �����ڸ� ����� �� ����

SELECT *
FROM EMP
WHERE COMM IN (300,500,1400);

-- �����ȣ�� 7521 �̰ų� 7654 �̰ų� 7844 �� ������� �˻�

SELECT *
FROM EMP
WHERE EMPNO IN (7521, 7654, 7844);

-- NOT IN ������           not in

-- COMM�� 300, 500, 1400�� ��� �ƴ� ����� �˻�

SELECT *
FROM EMP
WHERE COMM NOT IN(300, 500, 1400);

-- ��� ��ȣ�� 7521�� �ƴϰ� 7654�� �ƴϰ� 7844�� �ƴ� ������� �˻�
-- NOT IN ������ Ȱ��

SELECT *
FROM EMP
WHERE EMPNO NOT IN (7521, 7654, 7844);

-- �� �����ڿ� �� ������ AND�� ����Ͽ� �ۼ�

SELECT *
FROM EMP
WHERE EMPNO <> 7521 AND EMPNO <> 7654 AND EMPNO <> 7844;

-- LIKE �����ڿ� ���ϵ� ī��         like     wildcard      %      _

-- LIKE �����ڴ� �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��쿡
-- ���ϵ�ī��� �Բ� ����Ͽ� ���ϴ� ������ �˻��� �� ����

-- LIKE ������ PATTERN�� ���

-- ã������ �̸��� F�� ���� �ϴ� ���� ������ �� ���� ���ڴ� �� ���
-- ename = 'F'�� �˻��ϰ� �Ǹ� 
-- ename = 'F' ǥ���� �̸��� ��Ȯ�� F�� ������� �˻��ϰڴٴ� �ǹ�
-- �̸��� 'F' �� �����ϴ� ����� �˻����� ����
-- �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��� LIKE �����ڿ� �Բ� %�� ���

SELECT *
FROM EMP
WHERE ENAME LIKE 'F%';

-- ����� �߿��� �̸��� J�� �����ϴ� ������� ã�� �������� �ۼ�

SELECT *
FROM EMP
WHERE ENAME LIKE 'J%';

-- �̸� �� A�� �����ϴ� ����� �˻�

SELECT *
FROM EMP
WHERE ENAME LIKE '%A%';

-- ���ڿ��� �տ� � ���ڿ��� �� ���� ���� ������� N���� ������ ������ ã��

SELECT *
FROM EMP
WHERE ENAME LIKE '%N';

-- �̸��� K�� �����ϴ� ����� �����ȣ�� ����̸��� ���

SELECT EMPNO,ENAME
FROM EMP
WHERE ENAME LIKE 'K%';

-- �̸� �߿� K�� �����ϴ� ����� �����ȣ�� ����̸��� ���

SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '%K%';

-- �̸��� K�� ������ ����� �����ȣ�� ����̸��� ���

SELECT EMPNO, ENAME 
FROM EMP
WHERE ENAME LIKE '%K';

-- ���ϵ� ī�� ( _ ) ����ϱ�        _

-- �̸��� �� ��° ���ڰ� A�� ����� ã�� ����

SELECT *
FROM EMP
WHERE ENAME LIKE '_A%';

-- �� ��° ���ڰ� A�� �ڷḦ �˻�

SELECT *
FROM EMP
WHERE ENAME LIKE '__A%';

-- NOT LIKE ������             not like
-- �̸��� A�� �������� ���� ������� �˻��Ϸ��� �� ��쿡 NOT LIKE �����ڸ� ���

SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%A%';

-- NULL�� ���� ������ IS NULL �� IS NOT NULL          is null   is not null

SELECT *
FROM EMP
WHERE COMM IS NULL;

SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

-- ����� ���� ���(CEO �� �ǰ�����!)�� �˻��ϱ� ���� SQL ���� �ۼ�

SELECT *
FROM EMP
WHERE MGR IS NULL;

-- ������ ���� ORDER BY ��

-- �����̶� ũ�� ������� �����ϴ� ���� �ǹ�

-- ��������(ascending) ���� ���    ���� ���� ���� ��µǰ� �Ʒ��� ������ ū ���� ���

SELECT *
FROM EMP
ORDER BY SAL ASC;

-- ���Ĺ���� �������� ���� ��쿡�� ����Ʈ�� ������������ ������.

SELECT *
FROM EMP
ORDER BY SAL;

-- ��������(descending) ���� ���   ū ���� ���� ��µǰ� �Ʒ��� ������ ���� ���� ���

SELECT *
FROM EMP
ORDER BY SAL DESC;

-- EMP ���̺��� �ڷḦ �Ի��� �������� ������������ �����Ͽ� 
-- �ֱ� �Ի��� ������ ���߿� ����ϵ� �����ȣ, �����, ����, �Ի��� Į���� ���

SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE ASC;

-- EMP ���̺��� �ڷḦ �����ȣ�� �������� ������������ �����Ͽ� 
-- �����ȣ�� ����� Į���� ǥ��

SELECT EMPNO, ENAME
FROM EMP
ORDER BY EMPNO DESC;

-- ���� ������ ���

-- ũ�⿡ ���� �񱳴� ��ġ ������ �Ӹ� �ƴ϶� ���� �����ͳ� ��¥ �����Ϳ� ���ؼ��� ����
-- ���� �������� ��� �ƽ�Ű �ڵ� ������ ����ǹǷ� �ƽ�Ű �ڵ� ���� �������� ����
-- ���������� ��쿡�� A, B, . . . Z ������ ��µǰ� 
-- ���������� ��쿡�� Z, Y, . . . A ������ ���

SELECT *
FROM EMP
ORDER BY ENAME;

-- ��¥ ������ ���

-- ��¥�� �������� Ȥ�� ������������ ��� ����
-- ������������ �����ϸ� ���� ������ ������ ���� ���� ��� 
-- �Ʒ��� ������ �ֱ� ������ ���

-- ���������� �ֱ� �������� ���

SELECT *
FROM EMP
ORDER BY HIREDATE DESC;

SELECT *
FROM EMP
ORDER BY HIREDATE ASC;

-- ���� ��Ŀ� ���� ���� ���� ����
-- �޿��� ���� ����� ������ ��� �̸��� ö�ڰ� ���� ������� ��µǵ��� 
-- ���� ����� ���������� ���� �� �� ����

SELECT *
FROM EMP
ORDER BY SAL DESC, ENAME ASC;

-- �μ� ��ȣ�� ���� ������� ����ϵ� ���� �μ����� ����� ����� ��� �̸������� ���

SELECT *
FROM EMP
ORDER BY DEPTNO ASC, ENAME ASC;