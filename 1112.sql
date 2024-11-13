-- SELECT문은 자원 검색에 사용되는 문장이다.
-- 전체 데이터 확인하기
SELECT * FROM employees;

-- 컬럼명을 기술하여 확인하기
-- SELECT employeenumber, firstname, email, jobtitle
Select employeenumber, firstname, email, jobtitle
FROM employees;

-- 조건부여(WHERE절)
-- 		일반적으로 테이블에 있는 자원들을 조회할 때가 많다.
-- 		이때 사용자가 원하는 자원들을 간단한 연산자 등을 이용하여
-- 		WHERE절에 조건으로 기술하면 결과를 얻을 수 있다.
-- 예) 사원테이블에서 부서(officecode)가 2번인 사원들의 정보를
-- 	   사번, 이름, 이메일, 부서코드 순으로 출력하자!
SELECT employeenumber, firstname, email, officecode
FROM employees
WHERE officeCode = 2;

-- 문제) 사원 테이블에서 직종(jobTitle)이 "Sales Rep"인 사원들의 정보를
-- 	  사번, 이름, 부서코드, 직종 순으로 출력하자!
select employeenumber, firstname, officecode, jobtitle 
from employees
where jonTitle = 'Sales Rep';

-- 문제) 사원 테이블에서 사번이 1500번 이상인 사원들의 정보를
-- 	    사번, 이름, 이메일 순으로 출력하자! 
SELECT employNumber, firstName, email
From employees
Where employeeNumber >= 1500;
-- 주의)
--  1. 비교연산자는 ==이 아니라 =으로 같은 값을 비교한다.
--  2. 문자열을 의미할 때는 쌍따옴표가 아니라 홑따옴표로 표기한다.

-- 예문) 주문 테이블에서 주문 날짜가 2003-03-02에 주문된 정보를
-- 		주문번호, 주문날짜, 필수 날짜, 배송날짜 순으로 출력하자

Select orderNumber, orderDate, requiredDate, shippedDate, customerNumber
From orders
Where orderDate = '2003-03-03';

-- 문제) 주문테이블에서 주문이 취소된 정보를
-- 		주문번호, 주문날짜, 상태(status), 고객번호 순으로 출력하시오
Select orderNumber, orderDate, status, customerNumber
From orders
Where status = 'cancelled'; 

-- 위의 문제에서 다시 진행중인 것을 확인하고 싶다면
Select orderNumber, orderDate, status, customerNumber
From orders
Where status = 'in process';

-- 예) 주문테이블에서 주문날짜가 2004년에 주문된 모든 정보를 확인하고 싶다면
-- 	  정보들 모두를 확인하고 싶다면 다음과 같이 비교할 수 있다.
Select * from orders
where orderDate >= '2004-01-01'
And orderDate <= '2004-12-31';

-- 문제) 주문테이블에서 고객번호 452번인 고객이 2004년에 주문한 모든 정보를 출력하시오!
Select * from orders
Where customerNumber = 452 
And orderDate >= '2005-01-01'
And orderDate <= '2005-12-31';

-- 특정 컬럼
-- 예) 주문테이블에서 2005년에 주문한 데이터들을 가장 최근의 데이터들부터 확인하고 한다.
Select * From orders
Where orderDate >= '2005-01-01'
And orderDate <= '2005-12-31'
Order By orderDate Desc;

-- 오름차순으로 한다면
-- ORDER BY orderDate ASC; 또는
-- ORDER BY orderDate;

-- SQL 연산자
--    1. BETWEEN 연산자
-- 	  2. IN 연산자
--    3. LIKE 연산자

-- 1. BETWEEN 연산자
-- 	  특정 값 A에서 특정 값 B의 사이(범위)의 정보를 얻을 때 사용한다.
-- 	  예) 주문테이블에서 2004년도에 주문된 정보들을 주문번호, 주문날짜, 배송날짜, 상태, 고객번호 순으로 확인
SELECT orderNumber, orderDate, shippedDate, status, customerNumber
FROM orders
WHERE orderDate >= '2004-01-01'
AND orderDate <= '2004-12-31';
-- 	  BETWEEN연산자를 사용하면 다음과 같다.
SELECT orderNumber, orderDate, shippedDate, status, customerNumber
From orders
WHERE orderDate BETWEEN '2004-01-01'
AND '2004-12-31';

-- 문제) 사원테이블에서 사번의 1100~1200 사이의 사원들의 정보를
-- 	    사번, 이름, 이메일, 부서코드 순으로 출력하자
SELECT employeeNumber, firstname, email, officecode
FROM employees
WHERE employeeNumber BETWEEN 1100 AND 1200;

-- 2. IN연산자
--    특정 목록의 결과값에서 비교값이 속하는지? 를 가려내는 연산자이다. (OR)
--    [구성]
--    WHERE [컬럼명] IN(값1, 값2, ..., 값n);
--    예) 사원테이블에서 사번 1102, 1200, 1120, 1166인 사원들의 정보를 출력하시오
SELECT employeeNumber, firstname, email, officecode
FROM employees
WHERE employeeNumber = 1102
OR employeeNumber = 1200
OR employeeNumber = 1120
OR employeeNumber = 1166;

