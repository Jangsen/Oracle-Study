-- DUAL ���̺�� SQL �Լ� �з�  dual

-- DUAL ���̺��� ������ ���캸�� ���ؼ� DESC ��ɾ ���

DESC DUAL;

-- DUAL ���̺��� DUMMY��� �� �ϳ��� �÷����� ����          dummy
-- �� �÷��� �ִ� ���̴� 1

-- DUMMY �÷��� � ���� ����?

SELECT *
FROM DUAL;

-- DUAL ���̺��� DUMMY��� �� �ϳ��� �÷��� X��� �� �ϳ��� �ο츸�� �����ϰ� ����
-- �� ���� �ƹ��� �ǹ̰� ����
-- �������� ���� ����� �ϳ��� �ο�� ��µǵ��� �ϱ� ���ؼ�
-- �� �ϳ��� �ο츦 �����ϰ� ��������.

-- ���� �Լ�    
/*
    
    ABS             ���밪�� ����
    abs
    
    COS             COSINE ���� ��ȯ
    cos
    
    EXP             e(2.71828183...) ��  n���� ��ȯ
    exp
    
    FLOOR           �Ҽ��� �Ʒ��� �߶� (����)
    floor
    
    LOG             LOG���� ��ȯ
    log
    
    POWER           POWER(m,n) m�� n���� ��ȯ
    power
    
    SIGN            SIGN (n) n < 0 �̸� -1 ,
    sign                     n = 0 �̸� 0, 
                             n > 0 �̸� 1     �� ��ȯ
    
    SIN             SINE ���� ��ȯ
    sin
    
    TAN             TANGENT ���� ��ȯ
    tan
    
    ROUND           Ư�� �ڸ������� �ݿø�
    round
    
    TRUNC           Ư�� �ڸ������� �߶� (����)
    trunc
    
    MOD             �Է� ���� ���� ���� ������ ���� ��ȯ
    mod
*/

-- ���밪 ���ϴ� ABS �Լ�   abs

SELECT -10, ABS(-10)
FROM DUAL;

-- �Ҽ��� �Ʒ��� ������ FLOOR �Լ�

SELECT 34.5678, FLOOR(34.5678)
FROM DUAL;

-- Ư�� �ڸ������� �ݿø��ϴ� ROUND �Լ�

SELECT 34.5678, ROUND(34.5678)
FROM DUAL;

-- ROUND(���, �ڸ���)
-- �� ��° ���� ���� 2�̸� �Ҽ��� ���� ����° �ڸ����� �ݿø��Ͽ�
-- �Ҽ��� ���� �� ��° �ڸ����� ǥ��

SELECT 34.5678,ROUND(34.5678,2)
FROM DUAL;

-- �ι�° ���� ���� ������ ���� �� ���
-- �ϴ���, �ʴ���, ����� ������ �Ž��� �ö�
-- ����϶��� �޸� �ش� �ڸ����� �ݿø��� �Ͼ

SELECT 34.5678,ROUND(34.5678,-1)
FROM DUAL;

-- Ư�� �ڸ������� �߶󳻴� TRUNC �Լ�        trunc
-- ������ �ڸ� �� ���ϸ� ���� ����� �����ִ� �Լ�

SELECT TRUNC(34.5678,2),TRUNC(34.5678,-1),TRUNC(34.5678)
FROM DUAL;

-- �������� ���ϴ� MOD �Լ�      mod

SELECT MOD(27,2),MOD(27,5),MOD(27,7)
FROM DUAL;

-- ����� Ȧ���� ������� �˻��ϱ�

SELECT *
FROM EMP
WHERE MOD(EMPNO,2) = 1;

