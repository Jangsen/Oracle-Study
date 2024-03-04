-- ���̺� ���ο� ���� �߰��ϴ� INSERT ��    ============================ insert

-- INSERT ���� ���̺� ���ο� �����͸� �Է��ϱ� ���� ����ϴ� ������ ���۾�
-- INSERT ���� �⺻ ����
-- INSERT INTO table_name
-- (column_name, ��)
-- VALUES(column_value, ��);

-- INSERT ���� ���� �ǽ��� ����� ���̺� �����ϱ�

DROP TABLE DEPT01;

CREATE TABLE DEPT01
AS
SELECT * FROM DEPT
WHERE 1 = 0;

-- ���ο� �����͸� �߰��ϱ�  

-- ���ο� �����͸� �߰��ϱ� ���ؼ� ����� ��ɾ� INSERT INTO ~ VALUES ~�� 
-- Į�� �� ����� ����� ���� VALUES ������ ������ ��ȣ�� ����� ���� ������ ���ƾ� ��

INSERT INTO DEPT01
(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING', 'NEW YORK');

-- INSERT �������� ���� �߻��� ��

-- �÷� �� ����� ����� ������ 
-- VALUES ������ ������ ��ȣ�ȿ� ����� ���� ������ ������ ���� �߻�

INSERT INTO DEPT01
(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING');

-- ���� �� ����

-- �÷� �� ����� ����� ������
-- VALUES ������ ������ ��ȣ�� ����� ������ ������ ���� �߻�

INSERT INTO DEPT01
(DEPTNO, DNAME, LOC)
VALUES(10, 'ACCOUNTING', 'NEW YORK', 20);

-- ���� �� ����

-- �÷� ���� �߸� �ԷµǾ��� ���� ������ �߻�

INSERT INTO DEPT01
(NUM, DNAME, LOC)
VALUES(10, 'ACCOUNTING', 'NEW YORK');

-- ���� �� ����

-- �÷��� �Է��� ���� ������ Ÿ���� ���� ���� ���� ��쿡�� ������ �߻�

INSERT INTO DEPT01
(DEPTNO, DNAME, LOC)
VALUES('50', 'ACCOUNTING', SEOUL);

-- ���� �� ����

-- �÷� ���� ������ INSERT ����  ==================================

-- ���̺� �ο츦 �߰��� �� ��� Į���� ��� �ڷḦ �Է��ϴ� ��쿡��
-- ���� �÷� ����� ������� �ʾƵ� ��

-- �÷� ����� �����Ǹ� VALUES �� ������ ������ ���̺��� �⺻ �÷� ������� �Էµ�.

-- ���̺��� �÷� ������ CREATE TABLE�� ���̺��� ������ ���� ������ ����

-- ���̺��� �⺻ �÷� ������ DESC ������ ��ȸ���� �� �������� ����

-- Į�� ���� ������ INSERT ���� ���

-- Į������ ������ ä ���̺��� ���� ��� �÷��� �����͸� �߰�

INSERT INTO DEPT01
VALUES(20, 'RESEARCH', 'DALLAS');


-- EMPNO    NUMBER(4)    
-- ENAME    VARCHAR2(10) 
-- JOB      VARCHAR2(9)  
-- SAL      NUMBER(7,2)  
-- ������ ���� ������ SAM01 ���̺��� �����Ͻÿ�. 
-- ������ ��� DROP TABLE�� ���� �� ����
 
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
-- SAM01 ���̺� ������ ���� �����͸� �߰�

INSERT INTO SAM01
VALUES(1000, 'APPLE', 'POLICE', 10000);
INSERT INTO SAM01
VALUES(1010, 'BANANA', 'NURSE', 15000);
INSERT INTO SAM01
VALUES(1020, 'ORANGE', 'DOCTOR', 25000);

SELECT * FROM SAM01;

-- NULL �� �����ϴ� �پ��� ��� ==============================null

/* �����͸� �Է��ϴ� �������� 
   �ش� �÷� ���� �𸣰ų� Ȯ������ �ʾ��� ��쿡�� NULL���� �Է�
   
   NULL �� ������ �Ͻ����� ����� ������� ����� ����
   
   �Ͻ��� ����� Į�� �� ����Ʈ�� Į���� �����ϴ� ��
   ��, �ٸ� Į���� ���� �Է������� 
   �̷��� ������ Į������ �Ͻ������� NULL ���� �Ҵ�Ǵ� ��
   
   ����� ����� VALUES ����Ʈ�� ��������� NULL�� �Է�
*/

-- �μ� ���̺� �÷��� NULL���� ����ϴ��� ���캸�� ���ؼ� DESC ����� ����
-- DEPT ���̺��� DEPTNO �÷��� NOT NULL ���������� �����Ǿ� ����

-- NOT NULL ���������� ������ DEPTNO �÷��� �� ���� �Է����� ����

-- ����Ŭ�� ������ �ִ� DEPT ���̺��� DEPTNO �÷��� 
-- �ΰ��� ������� ���ϵ��� ����Ŭ ���ο��� �̹� �÷��� ���������� ������ ���� ����

-- �÷��� �ΰ��� ������� ���ϵ��� �Ϸ��� �÷��� ���������� �����ؾ� ��

-- �Ͻ������� NULL ���� ���� ====================================

-- �������� �������� ���� 30�� �μ��� �μ��� �Է��Ϸ��� ��
-- ������ ���� ��Ȯ�ϰ� �˰� �ִ� �÷� �� ��������� ����� �Ŀ� 
-- �׿� ��Ī�Ǵ� ���� VALUES �� ������ ���
INSERT INTO DEPT01
(DEPTNO, DNAME)
VALUES(30, 'SALES');

-- ��������� NULL ���� ���� =====================================

-- �÷����� ��������� ������� ������ ���̺��� ���� �ִ� ��� �÷��� ���� �����ؾ� ��
-- �������� �����Ǿ� ���� �ʾҴ��� �ݵ�� ���� 3�� �����ؾ� �ϱ� ������ 
-- ��������� VALUES ����Ʈ���� ������ NULL�� �Է��ؾ� ��

INSERT INTO DEPT01
VALUES(40,'OPERATIONS', NULL);

-- NULL ���� ���� �÷��� �߰��ϱ� ���ؼ��� NULL ��� ''�� ����� �� ����
-- �������� �ƴ� �μ����� �������� �ʾ� �μ��� NULL ���� �Է��� ��

INSERT INTO DEPT01
VALUES(50, '', 'CHICAGO');

SELECT * FROM DEPT01;

-- SAM01 ���̺� ������ ���� NULL ���� ���� ���� �߰��ϱ�

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

-- ���� ������ ������ �����ϱ� ====================================
-- INSERT INTO ������ VALUES ���� ����ϴ� ��ſ� ���� ������ ����� �� ����
-- �̷��� �ϸ� ������ ���̺� �ִ� ���� ���� �����ؼ� �ٸ� ���̺� ������ �� ����
-- �� �� ������ ���� INSERT ��ɹ����� 
-- ������ �÷��� ������ ������ Ÿ���� ���� ������ ������ ����� �����ؾ� ��!!

-- ���� ������ ������ �����ϴ� ����

-- 1.���� ������ ������ �����ϱ� ���ؼ� 
-- �켱 ���̺��� �����ϵ� �����ʹ� �������� �ʰ� �� ���̺� ����

DROP TABLE DEPT02;

CREATE TABLE DEPT02
AS
SELECT * 
FROM DEPT 
WHERE 1 = 0;

-- 2.���̺� �������� �����ؼ� ������ ���� �ʴ� ���̺� ���� ������ �ο츦 �Է��غ���

INSERT INTO DEPT02
SELECT *
FROM DEPT;

SELECT *
FROM DEPT02;

-- SAM01 ���̺� ���� �������� ����Ͽ� 
-- EMP�� ����� ��� �� 10�� �μ� �Ҽ� ����� ������ �߰�

INSERT INTO SAM01
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE DEPTNO = 10;

SELECT * FROM SAM01;

-- ���� ���̺� ���� �� �Է��ϱ� ========================================

/* 

INSERT ALL���� ����ϸ� ���� ������ ����� ���� ���� ���� ���̺� ���ÿ� �Է��� �� ����.
�����ȣ, �����, �Ի����ڷ� ������ EMP_HIR ���̺�� 
�����ȣ, �����, �ش������(���))�� ������ EMP_MGR ���̺��� �� ���̺�� �����Ѵٰ� ����
��� ���̺�(EMP)���� �μ� ��ȣ�� 20�� ������� �˻��Ͽ� 
EMP_HIR ���̺��� ��� ��ȣ, ��� ��, �޿��� 
EMP_MGR ���̺��� ��� ��ȣ, ��� ��, �ش������(���)�� �Է��Ϸ��� ��� �ؾ� �ұ�?

INSERT ALL ��ɹ��� ����ϸ� �� ���� �������� �������� �ʰ� 
�ϳ��� ���������� �� ���� ���̺� ���ϴ� �÷� ���� ������ �� ����.

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
INSERT ALL ��ɹ��� 
���� ������ ��� ������ 
���� ���� ���� ���̺� ���ÿ� �Է��ϱ� ���� ��ɹ�
�̶� ������ ���� 
���� ������ �÷���� �����Ͱ� �ԷµǴ� ���̺��� �÷����� �����ؾ� �Ѵٴ� ��
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

-- ����(WHEN)�� ���� ���� ���̺� ���� �� �Է� ================== when

/*
INSERT ALL ��ɹ��� WHEN ���� �߰��ؼ� ������ �����Ͽ� 
���ǿ� �´� �ุ �����Ͽ� ���̺� �߰�. 
EMP_HIR02 ���̺��� 
1982 �� 01 ��01 �� ���Ŀ� �Ի��� ������� ��ȣ, ��� ��, �Ի����� �߰�. 
EMP_SAL ���̺��� 
�޿��� 2000 �̻��� ������� ��ȣ, ��� ��, �޿��� �߰�. 
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

-- PIVOTING�� ���� ���� ���̺� ���� �� �Է��ϱ�

-- 1. �� ���� �����Ϻ��� �ݿ��ϱ��� ���� ������ �Ǹ� ������ ����ϴ� ���̺��� ����

CREATE TABLE SALES
(SALES_ID NUMBER(4),
 WEEK_ID NUMBER(4),
 MON_SALES NUMBER(8, 2),
 TUE_SALES NUMBER(8, 2),
 WED_SALES NUMBER(8, 2),
 THU_SALES NUMBER(8, 2),
 FRI_SALES NUMBER(8, 2));
 
--  2. ����� ������ SALES_DATA ���̺��� ����

CREATE TABLE SALES_DATA
(SALES_ID NUMBER(4),
 WEEK_ID NUMBER(4),
 DAILY_ID NUMBER(4),
 SALES NUMBER(8, 2));
 
-- 3. ���Ӱ� ������ SALES ���̺� �ְ� �Ǹ� ������ �߰�

INSERT INTO SALES VALUES
(1001, 1, 200, 100, 300, 400, 500);
INSERT INTO SALES VALUES
(1002, 2, 100, 300, 200, 500, 350);

-- 4. �� ������ ������ �� �ִ� �÷��� �߰��Ͽ� ���� ������ �Ǹ� ������ ���

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


-- ���̺��� ������ �����ϱ� ���� UPDATE��    ======================== update
/*
UPDATE���� ���̺� ����� �����͸� �����ϱ� ���� ���

UPDATE table_name
SET column_name1 = value1, column_name2 = value2, ��
WHERE conditions;

UPDATE���� ������ ���� �����ϴ� ��
���� � ���� �����͸� �����ϴ���
WHERE ���� �̿��Ͽ� ������ ����

WHERE ���� ������� ���� ����
���̺� �ִ� ��� ���� ������

���̺��� ��ü ���� �����Ϸ��� �ߴ� ���� �ƴ϶��
ū ������ �߻��ϹǷ� WHERE���� ��� ������ ������ �Ǵ��ؾ���.
*/

-- EMP01 ���̺��� EMP���̺�� ����

CREATE TABLE EMP01
AS
SELECT *
FROM EMP;

SELECT * FROM EMP01;

-- EMP01 ���̺��� ��� �� ����

-- ��� ����� �μ���ȣ�� 30������ ����

UPDATE EMP01
SET DEPTNO = 30;

-- ��� ����� �޿��� 10% �λ�

UPDATE EMP01
SET SAL = SAL * 1.1;

-- ��� ����� �Ի����� ���÷� ����

UPDATE EMP01
SET HIREDATE = SYSDATE;

-- ���̺��� Ư�� �ุ ����
/*
UPDATE ���� WHERE ���� �߰��ϸ� ���̺��� Ư�� ���� �����.
UPDATE ���� �̿��Ͽ� ���̺��� Ư�� ���� �����ϱ� ���� �ǽ��� �ϱ⿡ �ռ��� 
�ǽ��� ����� ���̺��� ���� ������. 
���� �ǽ��� ���ؼ� ����Ͽ��� ��� ���̺�(EMP01)�� ������ �� 
���� ��� ���̺�(EMP)�� ������ ������ �����͸� ���� ��� ���̺�(EMP01)�� ����.
*/

DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT * FROM EMP;

SELECT * FROM EMP01;

-- �μ���ȣ�� 10���� ����� �μ���ȣ�� 30������ ����

UPDATE EMP01
SET DEPTNO = 30
WHERE DEPTNO = 10;

SELECT * FROM EMP01;
-- �޿��� 3000 �̻��� ����� �޿��� 10% �λ�

UPDATE EMP01
SET SAL = SAL * 1.1
WHERE SAL >= 3000;

SELECT * FROM EMP01;
-- 1987�⿡ �Ի��� ����� �Ի����� ���÷� ����

UPDATE EMP01
SET HIREDATE = SYSDATE
WHERE SUBSTR(HIREDATE,1,2) = '87';

SELECT * FROM EMP01;

-- SAM01�� ���̺� ����� ��� �� �޿��� 10000 �̻��� ������� �޿��� 5000���� �谨

UPDATE SAM01
SET SAL = SAL - 5000
WHERE SAL >= 10000;

SELECT * FROM SAM01;

-- ���̺��� 2�� �̻��� �÷� �� ���� =========================================
-- ���̺��� �ϳ��� Į���� �ƴ� ���� �� Į���� ���� �����Ϸ��� 
-- ���� SET ���� �޸��� �߰��ϰ� Į��=���� �߰� ����ϸ� ��.

-- SCOTT ����� �μ���ȣ�� 20������, ������ MANAGER�� �Ѳ����� ����  (EMP01 ���̺�)

UPDATE EMP01
SET DEPTNO = 20, JOB = 'MANAGER'
WHERE ENAME = 'SCOTT';

--SELECT DEPTNO, ENAME, JOB
--FROM EMP01;

--SELECT DEPTNO, ENAME, JOB
--FROM EMP01
--WHERE ENAME = 'SCOTT';

-- SCOTT ����� �Ի����ڴ� ���÷�, �޿��� 50 ���� Ŀ�̼��� 4000 ���� ����

UPDATE EMP01
SET HIREDATE = SYSDATE, SAL = 50, COMM = 4000
WHERE ENAME = 'SCOTT';

SELECT * FROM EMP01
WHERE ENAME = 'SCOTT';

-- ���� ������ �̿��� ������ �����ϱ�
/*
UPDATE ���� SET ������ ���� ������ ����ϸ� ���� ������ ������ ����� ������ �����
�̷��� ������� �ٸ� ���̺� ����� �����ͷ� �ش� �÷� ���� ������ �� ����
*/

-- ���� DEPT01 ���� 40�� �μ��� ���� �����ϱ�

SELECT * FROM DEPT01;
INSERT INTO DEPT01
(DEPTNO, DNAME, LOC)
VALUES(40, 'OPERATIONS', 'BOSTON');

-- 40�� �μ��� �������� 10�� �μ��� ���������� ����

UPDATE DEPT01
SET LOC = (SELECT LOC
           FROM DEPT01
           WHERE DEPTNO = 10)
           WHERE DEPTNO = 40;
           
SELECT * FROM DEPT01;

-- ���� �������� ����Ͽ� EMP ���̺� ����� �������� Ư�� �÷������� ������
-- SAM02 ���̺� ����

DROP TABLE SAM02;

CREATE TABLE SAM02
AS
SELECT ENAME, SAL, HIREDATE, DEPTNO
FROM EMP;

-- ���� �� DALLAS�� ��ġ�� �μ� �Ҽ� ������� �޿��� 1000 �λ��Ͻÿ�

SELECT * FROM SAM02;

UPDATE SAM02
SET SAL = SAL + 1000
WHERE DEPTNO = 20;

-- ���� ������ �̿��� �ΰ� �̻��� �÷��� ���� �� ����
/*
���� ������ ����� UPDATE ������ ������ ���� 2����

���� 1
UPDATE table_name
SET column_name1 = (sub_query1), column_name2 = (sub_query2), ��
WHERE ����


���� 2
UPDATE table_name
SET (column_name1, column_name2, ��) = (sub_query)
WHERE ����
*/

-- ���������� �̿��ؼ� �μ���ȣ�� 20�� �μ��� �μ���� �������� 
-- �μ���ȣ�� 40���� �μ��� �����ϰ� ����
-- �μ���ȣ�� 20���� �μ��� �̸��� ������ RESEACH �� DALLAS

UPDATE DEPT01
SET (DNAME, LOC) = (SELECT DNAME, LOC
                    FROM DEPT
                    WHERE DEPTNO = 40)
WHERE DEPTNO = 20;

SELECT * FROM DEPT01;

-- ���� �������� ����Ͽ� SAM02 ���̺��� ��� ����� �޿��� �Ի����� 
-- �̸��� KING �� ����� �޿��� �Ի��Ϸ� ����

SELECT * FROM SAM02;

UPDATE SAM02
SET (SAL, HIREDATE) = (SELECT SAL, HIREDATE
                       FROM SAM02
                       WHERE ENAME = 'KING');

-- ���̺� ���ʿ��� ���� �����ϱ� ���� DELETE �� ====================   delete
/*
DELETE ���� ���̺� ����Ǿ� �ִ� �����͸� ����

DELETE FROM table_name 
WHERE conditions;

DELETE ���� ���̺��� ���� ���� �����ϸ� 
Ư���� �ο�(��)�� �����ϱ� ���ؼ� WHERE ���� �̿��Ͽ� ������ ����

���� DELETE ���� WHERE ���� ������� ���� ��� ���̺� �ִ� ��� ���� �����ǹǷ� 
�ſ� �����ϰ� ��ɹ��� ����ؾ� ��
*/

-- �μ� ���̺��� ��� ���� ����

DELETE FROM DEPT01;

DROP TABLE DEPT01;

CREATE TABLE DEPT01
AS
SELECT * FROM DEPT;

-- �μ� ���̺��� 30�� �μ��� ����
SELECT * FROM DEPT01;

DELETE FROM DEPT01
WHERE DEPTNO = 30;

-- SAM01 ���̺��� ������ �������� ���� ����� ����

SELECT * FROM SAM01;

DELETE FROM SAM01
WHERE JOB IS NULL;

-- ���� ������ �̿��� ������ ���� 

/*
DELETE ���� ����ϱ⿡ �ռ� ��� ���̺��� ����. 

��� ���̺��� �μ����� SALES�� ����� ��� ����. 

��� ���̺��� �μ����� ��ϵǾ� ���� ����. 

�μ����� �μ� ���̺� ��ϵǾ� �����Ƿ� �μ� ���̺��� 
�μ����� SALES�� �μ��� ��ȣ���� �˾Ƴ��� ��. 

�̷��� �˾Ƴ� �μ���ȣ�� ��� ���̺� �����ϱ� ���ؼ��� 
���� ������ �̿��ؾ� ��.
*/

-- ��� ���̺��� �μ����� SALES�� ����� ��� ����
SELECT * FROM EMP01;

SELECT * FROM DEPT;

DELETE FROM EMP01
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');

-- SAM02 ���̺��� 'RESEARCH' �μ� �Ҽ� ����鸸 ����

SELECT * FROM SAM02;

DELETE FROM SAM02
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'RESEARCH');
                
-- ���̺��� �����ϴ� MERGE  =========================== merge

/*
MERGE�� �����̶� �ǹ̷� 
������ ���� �ΰ��� ���̺��� �ϳ��� ���̺�� ��ġ�� ���. 

MERGE ����� �����ϱ� ���ؼ� 
�����ϴ� ���̺� ������ �����ϴ� ���� �ִٸ� 
���ο� ������ ����(UPDATE)�ǰ�, 
�������� ������ ���ο� ������ �߰�(INSERT)�˴ϴ�
*/

-- MERGE ���� ���ؼ� ����(UPDATE) �ǰ� �߰�(INSERT) �Ǵ��� ���캸��

-- 1. ���ο� ���̺� EMP01�� ����
DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT * FROM EMP;

SELECT * FROM EMP01;
-- 2. ������ 'MANAGER' �� �����θ� ������ EMP02 ���̺��� ����

CREATE TABLE EMP02
AS
SELECT * FROM EMP
WHERE JOB = 'MANAGER';

SELECT * FROM EMP02;

-- 3. MERGE ���� ���ؼ� ������ �����ϴ� ���� ����(UPDATE) �Ǵ��� ���캸�� ����
--    ���� ������ EMP02 ���̺��� JOB�� 'TEST' �� ����

UPDATE EMP02
SET JOB = 'TEST';

-- 4. MERGE ���� ���ؼ� ���ο� ���� �߰�(INSERT) �Ǵ��� ���캸�� ���ؼ� 
--    ���ο� �ο츦 �߰�

INSERT INTO EMP02
VALUES(8000, 'SYJ', 'TOP', 7566, '2009/01/12', 1200, 10, 20);
DESC EMP02;

-- 5. EMP01 ���̺� EMP02 ���̺��� �պ�

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