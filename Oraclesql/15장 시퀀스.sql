/*
============== ������ ���� ���ؿ� ������ ���� =================

����Ŭ������ ���� �����ϱ� ���ؼ� �⺻ Ű�� �ΰ� ����.

�⺻ Ű�� �ߺ��� ���� ���� �� �����Ƿ� �׻� ������ ���� ������ ��. 

�⺻ Ű�� ������ ���� ������ ����ڰ� ���� ���� �����س����� �δ��� Ŭ ��. 

�������� ���̺� ���� ������ ���ڸ� �ڵ����� �����ϴ� �ڵ� ��ȣ �߻����̹Ƿ� 
�������� �⺻ Ű�� ����ϰ� �Ǹ� ������� �δ��� ���� �� ����.


============= ������ �⺻ ���� ==================

        �������� �����ϱ� ���� �⺻ ����

CREATE SEQUENCE sequence_name 
                [START WITH n]              �� 
                [INCREMENT BY n]            �� 
                [{MAXVALUE n | NOMAXVALUE}] ��
                [{MINVALUE n | NOMINVALUE}] ��
                [{CYCLE | NOCYCLE}]         ��
                [{CACHE n | NOCACHE}]       �� 
                
�� START WITH 

������ ��ȣ�� ���۰��� ������ �� ���. 
���� 1���� ���۵Ǵ� �������� �����Ϸ��� START WITH 1�̶�� ���. 

�� INCREMENT BY 

�������� ������ ��ȣ�� ����ġ�� ������ �� ���. 
���� 1�� �����ϴ� �������� �����Ϸ��� INCREMENT BY 1�̶�� ���. 

�� MAXVALUE n | NOMAXVALUE 

MAXVALUE �� �������� ���� �� �ִ� �ִ밪�� ����. 
���� NOMAXVALUE�� �����ϰ� �Ǹ� 
ASCENDING ������ ��쿡�� 1027���̰� 
DESCENDING ������ ��쿡�� -1�� ������.

�� MINVALUE n | NOMINVALUE

MINVALUE �� �������� ������ �ִ� �ּҰ��� ����. 
���� NOMINVALUE�� �����ϰ� �Ǹ� 
ASCENDING ������ ��쿡�� 1�̰� 
DESCENDING ������ ��쿡�� 1026������ ������.

�� CYCLE | NOCYCLE

CYCLE �� ������ ������ ���� �ִ밪���� ������ �Ϸ�ǰ� �Ǹ� 
�ٽ� START WITH �ɼǿ� ������ ���� ������ �ٽ� �������� �����ϵ��� ��. 

NOCYCLE�� ������ �Ϸ�ǰ� �Ǹ� ������ ���߽�Ŵ. 

�� CACHE n | NOCACHE 

CACHE �� �޸𸮻��� ������ ���� �����ϵ��� �ϴ� ���ε� �⺻ ���� 20.
NOCACHE�� ��Ģ������ �޸� �󿡼� �������� �������� ����.

*/

-- ������ �μ� ��ȣ�� �ڵ����� �ο����ִ� ������ ��ü�� �����ϴ� ����

CREATE SEQUENCE DEPT_DEPTNO_SEQ
INCREMENT BY 10
START WITH 10;

-- ���� ���� 10�̰� 10�� �����ϴ� ������ DEPT_DEPTNO_SEQ �� ����.

/*
==================== ������ ���� ������ ��ųʸ� ===========================

����ڰ� �ۼ��� ��ü���� ������ �����ϰ� �ִ� ������ ��ųʸ��� �̸��� ���� 
������ ���� ��Ģ���� ����. 

���̺�(TABLE) ��ü�� ���� ������ �����ϴ� ������ ��ųʸ��� USER_TABLES�̰�, 
��(VIEW)��ü�� ���� ������ �����ϴ� ������ ��ųʸ��� USER_VIEWS�̹Ƿ� 
������(SEQUENCE)�� ���� �ڷ������ �̸��� USER_SEQUENCES �̶�� ���� ��.

������ ������ ��ü�� ���� ������ �����ϴ� ������ ��ųʸ��δ� 
USER_SEQUENCES�� ����.

�������� ���õ� ������ ��ųʸ� : user_sequences

====================== ������ ��ü�� ������ ���캸�� ===========================
*/

-- 1. �켱 ������ ��ųʸ� USER_SEQUENCES�� ���̺� ������ ���� ���캸��

DESC USER_SEQUENCES;

-- SEQUENCE_NAME�� ������ ��ü�� �̸��� �����ϰ� 
-- MIN_VALUE�� �ּҰ�, MAX_VALUE�� �ִ밪. 
-- INCREMENT_BY�� ����ġ�� ���� ������ ������ ������, 
-- CYCLE_FLAG�� CYCLE�ɼ��� ����ϴ���, ���� �ʴ����� ���� ������ ������
-- LAST_NUMBER�� ������ ���� ���� ������ ����.

