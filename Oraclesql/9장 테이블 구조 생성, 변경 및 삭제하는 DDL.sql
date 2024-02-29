-- ���̺� ���� �����ϴ� CREATE TABLE ========================    create
-- DDL(Data Definition Language)��
-- ����Ͽ� ���̺� ���� ��ü�� ���Ӱ� ����, ����, ����
-- CREATE TABLE ��ɾ�� ���ο� ���̺��� ����
-- CREATE TABLE ���� �⺻ ����

-- CREATE TABLE table_name
--(column_name, data_type expr, ...);

-- ��������
-- �����ͺ��̽����� ����, ����, ��¥, �̹��� ��� ���� �پ��� ������ �����Ͱ� ����

-- �ڷ���

-- ����� ���� , ���� ( ��Į��, �÷���, ���� )

-- ����(vector)�� ũ��� ������ ���� ����
-- ��Į��(scalar)�� ������ ���� �ʰ� ũ�⸸ ���� ����

-- ��Į�� ===================

-- CHAR(N), NCHAR(N)
-- VARCHAR2(N)
-- NVARCHAR2(N)
-- NUMBER(P,S)  
-- DATE                
-- BLOB, CLOB                    

-- NCLOB, BFILE

-- LONG, LONG RAW

-- ROWID

-- �÷��� ===================

-- VARRAY
-- TABLE

-- ���� ===================

-- REF

-- �������� ===================
 
/* CHAR(N)          CHAR(SIZE) ���� ���� ���� ������
                    �Էµ� �ڷ��� ���̿ʹ� ������� ������ ���̸�ŭ ���� ���� ����
                    �ּ� ũ�� 1 */

/* VARCHAR2(N)      ���� ���� ���� ������, ���� �Էµ� ���ڿ� ���̸�ŭ ���� ���� ����
                    �ִ� ũ�� ���, �ּ� ũ�� 1 */   
                    
/* NUMBER           Internal Number Format �ְ� 40�ڸ������� ���ڸ� ����
                    �̶� �Ҽ����̳� ��ȣ�� ���̿� ���Ե��� ���� */
                    
/* NUMBER(W)        W �ڸ������� ��ġ�� �ִ� 38�ڸ����� ���� (38�ڸ��� ��ȿ ����) */

/* NUMBER (W,D)     W �� ��ü ����, D�� �Ҽ��� ���� �ڸ���.
                    �Ҽ����� �ڸ����� ���Ե��� ���� */
                    
/* DATE             BC 4712�� 1�� 1�� ~ AD 4712�� 12�� 31�ϱ����� ��¥ */

/* LOB              2GB������ ���� ���� ���̳ʸ� �����͸� ���� ����
                    �̹��� ����, ���� ���� ���� ���� */
                    
/* LONG             ���� ������ ������ ������ Ÿ��, �ִ� ũ�� 2GB

/* ROWID            ROWID �� Tree-piece Format�� ����
                    ROWID�� DB�� ����Ǿ� ���� ������ , DB DATA�� �ƴ�

/* TIMESTAMP(m)        DATE���� Ȯ���� ���� */

/* INTERVAL YEAR TO MONTH   ��� ���� �̿��Ͽ� �Ⱓ�� ���� */

/* INTERVAL DAY TO SECOND   ��,��,��,�ʸ� �̿��Ͽ� �Ⱓ�� ����
                            �� ��¥ ���� ��Ȯ�� ���̸� ǥ���ϴµ� ���� */

-- LOB ===================
/* Large OBject ������ ���� �ؽ�Ʈ, �׷��� �̹���, ������, ����� ����
                           ����ȭ���� ���� ��뷮�� �ؽ�Ʈ�� ��Ƽ�̵�� �����͸�
                           �����ϱ� ���� ������ ��
                           �ִ� 4GB ���� ���� ����
                           ����Ŭ���� �����Ǵ� LOB�� ������ ����
                           BLOB, CLOB, NCLOB, BFILR ���� ���� */
 
-- CLOB ===================
-- e-BOOK �� ���� ��뷮�� �ؽ�Ʈ �����͸� �����ϱ� ���� ���

-- NCLOB ===================
-- ������ ���ڼ� �����͸� ����

-- BFILE ===================
-- ���̳ʸ� �����͸� ���� ���·� ����

