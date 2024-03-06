/*
======================= PL/SQL ���� ===========================

PL/SQL �� Oracle's Procedural Language extension to SQL�� ����. 

SQL���忡�� ��������, ����ó��(IF), �ݺ�ó��(LOOP, WHILE, FOR)���� �����ϸ�,

����Ŭ ��ü�� ����Ǿ� �ִ� ������ ���(Procedure Language)�μ� 
SQL�� ������ ��������.

����Ŭ �翡���� �����ͺ��̽� ���� �����͸� �����ϱ� ���ؼ� 
SQL�� �Բ� PL/SQL�� ����. 

C�� �ڹٿ� ���� ���α׷��� �� �ͼ��� ����̶�� 
������ ����� PL/SQL�� ���� ������ �� ���� ��. 

============= PL/SQL�� SQL�� ���� ������ ���� ����� ����===============

- ���� ������ �� �� ����.
- �� ó���� �� �� ����. 
- �ݺ� ó���� �� �� ����.

���� ����� ����� ������ ���� �����Ǵ� ������ 
ȿ�������� SQL ���� ����� �� �ְ� ����

PL/SQL�� PASCAL�� ������ �����μ� DECLARE~BEGIN~EXCEPTION~END ������ ���� ����

PL/SQL�� ������ ���� ���(BLOCK) ������ ���μ� ũ�� 3 �κ����� ���� �� ����

DECLARE SECTION(�����)

EXECUTABLE SECTION(�����)

EXCEOTION SECTION(���� ó����)

======================== �����(DECLARE SECTION) =======================

PL/SQL���� ����ϴ� ��� ������ ����� �����ϴ� �κ����μ� DECLARE�� ����. 

======================== �����(EXECUTABLE SECTION)======================

������ �������� SQL���� ������ �� �ֵ��� ������ ����� �����
���, �ݺ���, �Լ� ���� �� ������ ����� �� �ִ� �κ����� 
BEGIN���� ����.

======================== ���� ó��(EXCEPTION SECTION) ===================

PL/SQL ���� ����Ǵ� �߿� ������ �߻��� �� �ִµ� 
�̸� ���� �����̶�� ��. 

�̷��� ���� ������ �߻����� �� �̸� �ذ��ϱ� ���� ������ ����� �� �ִ� �κ����� 
EXCEPTION ���� ����.

======================== PL/SQL ���α׷��� �ۼ� ��� ============================

1. PL/SQL ��ϳ������� �� ������ ������ ������ �����ݷ�(;)�� ���.

2. END�ڿ� ;�� ����Ͽ� �ϳ��� ����� �����ٴ� ���� ���.

3. PL/SQL ����� �ۼ��� �����⸦ ���� ���Ϸ� �ۼ��� ���� �ְ�, 
   ������Ʈ���� �ٷ� �ۼ��� ���� ����.
   
4. SQL*PLUSȯ�濡���� DELCLARE�� BEGIN�̶�� Ű����� 
   PL/SQL���� �����ϴ� ���� �� �� ����.
   
5. ������ �ּ��� --�̰� ������ �ּ� /* */                                /*

6. �������� �����ϱ� ���ؼ� /�� �ݵ�� �ԷµǾ�� 
   PL/SQL ����� �࿡ / �� ������ ����� ������ ����.

===================== ������ �޽��� ����ϱ� =======================

'Hello World!'�� ����ϴ� PL/SQL ���� �ۼ��� ����

1. ����Ŭ�� ȯ�� ���� SERVEROUTPUT�� ����Ŭ���� �������ִ� ���ν����� ����Ͽ�  
   ����� �ִ� ������ ȭ�鿡 �����ֵ��� �����ϴ� ȯ�� �����ε� 
   ����Ʈ�� OFF�̱⿡ ON���� �����ؾ߸� ��.
   
SET SERVEROUTPUT ON

2. ȭ�� ����� ���ؼ��� PUT_LINE�̶� ���ν����� �̿�. 
   PUT_LINE�� ����Ŭ�� �������ִ� ���ν����� DBMS_OUTPUT ��Ű���� ���� ����. 
   ���� DBMS_OUTPUT.PUT_LINE�� ���� ����ؾ� ��.
   
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello World!'); 
END;
/

============================= ��������� ���Թ� ===========================

PL/SQL�� ����ο����� ����ο��� ����� ������ ����. 

������ ������ �� ������ ������ �ڷ����� ����ؾ� ��.

PL/SOL���� ���� ������ �� ���Ǵ� �ڷ����� SQL���� ����ϴ� �ڷ����� ���� ������.

identifier [CONSTANT] datatype [NOT NULL]
[:= | DEFAULT expression];


����                      ����

IDENTIFIER                ������ �̸�

CONSTANT                  ������ ���� ������ �� ������ ������

DATATYPE                  �ڷ����� ���

NOT NULL                  ���� �ݵ�� �����ϵ��� �ϱ� ���� ������ ����

EXPRESSION                LITERAL, �ٸ� ����, �����ڳ� �Լ��� �����ϴ� ǥ����


�������� �����ϰ� �� �Ŀ� ����� ����� �÷� ������ ������ ������ ��� ������ ���� ����

VEMPNO NUMBER(4);
VENAME VARCHAR2(10);

PL/SOL���� ������ ������ �� ���� ���� 
SQL���� ����ϴ� �ڷ����� �����ϰ� �����ϴ� ���� 
��Į��(SCALAR) ������� ��.

���ڸ� �����ϱ� ���ؼ� 
VEMPNO ������ NUMBER�� �����Ͽ���,

���ڸ� �����ϱ� ���ؼ�
VENAME ������  VARCHAR2�� ����ؼ� �����Ͽ���.

===================== ���Թ����� ������ �� �����ϱ� ==========================

PL/SQL������ ������ ���� �����ϰų� �������ϱ� ���ؼ� :=�� ���

:= �� ������ �� ���� �ޱ� ���� ������ ����ϰ� ������ ������ ���� ���

identifier := expression;

����ο��� ������ ������ ���� �Ҵ��ϱ� ���ؼ��� :=�� ����غ���.

VEMPNO := 7788;
VENAME := 'SCOTT'; 

======================== ���� ����ϱ� ===============================

������ ����� �Ҵ��� �ϰ� �� ���� ���� ����� ����.

1. ED EXAM01�� �Է��Ͽ� ���� ���� EXAM01.sql ���Ͽ� ������ ���� �Է�.

SET SERVEROUTPUT ON
DECLARE
	VEMPNO NUMBER(4);
	VENAME VARCHAR(10);
BEGIN
	VEMPNO := 7788;
	VENAME := 'SCOTT';
	DBMS_OUTPUT.PUT_LINE('��� / �̸�');
	DBMS_OUTPUT.PUT_LINE('------------------');
	DBMS_OUTPUT.PUT_LINE(VEMPNO || ' / ' || VENAME);
END;

2. �ۼ��� �Ϸ��� �Ŀ� ������ ����.
   SQL> ������Ʈ�� @EXAM01�� �Է��ϸ� 
   EXAM01.sql ���� ���ο� �����
   PL/SQL �� ����� �� ����� ��µ�.

======================= ��Į�� ����/���۷��� ���� ==============================

PL/SQL���� ������ �����ϱ� ���� ����� �� �ִ� ���������� ũ�� 
��Į��(Scalar)�� ���۷���(Reference)�� ���� �� ����.

=============================== ��Į�� ======================================

PL/SOL���� ������ ������ �� ���Ǵ� �ڷ����� 
SQL���� ����ϴ� �ڷ����� ���� ������.
���ڸ� �����Ϸ��� NUMBER�� ����ϰ� 
���ڸ� �����Ϸ��� VARCHAR2�� ����ؼ� ����

=============================== ���۷��� =====================================

������ ����� �ٸ� ���� �Ǵ� �����ͺ��̽� �÷��� ���߾� ������ �����ϱ� ���� 
%TYPE�Ӽ��� ����� �� ����

VEMPNO EMP.EMPNO%TYPE;
        ��    �� 
VENAME EMP.ENAME%TYPE;
        ��    ��

%TYPE�Ӽ��� ����Ͽ� ������ VEMPNO ������ 

�ش� ���̺�(��EMP)�� �ش� Į��(��EMPNO Ȥ�� ��)�� �ڷ����� ũ�⸦ 
�״�� �����ؼ� ������.

��� �����ڰ� ���̺� ���ǵ� Į���� �ڷ����� ũ�⸦ ��� �ľ��ϰ� �ִٸ� 
�� ������ ��������, 
��κ��� �׷��� ���ϱ� ������ ����Ŭ������ ���۷���(REFERENCES) ������ ������.

�÷��� �ڷ����� ����Ǵ��� 
Į���� �ڷ����� ũ�⸦ �״�� �����ϱ� ������ 
���� ���۷��� ���� ������ ������ �ʿ䰡 ���ٴ� ������ ����.

%TYPE == �ķ� ������ �����Ѵٸ� 

�ο�(��) ������ �����ϴ� %ROWTYPE�� ����.

�����ͺ��̽��� ���̺� �Ǵ� VIEW�� �Ϸ��� �÷��� RECORD�� �����ϱ� ���Ͽ�
%ROWTYPE�� ���. 

�����ͺ��̽� ���̺� �̸��� %ROWTYPE �տ� ���ξ �ٿ� RECORD�� �����ϰ�
FIELD�� ���̺��̳� VIEW�� COLUMN��� ������ Ÿ�԰� LENGTH�� �״�� ������ �� ����.

VEMP EMP%ROWTYPE;

%ROWTYPE�� ��� �� ������ 
Ư�� ���̺��� �÷��� ������ ������ ������ �𸣴��� ������ �� ����.

SELECT �������� �ο츦 �˻��� �� ������.

======================== PL/SQL���� SELECT �� ==========================

�����ͺ��̽����� ������ ������ �ʿ䰡 ���� �� 
�Ǵ� �����ͺ��̽��� ����� ������ ������ �ʿ䰡 ���� �� SQL�� ���. 

PL/SQL�� SQL�� �ִ� DML ����� ������.

���̺��� �࿡�� ���ǵ� ���� ������ �Ҵ��Ű�� ���� SELECT������ ���.

PL/SQL�� SELECT ���� INTO���� �ʿ��ѵ�, 
INTO������ �����͸� ������ ������ �����. 

SELECT ���� �ִ� �÷��� INTO���� �ִ� ������ 1��1������ �ϱ⿡ 
������ �������� ��, ���̰� ��ġ�Ͽ��� ��. 

SELECT ���� INTO���� ���� �ϳ��� �ุ�� ������ �� ����. 

SELECT select_list
INTO {variable_name1[,variable_name2,..] | record_name}
FROM table_name
WHERE condition;

����              ����

SELECT_LIST       ���� ����̸� �� �Լ�, �׷� �Լ�, ǥ������ ����� �� ����.

VARIABLE_NAME     �о���� ���� �����ϱ� ���� ��Į�� ����

RECORD_NAME       �о� ���� ���� �����ϱ� ���� PL/SQL RECORD ����

CONDITION         PL/SQL ������ ����� �����Ͽ� 
                  ����,ǥ����,���,�� �����ڷ� �����Ǹ� 
                  ���� �ϳ��� ���� RETURN�� �� �ִ� �����̾�� ��.
                  
SELECT EMPNO, ENAME INTO VEMPNO, VENAME
FROM EMP
WHERE ENAME='SCOTT';

VEMPNO, VENAME ������ 
�÷�(EMPNO, ENAME)�� ������ ���������� ������ �ϱ� ���ؼ� 
%TYPE �Ӽ��� �����.

INTO ���� ������ SELECT���� ����� �÷��� ���������Ӹ� �ƴ϶� 
�÷��� ���͵� ��ġ�ؾ� ��.

== ����� �̸� �˻��ϱ�

PL/SQL�� SELECT ������ EMP ���̺��� �����ȣ�� �̸��� ��ȸ�ϱ�

1. ED ������ �����̸��� �Է��Ͽ� ���� ���� SQL ���Ͽ� ������ ���� �Է��Ͻÿ�.
   (�����̸�:EXAM02.sql)

2. �ۼ��� �Ϸ��� �Ŀ� ������ ����. 
   SQL> ������Ʈ�� @���ϸ��� �Է��ϸ� 
   SQL ���� ���ο� ����� PL/SQL �� ����� �� ����� ��µ�.
   
============================ PL/SQL ���̺� =============================

PL/SQL ���̺��� �ο쿡 ���� �迭ó�� �׼����ϱ� ���� �⺻Ű�� ���. 

�迭�� �����ϰ� PL/SQL ���̺��� �׼����ϱ� ���� 
BINARY_INTEGER ���������� �⺻Ű�� PL/SQL ���̺� ��Ҹ� �����ϴ� 
��Į�� �Ǵ� ���ڵ� ���������� �÷��� �����ؾ� ��.

���� �̵��� �������� �����Ӱ� ������ �� ����.

TYPE table_type_name IS TABLE OF
{column_type | variable%TYPE | table.column%TYPE} [NOT NULL]
[INDEX BY BINARY_INTEGER];
identifier table_type_name;


����                  ����
TABLE_TYPE_NAME       ���̺����� �̸�
COLUMN_TYPE           VARCHAR2, DATE, NUMBER �� ���� ��Į�� ��������
IDENTIFIER            ��ü PL/SQL ���̺��� ��Ÿ���� �ĺ����� �̸�

========================== TABLE ���� ����ϱ� ===============================

TABLE ������ ����Ͽ� EMP ���̺��� �̸��� ������ ����� ����

1. ED ������ �����̸��� �Է��Ͽ� ���� ���� SQL ���Ͽ� ������ ���� �Է��Ͻÿ�.
   (�����̸�:EXAM03.sql)
   
SET SERVEROUTPUT ON
DECLARE

-- ���̺� Ÿ���� ���� 
TYPE  ENAME_TABLE_TYPE IS TABLE OF EMP.ENAME%TYPE
INDEX BY BINARY_INTEGER;
TYPE  JOB_TABLE_TYPE IS TABLE OF EMP.JOB%TYPE
INDEX BY BINARY_INTEGER;

-- ���̺� Ÿ������ ���� ����
ENAME_TABLE  ENAME_TABLE_TYPE;
JOB_TABLE  JOB_TABLE_TYPE;
  
I BINARY_INTEGER := 0;
  
-- ����� ��

BEGIN  
  -- EMP ���̺��� ����̸��� ������ ����
  FOR  K IN (SELECT ENAME, JOB FROM EMP) 
  LOOP
    I := I + 1;                --�ε��� ����
    ENAME_TABLE(I) := K.ENAME; --����̸��� 
    JOB_TABLE(I) := K.JOB;     --������ ����. 
  END LOOP;

  --���̺� ����� ������ ���
  FOR J IN 1..I LOOP          
    DBMS_OUTPUT.PUT_LINE(RPAD(ENAME_TABLE(J),12) 
       || ' / ' ||  RPAD(JOB_TABLE(J),9));
  END LOOP;
END;
/

=================== PL/SQL RECORD TYPE =======================

PL/SQL RECORD TYPE�� ���α׷� ����� ����ü�� ������

PL/SQL RECORD��FIELD(ITEM)���� ������ �ϳ��� ���� ������ ó���� �� �ְ� �� �ֹǷ� 
���̺��� ROW�� �о�� �� ����.

TYPE type_name IS RECORD
(field_name1 {scalar_datatype|record_type} 
[NOT NULL] [{:= | DEFAULT} expr],
field_name2 {scalar_datatype|record_type} 
[NOT NULL] [{:= | DEFAULT} expr],
. . . . . . .);
identifiee_name type_name;


TYPE_NAME       RECODE ���� �̸�, �� �ĺ��ڴ� RECODE�� �����ϱ� ���� ���.


FIELD_NAME      RECODE���� �ʵ��.

���� �ʵ带 �����ϰų� �ʱ�ȭ�ϱ� ���� "."�� ���̿� �ڰ� ���ڵ� �̸��� �ʵ� �̸��� ���

Record_name.field_name

=================== RECORD TYPE ����ϱ� ============================

EMP ���̺��� SCOTT ����� ������ ����غ���

1. ED ������ �����̸��� �Է��Ͽ� ���� ���� SQL ���Ͽ� ������ ���� �Է��Ͻÿ�.
   (�����̸�:EXAM04.sql)

SET SERVEROUTPUT ON
DECLARE
  -- ���ڵ� Ÿ���� ����
  TYPE emp_record_type IS RECORD(
    v_empno    emp.empno%TYPE,
    v_ename    emp.ename%TYPE,
    v_job    emp.job%TYPE,
    v_deptno  emp.deptno%TYPE);

  -- ���ڵ�� ���� ����
  emp_record  emp_record_type;
================================================ ����� ��
BEGIN
  -- SCOTT ����� ������ ���ڵ� ������ ����
  SELECT empno,ename, job, deptno
    INTO emp_record
    FROM emp
    WHERE ename = UPPER('SCOTT');

  -- ���ڵ� ������ ����� ��� ������ ���
  DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || 
     TO_CHAR(emp_record.v_empno));
  DBMS_OUTPUT.PUT_LINE('��    ��: ' || 
     emp_record.v_ename);
  DBMS_OUTPUT.PUT_LINE('������ : ' || 
     emp_record.v_job);
  DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' || 
     TO_CHAR(emp_record.v_deptno));
END;
/

============================ ���ù� ==============================

�⺻������ ��� ������� ������ ������� ���������� �����.

������ ��쿡 ���󼭴� ������ �帧�� ������ �ʿ䰡 ����. 

�̶� ����ϴ� ���� IF ��.

IF ���� ������ �����ؼ� �����ϴ��� ���� �ʴ��Ŀ� ���� 
������ ���������� �����ϱ� ������ ���ù��̶�� ��. 

����Ŭ������ 3���� ������ ���ù��� �����˴ϴ�.

if ��� �ܾ��� �������� �ǹ̴� ������ ~ ��顱. 

�̷��� �ǹ�ó�� if���� ���ǿ� ���� 
� ����� ���������� ó���ϱ� ���� ����ϴ� ���� ��ǥ���� ����. 

��� ��쿡 � �ൿ�� �ض�!���� ���� ������ ó���� �� �� ���.

IF condition THEN ..... ���ǹ�
statements; .............. ���ǿ� ������ ��� ����Ǵ� ����
END IF

������ TRUE�̸� THEN������ ������ �����ϰ� 
������ FALSE�� NULL�̸� END IF���� ������ ����

====================== �μ���ȣ�� �μ��� �˾Ƴ��� =======================

������ ��� ��ȣ�� 7788�� ����� �μ� ��ȣ�� ��� �ͼ�
�μ� ��ȣ�� ���� �μ����� ���ϴ� ����. 

IF���� ������ ������ �ݵ�� END IF�� ����ؾ� �Ѵٴ� ���� ����

1. ED ������ �����̸��� �Է��Ͽ� ���� ���� SQL ���Ͽ� ������ ���� �Է��Ͻÿ�.
   (�����̸�:EXAM05.sql)
   
SET SERVEROUTPUT ON
DECLARE
   VEMPNO 	 NUMBER(4);
   VENAME 	 VARCHAR2(20);
   VDEPTNO       EMP.DEPTNO%TYPE;
   VDNAME 	 VARCHAR2(20) := NULL;
BEGIN
 SELECT EMPNO, ENAME, DEPTNO INTO VEMPNO,
               VENAME, VDEPTNO 
 FROM  EMP
 WHERE EMPNO=7788;
 IF (VDEPTNO = 10)  THEN
      VDNAME := 'ACCOUNTING';
 END IF;
 IF (VDEPTNO = 20)  THEN
     VDNAME := 'RESEARCH';
 END IF;
 IF (VDEPTNO = 30)  THEN
      VDNAME := 'SALES';
 END IF;
 IF (VDEPTNO = 40) THEN  
      VDNAME := 'OPERATIONS';
 END IF;

 DBMS_OUTPUT.PUT_LINE('���    �̸�    �μ���');
 DBMS_OUTPUT.PUT_LINE(VEMPNO||'    '||VENAME
  ||'    '||VDNAME);
END;
/

=== ������ ������ ���ϴ� ����. 
���� ����� ���� ���޿�*12+Ŀ�̼ǡ��̶� ������ �����. 
(CH20_QUIZ_01.sql)


SET SERVEROUTPUT ON
DECLARE
-- %ROWTYPE �Ӽ����� �ο� ��ü�� ������ �� �ִ� ���۷��� ���� ���� 
VEMP EMP%ROWTYPE; 
ANNSAL NUMBER(7,2);
BEGIN
DBMS_OUTPUT.PUT_LINE('��� / �̸� / ����'); 
DBMS_OUTPUT.PUT_LINE('-------------------------');
-- SCOTT ����� ��ü ������ �ο� ������ ���� VEMP�� �����Ѵ�. 
SELECT * INTO VEMP
FROM EMP
WHERE ENAME='SCOTT';
-- Ŀ�̼��� NULL�� ��� 0���� �����ؾ� �ùٸ� ���� ���

IF(VEMP.COMM IS NULL) THEN
   VEMP.COMM := 0;
END IF;                  

-- ��Į�� ������ ������ ����� ����� �����Ѵ�.
ANNSAL:=VEMP.SAL*12+VEMP.COMM ; 
-- ��� ��� 
DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||' /��
   ||VEMP.ENAME||' /'||ANNSAL); 
END;
/

�� ����� ���� �������� �ƹ��� ���뵵 ��µ��� ������ Ȯ���� �� ����.

�ֳ��ϸ� COMM Į�� ���� NULL�̱⿡ ������ ���� ����� ���� ���� NULL�� �������� ����.

���� Ŀ�̼� Į���� NULL ���� ���� 0 ������ �ٲ���� �ùٸ� ���� ����� �� �� �ְ� ��.

==================== IF ~ THEN ~ ELSE ~ END IF ===========================

IF �� �迭 �� ���� �Ϲ������� ���� ���Ǵ� ������ 
IF ~ THEN ~ ELSE ~ END IF ��. 

�� ������ ���� ���� ������ �� ���� �ٸ� ������ �����ϵ��� ������ �� ����.

[����1]
IF condition THEN ....... ���ǹ�
statements; ...... ���ǿ� ������ ��� ����Ǵ� ����[����2]
ELSE
statements; ...... ���ǿ� �������� ���� ��� ����Ǵ� ����[����3]
END IF
[����4]


[����1]�� �����ϰ� if ���� ������ ���ǹ��� �˻�. 

�׸��� �� ����� ���̸� [����2]�� �����ϰ�, �����̸� [����3]�� ����.

�׷� �Ŀ��� [����4]�� �����ϰ� ��.

======================= ���� ���ϴ� ���� ==========================

Ŀ�̼��� �޴� ������ �޿��� 12�� ���� �� Ŀ�̼ǰ� �ջ��Ͽ� ������ ���ϰ� 
Ŀ�̼��� ���� �ʴ� ������ �޿��� 12�� ���� �����θ� ������ ����

1. ED ������ �����̸��� �Է��Ͽ� ���� ���� SQL ���Ͽ� ������ ���� �Է��Ͻÿ�.
   (�����̸�:EXAM06.sql)
   
   SET SERVEROUTPUT ON
DECLARE
  VEMP EMP%ROWTYPE;
  ANNSAL NUMBER(7,2);
BEGIN
 -- SCOTT ����� ��ü ������ �ο� ������ ���� VEMP�� �����Ѵ�.   
  SELECT * INTO VEMP
  FROM EMP
  WHERE ENAME='SCOTT';
IF (VEMP.COMM IS NULL)THEN        -- Ŀ�̼��� NULL �̸� 
    ANNSAL:=VEMP.SAL*12;          -- �޿��� 12�� ���Ѵ�.
  ELSE                            -- Ŀ�̼��� NULL�� �ƴϸ� 
    ANNSAL:=VEMP.SAL*12+VEMP.COMM;
    -- �޿��� 12�� ���� �� Ŀ�̼ǰ� �ջ�
  END IF;

  DBMS_OUTPUT.PUT_LINE('��� / �̸� / ����'); 
  DBMS_OUTPUT.PUT_LINE('----------------------');
  DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||'/ '
                 ||VEMP.ENAME||'/'||ANNSAL); 
END;
/

=================== IF ~ THEN ~ ELSIF ~ ELSE ~ END IF ==================

IF ~ THEN ~ ELSE ~ END IF ���� �� ������ �����ϴ� �������� �ѹ��� ���Ǿ�����, 
�̷� ��� �� �߿� �ϳ��� ������ �� ����

���� �� ����� ���� ���� �ƴ� �� �̻󿡼� �ϳ��� �����ؾ� �� ��쿡�� 
IF ~ THEN ~ ELSIF ~ ELSE ~ END IF ���� ����ؾ� ��.

IF condition THEN
statements;
ELSIF condition THEN
statements;
ELSIF condition THEN
statements;
ELSE
statements;
END IF

=============== �μ���ȣ�� �μ��� �˾Ƴ��� =====================

SQL �Լ����� ������ ���� DECODE �Լ��� �н��ϸ鼭 
�μ���ȣ�� ���ؼ� �μ����� ������ ������

�̰� PL/SQL������ DECODE �Լ� ��� 
IF ~ THEN ~ ELSIF ~ ELSE ~ END IF �������� �μ���ȣ�� ���� �μ����� ���غ���

1. ED ������ �����̸��� �Է��Ͽ� ���� ���� SQL ���Ͽ� ������ ���� �Է��Ͻÿ�.
   (�����̸�:EXAM07.sql)

SET SERVEROUTPUT ON
DECLARE
  VEMP EMP%ROWTYPE;
  VDNAME VARCHAR2(14);
BEGIN
  DBMS_OUTPUT.PUT_LINE('��� / �̸� / �μ���'); 
  DBMS_OUTPUT.PUT_LINE('--------------------');

  SELECT * INTO VEMP
  FROM EMP
  WHERE ENAME='SCOTT';

  IF (VEMP.DEPTNO = 10)  THEN
    VDNAME := 'ACCOUNTING';
  ELSIF (VEMP.DEPTNO = 20)  THEN
    VDNAME := 'RESEARCH��;
ELSIF (VEMP.DEPTNO = 30)  THEN
    VDNAME := 'SALES';
  ELSIF (VEMP.DEPTNO = 40) THEN  
    VDNAME := 'OPERATIONS';
  END IF;

  DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||'/'||
  VEMP.ENAME||'/'||VDNAME); 
END;
/

=========================== �ݺ��� ============================

�ݺ����� SQL ���� �ݺ������� ���� �� �����ϰ��� �� �� ���. 

PL/SQL������ ������ ���� �پ��� �ݺ����� ���

1. ���� ���� �ݺ� �۾��� �����ϱ� ���� BASIC LOOP��

2. COUNT�� �⺻���� �۾��� �ݺ� ��� �����ϴ� FOR LOOP��

3. ������ �⺻���� �۾��� �ݺ� ��� �����ϱ� ���� WHILE LOOP��

4. LOOP�� �����ϱ� ���� EXIT��

========================= BASIC LOOP�� =========================

���� �Ұ��� ������ ���� ������ ������ ���� ���ڷ� LOOP�� END LOOP�� ����.

LOOP
statement1;
statement2;
. . . . . .
EXIT [WHERE condition];
END LOOP

���� ���� �帧�� END LOOP�� ������ ������ �׿� ¦�� �̷�� LOOP ������ ��� �ǵ��ư�.

�̷��� ������ ���� ������ �ϸ�, ���⼭ ������������ EXIT���� ���

�⺻ LOOP�� LOOP�� �� �� ������ �̹� ��ġ�ߴ� ������ ��� �ѹ��� ������ �����

================= BASIC LOOP ������ 1���� 5���� ����ϱ� =====================

������ BASIC LOOP ������ 1���� 5���� ����ϴ� ����

1. ED ������ �����̸��� �Է��Ͽ� ���� ���� SQL ���Ͽ� ������ ���� �Է��Ͻÿ�.
   (�����̸�:EXAM08.sql)
   
SET SERVEROUTPUT ON
DECLARE
N NUMBER := 1;
BEGIN
LOOP
DBMS_OUTPUT.PUT_LINE( N );
N := N + 1;
IF N > 5 THEN
EXIT;
END IF;
END LOOP;
END;
/
SET SERVEROUTPUT ON
DECLARE
N NUMBER := 1;
BEGIN
WHILE N <= 5 LOOP
DBMS_OUTPUT.PUT_LINE( N );
N := N + 1;
END LOOP;
END;
/

============================= FOR LOOP �� ==============================

FOR LOOP�� �ݺ��Ǵ� Ƚ���� ������ �ݸ��� ó���ϱ⿡ ����

FOR index_counter 
IN [REVERSE] lower_bound..upper_bound LOOP
statement1;
statement2;
. . . . . .
END LOOP


����                          ����

INDEX_COUNTER                 UPPER_BOUND�� LOWER_BOUND�� ������ ������ LOOP�� �ݺ������ν� 
                              1�� �ڵ������� �����ϰų� ���ҵǴ� ���� ���� 
                              �Ͻ������� ����� ����.

REVERSE                       UPPER_BOUND���� LOWER_BOUN���� �ݺ������ν� �ε����� 1�� ���ҵǵ��� ��.              

LOWER_BOUN                    INDEX_COUNTER ���� ������ ���� �ϴ� �ٿ�尪�� ����        

UPPER_BOUND                   INDEX_COUNTER ���� ������ ���� ��� �ٿ�尪�� ���� 


FOR LOOP ������ ���Ǵ� �ε����� 
������ �ڵ� ����ǹǷ� ���� ������ �ʿ䰡 ����.

FOR LOOP ���� LOOP�� �ݺ��� ������ �ڵ������� 1�� ���� �Ǵ� ������.

REVERSE�� 1�� �������� �ǹ�.


============================= WHILE LOOP�� ===================================

���� ������ TRUE�� ���ȸ� �Ϸ��� ������ �ݺ��ϱ� ���� WHILE LOOP ������ ���. 

������ �ݺ��� ���۵� �� üũ�ϰ� �Ǿ� LOOP���� ������ �� ���� ������� ���� ��쵵 ����.

LOOP�� ������ �� ������ FALSE�� �ݺ� ������ Ż���ϰ� ��

WHILE condition LOOP
statement1;
statement2;
. . . . . .
END LOOP

������ WHILE LOOP ������ 1���� 5���� ����ϴ� ����. 
1. ED ������ �����̸��� �Է��Ͽ� ���� ���� SQL ���Ͽ� ������ ���� �Է��Ͻÿ�.
   (�����̸�:EXAM10.sql)

SET SERVEROUTPUT ON
DECLARE
N NUMBER := 1;
BEGIN
WHILE N <= 5 LOOP
DBMS_OUTPUT.PUT_LINE( N );
N := N + 1;
END LOOP;
END;
/

2. WHILE LOOP ������ ���� �ﰢ�� ������ ����ϴ� ���Դϴ�. 
   (CH20_QUIZ_04.sql)
   
   SET SERVEROUTPUT ON
DECLARE
V_CNT NUMBER := 1;
V_STR VARCHAR2(10) := NULL;
BEGIN
WHILE V_CNT <=5 LOOP
V_STR := V_STR || '*';
DBMS_OUTPUT.PUT_LINE(V_STR);
V_CNT := V_CNT +1;      
END LOOP;               
END;
/



