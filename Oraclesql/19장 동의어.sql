/*
================== 동의어 개념과 종류 ====================

데이터베이스의 객체에 대한 소유권은 해당 객체를 생성한 사용자에게 있음. 

따라서 다른 사용자가 객체에 접근하기 위해서는 소유자로부터 접근 권한을 부여받아야 함.

또한 다른 사용자가 소유한 객체에 접근하기 위해서는 소유자의 이름을 객체 앞에 지정해야 함.

이렇게 객체를 조회할 때마다 일일이 객체의 소유자를 지정하는 것이 
번거로울 경우 동의어를 정의하면 긴 이름 대신 간단한 이름으로 접근할 수 있게 됨.

동의어는 개별 사용자를 대상으로 하는 비공개 동의어와 
전체 사용자를 대상으로 한 공개 동의어가 있음

======================= 동의어의  종류 ===========================

=========비공개 동의어

객체에 대한 접근 권한을 부여받은 사용자가 정의한 동의어로 해당 사용자만 사용할 수 있음. 

=========공개 동의어 

권한을 주는 사용자가 정의한 동의어로 누구나 사용할 수 있음.

공개 동의어는 DBA 권한을 가진 사용자만이 생성할 수 있음.

SYNONYM 앞에 PUBLIC를 붙여서 정의함. 

======================== 동의어의 사용 예 =============================

DUAL은 원래 SYS가 소유하는 테이블 명이므로 
다른 사용자가 DUAL 테이블에 접근하려면 SYS.DUAL로 표현해야 하는 것이 원칙. 

그럼에도 불구하고 지금까지 모든 사용자가 SYS.을 생략하고 
DUAL이라고 간단하게 사용하였음.

이럴 수 있었던 이유는 공개 동의어로 지정되어있기 때문!!

======================= 동의어 생성 ============================

동의어를 정의하기 위한 CREATE SYNONYM 명령어의 기본 형식

CREATE [PUBLIC] SYNONYM synonym_name
FOR user_name.object_name;

synonym_name은 user_name.object_name에 대한 별칭.

user_name은 객체를 소요한 오라클 사용자이고 
object_name는 동의어를 만들려는 데이터베이스 객체 이름임.

==================== 테이블 생성후 객체 권한 부여하기 ====================

SYSTEM 사용자 계정으로 접속해서 테이블을 생성한 후 
이를 SCOTT 사용자가 사용할 수 있도록 권한을 부여하기

1. SYSTEM으로 접속합니다.

CONN system/12341234
SHOW USER

2. SYSTBL 이란 테이블이 생성

CREATE TABLE SYSTBL (
ENAME VARCHAR2(20)
);

3. 로우를 2개 추가

INSERT INTO SYSTBL VALUES('전수빈');
INSERT INTO SYSTBL VALUES('전원지');

4. SCOTT 사용자에게 SYSTBL 이란 테이블을 SELECT 할 권한을 부여

GRANT SELECT ON SYSTBL TO SCOTT;

5. SCOTT 사용자에서 SYSTBL 테이블을 접근해보기

CONN scott/tiger
SELECT * FROM SYSTBL;

5. SCOTT 사용자에서 SYSTBL 테이블에 접근하려면 
   반드시 SYSTBL 테이블의 소유자인 SYSTEM을 SYSTBL 앞에 기술해야함
   
======================== 동의어 생성하기 =========================

SCOTT 사용자에서 SYSTBL 테이블을 [소유자의 이름].SYSTBL로 접근하는 것뿐만 아니라 
SYSTBL 이란 이름으로 접근할 수 있게끔 비공개 동의어를 생성해 보기

1. 비공개 동의어는 권한을 부여받는 사용자인 SCOTT이 정의해야 함으로
   SCOTT 계정으로 접속하여 비공개 동의어를 생성.

CONN scott/tiger
CREATE SYNONYM PriSYSTBL FOR system.SYSTBL;
SELECT * FROM PriSYSTBL;

CREATE SYNONYM 권한이 부여되지 않았기에 비공개 동의어를 생성하지 못한 것.

2. CREATE SYNONYM 권한이 불충분할 경우에는 DBA 관리자에서 권한을 부여해야 함

CONN system/manager
GRANT CREATE SYNONYM TO scott;

3. 다시 SCOTT 계정으로 접속하여 비공개 동의어를 생성

CONN scott/tiger
CREATE SYNONYM PriSYSTBL FOR system.SYSTBL;
SELECT * FROM PriSYSTBL;

================== 비공개 동의어 의미 파악하기 ======================

비공개 동의어는 동의어를 생성한 소유자만이 접근할 수 있음. 

이를 위한 예제를 만들어 보기

1. 데이터베이스의 객체에 대한 소유권은 해당 객체를 생성한 사용자가 가지고 있으므로 
   다른 사용자가 소유한 객체를 접근하기 위해서는 소유자로부터 접근 권한을 받아야 함. 
   우선 데이터베이스 관리자인 SYSTEM으로 접속한 후에 
   사용자 정의 롤을 생성한 후에 
   사용자 정의 롤에 CONNECT, RESOURCE 롤과 CREATE SYNONYM 권한과 
   SCOTT 소유자의 EMP 테이블과 DEPT 테이블에 대한 SELECT 객체 권한을 롤에 부여함
   
CONN system/manager
CREATE ROLE TEST_ROLE;
GRANT CONNECT, RESOURCE, CREATE SYNONYM TO TEST_ROLE;
GRANT SELECT ON scott.DEPT TO TEST_ROLE;

2. 사용자를 생성.

CREATE USER USERB1 IDENTIFIED BY B1234;
CREATE USER USERB2 IDENTIFIED BY B1234;

3. 생성한 사용자에게 롤을 부여

GRANT TEST_ROLE TO USERB1;
GRANT TEST_ROLE TO USERB2;

4. 접근 권한만 부여받았다고 다른 사용자가 소유한 객체를 무조건 접근하지 못하고 
   사용자명.객체명으로 접근해야 함
   
CONN USERB1/B1234
SELECT * FROM SCOTT.DEPT;
SELECT * FROM SCOTT.EMP;

CONN USERB2/B1234
SELECT * FROM SCOTT.DEPT;
SELECT * FROM SCOTT.EMP;

5. 소유자를 지정하지 않고도 다른 사용자(SCOTT) 소유의 객체(EMP)에 접근하기 위해서는 
   동의어를 생성. USERB1과 USERB2 계정으로 접속하여 DEPT로 테이블을 조회해보기

CONN USERB1/B1234
CREATE SYNONYM DEPT FOR SCOTT.DEPT;

USERB1으로 접속해서 동의어 DEPT를 정의하고 DEPT로 테이블을 접근하면 조회에 성공.

하지만 동의어 DEPT는 USERB1의 비공개 동의어기 때문에 USER02로 접속하면 
DEPT로 테이블을 조회하지 못함.


=================== 공개 동의어 정의하기 =======================

만일 USERB1과 USERB2에서 
모두 사용할 수 있는 동의어를 선언하려면 공개 동의어로 선언해야 함.
이번에는 USERB1 사용자로 접속해서 공개 동의어를 정의해보기

1. USERB1는 DBA 롤이 부여되지 않은 사용자이기 때문에 
   공개 동의어를 생성하지 못함. 
   공개 동의어를 생성하기 위해서는 DBA 롤이 부여된 데이터베이스 관리자인 
   SYSTEM으로 접속.

CONN system/manager
CREATE PUBLIC SYNONYM PUBDEPT FOR SCOTT.DEPT;

2. USERB1과 USERB2 계정으로 접속하여 DEPT로 테이블을 조회.

CONN USERB1/B1234
SELECT * FROM PUBDEPT;

CONN USERB1/B1234
SELECT * FROM PUBEMP;

CONN USERB2/B1234
SELECT * FROM PUBDEPT;

CONN USERB2/B1234
SELECT * FROM PUBEMP;

조회 가능.

========================= 비공개 동의어의 제거하기 ======================

1. 비공개 동의어인 DEPT는 동의어를 소유한 사용자로 접속한 후에 제거해야 함을 증명하기 위해서
비공개 동의어의 소유자가 사용자로 접속해서 제거해 보도록 하기

CONN system/12341234
DROP SYNONYM DEPT;

동의어 DEPT는 USERB1에서 생성하였으므로 
USERB1이 아닌 사용자로 접속하였을 때에는 오류가 발생

2. 동의어를 소유한 사용자로 접속해야만 제거가 가능

CONN USERB1/B1234
DROP SYNONYM DEPT;

동의어 DEPT는 USERB1에서 생성하였으므로 
USERB1 사용자로 접속하여 동의어 DEPT를 삭제하는데 성공

====================== 공개 동의어 제거하기 ========================

이번에는 공개 동의어인 PubDEPT 를 삭제해보기.
공개 동의어는 DBA 롤이 부여된 사용자에서 생성과 제거가 가능함으로 
데이터베이스 관리자인 SYSTEM으로 접속한 후에 제거해야함. 
또한 제거할 때 반드시 PUBLIC 예약어를 명시해야한다.

1. USERB1 사용자에게는 DBA 롤이 없으므로 공개 동의어를 제거할 수 없음

CONN USERB1/B1234
DROP SYNONYM PUBDEPT; 

2. SYSTEM 사용자이므로 DBA 롤이 있지만 공개 동의어를 제거하는데, 
   예약어 PUBLIC를 기술하지 않았기 때문에 오류가 발생

CONN system/12341234
DROP SYNONYM PUBDEPT; 

3. SYSTEM 사용자이므로 DBA 롤에 대한 권한도 있고 
   예약어 PUBLIC 역시 기술하였기 때문에 공개 동의어를 제거가능
   
DROP PUBLIC SYNONYM PUBDEPT; 