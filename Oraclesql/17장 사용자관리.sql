/*
==================== 데이터베이스 보안을 위한 권한  ====================

기업에서 보유하고 있는 데이터들은 자료 이상의 가치가 있으므로 
외부에 노출되지 않도록 보안을 해야 함. 

데이터베이스를 운영하려면 데이터베이스에 대한 적절한 보안 대책을 마련해야 함. 

오라클은 다수의 사용자들이 데이터베이스에 저장된 정보를 공유해서 사용. 

하지만 정보의 유출이나 불법적인 접근을 방지하기 위해서 철저한 보안 대책이 필요함. 
이러한 보안 대책을 위해서 데이터베이스 관리자가 있어야 함.

데이터베이스 관리자는 
사용자가 데이터베이스의 객체(테이블, 뷰 등)에 대한 특정 권한을 가질 수 있도록 함으로서 
다수의 사용자가 데이터베이스에 저장된 정보를 공유하면서도 
정보에 대한 보안이 이루어지도록 함. 

데이터베이스에 접근하기 위해서는 
사용자가 이름과 암호를 입력해서 로그인 인증을 받아야 함. 

이렇게 데이터베이스에 접속하는 사용자로부터 어떻게 데이터를 보안할 수 있을까? 

사용자마다 서로 다른 권한과 롤을 부여함으로서 보안을 설정할 수 있음.

========================= 권한의 역할과 종류  =============================

권한은 사용자가 특정 테이블을 접근할 수 있도록 하거나 
해당 테이블에 SQL(SELECT/INSERT/UPDATE/DELETE) 문을 사용할 수 있도록 
제한을 두는 것을 말함.

데이터베이스 보안을 위한 권한

시스템 권한(System Privileges)과 
객체 권한(Object Privileges)으로 나뉨.

시스템 권한은 사용자의 생성과 제거, DB 접근 및 각종 객체를 생성할 수 있는 권한 등 
주로 DBA에 의해 부여되며 그 권한의 수가 80 가지가 넘기에 
대표적인 시스템 권한만 정리하고 넘어가기.

시스템 권한                                  기능

CREATE USER                                 새롭게 사용자를 생성하는 권한

DROP USER                                   사용자를 삭제하는 권한

DROP ANY TABLE                              임의의 테이블을 삭제할 수 있는 권한

QUERY REWRITE                               함수 기반 인덱스를 생성하는 권한

BACKUP ANY TABLE                            임의의 테이블을 백업할 수 있는 권한

데이터베이스를 관리하는 권한으로 다음과 같은 것이 있음.

이러한 권한은 시스템 관리자가 사용자에게 부여하는 권한임.

시스템 권한                                  기능

CREATE SESSION                              데이터베이스에 접속할 수 있는 권한

CREATE TABLE                                사용자 스키마에서 테이블을 생성할 수 있는 권한

CREATE VIEW                                 사용자 스키마에서 뷰를 생성할 수 있는 권한

CREATE SEQUENCE                             사용자 스키마에서 시퀀스를 생성할 수 있는 권한

CREATE PROCEDURE                            사용자 스키마에서 함수를 생성할 수 있는 권한

객체 권한은 객체를 조작할 수 있는 권한.
객체는 테이블, 뷰 등을 예로 들 수 있고, 
시퀀스, 인덱스 등과 앞으로 배울 동의어가 모두 객체에 해당.

============================ 사용자 생성 =============================

회사에 새로운 사원이 입사하게 되면 시스템에 접속하도록 관리자가 계정을 하나 발급해 줌.

지금까지는 SCOTT 사용자로 접속해서 오라클 데이터베이스를 사용했지만, 
사실은 부서별이나 사원의 직무에 따라 사용 가능한 테이블을 고려해서 
오라클 데이터베이스에서도 사용자 계정을 발급해야 함.

권한은 사용자한테 부여하는 것이므로 사용자를 생성하는 것부터 살펴보도록 하기.

다음은 사용자 생성을 위한 CREATE USER 명령어의 형식

CREATE USER user_name
IDENTIFIED BY password;

사용자의 생성은 사용자의 이름과 암호를 지정하여 생성. 

사용자를 생성하기 위해서도 권한이 필요함. 

우리가 지금까지 주로 사용해 왔던 SCOTT이란 사용자는 사용자를 생성할 권한이 없음. 

새로운 사용자 계정을 발급받기 전에 주의할 점이 있음.

(1장에서 언급)
사용자를 생성하기 위해서는 시스템 권한을 가지고 있어야 함. 

오라클 데이터베이스를 설치할 때 자동으로 생성되는 디폴트 사용자 가운데 
시스템 권한을 가진 데이터베이스 관리자인 DBA는 SYS, SYSTEM. 

그러므로 사용자 계정을 발급 받기 위해서 시스템 권한을 가진 SYSTEM으로 접속해야 함. 

CREATE USER 명령어를 사용하여 사용자명은 USER01 암호는 TIGER로 사용자를 생성해보기

1. 오라클 설치할 때 system 사용자의 암호를 manager 로 지정하였기 때문에 
   위와 같이 입력했음.
    
    CONN SYSTEM/MANAGER

2. 사용자명은 USER01 암호는 TIGER로 사용자를 생성. 
   사용자를 생성하기 위해서는 CREATE USER 명령어를 사용. 
   
   CREATE USER USER01 IDENTIFIED BY TIGER;

3. 새롭게 생성된 사용자로 접속
   
    CONN USER01/TIGER

====================== 권한 부여하는 GRANT 명령어 =======================

사용자에게 시스템 권한 부여하기 위해서는 GRANT 명령어를 사용

GRANT privilege_name, …
TO user_name;

만일 user_name 대신 PUBLIC을 기술하면 모든 사용자에게 해당 시스템 권한이 부여됨. 

PUBLIC 이란 DB 내에 있는 모든 계정 즉, 모든 계정을 의미. 

우선 데이터베이스 관리자로 접속. 

새로 생성된 user01에 데이터베이스에 접속할 수 있는 권한인 CREATE SESSION를 부여. 

다시 user01 사용자로 접속을 시도하면 이번에는 데이터베이스에 성공적으로 접속하게 됨.

====================== CREATE SESSION 권한 부여하기 =======================

새로 생성된 user01에 데이터베이스에 접속할 수 있는 권한인 CREATE SESSION를 부여. 
다시 user01 사용자로 접속을 시도하면 이번에는 데이터베이스에 성공적으로 접속하게 됨

1.CREATE SESSION 권한 역시 DBA 만이 부여할 수 있으므로 system 으로 로그인. 

CONN system/manager

2. SYSTEM으로 로그인한 후에 다음과 같이 USER01 사용자에게 CREATE SESSION 권한을 부여

GRANT CREATE SESSION TO USER01;

3.  USER01 사용자에 데이터베이스에 연결할 수 있는 권한인 
    CREATE SESSION이 성공적으로 부여되었기에
    USER01 사용자로 데이터베이스에 접속을 시도하면 성공적으로 접속
    
CONN USER01/TIGER;

============================= WITH ADMIN OPTION 옵션 ==========================

사용자에게 시스템 권한을 WITH ADMIN OPTION과 함께 부여하면 
그 사용자는 데이터베이스 관리자가 아닌데도 불구하고 부여받은 시스템 권한을 
다른 사용자에게 부여할 수 있는 권한도 함께 부여 받게 됨.

데이터베이스 관리자로 로그인해서 사용자 USER02 와 USER03 를 생성.

역시 데이터베이스 관리자에서 USER02 와 USER03 에 데이터베이스에 접속할 수 있는 권한인 
CREATE SESSION 권한을 부여하는데 
USER02 는 WITH ADMIN OPTION을 지정하고 
USER03 은 WITH ADMIN OPTION을 지정하지 않은 채 권한 부여를 할 것. 

USER02 사용자로 로그인하면 CREATE SESSION 권한을 USER01 사용자에게 부여할 수 있음.

이것이 가능해진 것은 USER02에게 WITH GRANT OPTION을 사용하여 
CREATE SESSION 권한을 부여하여 
그 권한을 다른 사용자에게도 부여할 수 있도록 허용하였기 때문.

USER03 사용자는 단순히 CREATE SESSION 권한만을 부여받았으므로 
그 권한을 다른 사용자에게 부여할 수 없음.

======================== WITH ADMIN OPTION을 지정하여 권한 부여 ===================

WITH ADMIN OPTION과 함께 권한을 부여하여 그 권한을 다른 사용자에게 부여할 수 있도록 하기.

1. DBA 권한을 가진 system 사용자로 접속.

2. 사용자명은 USER02 암호는 TIGER로 사용자를 생성해보기.
   사용자를 생성하기 위해서는 CREATE USER 명령어를 사용.

CREATE USER USER02 IDENTIFIED BY TIGER;

3. USER02에게 CREATE SESSION 권한을 WITH ADMIN OPTION을 지정하여 부여

GRANT CREATE SESSION TO USER02
WITH ADMIN OPTION;

USER02 사용자로 접속

CONN USER02/TIGER;

4. USER02 사용자는 자기가 받은 권한을 다른 사용자에게 부여할 수 있음.

GRANT CREATE SESSION TO USER01;

================== WITH ADMIN OPTION을 지정하지 않고 권한 부여 ===============

WITH ADMIN OPTION을 지정하지 않으면 
부여 받은 권한을 다른 사용자에게 부여할 수 없음을 확인해보기

1. 사용자명은 USER03 암호는 TIGER로 사용자를 생성. 
   사용자를 생성하기 위해서는 CREATE USER 명령어를 사용.
   
2. USER03에게 WITH ADMIN OPTION을 지정하지 않고 CREATE SESSION 권한을 부여.

GRANT CREATE SESSION TO USER03; 

3. USER03 사용자로 접속.

CONN USER03/TIGER;

4. USER03 사용자는 자기가 받은 권한을 다른 사용자에게 부여할 수 없음.

GRANT CREATE SESSION TO USER01;

============================ 객체 권한 ================================

객체 권한은 특정 객체에 조작을 할 수 있는 권한. 
객체의 소유자는 객체에 대한 모든 권한을 가짐.

        객체와 권한 설정할 수 있는 명령어를 매핑시켜 놓은 표

권한          TABLE           VIEW            SEQUENCS            PROCEDURE

ALTER           V                               V

DELETE          V               V

EXECUTE                                                            V

INDEX           V               

INSERT          V               V

REFERENCES      V

SELECT          V               V                V

UPDATE          V               V


객체 권한은 테이블이나 뷰나 시퀀스나 함수 등과 같은 
객체별로 DML문(SELECT, INSERT, DELETE)을 사용할 수 있는 권한을 설정하는 것

객체에 권한을 부여하기 위한 형식

GRANT privilege_name [(column_name)] | ALL ①
ON object_name | role_name | PUBLIC ②
TO user_name; ③

GRANT 명령어의 형식은 

어떤 객체(②)에 
어떠한 권한(①)을 
어느 사용자(③)에게 부여하는가를 설정. 

시스템 권한과 차이점이 있다면 ON 옵션이 추가된다는 점. 

ON 다음에 테이블 객체나 뷰 객체 등을 기술함.

======================== 다른 유저의 객체 접근하기 ===========================

객체 권한을 부여해야 하는 필요성을 살펴보기 위해서 
새롭게 생성한 USER01 객체로 EMP 테이블의 내용을 조회해 보기

1. USER01로 접속.

2. EMP 테이블을 조회. 

SELECT * FROM EMP;

ORA-00942: 테이블 또는 뷰가 존재하지 않는다는 오류 발생

특정 객체에 대한 권한은 그 객체를 만든 사용자에게만 기본적으로 주어짐.

우리가 지금까지 사용했던 EMP 테이블은 SCOTT 사용자 소유의 테이블임.

그러므로 다음과 같이 SCOTT 사용자로 로그인해서 
USER01 사용자가 테이블 객체 EMP를 조회할 수 있도록 권한 부여를 해야 함. 

==================== 테이블 객체에 대한 SELECT 권한 부여하기 ====================

특정 객체에 대한 권한은 그 객체를 만든 사용자에게만 기본적으로 주어짐.

우리가 지금까지 사용했던 EMP 테이블은 SCOTT 사용자 소유의 테이블.

그러므로 SCOTT 사용자로 로그인해서 
USER01 사용자가 테이블 객체 EMP를 조회할 수 있도록 권한 부여를 해야 함.

1. SCOTT으로 접속합니다

CONN scott/tiger

2. SCOTT 사용자 소유의 EMP 테이블을 조회(SELECT)할 수 있는 권한을 
   USER01이란 사용자에게 부여.
   
GRANT SELECT ON EMP TO USER01;

3. 권한 부여가 되었다면 다시 USER01로 로그인하여 EMP 테이블에 접속해보기

CONN USER01/TIGER
SHOW USER
SELECT * FROM EMP;

권한 부여가 되었는데도 USER01은 EMP 테이블 객체를 조회할 수 없음.

그 이유는 객체의 소유자인 스키마를 지정하지 않았기 때문. 

스키마에 대해 개념을 학습한 후에 
특정 소유자의 테이블에 접근해보도록 하기 위해서 어떻게 해야 하는지 살펴보도록 하기


============================= 스키마 ================================

스키마(SCHEMA)란?

객체를 소유한 사용자명을 의미. 

객체 명 앞에 소속 사용자명을 기술해서 사용.

SELECT * FROM SCOTT.EMP;

EMP 앞에 SCOTT은 EMP 테이블 객체를 소유한 사용자명임.

지금까지 객체를 기술할 때 다음과 같이 기술해서 사용했음.

SELECT * FROM EMP;

왜냐하면 현재 사용자가 SCOTT일 경우 자신이 소유한 객체를 언급할 때 
객체 명 앞에 스키마를 생략할 수 있기 때문.

하지만 USER01 계정에서 다음과 같이 기술하면 
자기 자신인 USER01 사용자가 소유한 EMP 테이블을 조회하려고 하다가 
USER01 사용자는 EMP 테이블을 소유하지 않았기 때문에 다음과 같은 에러가 발생하는 것.

CONN USER01/TIGER
SHOW USER
SELECT * FROM EMP;

자신이 소유한 객체가 아닌 경우에는 그 객체를 소유한 사용자명을 반드시 기술해야 함.

CONN USER01/TIGER
SHOW USER
SELECT * FROM SCOTT.EMP;

======================= 사용자에게 부여된 권한 조회 =========================

사용자 권한과 관련된 데이터 딕셔너리 중에서
USER_TAB_PRIVS_MADE 데이터 딕셔너리는 
현재 사용자가 다른 사용자에게 부여한 권한 정보를 알려줌.

만일 자신에게 부여된 사용자 권한을 알고 싶을 때에는 
USER_TAB_PRIVS_RECD 데이터 딕셔너리를 조회하면 됨. 
USER01과 SCOTT 사용자가 부여한 권한과 부여된 권한을 살펴보기. 

CONN USER01/TIGER
SELECT * FROM USER_TAB_PRIVS_MADE;      USER1 사용자가 부여한 권한을 살펴봄
SELECT * FROM USER_TAB_PRIVS_RECD;      USER1 사용자가 부여된 권한을 살펴봄

CONN scott/tiger
SELECT * FROM USER_TAB_PRIVS_MADE;      SCOTT 사용자가 부여한 권한을 살펴봄
SELECT * FROM USER_TAB_PRIVS_RECD;      SCOTT 사용자에게 부여된 권한을 살펴봄

====================== 사용자에게서 권한을 뺏기 위한 REVOKE 명령어 ====================

사용자에게 부여한 객체 권한을 데이터베이스 관리자나 
객체 소유자로부터 절회하기 위해서는 REVOKE 명령어를 사용

REVOKE 명령어의 형식

REVOKE {privilege_name | all}
ON object_name
FROM {user_name | role_name | public};

REVOKE 명령어 다음에는 철회하고자하는 객체 권한을 기술하고 
ON 다음에는 어떤 테이블에 부여된 권한인지 해당 테이블명을 기술하고 
FROM 다음에는 어떤 사용자에게 부여한 권한인지 사용자명을 기술함.

============================= 객체 권한 제거하기 ============================

SELECT 권한을 철회해 보기. 

1. SCOTT 계정으로 로그인. 

2. SELECT 권한을 철회하기 전에 SCOTT 계정에 설정된 권한을 살펴보기.

SELECT * FROM USER_TAB_PRIVS_MADE;

3. REVOKE SELECT ON EMP FROM USER01; 명령문은 
   USER01 사용자에게 부여된 EMP 테이블에 대한 SELECT 권한을 철회함.
   
REVOKE SELECT ON EMP FROM USER01;

4. 권한이 철회되고 나면 데이터 딕셔너리에 객체 권한에 대한 정보도 함께 사라짐.

SELECT * FROM USER_TAB_PRIVS_MADE;

5. USER01 사용자에게 부여된 EMP 테이블에 대한 SELECT 권한을 철회하였기에 
   USER01 사용자 계정으로 로그인해서 SCOTT 사용자의 EMP 테이블을 사용할 수 없음
   
CONN USER01/TIGER
SELECT * FROM SCOTT.EMP;
  
========================= WITH GRANT OPTION =============================

사용자에게 객체 권한을 WITH GRANT OPTION과 함께 부여하면 
그 사용자는 그 객체를 접근할 권한을 부여 받으면서 
그 권한을 다른 사용자에게 부여 할 수 있는 권한도 함께 부여받게 됨.

SCOTT 사용자로 로그인해서 사용자 USER02와 USER03에게 
EMP 테이블 객체를 SELECT 할 수 있는 권한을 부여하는데
USER02는 WITH GRANT OPTION을 지정하고 
USER03은 WITH GRANT OPTION을 지정하지 않아서 차이점을 확인해 보기.

USER02는 WITH GRANT OPTION을 지정하였기에 
USER02로 로그인해서 객체권한을 또 다른 사용자에게 부여할 수 있음. 

USER03는 WITH GRANT OPTION을 지정하지 않았기에 
USER03으로 로그인해서 객체 권한을 또 다른 사용자에게 부여할 수 없음.

===============WITH GRANT OPTION을 지정하여 객체 권한 부여하기=================

WITH GRANT OPTION을 지정하였기에 다른 사용자에게 객체권한을 부여할 수 있음

1. SCOTT 사용자로 접속

2. USER02에게 SCOTT.EMP를 SELECT하는 권한을 WITH GRANT OPTION으로 부여하기

GRANT SELECT ON SCOTT.EMP TO USER02
WITH GRANT OPTION;

3. USER02 사용자로 접속

CONN USER02/TIGER;

4. USER02 사용자가 자기가 받은 권한을 다른 사용자에게 부여할 수 있음

GRANT SELECT ON SCOTT.EMP TO USER01;

예제의 마지막 부분을 보면 USER02 사용자로 로그인하여 
SCOTT.EMP 테이블을 SELECT 할 수 있는 권한을 
USER01 사용자에게 부여하고 있음. 

이것이 가능해진 것은 USER02에게 WITH GRANT OPTION을 사용하여 
SCOTT.EMP 테이블 객체를 SELECT 할 수 있는 권한뿐만 아니라 
그 권한을 다른 사용자에게도 부여할 수 있도록 허용하였기 때문.

============ WITH GRANT OPTION을 지정하지 않고 객체 권한 부여하기 ================

WITH GRANT OPTION을 지정하지 않고 
USER03 사용자가 단순히 SCOTT.EMP에 SELECT 할 수 있는 권한만을 부여하면 
그 권한을 다른 사용자에게 부여할 수 없음을 확인해보기

1. SCOTT 사용자로 접속. 

2. 단순히 SCOTT.EMP에 SELECT 할 수 있는 권한만을 부여받음

GRANT SELECT ON SCOTT.EMP TO USER03; 

3. USER03 사용자로 접속.

CONN USER03/TIGER;

4. USER02 사용자가 자기가 받은 권한을 다른 사용자에게 부여할 수 없음

GRANT SELECT ON SCOTT.EMP TO USER01;