-- ROWID ===================
/* ROWID ������ ���� ���̺��� ���� ��ġ�� �����ϴ� ������ �ּҰ�
                    �����ͺ��̽� ��ü���� �ߺ����� �ʴ� ������ ������
                    ���̺� ���ο� ���� ���ԵǸ�
                    ���̺� ���ο��� �ǻ� �÷� ���·� �ڵ������� ����
                    ���̺��� Ư�� ���ڵ带 �����ϰ� �����ϱ� ���� �ַ� ��� */

-- SELECT���� ���ؼ� EMP ���̺��� ROWID �ּҰ� ���� 

SELECT ROWID, EMPNO, ENAME
FROM EMP;

-- rowid
/* ROWID �� ������ ���� �������� �����͸� ����
                                            (�� 80��Ʈ : 10����Ʈ)
        32BIT           10BIT           22BIT           16BIT
        00000            FFF            BBBBB            RRR
     �����Ͱ�ü��ȣ    ��������Ϲ�ȣ      ��Ϲ�ȣ          ���ȣ  */

-- ������ ��ü��ȣ  =      ���̺��̳� �ε����� ���� ������ ��ü�� ������ �� �Ҵ��
-- ����� ���Ϲ�ȣ  =      �����Ͱ� ����Ǵ� �������� ������ ���Ϲ�ȣ�� ������ ���� ����
-- ��Ϲ�ȣ        =      ������ ���� ������ ���� ������ ��� ��ġ
-- ���ȣ          =      ��� ������ �� ��ġ�� ��Ÿ���� ��ȣ

SELECT ROWID, DEPTNO, DNAME
FROM DEPT;

-- timestamp
-- TIMESTAMP        DATE���� Ȯ��� ����
--                  �鸸���� ���� �������� ǥ���� �� ����
-- interval year
-- INTERNAL YEAR TO MONTH   
--                    ��� ���� ����Ͽ� �� ��¥ ������ �Ⱓ�� �����ϱ� ���� ��������
-- INTERNAL YEAR (�⵵�� ���� �ڸ���) TO MONTH (�޿� ���� �ڸ���)
--                     �ڸ����� �������� ������ �⺻������ 2�ڸ��� ����

DROP TABLE SAM02;

CREATE TABLE SAM02(
YEAR01 INTERVAL YEAR(4) TO MONTH);

CREATE TABLE SAM03(
DAY01 INTERVAL DAY(3) TO SECOND);



DESC EMP01;
DESC DEPT01;

INSERT INTO SAM03
VALUES(INTERVAL '100' DAY(3));

DESC SAM02;

INSERT INTO SAM02
VALUES(INTERVAL '48' MONTH(3));

SELECT * FROM SAM02;

-- ���� ��¥�� ����ϰ� 
-- ���̺� SAM02�� YEAR01 �̶�� �÷��� ����� ��¥��ŭ ���� ��¥�� ����Ͽ� ���

SELECT YEAR01, SYSDATE, SYSDATE + YEAR01
FROM SAM02;

-- interval day
-- INTERVAL DAY TO SECOND
-- INTERVAL DAY (�ϼ��� ���� �ڸ���) TO SECOND (�ʿ� ���� �ڸ���)

SELECT * FROM SAM03;
SELECT DAY01, SYSDATE, SYSDATE + DAY01 FROM SAM03;

-- EMP TABLE�� MICHALE �߰�
INSERT INTO EMP
VALUES(8000, 'MICHALE', 'ARTIST', 7839,
        TO_DATE('90-01-01','YY-MM-DD'),4000,600,40);

-- new table
-- ���Ӱ� ���̺� �����ϱ�

CREATE TABLE EMP01(
EMPNO NUMBER(4),
ENAME VARCHAR2(20),
SAL NUMBER(7,2));

CREATE TABLE DEPT01(
DEPTNO NUMBER(2),
DNAME VARCHAR2(14),
LOC   VARCHAR2(13));

-- sub query new table
-- ���� ������ ���̺� ����
-- �̹� �����ϴ� ���̺�� ������ ������ ������ ���� ���ο� ���̺� ���� ����

CREATE TABLE EMP02
AS
SELECT * FROM EMP;

-- as select
-- ���ϴ� �÷����� ������ ���� ���̺� ����

CREATE TABLE EMP03
AS
SELECT EMPNO, ENAME
FROM EMP;

SELECT * FROM EMP01;

-- EMP ���̺��� �����Ҷ� �����ȣ, ����̸�, �޿� �÷����� ������ ���̺� ����
CREATE TABLE EMP03
AS
SELECT EMPNO, ENAME, SAL
FROM EMP;