-- ���� ó�� �Լ�
/*
    LOWER           �ҹ��ڷ� ��ȯ
    lower
    
    UPPER           �빮�ڷ� ��ȯ
    upper
    
    INITCAP         ù ���ڸ� �빮�ڷ� ������ ���ڴ� �ҹ��ڷ� ��ȯ
    initcap
    
    CONCAT          ������ ���� ����
    concat
    
    SUBSTR          ���ڸ� �߶� ���� ( �ѱ� 1Byte )
    substr
    
    SUBSTRB         ���ڸ� �߶� ���� ( �ѱ� 2Byte )
    substrb
    
    LENGTH          ������ ���̸� �߶� ��ȯ ( �ѱ� 1Byte )
    length
    
    LENGTHB         ������ ���̸� �߶� ��ȯ ( �ѱ� 2Byte )
    lengthb

    LPAD, RPAD      �Է� ���� ���ڿ��� ��ȣ�� �����Ͽ� Ư�� ������ ���ڿ��� ��ȯ
    lpad, rpad
    
    TRIM            �߶󳻰� ���� ���ڸ� ǥ��
    trim
    
    CONVERT         CHAR SET�� ��ȯ
    convert
    
    CHR             ASCII �ڵ� ������ ��ȯ
    chr
    
    ASCII           ASCII �ڵ� ���� ���ڷ� ��ȯ
    ascii
    
    REPLACE         ���ڿ����� Ư�� ���ڸ� ����
    replace
    
*/

-- �빮�ڷ� ��ȯ�ϴ� UPPER �Լ�           upper

SELECT 'Welcome to Oracle', UPPER('Welcome to Oracle')
FROM DUAL;

-- �ҹ��ڷ� ��ȯ�ϴ� LOWER �Լ�           lower

SELECT 'WELCOME TO ORACLE', LOWER('WLECOME TO ORACLE')
FROM DUAL;

-- �̴ϼȸ� �빮�ڷ� ��ȯ�ϴ� INITCAP �Լ�

SELECT 'WELCOME TO ORACLE',
INITCAP('WELCOME TO ORACLE')
FROM DUAL;

-- �ҹ���('manager')�� �����͸� �˻��ؾ� �Ѵٸ� 
-- LOWER �Լ��� ����ؼ� ���ϴ� ����� ���� �� ����

SELECT JOB
FROM EMP
WHERE LOWER(JOB) = 'manager';

-- ������ ���̸� ���ϴ� LENGTH           length
-- �� ���� ���ڷ� �����Ǿ����� ���̸� �˷��ִ� �Լ�

SELECT LENGTH('ORACLE'), LENGTH('����Ŭ')
FROM DUAL;

-- ����Ʈ ���� �˷��ִ� LENGTHB �Լ�           lengthb
-- �ѱ��� 2Byts �Ǵ� 3Byte �� ����ϹǷ� ����!!

SELECT LENGTHB('ORACLE'), LENGTHB('����Ŭ')
FROM DUAL;

-- ���ڿ� �Ϻθ� �����ϴ� SUBSTR �Լ�

-- SUBSTR �� SUBSTRB �Լ��� ��� ���ڿ��̳� Į���� �ڷῡ�� 
-- ������ġ���� ���� ������ŭ�� ���ڸ� ������

-- SUBSTR(���, ������ġ, ������ ����)

SELECT SUBSTR('WELCOME TO ORACLE',4,3)
FROM DUAL;

-- ������ġ ���� ���� ���� ������ �� �� �ִµ� �̶��� ���ڿ��� ������ �ƴ� ���ʺ��� ������

SELECT SUBSTR('WELCOME TO ORACLE',-4,3)
FROM DUAL;

-- ������ġ: -4(���ʿ��� 4��°) ���� ���ڼ�: 3��

-- ������� �Ի�⵵�� ����Ϸ���?

SELECT SUBSTR(HIREDATE,1,2) �⵵ ,SUBSTR(HIREDATE,4,2) ��
FROM EMP;

-- 9���� �Ի��� ����� ���

SELECT *
FROM EMP
WHERE SUBSTR(HIREDATE,4,2) = '09';

-- 82�⵵�� �Ի��� ������ �˾Ƴ��� ���� SUBSTR �Լ��� �̿��Ͽ� 
-- HIREDATE �÷����� ù ���ں��� 2���� �����Ͽ� �� ���� 82������ üũ

SELECT *
FROM EMP
WHERE SUBSTR(HIREDATE,1,2) = '82';

-- �̸��� E�� ������ ����� �˻�
-- SUBSTR �Լ��� �̿��Ͽ� 
-- ENAME �÷��� ������ ���� �Ѱ��� �����ؼ� �̸��� E�� ������ ����� �˻�

SELECT *
FROM EMP
WHERE SUBSTR(ENAME,-1,1) = 'E';

-- ����Ʈ ���� �������� ���ڿ� �Ϻθ� �����ϴ� SUBSTRB �Լ�
-- �޸𸮿� ����Ǵ� ����Ʈ ���� ��
-- ������ 1�ڴ� �޸𸮿� 1����Ʈ�� ����

SELECT SUBSTR('WELCOME TO ORACLE',4,3),
       SUBSTRB('WELCOME TO ORACLE',4,3)
FROM DUAL;

-- �ѱ� 1�ڴ� 3����Ʈ�� �����ϱ� ������ SUBSTR �Լ��� SUBSTRB �Լ��� ����� �޶���

SELECT SUBSTR('����������Ŭ',1,6),
       SUBSTRB('����������Ŭ',1,6)
FROM DUAL;

-- ���ڵ� ��Ŀ� ���� �ѱ� �� ������ ����Ʈ���� �޶���!!

-- * KO16KSC5601, KO16MSWIN949, EUR-KR : �ѱ� �� ���� 2����Ʈ
-- * UTF8, AL32UTF8 : �� ���� 3����Ʈ

-- Ư�� ������ ��ġ�� ���ϴ� INSTR �Լ�      instr

-- ��� ���ڿ��̳� �÷����� Ư�� ���ڰ� ��Ÿ���� ��ġ�� �˷���
-- ���ڿ� 'Welcome To Oracle' ���� 'O' �� ����� ��ġ�� ������ �˰� ������
-- INSTR �Լ��� ���

SELECT INSTR('WELCOME TO ORACLE','O')
FROM DUAL;

-- INSTR(���, ã������, ������ġ, ���°�߰�)

SELECT INSTR('WELCOME TO ORACLE','O',6,2)
FROM DUAL;

-- ���鵵 ���ڷ� ����ϱ� ������ 12 �� ����� ����.

-- INSTRB �Լ�            instrb  
-- �����ڴ� 1���ڰ� 1����Ʈ, �ѱ��� 1���ڰ� 3����Ʈ

SELECT INSTR('�����ͺ��̽�','��',3,1),
       INSTRB('�����ͺ��̽�','��',3,1)
FROM DUAL;

-- �̸��� �� ��° �ڸ��� R�� ������ ����� �˻��ϱ� ���ؼ� 
-- ���ϵ�ī�� _ �� LIKE �����ڸ� ����Ͽ� ������ ���� ǥ���� �� ����

SELECT *
FROM EMP
WHERE SUBSTR(ENAME, 3, 1) = 'R';

SELECT *
FROM EMP
WHERE ENAME LIKE '__R%';

-- Ư�� ��ȣ�� ä��� LPAD/RPAD �Լ�      lpad, rpad

-- LPAD(LEFT PADDING) �Լ��� 
-- Į���̳� ��� ���ڿ��� ��õ� �ڸ������� �����ʿ� ��Ÿ����, 
-- ���� ���� �ڸ��� Ư�� ��ȣ�� ä��

SELECT LPAD('ORACLE',20,'#')
FROM DUAL;

-- �� 20������ ORACLE 6���� �������� 14���ڸ� #�� ǥ��

-- RPAD(RIGHT PADDING) �Լ���
-- LPAD�� �ݴ�� Į���̳� ��� ���ڿ��� ��õ� �ڸ������� ���ʿ� ��Ÿ����,
-- ���� ������ �ڸ��� Ư�� ��ȣ�� ä��

SELECT RPAD('ORACLE',20,'#')
FROM DUAL;

-- �� 20������ ORACLE 6���� ���������� 14���ڸ� #�� ǥ��

-- ���� ���ڸ� �����ϴ� TRIM �Լ�  trim

-- LTRIM �Լ��� ���ڿ��� ����(��)�� ���� ���ڵ��� ����     ltrim

SELECT LTRIM('                         ORACLE')
FROM DUAL;

-- RTRIM �Լ��� ���ڿ��� ������(��)�� ���� ���ڵ��� ����    rtrim

SELECT RTRIM('ORACLE                         ')
FROM DUAL;

-- TRIM �Լ��� �÷��̳� ��� ���ڿ����� Ư�� ���ڰ�
-- ù ��° �����̰ų� ������ �����̸� �߶󳻰� ���� ���ڿ��� ��ȯ

SELECT TRIM('A' FROM 'AAAAAAAAAAAORACLEAAAAAAAAAAAA')
FROM DUAL;

-- ù��° 'A' �ڸ��� ���� ����
-- �������� ���� ���� ���ڸ� ������

SELECT TRIM ('               ORACLE                ')
FROM DUAL;

-- ��¥ �Լ�            date
/*

    SYSDATE                 �ý��� ����� ���� ��¥�� ��ȯ
    
    MONTHS_BETWEEN          �� ��¥ ���̰� �� ���������� ��ȯ
    
    ADD_MONTH               Ư�� ��¥�� ���� ���� ����
    
    NEXT_DAY                Ư�� ��¥���� ���ʷ� �����ϴ� ���ڷ� ���� ������ ��¥�� ��ȯ
    
    LAST_DAY                �ش� ���� ������ ��¥�� ��ȯ
    
    ROUND                   ���ڷ� ���� ��¥�� Ư�� �������� �ݿø�
    
    TRUNC                   ���ڷ� ���� ��¥�� Ư�� �������� ����

*/

-- ���� ��¥�� ��ȯ�ϴ� SYSDATE �Լ�       sysdate

SELECT SYSDATE
FROM DUAL;

-- ��¥ ����

-- ��¥ �� �����Ϳ� ���ڸ� ���ϸ� (��¥ + ����) �� ��¥�κ���
-- �� �Ⱓ��ŭ ���� ��¥�� ���
-- ��¥�� �����Ϳ� ���ڸ� ���� (��¥ - ����) �� ��¥�κ���
-- �� �Ⱓ��ŭ ���� ��¥�� ����

SELECT SYSDATE - 1 ����, SYSDATE ����, SYSDATE + 1 ����
FROM DUAL;

-- �� ������� ��������� �ٹ� �ϼ��� ���ϱ�

SELECT TRUNC(SYSDATE - HIREDATE) �ٹ��ϼ�
FROM EMP;

-- Ư�� �������� �ݿø��ϴ� ROUND �Լ�         round

-- ROUND(date, format)

-- ���� ��
/*

    CC, SCC                 ����
    
    SYYY, YYYY, YEAR        4�ڸ� ������ �� �� ���� �������� �ݿø�
    SYEAR, YYY, YY, Y
    
    DDD, D, J               ��(7�� 1�Ϻ��� �ݿø�)
    
    HH, HH12, HH24          ���� ����
    
    Q                       �ø� ����
    
    MONTH, MON, MM, RM      �� �б��� �� ��° ���� 16���� �������� �ݿø�
    
    DAY, DY, D              ��(16���� �������� �ݿø�)
    
    MI                      ���� ����
    
*/


-- �Ի����� ���� �������� �ݿø��� ����

SELECT HIREDATE, ROUND(HIREDATE,'MONTH')
FROM EMP;

-- Ư�� �������� ������ TRUNC �Լ�         trunc

-- ���ڸ� �߶󳻴� �� �Ӹ� �ƴ϶� ��¥�� �߶� �� �� ����
-- ROUND �Լ��� ���������� ���� ������ �־� �پ��� �������� ��¥�� �߶� �� ����

-- TRUNC (date, format)

-- Ư�� ��¥(DATE)�� ��(MONTH)�� �������� ������ ��¥�� ���� �� TRUNC�� ���

SELECT HIREDATE, TRUNC(HIREDATE,'MONTH')
FROM EMP;

-- �� ��¥ ���� ������ MONTHS_BETWEEN �Լ�    month_between

-- ��¥�� ��¥ ������ ���� ���� ���ϴ� �Լ�

-- MONTHS_BETWEEN(date1, date2)

-- �������� �ٹ��� ���� ���� ���ϴ� ����

SELECT ENAME, SYSDATE, HIREDATE,
       MONTHS_BETWEEN(SYSDATE, HIREDATE)
FROM EMP;

-- �Ҽ��� ���ϱ��� ����� ������
-- �Ҽ��� �����ڸ��� �� ���� ���� ���� �ϼ��� ��Ÿ��
-- TRUNC �Լ��� ����ϸ� �Ҽ��� ���ϸ� ������ �� ����

SELECT ENAME, HIREDATE,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))
FROM EMP;

-- ���� ���� ���ϴ� ADD_MONTHS �Լ�

-- ADD_MONTH(date, number)

-- �Ի� ��¥�� 6������ �߰��ϱ�

SELECT ENAME, HIREDATE,
       ADD_MONTHS(HIREDATE,6)
FROM EMP;

