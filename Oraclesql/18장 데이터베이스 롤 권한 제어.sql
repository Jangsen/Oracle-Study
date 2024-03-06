/*
======================== 롤이란 ==============================

롤은 사용자에게 보다 효율적으로 권한을 부여할 수 있도록 
여러 개의 권한을 묶어 놓은 것이라고 생각하면 됨. 

사용자를 생성했으면 그 사용자에게 각종 권한을 부여해야만 
생성된 사용자가 데이터베이스를 사용할 수 있음. 

데이터베이스의 
접속 권한(CREATE SESSION), 
테이블 생성 권한(CREATE TABLE),
테이블 수정(UPDATE), 
삭제(DELETE), 
조회(SELECT) 

등과 같은 권한은 사용자에게 기본적으로 필요한 권한들인데
사용자를 생성할 때마다 일일이 이러한 권한을 부여하는 것은 번거로움. 

이 때문에 다수의 사용자에게 공통적으로 필요한 권한들을 
롤에 하나의 그룹으로 묶어두고 사용자에게는 특정 롤에 대한 권한 부여를 함으로서 
간단하게 권한 부여를 할 수 있도록 함.

또한 여러 사용자에게 부여된 권한을 수정하고 싶을 때에도 
일일이 사용자마다 권한을 수정하지 않고 
롤만 수정하면 그 롤에 대한 권한 부여를 한 사용자들의 권한이 자동 수정됨.

이 밖에 롤을 활성화 비활성화 함으로서 일시적으로 권한을 부여했다가
철회할 수 있으므로 사용자 관리를 간편하고 효율적으로 할 수 있음

======================== 롤의 종류 =============================

롤은 오라클 데이터베이스를 설치하면 
기본적으로 제공되는 사전 정의된 롤과 사용자가 정의한 롤로 구분됨

사용자가 직접 롤을 정의하는 방법은 복잡하므로 사전에 정의된 롤부터 살펴보기

========================= 사전 정의된 롤의 종류 ========================

다음과 사전 정의된 시스템에서 제공해주는 롤.

CONNECT 롤

사용자가 데이터베이스에 접속 가능하도록 하기 위해서 
다음과 같이 가장 기본적인 시스템 권한 8가지를 묶어 놓았음.

ALTER SESSION, CREATE CLUSTER, CREATE DATABASE LINK,
CREATE SEQUENCE, CREATE SESSION, CREATE SYNONYM, 
CREATE TABLE, CREATE VIEW

CREATE CLUSTER 와 CREATE SEQUENCE 는 둘 CONNECT롤과 RESCOUCE롤에 포함

RESOURCE 롤

사용자가 객체(테이블, 뷰, 인덱스)를 생성할 수 있도록 하기 위해서 
시스템 권한을 묶어 놓았음. 

CREATE CLUSTER, CREATE PROCEDURE, CREATE SEQUENCE, 
CREATE TABLE, CREATE TRIGGER

DBA 롤

사용자들이 소유한 데이터베이스객체를 관리하고 
사용자들을 작성하고 변경하고 제거할 수 있도록 하는 모든 권한을 가짐.
즉, 시스템 자원을 무제한적으로 사용하며 
시스템 관리에 필요한 모든 권한을 부여할 수 있는 강력한 권한을 보유한 롤. 

======================== 롤 부여하기  ===========================

일반적으로 데이터베이스 관리자는 새로운 사용자를 생성할 때 
CONNECT 롤과 RESOURCE 롤을 부여함.

USER04 사용자를 생성하여 CONNECT 롤과 RESOURCE 롤을 부여함

1. 데이터베이스 관리자로 접속

CONN system/12341234

2. 새롭게 사용자를 생성

CREATE USER USER04 IDENTIFIED BY TIGER;

3. 생성된 생성자로 로그인을 시도

CONN USER04/TIGER

새롭게 생성된 사용자에는 데이터베이스의 접속 권한인 
CREATE SESSION 권한이 부여 되지 않았으므로 로그인에 실패

4. 새로운 사용자에게 권한 부여를 하기 위해서는 다시 데이터베이스 관리자로 접속해야 함

CONN system/12341234

5. 데이터베이스 관리자로 접속했으면 이제 CONNECT롤과 RESOURCE롤을 부여

GRANT CONNECT, RESOURCE TO USER04;

6. 권한이 부여가 되었으면 다시 USER04 사용자로 로그인 시도

CONN USER04/TIGER

CONNECT롤에 데이터베이스의 접속 권한에 CREATE SESSION 권한이 포함되어 있으므로 

로그인에 성공

======================== 롤 관련 데이터 딕셔너리 =============================

다음은 사용자에게 부여된 롤을 확인해 보기.

롤을 확인하기 위한 데이터 딕셔너리는 무수히 많음

SELECT * FROM DICT WHERE TABLE_NAME LIKE '%ROLE%';

조회 결과로 얻어진 데이터 딕셔너리를 통해서 부여된 권한에 대한 정보를 확인할 수 있음


                    롤 관련 데이터 딕셔너리를 정리한 표
                    
 딕셔너리 명                         설명
 
ORLE_SYS_PRIVS                      롤에 부여된 시스템 권한 정보

ROLE_TAB_PRIVS                      롤에 부여된 테이블 관련 권한 정보

USER_ROLE_PRIVS                     접근 가능한 롤 정보

USER_TAB_PRIVS_MADE                 해당 사용자 소유의 오브젝트에 대한 오브젝트 권한 정보

USER_TAB_PRIVS_RECD                 사용자에게 부여된 오브젝트 권한 정보

USER_COL_PRIVS_MADE                 사용자 소유의 오브젝트 중 칼럼에 부여된 오브젝트 권한 정보

USER_COL_PRIVS_REDC                 사용자에게 부여된 특정 칼럼에 대한 오브젝트 권한 정보


======================== 롤을 확인하기  ==========================

롤 관련 데이터 딕셔너리 중에서
현재 사용자에게 부여된 롤을 확인하기 위한 데이터 딕셔너리는 USER_ROLE_PRIVS
USER04로 로그인 하였으므로 다음과 같이 입력하면 
사용자 USER04에 부여된 롤에 대한 정보를 확인할 수 있음

CONN USER04/TIGER
SELECT * FROM USER_ROLE_PRIVS;

========================= 사용자 롤 정의 ===========================

CONNECT, RESOURCE 롤과 같은 기본적으로 제공되는 사전 정의된 롤을 
사용자에게 부여해 보았음. 

이번에는 사용자가 정의해서 사용하는 롤에 대해 살펴볼 것.
사용자는 CREATE ROLE 명령어로 다음 형식에 따라 롤을 생성해야 함.

CREATE ROLE role_name;
GRANT privilege_name TO role_name;

새로 생성된 USER04로 로그인해서 SCOTT 사용자의 EMP 테이블에 접근해 보도록 하기

CONN USER04/TIGER;
SELECT * FROM SCOTT.EMP;

사용자 USER04는 SCOTT 사용자 소속인 EMP 테이블 객체를 조회할 수 없음.
USER04는 SCOTT 사용자 소속인 EMP 테이블 객체를 조회할 수 있도록 
권한을 부여 해야만 함.

이번에는 사용자 USER04에 객체 권한을 직접 부여하지 않고 롤을 이용해 보도록하기

다음과 같은 순서로 작업을 진행할 것

1) 롤을 생성한다. (데이터베이스 관리자)

2) 롤에 권한을 부여한다. (데이터베이스 관리자 혹은 특정 사용자)

3) 사용자에 롤을 부여한다. (데이터베이스 관리자)

① 롤을 생성하기 위한 DBA에서 이루어짐. 

CREATE ROLE ROLE_NAME; 

②롤에 부여할 퀀한의 종류에 따라서 DBA에서 부여할 수도 있고, 
객체를 소유한 사용자로 접속한 후 부여해야 함.

다음과 같이 시스템 권한 일 경우에는 DBA에서 이루어짐. 

GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO ROLE_NAME;

다음과 같이 객체 권한일 경우에는 특졍 객체로 접근해서 부여해야 함. 

GRANT OBJECT_PRIV TO ROLE_NAME;

③ 사용자에 롤을 부여하는 작업 역시 DBA에서 이루어짐.

GRANT ROLE_NAME TO USER_NAME;

====================== 롤 생성하여 시스템 권한 할당하기 ======================

1. 롤을 생성할 수 있는 사용자는 반드시 DBA 권한이 있는 사용자여야만 하기에 
   롤을 생성하기 앞서서 반드시 DBA 권한을 가진 사용자로 접속해야만 함
   
CONN system/manager
CREATE ROLE MROLE;

2. 생성된 롤에게 권한을 부여

GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO MROLE;

3. 사용자를 생성하여 롤을 부여

CREATE USER USER05 IDENTIFIED BY TIGER;
GRANT MROLE TO USER05;

===================== 롤 생성하여 객체 권한 할당하기 =======================

롤을 생성하여 할당하는 객체 권한을 할당해보기

1. 롤을 생성할 수 있는 사용자는 반드시 DBA 권한이 있는 사용자여야만 하기에 
   롤을 생성하기 앞서서 반드시 DBA 권한을 가진 사용자로 접속해야만 함.
   CREATE ROLE 명령문을 사용하여 MROLE02 를 생성.

CONN system/manager
CREATE ROLE MROLE02;

2. 생성한 롤에 권한 부여를 하기 위해서 
   EMP 테이블 객체를 소유하고 있는 SCOTT 사용자로 로그인. 
   MRLOE02 에게 EMP 테이블 객체를 조회할 수 있도록 SELECT 권한을 주기.

CONN scott/tiger
GRANT SELECT ON EMP TO MROLE02;

3. MRLOE02 에 EMP 테이블 객체를 조회할 수 있도록 SELECT 권한을 주었음. 
   생성된 롤을 사용자에게 부여하기 위해서 
   다시 데이터베이스 관리자로 로그인하여 사용자 USER05 에게 롤에 대한 권한 부여하기

CONN system/manager
GRANT MROLE02 TO USER05;

4. 사용자 USER05 에게 롤에 대한 권한 부여를 마쳤으면 
   사용자 USER05 로 로그인하여 롤에 대한 권한이 부여되었는지 확인하기
   
CONN USER05/TIGER
SELECT * FROM USER_ROLE_PRIVS;

================ WITH ADMIN OPTION을 지정하지 않고 권한 부여 ===================

WITH ADMIN OPTION을 지정하지 않으면 
부여 받은 권한을 다른 사용자에게 부여할 수 없음을 확인해보기

1. 사용자명은 USER03 암호는 TIGER로 사용자를 생성해보기. 
   사용자를 생성하기 위해서는 CREATE USER 명령어를 사용. 
   
2. USER03에게 WITH ADMIN OPTION을 지정하지 않고 CREATE SESSION 권한을 부여.

GRANT CREATE SESSION TO USER03; 

3. USER03 사용자로 접속

CONN USER03/TIGER;

4. USER03 사용자는 자기가 받은 권한을 다른 사용자에게 부여할 수 없음

GRANT CREATE SESSION TO USER01;

========================= 롤 회수하기 ============================

롤 역시 권한처럼 사용하지 않게 되었을 경우 이를 회수할 수 있음. 
다음은 롤을 회수하기 위한 DROP ROLE 명령어의 형식

DROP ROLE role_name FROM user_name;

이번에는 REVOKE 문을 사용하여 롤을 회수해 보도록 하기

1. 현재 사용자에게 부여된 롤 권한을 확인하기 위해서 
   다음과 같이 명령문을 수행해 보도록하기

CONN USER05/TIGER
SELECT * FROM USER_ROLE_PRIVS;

2. 데이터베이스 관리자로 접속한 후에 롤을 회수하기

CONN system/manager
REVOKE MROLE FROM USER05;

3. 다시 USER05로 접속하여 USER05에 부여된 롤을 확인해보면
   MROLE 롤이 회수된 것을 확인할 수 있음

CONN USER05/TIGER
SELECT * FROM USER_ROLE_PRIVS;
 
 ============================== 롤 제거하기 ================================
 
1. 사용자 USER05 에게 부여되었던 롤에 대한 권한만을 회수할 뿐, 
롤 MROLE02 은 아직 존재함.
SYSTEM 계정에서 롤을 생성하였으므로 
SYSTEM 계정으로 접속하여 데이터 딕셔너리 USER_ROLE_PRIVS의 내용을 출력하여 
MROLE02이 존재함을 확인하기

CONN system/manager
SELECT * FROM USER_ROLE_PRIVS;

=============================== 롤의 장점 =================================

롤을 사용하여 권한 부여함으로서 생기는 장점에 대해서 살펴볼 것.

시스템권한이나 객체 권한을 사용자마다 일일이 부여하게 되면 번거로움.

CREATE SESSION      CREATE TABLE        UPDATE      DELETE      SELECT
                            
                            사용자 1
                            
CREATE SESSION      CREATE TABLE        UPDATE      DELETE      SELECT
                            
                            사용자 2
                            
CREATE SESSION      CREATE TABLE        UPDATE      DELETE      SELECT
                            
                            사용자 3
                            

3명의 사용자에게 일일이 권한 부여하는 명령어를 부여하려면 굉장히 번거로움
이러한 단점을 롤로 보안할 수 있음
우선 롤에 시스템 권한과 객체 권한을 부여함.
그런 후에 롤을 사용자에 대해 권한 부여함으로서 작업을 간소화할 수 있음.

=============== 디폴트 롤을 생성하여 여러 사용자에게 부여하기 =================

롤에 시스템 권한과 객체 권한을 부여한 후에 롤을 사용자에 대해 권한 부여함으로서
작업을 간소화 해보기.

1. 데이터베이스 관리자로 접속하여 롤(DEF_ROLE) 생성해보기

CONN system/manager
CREATE ROLE DEF_ROLE;

2. 생성된 롤 DEF_ROLE에 시스템 권한인 
   CREATE SESSION과 CREATE TABLE을 부여하기. 

GRANT CREATE SESSION TO DEF_ROLE;
GRANT CREATE TABLE TO DEF_ROLE;

3. 생성된 롤 DEF_ROLE에 SCOTT 사용자로 접속해서 
   EMP 테이블을 수정, 삭제, 조회할 수 있도록 객체 권한을 부여하기.

CONN SCOTT/TIGER
GRANT UPDATE ON EMP TO DEF_ROLE;
GRANT DELETE ON EMP TO DEF_ROLE;
GRANT SELECT ON EMP TO DEF_ROLE;

4. 데이터베이스 관리자인 SYSTEM으로 접속해서 사용자 계정을 3개 만들기

CONN system/manager
CREATE USER USERA1 IDENTIFIED BY A1234;
CREATE USER USERA2 IDENTIFIED BY A1234;
CREATE USER USERA3 IDENTIFIED BY A1234;

5. 생성된 사용자 계정에 각각 DEF_ROLE에 대한 권한 설정하기

SHOW USER
GRANT DEF_ROLE TO USERA1;
GRANT DEF_ROLE TO USERA2;
GRANT DEF_ROLE TO USERA3;

6. ROLE_SYS_PRIVS은 시스템 권한에 대한 정보를 저장한 데이터 딕셔너리이고,
   ROLE_TAB_PRIVS은 객체 권한에 대한 정보를 저장한 데이터 딕셔너리임. 
   두 데이터 딕셔너리의 내용을 출력함으로서 
   롤에 권한 설정이 제대로 되어 있는지 확인해보기

SHOW USER
SELECT * FROM ROLE_SYS_PRIVS WHERE ROLE='DEF_ROLE';
SELECT * FROM ROLE_TAB_PRIVS WHERE ROLE='DEF_ROLE';

이렇게 자주 사용되는 권한을 롤에 부여해 놓으면 
언제 어느 때 새로운 사용자가 생기더라도 쉽게 권한 부여를 할 수 있게 됨.