-- 2. ������ ��ųʸ� USER_SEQUENCES�� ���� ��� ���� ������ ��ü�� ������ ���캸��

SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE,
INCREMENT_BY, CYCLE_FLAG
FROM USER_SEQUENCES;

-- ���ݱ��� ������ ������ ��ü�� DEPT_DEPTNO_SEQ �� ���̱⿡ 
-- ������ ��ųʸ����� DEPT_DEPTNO_SEQ ������ ��ü �ϳ��� ���� ������ ��Ÿ��

-- INCREMENT_BY�� ����ġ�� �����ϴ� �÷����� 10�� �����Ѵٰ� ����ġ�� �����Ǿ� �ְ� 
-- MIN_VALUE�� MAX_VALUE, CYCLE �ɼ� ���� ���� �������� �ʾ����Ƿ� 
-- �⺻ ���� 1�� 10^27, N(����Ŭ�� ������� �ʰڴ�)���� �����Ǿ� ����.

/*
===================== CURRVAL, NEXTVAL  ==========================

�������� ���� ���� �˾Ƴ��� ���ؼ� CURRVAL�� ����ϰ�,   
���� ���� �˾Ƴ��� ���ؼ��� NEXTVAL�� ���

CURRVAL : ���� ���� ��ȯ�Ѵ�.
NEXTVAL : ���� ������ ���� ���� ���� ��ȯ�Ѵ�

CURRVAL�� ���ο� ���� �Ҵ�Ǳ� ���ؼ��� NEXTVAL�� ���ο� ���� �����ؾ� ��. 

��, NEXTVAL�� ���ο� ���� ������ ������ �� ���� CURRVAL�� ��ü�ϰ� ��. 

NEXTVAL, CURRVAL�� ����� �� �ִ� ���� ����� �� ���� ��츦 ���캸��

    ����� �� �ִ� ���                  ����� �� ���� ���
    
���� ������ �ƴ� SELECT ��            VIEW�� SELECT ��
INSERT ���� SELECT ��                DISTINCT Ű���尡 �ִ� SELECT ��
INSERT ���� VALUE��                  GROUP BY, HAVING, ORDER BY ���� �ִ� SELECT 
UPDATE���� SET ��                    SELECT, DELETE, UPDATE�� ���� ����
                                    CREATE TABLE, ALTER TABLE ����� DEFAULT ��
                                                              
*/

-- CURRVAL, NEXTVAL�� ���� ��� ���� ���캸��

-- 1. NEXTVAL�� ���ο� ���� �����ؾ� ��

SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;

-- 2. �������� ���� ���� �˾Ƴ��� ���ؼ� CURRVAL�� ���

SELECT DEPT_DEPTNO_SEQ.CURRVAL FROM DUAL;

/*
======================== ������ �ǹ��� �����ϱ� =======================

�������� 99.9%�� INSERT ����� ���� ���Ǿ� �÷� ���� �ڵ����� �߻���Ű�� �뵵�� ���. 

��� ���̺��� �����ϸ鼭 ��� ��ȣ�� �⺻ Ű�� ����. 

�⺻ Ű�� �ݵ�� ������ ���� ������ ��. 

����ڰ� ���ο� ����� �߰��� ������ 
������ �����ȣ�� INSERT �ؾ� �ϴ� ���ŷο��� ����.

��� ��ȣ�� �����ϴ� ������ ��ü�� ����Ͽ� ��� ��ȣ�� �ڵ� �����ǵ��� �Ѵٸ� 
�̷��� ���ŷο��� ������ �� ����.

*/

--  ===================== �������� ���̺��� �⺻ Ű�� �����ϱ� ===============

-- ��� ��ȣ�� �����ϴ� ������ ��ü�� �����Ͽ� 
-- �̸� �⺻ Ű�� ��� ��ȣ�� ����Ͽ� ����ڰ� ���ο� ����� �߰��� ������ 
-- ������ �����ȣ�� INSERT �ؾ� �ϴ� ���ŷο��� �ٿ�����

-- 1. ���� ���� 1�̰� 1�� �����ϰ�, �ִ��� 100000�� �Ǵ� ������ EMP_SEQ �����ϱ�

CREATE SEQUENCE EMP_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000 ;

-- 2. �̹����� ������ �������� ����ϱ� ���ؼ� 
--    ��� ��ȣ�� �⺻ Ű�� �����Ͽ� EMP01�� �̸����� ���Ӱ� �����ϱ�

DROP TABLE EMP01;

CREATE TABLE EMP01(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR(10),
HIREDATE DATE
);

-- 3. ��� ��ȣ�� �����ϴ� EMPNO �÷��� �⺻ Ű�� �����ؼ� �ߺ��� ���� ���� �� ����
--    ������ ������ EMP_SEQ �������κ��� 
--    �����ȣ�� �ڵ����� �Ҵ�޾� �����͸� �߰��ϴ� ����

INSERT INTO EMP01
VALUES(EMP_SEQ.NEXTVAL, 'JULIA', SYSDATE);

SELECT * FROM EMP01;

-- 1. �μ� ��ȣ�� �����ϴ� ������ ��ü�� �����Ͽ� 
--    ������ ��ü�� �̿��Ͽ� �μ� ��ȣ�� �ڵ� �����ϵ��� �غ���

-- �μ� ���̺� ����

CREATE SEQUENCE DEPT_SEQ
START WITH 10
INCREMENT BY 10
MAXVALUE 100000 ;

CREATE TABLE DEPT_EXAMPLE(
DEPTNO NUMBER(4) PRIMARY KEY,
DNAME VARCHAR2(15),
LOC VARCHAR2(15)
);

-- �μ� ��ȣ�� �����ϴ� DEPTNO �÷��� �⺻ Ű�� �����Ͽ����Ƿ� �ߺ��� ���� ������ ����

INSERT INTO DEPT_EXAMPLE
VALUES(DEPT_SEQ.NEXTVAL, 'ACCOUNT', 'SEOUL');
INSERT INTO DEPT_EXAMPLE
VALUES(DEPT_SEQ.NEXTVAL, '�渮��', '����');
INSERT INTO DEPT_EXAMPLE
VALUES(DEPT_SEQ.NEXTVAL, '�ѹ���', '����');
INSERT INTO DEPT_EXAMPLE
VALUES(DEPT_SEQ.NEXTVAL, '�����', '��õ');

SELECT * FROM DEPT_EXAMPLE;

-- �߰��� ���� ���캸�� ������ ��ü�� �߻���Ų �Ϸù�ȣ�� 
-- �μ� ��ȣ�� ����� ���� Ȯ���� �� �ֽ��ϴ�. 
-- ������ ��ü�� �ʱ� ���� 10���� �Ͽ� 10�� �����ϵ��� �߱� ������ 
-- ����ġ�� �����߱� ������ �μ� ��ȣ�� 10, 20, 30, 40���� ������ ���� Ȯ���� �� ����.

-- ================= DROP SEQUENCE������ �������� ���� =================

DROP SEQUENCE DEPT_DEPTNO_SEQ;

/*
=================== ������ ���� ========================

�̹����� �������� �����غ���. 
�������� �����Ϸ��� ALTER SEQUENCE ���� ����ؾ���.

ALTER SEQUENCE sequence_name 
[INCREMENT BY n] 
[{MAXVALUE n | NOMAXVALUE}] 
[{MINVALUE n | NOMINVALUE}] 
[{CYCLE | NOCYCLE}] 
[{CACHE n | NOCACHE}]

ALTER SEQUENCE�� START WITH ���� ���ٴ� ���� �����
CREATE SEQUENCE�� ������ ����. 

START WITH �ɼ��� ALTER SEQUENCE�� �Ἥ ������ �� ����.

�ٸ� ��ȣ���� �ٽ� �����Ϸ��� ���� �������� �����ϰ� �ٽ� �����ؾ� ��.  
*/

-- �̹� �����ؼ� ����ϴ� �������� �ִ밪�� �����غ���

-- 1. �������� �ִ밪�� �������� ������ �⺻������ 10^27���� ������.
--    ����ڰ� ���Ƿ� �ִ밪�� ������ �� �ִµ� MAXVALUE�� ���� �����ϸ� ��. 
--    10���� 10�� �����ϸ鼭 �ִ� 30������ ���� ���� �������� �����ϱ�

DROP SEQUENCE DEPT_DEPTNO_SEQ;

CREATE SEQUENCE DEPT_DEPTNO_SEQ
START WITH 10
INCREMENT BY 10 
MAXVALUE 30; 

-- 2. �μ� ��ȣ�� ��� �����ϴ� ���� �ִ밪�� �Ѱ� ��. 
--    �ִ밪�� ���� ������ �������� �����غ���

SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;
SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;
SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;
SELECT DEPT_DEPTNO_SEQ.NEXTVAL FROM DUAL;

-- �̶� CYCLE �ɼ��� �������� ������ �⺻������ NOCYCLE�� ���� �ǹǷ� ������ �߻��ϰ� ��.

-- 3. ALTER SEQUENCE���� ����Ͽ� ��� ���̴� 
-- DEPT_DEPTNO_SEQ �������� �ִ밪�� �����غ���

ALTER SEQUENCE DEPT_DEPTNO_SEQ
MAXVALUE 1000;

-- 4. USER_SEQUENCES �� ��ȸ�ϸ� �������� �����Ǿ����� Ȯ���� �� ����

SELECT SEQUENCE_NAME, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG
FROM USER_SEQUENCES;