-- sub query select
-- ���� �������� SELECT ���� ������ ��
-- WHERE ���� �߰��Ͽ� ���ϴ� ������ �����ϸ� ���� ���̺��� �Ϻ��� �ุ ����

CREATE TABLE EMP05
AS
SELECT * FROM EMP
WHERE DEPTNO = 10;

CREATE TABLE DEPT20
AS
SELECT EMPNO,ENAME,SAL*12 ANNSAL
FROM EMP
WHERE DEPTNO = 20;

-- ���̺��� ������ �����ϱ�
-- ������ ����� �ִ°��� �ƴϰ�, ���� ������ �̿��ؾ� ��
-- WHERE ���� ���� �׻� ������ �Ǵ� ������ �����ϰ� �Ǹ�
-- ���̺��� ������� �ִ� �ο찡 ���� �ǹǷ� �� ���̺��� �����ǰ� ��

CREATE TABLE EMP04
AS
SELECT EMPNO, ENAME
FROM EMP
WHERE 1 = 0;

-- ���̺� Į�� �̸� �ٲ㼭 �����ϱ� table clone calumn change
CREATE TABLE EMP02
AS
SELECT EMPNO EMP_ID, ENAME NAME, SAL, DEPTNO DEPT_ID
FROM EMP;

-- DEPT ���̺�� ������ ������ �� ���̺� ���� (���̺��� �̸��� DEPT02�� ����)

CREATE TABLE DEPT02
AS
SELECT DEPTNO,DNAME,LOC
FROM DEPT
WHERE 1 = 0;

DESC DEPT02;
-- ���� ����
SELECT * FROM DEPT02;
-- �� ���̺�

-- ���̺� ���� �����ϴ� ALTER TABLE  alter table
/* ���� ���̺��� ������ �����ϱ� ���� DDL ��ɹ�
   ���̺� ���� ���� ������ �÷��� �߰�, ����, �÷��� Ÿ���̳� ���̸� ������ �� ���
   ���̺��� ������ �����ϰ� �Ǹ� ������ ����Ǿ� �ִ� �����Ϳ� ������ �ְԵ�
   
   ALTER TABLE�� �÷� �߰�, ����, �����ϱ� ���ؼ��� ������ ���� ��ɾ ���
   
   ADD COLUMN ���� ����Ͽ� ���ο� �÷��� �߰�
   MODIFY COLUMN ���� ����Ͽ� ���� �÷��� ����
   DROP COLUMN ���� ����Ͽ� ���� �÷��� ����    */

-- ALTER TABLE ADD ���� ���� ���̺� ���ο� �÷��� �߰�
-- ���ο� �÷��� ���̺� �� �������� �߰��ǰ� �ڽ��� ���ϴ� ��ġ�� ����� ����
-- �̹� ������ �߰��� ���� �ο찡 �����ϸ� �� �ο쿡�� �÷��� �߰�������, �÷� ���� NULL

-- ALTER TABLE table_name
-- ADD (column_name, data type expr,...)

-- EMP01 ���̺� ���� Ÿ���� ����(JOB) Į���� �߰�
ALTER TABLE EMP01
ADD(JOB VARCHAR(9));

DESC EMP01;

-- DEPT02 ���̺� ���� Ÿ���� �μ���(DNGR) Į���� �߰�
ALTER TABLE DEPT02
ADD(DNGR NUMBER(4));

DESC DEPT02;

-- ���� �÷� �Ӽ� �����ϱ� ALTER TABLE MODIFY alter table modify
-- ALTER TABLE table_name
-- MODIFY (column_name, data_type expr, ��);
-- �÷��� �����Ѵٴ� ���� �÷��� ���ؼ� 
-- ������ Ÿ���̳� ũ��, �⺻ ������ �����Ѵٴ� �ǹ�

-- ����(JOB) Į���� �ִ� 30���ڱ��� ������ �� �ְ� ����
ALTER TABLE EMP01
MODIFY(JOB VARCHAR2(30));

DESC EMP01;

-- DEPT02 ���̺��� �μ���(DNGR) Į����  ���� Ÿ������ ����
ALTER TABLE DEPT02
MODIFY(DNGR VARCHAR2(15));

SELECT * FROM DEPT02; 
DESC DEPT02;

INSERT INTO DEPT02
VALUES(10, 'RESEARCH', 'PARIS','KIM');