-- 위의 내용을 IN연산자를 사용하면 다음과 같다. 
SELECT employeeNumber, firstname, email, officecode
FROM employees
WHERE employeeNumber IN (1102, 1200, 1120, 1166);

-- 문제) 주문테이블에서 주문상태(status)가
-- 		분쟁(disputed), 보류(on hold) 또는 취소(cancelled)인 주문 항목을 모두 출력하시오!
-- 		단, IN 연산자를 사용해야 한다.
SELECT * FROM orders
WHERE status IN ('disputed', 'on hold', 'cancelled');

-- 문제) 주문테이블에서 주문상태(status)가 분쟁(disputed), 보류(on hold) 또는 취소(cancelled)인 주문항목을 모두 출력하시오!
-- 단, IN연산자를 사용해야 한다.
SELECT * FROM orders
WHERE status IN('disputed','on hold','cancelled');

-- 문제) 고객테이블(customers)에서 country가 usa 또는 austria 또는 italy인 고객들의 정보를 모두 출력하시오! (IN연산자 사용)
SELECT * FROM customers
WHERE country IN ('usa', 'austria', 'italy');

-- 문제) 고객테이블(customers)에서 country가 usa 또는 austria 또는 italy인 고객들 중
-- 		한도액이 77000불 이상인 고객들의 정보를 모두 출력하시오! (IN연산자 사용)
-- 		출력은 한도액이 많은 순으로 출력하시오.
SELECT * FROM customers
WHERE country IN ('usa', 'austria', 'italy')
AND creditLimit >= 77000
ORDER BY creditLimit ASC;

-- 3. LIKE 연산자
-- 	  지정한 문자 형태와 일치한 자원들을 검색할 때 사용한다.
--    [형식]
--    1. % : 모든 값
--    2. _ : 하나의 값
--    	1) 'M%' : M으로 시작하는 모든 값 (Michael, Mike, MK14, ...)
--      2) '%n' : n으로 끝나는 모든 값 (13028mnn, person, ...)
--      3) '%a%' : a가 포함된 모든 값 (1apart100, apple, Nasa, ...)
-- 		4) '_a' : 총 2자이면서 a로 끝나는 값(Na, Aa, 1a, ...)
-- 		5) 'M______' : 총 7자이면서 M으로 시작하는 값 (Michael, ...)

-- 문제) 주문테이블에서 2004년도에 주문된 정보들을 
-- 		주문번호, 주문날짜, 배송날짜, 상태, 고객번호 순으로 확인
-- 		LIKE 연산자로 활용하여 결과를 출력하시오!
SELECT orderNumber, orderDate, shippedDate, status, customerNumber
FROM orders
WHERE orderDate LIKE '2004%';

-- 사원테이블에서 직종(jobTitle)이 판매관련된 사원들의 모든 정보를 모두 출력하시오!
SELECT * FROM employees
WHERE jobTitle LIKE '%sale%';

-- SQL 함수
-- 기본적으로 쿼리(질의)문을 더욱 강력하게 하고, 데이터 값을 조작하는데 있어 도움이 되는 것

-- SQL 함수의 특징과 장점
-- 	- 자원에 대한 연산을 수행할 수 있다.
-- 	- 개별적인 데이터 항목을 수행할 수 있다.
-- 	- 그룹화 작업에도 용이하다.

-- SQL 함수의 종류
-- 	- 문자함수(변환, 조작)
-- 	- 숫자함수
-- 	- 날짜함수

-- 문자 함수
-- 1. 변환함수
--    - LOWER(컬럼명 또는 값) : 알파벳 값을 소문자로 변환
-- 	  - UPPER(컬럼명 또는 값) : 알파벳 값을 대문자로 변환
-- 	  - INITCAP(컬럼명 또는 값) : 알파벳 첫 문자만 대문자로 변환

-- 사원테이블에서 직종이 'sales rep'인 사원들의 정보를 사번, 이름, 이메일. 직종 순으로 출력하자!
SELECT employeeNumber as empno, firstName, email, officeCode, jobTitle
FROM employees
WHERE UPPER(jobTitle) = UPPER('sales rep');

-- 2.조작함수
--   - CONCAT : 두 문자열을 연결
--   - SUBSTR : 특정 문자나 문자열을 추출
--   - SUBSTRING : SUBSTR과 동일
--   - LEFT : 왼쪽부터 지정한 길이만큼 추출
--   - RIGHT : 오른쪽부터 지정한 길이만큼 추출
--   - INSTR : 명시된 문자열의 위치값(자바의 indexOf())
--   - LTRIM : 문자열의 왼쪽에 있는 공백제거: "    Test" --> "Test"
--   - RTRIM : 문자열의 오른쪽에 있는 공백제거: "Test	" --> "Tets"
--   - REVERSE : 문자열의 순서를 역순으로 만든다.


