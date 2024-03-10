-- ======================= CHAPTER.2_ȥ�� �غ��� ================================

-- 1. ���� �����ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������ ��
--    ����� �̸�, �޿�, �λ�� �޿��� ���

SELECT ENAME, SAL ,SAL+300
FROM EMP;

-- 2. ����� �̸�, �޿�, ���� �Ѽ����� �� ������ ���� �ͺ��� ���� ������ ���.
--    ���� �Ѽ����� ���޿� 12�� ���� �� $100�� �󿩱��� ���ؼ� ���

SELECT ENAME �̸�, SAL �޿�, SAL*12 "���� �Ѽ���", SAL*12+100 "���� �Ѽ��� + 100"
FROM EMP
ORDER BY SAL DESC;

-- 3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� ���
--    (�޿��� �����ͺ��� ������)

SELECT ENAME, SAL
FROM EMP
WHERE SAL > 2000
ORDER BY SAL DESC;

-- 4. ��� ��ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ���

SELECT ENAME, DEPTNO
FROM EMP
WHERE EMPNO = 7788;

-- 5. �޿��� 2000���� 3000 ���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ���

SELECT ENAME, SAL
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

-- 6. 1981�� 2�� 20�� ���� 1981�� 5�� 1�� ���̿� �Ի��� ����� �̸�, ��� ����, �Ի����� ���

SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981/02/20' AND '1981/05/01';

-- 7. �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ�,
--    �̸��� ����(��������)���� ������ ������ ���

SELECT ENAME,DEPTNO
FROM EMP
WHERE DEPTNO IN(20,30)
ORDER BY ENAME DESC;

SELECT ENAME,DEPTNO
FROM EMP
WHERE DEPTNO=20 OR DEPTNO=30
ORDER BY ENAME DESC;

-- 8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20�Ǵ� 30�� �����
--    �̸� ,�޿�, �μ���ȣ�� ����ϵ� �̸� ��(��������)���� ���

SELECT ENAME,SAL,DEPTNO
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000
AND DEPTNO IN(20,30)
ORDER BY ENAME ASC;

-- ASC ���� ����

-- 9. 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ���(like �����ڿ� ���ϵ� ī�� ���)

SELECT ENAME,HIREDATE
FROM EMP
WHERE HIREDATE LIKE '81%';

-- 10. �����ڰ� ���� ����� �̸��� ��� ������ ���

SELECT ENAME, JOB
FROM EMP
WHERE MGR IS NULL;

-- 11. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ�
--     �޿� �� Ŀ�̼��� �������� �������� �����Ͽ� ǥ��

SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY COMM DESC;

-- 12. �̸��� �� ��° ���ڰ� R�� ����� �̸��� ǥ��

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__R%';

-- 13. �̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� ǥ��

SELECT ENAME
FROM EMP
WHERE ENAME LIKE'%A%'
AND ENAME LIKE'%E%';

-- 14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭
--     �޿��� $1600,$950 �Ǵ� $1300�� �ƴ� ����� �̸�, ��� ����, �޿��� ���

SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB IN('CLERK','SALESMAN')
AND SAL NOT IN(1600,950,1300);

-- 15. Ŀ�̼��� $500 �̻��� ����� �̸��� �޿� �� Ŀ�̼��� ���

SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM >= 500;

-- 16. Ŀ�̼��� ���� ��� ���

SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NULL;