ALTER TABLE DEPT02
MODIFY(DNGR NUMBER(4));

DELETE FROM DEPT02;
DESC DEPT02;
SELECT * FROM DEPT02;

-- ���� Į�� ���� 
-- ���̺� �̹� �����ϴ� �÷��� �����ϱ� culomn delete
-- alter table drop column
-- ALTER TABLE ~ DROP COLUMN ��ɾ�� �÷��� ���� �� �� ����

-- ALTER TABLE table_name
-- DROP COLUMN column_name;

ALTER TABLE EMP01
DROP COLUMN JOB;
DESC EMP01;

-- DEPT02 ���̺��� �μ���(DNGR) �÷��� ����
ALTER TABLE DEPT02
DROP COLUMN DNGR;

DESC DEPT02;

-- SET UNUSED �ɼ� ���� =================set unused
/* Ư�� ���̺�(EMP02)���� �÷�(JOB)�� �����ϴ� ��� ������ �����ϴ� ���� ������
   ���̺� ����� ������ ���� ��� �ش� ���̺��� �����ϴ� �� �� ���� �ð��� �ɸ�
   �÷��� �����ϴ� ���� �ٸ� ����ڰ� �ش� �÷��� ����Ϸ��� �����ϰ� �Ǹ�
   ���� ���� ���̺��� ���ǰ� �ֱ� ������ �ٸ� ����ڴ� ���̺��� �̿��� �� ���� ��
   �۾��� ��Ȱ�ϰ� ������� �ʰ� ��(LOCK)�� �߻�
   
   ALTER TABLE�� SET UNUSED �ɼ��� �����ϸ�
   �÷��� �����ϴ� ���� �ƴ����� �÷��� ����� �������� ������ �� ����
   
   SET UNUSED �ɼ��� ����� �������� ������ �� ������ �÷��� �������� �ʾұ� ������
   �۾� �ð��� ���� �ɸ��� ����
   ���� �ɸ��� �ϵ� �Ͼ�� �ʰ� ��  */
   
-- SET UNUSED �ɼ��� ����Ͽ� EMP02 ���̺��� JOB �÷��� ����� �������� �����ϱ�

DESC EMP02;

ALTER TABLE EMP02
SET UNUSED(JOB);

-- ���� ���󵵰� ���� �ð��� �������� ���� �۾��� ����

ALTER TABLE EMP02
DROP UNUSED COLUMNS;

-- ���̺� ���� �����ϴ� DROP TABLE   drop table
-- DROP TABLE table_name;

-- ���̺� �����ϱ�
-- EMP01 ���̺��� �����ϱ�

DROP TABLE EMP01;

/* DDL ���� Ŀ���� �����ϰ� ���� */

-- ���̺��� ��� �ο츦 �����ϴ� TRUNCATE    truncate
-- ������ ����ϴ� ���̺��� ��� �ο츦 �����ϱ� ���� ��ɾ�

-- TRUNCATE table_name

-- ���̺��� ���� ��ü �����ϱ�===============   delete
-- EMP02 �� ����� �����͸� Ȯ���Ͽ����� �̹����� ���̺��� ��� �ο츦 �����ϱ�
SELECT * FROM EMP02;
DESC EMP02;
DELETE FROM EMP02
WHERE DEPTNO = 20;
TRUNCATE TABLE EMP02;   -- ��� �ο츦 ����
DESC EMP02;

-- ���̺� ���� �����ϴ� RENAME       rename
-- ������ ����ϴ� ���̺��� �̸��� �����ϱ� ���� ��ɾ�
-- RENAME OLD_NAME TO NEW_NAME

-- EMP02 ���̺��� �̸��� TEST�� �̸����� ����

RENAME EMP02 TO TEST;

-- ������ ��ųʸ��� ������ ��ųʸ� ��     dir

