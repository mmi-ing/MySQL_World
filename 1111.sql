-- SQL문 종류
-- 1) DDL (Data Definition Language) : 데이터 정의어
-- 	  CREATE, DROP, ALTER 
-- 2) DML (Data Manipulation Language) : 데이터 조작어
--    SELECT, UPDATE, INSERT, DELETE
-- 3) DCL (Data Control Language) : 데이터 제어
--    GRANT, REVOKE, COMMIT, ROLLBACK 등

-- 컬럼은 자원 한 개를 저장하는 공간이다.
-- 컬럼들은 자료형이 있어야 한다.
-- 자료형들 - 문자형 : CHAR(길이), VARCHAR(길이), TEXT()
-- 			날짜형 : DATE, DATETIME, TIMESTAMP
-- 			정수형 : INT(길이), BIGINT(길이)
-- 			고정소수점 : DECIMAL, NUMVERIC


-- 조작어
-- employees 테이블의 모든 자우너들을 출력하는 SQL문 작성
-- SELECT [컬럼명 또는 *] FROM [테이블명]
SELECT * FROM employees;
-- 문제 ) employees테이블에서 사번, 이름, 부서코드 순으로 출력하는 SQL문장을 완성하시오!
SELECT employeeNumber, lastname, officecode
FROM employees;