-- �ش� ������ ���� ����� ��¥�� ��ȯ�ϴ� NEXT_DAY �Լ�

-- NEXT_DAY(date, ����)

-- ������ �������� ���ʷ� �ٰ����� �������� �������� �˾ƺ��� ����

SELECT SYSDATE,
       NEXT_DAY(SYSDATE, '��')
FROM DUAL;

-- �ش� ���� ������ ��¥�� ��ȯ�ϴ� LAST_DAY �Լ�

-- �Ի��� ���� ������ ���� ���ϴ� ����

SELECT HIREDATE,
       LAST_DAY(HIREDATE)
FROM EMP;

-- �� ��ȯ �Լ�  ===================================
-- ����Ŭ�� ����ϴ� ���� ����, ����, ��¥�� ������ ���� 
-- �ٸ� ������ ������ ��ȯ�ؾ� �ϴ� ��찡 ����
-- �̷� �� ����ϴ� �Լ��� �� ��ȯ �Լ�
-- �� ��ȯ �Լ��δ� TO_NUMBER, TO_CHAR, TO_DATE �� ����

/*
            <- TO_NUMBER            <- TO_CHAE
    Number                Character                 Date
               TO_CHAR ->              TO_DATE ->
               
*/

-- ���������� ��ȯ�ϴ� TO_CHAR �Լ�
-- ��¥���� ���������� ��ȯ�ϱ�

-- DATE ������ �����͸� ������ ��Ŀ� ���� VARCHAR2 ���� ���ڷ� ��ȯ

-- TO_CHAR(��¥ ������, '�������')

/* ��¥ ��� ������ ����         �ǹ�
    YYYY                       �⵵ ǥ��(4�ڸ�)
    YY                         �⵵ ǥ��(2�ڸ�)
    MM                         ���� ���ڷ� ǥ��
    MON                        ���� ���ĺ����� ǥ��
    DAY                        ���� ǥ��
    DY                         ������ ���� ǥ��
    DD                         ���� ���ڷ� ǥ��
*/

-- ���� ��¥�� �⺻ ���İ� �ٸ� ���·� ���

SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD')
FROM DUAL;

-- ������� �Ի����� ����ϵ� ���ϱ��� �Բ� ���

SELECT HIREDATE, TO_CHAR(HIREDATE,'YYYY/MM/DD DAY')
FROM EMP;

-- �⵵�� 2�ڸ�(YY)�� ����ϰ� ���� ����(MON)�� ǥ���ϰ� ������ ���(DY)�� ǥ��

SELECT HIREDATE, TO_CHAR(HIREDATE,'YY/MM/DD DY')
FROM EMP;

/* �ð� ��� ������ ����         �ǹ�
    AM Or PM                   ����(AM), ����(PM) �ð� ǥ��
    
    HH Or HH12                 �ð� ( 1 ~ 12 )
    
    HH24                       24�ð����� ǥ�� ( 0 ~ 23 )
    
    MI                         �� ǥ��
    
    SS                         �� ǥ��
*/

-- ���� ��¥�� �ð��� ���

SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD, HH24:MI:SS')
FROM DUAL;

-- 1230000 ���ڸ� ���� ���·� ���

SELECT TO_CHAR(1230000)
FROM DUAL;

/* ���� ��� ���� 
    0       �ڸ����� ��Ÿ���� �ڸ����� ���� ���� ��� 0���� ä��
    
    9       �ڸ����� ��Ÿ���� �ڸ����� ���� �ʾƵ� ä���� ����
    
    L       �� ������ ��ȭ ��ȣ�� �տ� ǥ��
    
    .       �Ҽ���
    
    ,       õ ���� �ڸ� ����
*/