-- 예문) 사원테이블에서 각 사원들의 직종의 3번째 문자값을 추출하여 출력해보자!
-- 		출력할 컬럼들은 사번, 이름, 직종 순이다.
-- 		SUBSTR(컬럼명, 위치값, 길이)
SELECT employeeNumber, firstName, jobTitle, 
		SUBSTR(jobTitle,3,1) AS job1, SUBSTRING(jobTitle, 3, 1) AS job2, LENGTH(jobTitle)
FROM employees;

-- 예) 사원테이블에서 각 사원들의 직종 값에 'S'의 위치값을 알아내자!
SELECT employeeNumber, firstName, email, jobTitle, INSTR(jobTitle, 'S')
FROM employees;


-- 숫자함수
--    - ROUND : 반올림
-- 	  - CEIL : 소수점 이하를 자르면서 올림
--    - FLOOR : 소수점 이하를 자르면서 버림
--    - POW : 거듭제곱
--    - MOD : 나머지
--    - GREATEST : 최대값
--    - LEAST : 최소값

-- 예) 고객테이블에 고객의 한도액의 백단위에서 반올림을 시킨 후 
--    고객번호, 이름, 전화번호, 한도액 순으로 출력하자!
SELECT customerNumber, customerName, phone, creditLimit, ROUND(creditLimit, -3)
FROM customers;

-- 문제) 고객 테이블에서 고객정보를 고객번호, 이름, 전화번호, 한도액 순으로 출력하자
-- 		이때 한도액을 12로 나눴을 때 나머지가 얼마인지도 출력하자!
SELECT customerNumber, customerName, phone, creditLimit, 
		ROUND(creditLimit, -3) AS roundV, MOD(creditLimit, 12) As modV
FROM customers;

SELECT CEIL(3.14), FLOOR(3.94);

-- 날짜함수
--    weekday(날짜) : 요일(월요일-0, 화요일-1,...,일요일-6)
-- 	  dayofweek(날짜) : 한 주의 요일(일-1,월,-2,...,토-7)
SELECT NOW(), dayofweek(NOW()), dayofweek('2024-11-10');
--    dayofmonth(날짜) : 그 달에 몇 번째 날인지 알아낸다.
--    dayofyear(날짜) : 그 해에 몇 번째 날인지 알아낸다.
SELECT now(), dayofmonth(now()), dayofyear(now());
--    month(날짜) : 해달 날짜의 월 반환
--    year(날짜) : 해당 날짜의 년도 반환
--    dayname(날짜) : 요일명을 반환
--    quarter(날짜) : 분기 반환(1~4)
SELECT now(), month(now()), dayname(now()), quarter(now());

-- 시간함수
-- hour(시간) : 시간 반환 (0~23)
-- minute(시간) : 분 반환(0~59)
-- second(시간) : 초 반환(0~59)

-- period_add(날짜형식(xxxx년xx월 6자리로), 더할_월수) : 지정한 날짜에서 더한 월의 날짜 
SELECT now(), period_add(202411, 3);

-- period_diff(날짜1, 날짜2) : 두 날짜 사이의 개월 수를 반환
SELECT period_diff(202410, 202311);

-- 주문테이블에서 주문번호, 주문날짜, 현재날짜, 고객번호, 주문날짜에서 현재까지 몇 달이 지났는지
SELECT orderNumber, orderDate, now(), customerNumber,
		period_diff(CONCAT(SUBSTR(now(),1,4), SUBSTR(now(),6,2)), CONCAT(SUBSTR(orderDate,1,4), SUBSTR(orderDate,6,2)))
FROM orders;

-- 현재 날짜에서 년도와 월을 출력하려면 어떻게 할까?
SELECT orderNumber, orderDate, year(orderDate), month(orderDate)
FROM orders;
--
-- date_format(날짜, 형식)
--  형식은 정해지는 것에 따라 날짜 또는 시간을 출력한다.
--  [형식]
--   '%m' : 월 이름
--   '%w' : 요일명
--   '%d' : 일(몇일)
-- 	 '%Y' : 4자리의 년도
-- 	 '%y' : 2자리의 년도
-- 	 '%H' : 24시 형식의 시간
-- 	 '%h' : 12시 형식의 시간
-- 	 '%i' : 분(0~59)
-- 	 '%s' : 초(0~59)
-- 현재 날짜를 가지고 년/월/일 형식으로 출력해 보자
SELECT now(), 
		date_format(now(), '%Y/%m/%d') as c_date,
		date_format(now(), '%H:%i:%s') as c_time;

-- 이전에 작업했던 주문테이블에서 주문 테이블에서 주문번호, 주문날짜, 현재날짜,
-- 주문한 날짜가 현재날짜에서 몇 달 전인지? 출력하시오!
SELECT orderNumber, orderDate, now(), period_diff(date_format(now(),'%Y%m'), date_format(orderDate, '%Y%m')) as c_date
FROM orders;