-- ������ ��ųʸ� ======================
/* �����ͺ��̽� �ڿ��� ȿ�������� �����ϱ� ���� �پ��� ������ �����ϴ� �ý��� ���̺�

   ����ڰ� ���̺��� �����ϰų� ����ڸ� �����ϴ� ���� �۾��� �� �� 
   �����ͺ��̽� ������ ���� �ڵ����� ���ŵǴ� ���̺�
   ����ڴ� ������ ��ųʸ��� ������ ���� �����ϰų� ���� �� �� ����
   
   ������ ��ųʸ��� ����ڰ� ��ȸ�� ���� �ý����� ���� �����ϴ� ���̺��̱⿡ 
   ��ȣ ���� ��ȣ�� ������ �� ������ �� �� ����
   
   ������ ��ųʸ� �� ���̺��� ���� ��ȸ�ϱ�� ���� �Ұ����� ��   
   
   �ǹ��ִ� �ڷ� ��ȸ�� �Ұ����ϱ� ������ 
   ����Ŭ�� ����ڰ� ������ �� �ִ� �����͸� ������ �� �� �ֵ��� �ϱ� ����
   ������ ��ųʸ����� �Ļ��� ������ ��ųʸ� �並 ����   */
   
-- ������ ��ųʸ� �� (���ξ ���� �� ����) ================== 

/*���ξ�
DBA_XXXX        �����ͺ��̽� �����ڸ� ���� ������ ��ü���� ���� ��ȸ
                (DBA�� ��� ���� �����ϹǷ� �ᱹ ��� �ִ� ��� ��ü�� ���� ��ȸ)

ALL_XXXX        �ڽ� ���� ���� �Ǵ� ������ �ο� ���� ��ü � ���� ���� ��ȸ

USER_XXXX       �ڽ��� ������ ������ ��ü � ���� ���� ��ȸ      */

-- USER_������ ��ųʸ�================            user

-- ���ξ�� USER�� ���� ������ ��ųʸ��� 
-- �ڽ��� ������ ������ ��ü � ���� ������ ��ȸ 

-- USER�� ���� ������ ��ųʸ� �߿��� 
-- �ڽ��� ������ ���̺��̳� �ε����� �� ��� ���� 
-- �ڽ� ���� ������ ��ü ������ ������ USER_TABLES ������ ��ųʸ� �並 ���캸��

-- DESC ��ɾ�� ������ ��ųʸ� �� USER_TABLES�� ������ ���캸��
DESC USER_TABLES;

-- ���� ����ڰ� ����
SHOW USER

-- ���̺��� �̸��� �˷��ִ� TABLE_NAME �÷��� ������ ���캸��
-- ���� ����� ������ SCOTT �̹Ƿ� SCOTT�� ��밡���� ���̺��� �̸��� �� �� ����

SELECT TABLE_NAME
FROM USER_TABLES
ORDER BY TABLE_NAME DESC;

-- ALL_������ ��ųʸ� ================        all
-- ����� ������ ������ ��ü�� �ڽ��� �����̹Ƿ� �翬�� ������ ����
-- ���� �ڽ��� ������ �ƴ� �ٸ� ���� ������ ���̺��̳� ������ ���� ���� �����ұ�?
-- ����Ŭ������ Ÿ������ ��ü�� ��õ������ ���� �Ұ���
-- �� ��ü�� �����ڰ� ������ �� �ֵ��� ������ �ο��ϸ� Ÿ ������ ��ü���� ������ ����
-- ALL_ ������ ��ųʸ� ��� ���� ������ ���� ������ ��ü
-- ��, �ڽ� ������ �����̰ų� ���� ������ �ο� ���� 
-- Ÿ������ ��ü ���� ��ȸ �� �� �ִ� ������ ��ųʸ� �� 
-- ���� ������ ���� ������ ���̺��� ������ ��ȸ�ϴ� ��

-- DESC ��ɾ�� ������ ��ųʸ� �� ALL_TABLES�� ������ ���캸��

DESC ALL_TABLES;

-- �� �߿��� OWNER, TABLE_NAME �÷� ���� ���캸��

/* NOT NULL�� ���� PRIMARY KEY ���� ���� �����ϱ� not null*/

SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;

-- DBA_ ������ ��ųʺ� ��======================        dba

-- DBA_ �����͵�ųʸ��� DBA�� ���� ������ ��ü ���� ��ȸ �� �� �ִ� ��
-- DBA�� ���� �Ұ����� ������ ���⿡ �����ͺ��̽��� �ִ� ��� ��ü ���� �ǹ�
-- USER_ �� ALL_ �� �޸� DBA_ �����͵�ųʸ���� 
-- DBA �ý��� ������ ���� ����ڸ� ������ �� ����

-- DBA_TABLES ������ ��ųʸ� ���� ������ ��ȸ

-- SELECT TABLE_NAME, OWNER
-- FROM DBA_TABLES;

-- SYSTEM ����ڷ� �����ؾ� ��� ���� SCOTT�� �Ұ���