-- �� ������ ��ȭ ��ȣ�� �տ� ���̰� õ �������� �޸��� �ٿ��� ���
-- (�� : \1,230,000��

SELECT ENAME, SAL, TO_CHAR(SAL,'L999,999')
FROM EMP;

-- ��¥������ ��ȯ�ϴ� TO_DATE �Լ�    to_date

-- ����Ŭ �⺻ ��¥ ���� 'YY/MM/DD' �������� '��/��/��' 

-- TO_DATE( '����', 'format' )

-- ���� ������ 19810220�� TO_DATE�Լ��� ����Ͽ�
-- ��¥������ ��ȯ 

SELECT ENAME,HIREDATE
FROM EMP
WHERE HIREDATE = TO_DATE(19810220,'YYYYMMDD');

-- ���� ��ĥ�� �������� ���� ��¥���� ���� 1�� 1���� �� ����� ���

SELECT TRUNC(SYSDATE - TO_DATE('2024/01/01','YYYY/MM/DD'))
FROM DUAL;

-- ���������� ��ȯ�ϴ� TO_NUMBER �Լ�      to_number

-- Ư�� �����͸� ���������� ��ȯ���ִ� �Լ�

-- '20,000���� '10,000'�� ���̸� �˾ƺ��� ���ؼ� ���⸦ �غ���.
-- ��� ������ �Ϸ��� �������� ���������� ��ȯ�� �Ŀ� ����

SELECT TO_NUMBER('20,000','99,999') - TO_NUMBER('10,000','99,999')
FROM DUAL;

-- NULL�� �ٸ� ������ ��ȯ�ϴ� NVL �Լ�         nvl

SELECT ENAME, SAL, COMM, SAL*12+COMM,
       NVL(COMM,0),SAL*12+NVL(COMM,0)
FROM EMP
ORDER BY JOB;

-- ����� ���� ����� ����ϵ� MGR Į�� �� NULL ��� CEO�� ���

SELECT EMPNO, ENAME, NVL(TO_CHAR(MGR,'9999'),'CEO') "MANAGER"
FROM EMP
WHERE MGR IS NULL;

-- NVL2 �Լ��� expr1�� ���� NULL�� �ƴϸ� 
--            expr2, NULL�̸� 
--            expr3 ������ ��ȯ�ϱ� ���ؼ� ����ϴ� �Լ�

-- NVL2(expr1, expr2, expr3)
-- NVL2(COMM, SAL*12+COMM, SAL*12)

-- ������ ���� DECODE �Լ�             decode  ==============================

-- DECODE �Լ��� ���α׷� ���� ���� ���� ���Ǵ� SWITCH CASE���� ���� ���

-- DECODE( ǥ����, ����1, ���1,
--                ����2, ���2
--                ����3, ���3
--                �⺻���n
-- )


-- �μ���ȣ�� �ش�Ǵ� �μ����� ���ϴ� ���� (DECODE �Լ� ���)

SELECT ENAME, DEPTNO,
       DECODE(DEPTNO, 10, 'ACCOUNTING',
                      20, 'RESEARCH',
                      30, 'SALES',
                      40, 'OPERATIONS')
        AS DNAME
FROM EMP;

-- ���޿� ���� �޿��� �λ�
-- ������ ANALYST�� ����� 5%
--       SALESMAN�� ����� 10%
--       MANAGER�� ����� 15%
--       CLERK�� ����� 20% �λ�

SELECT ENAME, JOB, SAL,
        DECODE(JOB, 'ANALYST', SAL*1.05,
                    'SALESMAN',SAL*1.1,
                    'MANAGER',SAL*1.15,
                    'CLERK',SAL*1.20)
        AS UpSal
FROM EMP;

-- ���ǿ� ���� ���� �ٸ� ó���� ������ CASE �Լ�         case    ==================

-- CASE �Լ� ���� ���� ���� ��쿡 ���ؼ� �ϳ��� �����ϴ� �Լ�
-- DECODE �Լ��� �������� �ִٸ�
-- DECODE �Լ��� ������ ��ġ(= �񱳿�����) �ϴ� ��쿡 ���ؼ��� ����Ǵ� �ݸ�,
-- CASE �Լ��� �پ��� �� �����ڸ� �̿��Ͽ� ������ ������ �� ����.

-- CASE �Լ��� ���α׷� ����� IF ELSE IF ELSE �� ������ ����

-- CASE ǥ���� WHEN ����1 THEN ���1
--            WHEN ����2 THEN ���2
--            WHEN ����3 THEN ���3
--            ELSE ���n
-- END

-- �μ���ȣ�� �ش�Ǵ� �μ����� ���ϱ�

SELECT ENAME, DEPTNO,
      CASE WHEN DEPTNO = 10 THEN 'ACCOUNTING'
           WHEN DEPTNO = 20 THEN 'RESEARCH'
           WHEN DEPTNO = 30 THEN 'SALES'
           WHEN DEPTNO = 40 THEN 'CLERK'
      END AS DNAME
FROM EMP;
