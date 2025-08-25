-- 주석문 : 한 줄 주석 적을 때는 이렇게 씁니다.
/*
 * 여러 줄 주석을 사용할 때는 이렇게 씁니다. 
 */

/*
 * <SELECT>
 * 데이터를 조회하거나 검색할 때 사용하는 명령어
 * 
 * [ 표현법 ]
 * SELECT 
 * 		  조회하고자 하는 컬럼
 * 		 ,조회하고자 하는 컬럼
 * 		 ,조회하고자 하는 컬럼
 * 	FROM 
 * 		  테이블명;
 * 
 * SELECT문의 결과는 행 단위로 조회됨
 * 
 * - ResultSet : 조회된 행들의 집합 // SELECT문을 통해 조회된 데이터 결과물을 의미함
 */

-- EMPLOYEE 테이블에서 모든 컬럼을 전부 다 조회하겠다.
SELECT * FROM EMPLOYEE; -- 이 방법은 사용해선 안됨
-- * 사용 시 성능에 영향을 끼침

SELECT 
	   EMP_NAME
	 , EMAIL
	 , SALARY
  FROM 
	   EMPLOYEE;

SELECT emp_name, email, salsary FROM employee;

-- 명령어, 키워드, 테이블명, 컬럼명은 대/소문자를 가리지않음
-- 소문자로 작성해도 잘 동작을 하지만 대문자로 작성하는 습관을 들이는 것이 좋음

-- 실습문제

-- 1. JOB테이블에서 JOB_CODE, JOB_NAME컬럼을 조회하세요.

-- 2. JOB테이블에서 직급명만 조회되게 SELECT문을 작성해보세요.

-- 3. DEPARTMENT 테이블에서 DEPT_ID, DEPT_TITLE, LOCATION_ID 컬럼을 조회하세요.

-- 4. EMPLOYEE 테이블에서 EMP_NAME, EMAIL, PHONE컬럼을 조회하세요.

-- 5. EMPLOYEE 테이블에서 HIRE_DATE, EMP_NAME, SALARY컬럼을 조회하세요.


-- 1.
SELECT 
	   JOB_CODE
	 , JOB_NAME
  FROM 
  	   JOB;

-- 2.
SELECT 
	   JOB_NAME
  FROM 
  	   JOB;

-- 3.
SELECT 
	   DEPT_ID
	 , DEPT_TITLE
	 , LOCATION_ID
  FROM 
  	   DEPARTMENT;

-- 4.
SELECT 
	   EMP_NAME
	 , EMAIL
	 , PHONE
  FROM 
	   EMPLOYEE;

-- 5.
SELECT 
	   HIRE_DATE
	 , EMP_NAME
	 , SALARY
  FROM
	   EMPLOYEE;

-------------------------------------------
/*
 * < 컬럼의 조회된 값을 통한 산술연산 >
 * 컬럼들을 나열해서 조회를 할 때 산술연산(+, -, *, /)를 기술해서 결과를 조회할 수 있음
 */

-- EMPLOYEE 테이블로부터 직원명,  월급
SELECT 
	   EMP_NAME
	 , SALARY * 12 + 400000
  FROM 
	   EMPLOYEE;

-- EMPLOYEE 테이블로부터 사원명, 월급, 보너스, 보너스를 포함한 연봉((월급 * 보너스 + 월급) * 12)
SELECT 
	   EMP_NAME
	 , SALARY
	 , BONUS
	 , ((SALARY * BONUS + SALARY) * 12)
  FROM 
  	   EMPLOYEE;
-- 산술연산 과정에서 NULL값이 존재할 경우 산술연산의 결과도 NULL이 된다.

-- DATE => 년, 월, 일, 시, 분, 초
-- DATE 타입끼리의 연산 --> 근무 일수(오늘 날짜 - 입사일)
-- 현재 지금 시점의 날짜값 : SYSDATE
SELECT 
	   EMP_NAME
	 , HIRE_DATE
	 , SYSDATE
	 , SYSDATE - HIRE_DATE
  FROM 
  	   EMPLOYEE;
-- 결과값은 일 단위 --> 값이 지저분한 이유는 DATE안에는 시/분/초가 포함되어있으므로
-- 시/분/초까지 연산을 수행해서 지저분하게 나옴

-------------------------------------------

/*
 * < 컬럼명에 별칭 부여하기 >
 * [ 표현법 ]
 * 컬럼명 AS 별칭, 컬럼명 AS "별칭", 컬럼명 "별칭", 컬럼명 별칭
 */

SELECT 
	   EMP_NAME AS 사원명
	 , SALARY AS "급여(월)" -- "()"등 특수기호나 공백(띄어쓰기)를 포함할 경우 반드시 "로 묶어줘야함.
  FROM 
  	   EMPLOYEE;

-------------------------------------------
/*
 * < 리터럴 >
 * 
 * 임의로 지정한 문자열('')을 SELECT절에 기술하게 되면
 * ResultSet을 반환받을 때 데이터를 붙여서 조회할 수 있음.
 */
-- EMPOLYEE 테이블로 부터 사원명, 급여
SELECT 
	   EMP_NAME
	 , SALARY
	 , '원' 단위
  FROM 
  	   EMPLOYEE;

-------------------------------------------
/*
 * <DISTINCT>
 * 
 * 조회하고자하는 컬럼 앞에 작성하여 중복된 값을 딱 한 번만 조회하는 용도
 * 
 * 주의) SELECT에 DISTINCT구문은 한 개만 사용이 가능
 */

SELECT 
	   DISTINCT DEPT_CODE
  FROM 
  	   EMPLOYEE;

-------------------------------------------
/*
 * SELECT문을 이용해서 조회를 할 때 조건을 부여하는 방법
 * 
 * < WHERE 절 >
 * 조회하고자 하는 테이블에 특정 조건을 제시해서
 * 조건에 만족하는 행만 조회하고자 할 때 기술하는 구문
 * 
 * [ 포현법 ]
 * SELECT 
 * 		  컬럼명
 * 		, 컬럼명
 *   FROM 
 * 		  테이블명
 *  WHERE 
 * 		  조건식;
 * - 조건식에 다양한 연산자들을 사용할 수 있음
 * 
 * < 비교연산자 >
 * >, <, <=, >= // 대소비교
 * 
 * =, != // 동등비교
 */

--EMPLOYEE 테이블로부터 사원들의 사원명, 급여 조회 --> 급여가 300만원 이상인 사원들만
SELECT 
	   EMP_NAME
	 , SALARY
  FROM 
  	   EMPLOYEE   
 WHERE 
 	   SALARY >= 3000000;

-- EMPLOYEE 테이블로부터 부서코드가 D9인 사원들의 사원명, 부서코드 조회
SELECT 
	   EMP_NAME
	 , DEPT_CODE
  FROM 
  	   EMPLOYEE
 WHERE 
	   DEPT_CODE = 'D9';

-- EMPLOYEE 테이블로부터 부서코드가 D9가 아닌 사람들의 사원명, 전화번호 조회
SELECT 
	   EMP_NAME
	 , PHONE
  FROM
	   EMPLOYEE
 WHERE 
	 --DEPT_CODE != 'D9';
	 --DEPT_CODE ^= 'D9';
 	   DEPT_CODE <> 'D9';

-- 실행순서 1. FROM -> 2. WHERE -> 3. SELECT
-------------------------------------------
/*
 * < 실습 >
 */
-- 1. EMPLOYEE 테이블에서 급여가 250만원 이상인 사원들의 이름, 급여, 입사일 조회
SELECT 
	   EMP_NAME
	 , SALARY
	 , HIRE_DATE
  FROM 
  	   EMPLOYEE
 WHERE 
 	   SALARY >= 2500000;

-- 2. EMPLOYEE 테이블에서 부서코드가 D6인 사뤈들의 이름, 급여, 보너스 조회
SELECT 
	   EMP_NAME
	 , SALARY
	 , BONUS
  FROM 
  	   EMPLOYEE
 WHERE 
 	   DEPT_CODE = 'D6';

-- 3. EMPLOYEE 테이블에서 현재 재직중인 사원(ENT_YN == 'N')들의 이름, 입사일 조회
SELECT 
	   EMP_NAME
	 , HIRE_DATE
  FROM 
  	   EMPLOYEE
 WHERE 
 	   ENT_YN = 'N';

-- 4. EMPLOYEE 테이블에서 연봉이 5000 이상인 사원들의 이름 연봉 조회
-- 단, 연봉컬럼은 별칭으로 연봉으로 조회되게 할 것
SELECT 
	   EMP_NAME
	 , (SALARY * 12) AS "연봉"
  FROM 
  	   EMPLOYEE
 WHERE 
 	   (SALARY * 12) >= 50000000;
-------------------------------------------
/*
 * < 논리 연산자 >
 * 여러 개의 조건을 엮을 때 사용
 * 
 * AND (이면서~~, 그리고) / OR (~거나, 또는)
 */

-- EMPLOYEE 테이블에서 부서코드가 'D9'이면서 급여가 500만원 이하인 사원들의
-- 사원명, 부서코드, 급여 조회
SELECT 
	   EMP_NAME
	 , DEPT_CODE
	 , SALARY
  FROM 
  	   EMPLOYEE
 WHERE 
 	   (DEPT_CODE = 'D9') 
   AND 
	   (SALARY <= 5000000);

-- EMPLOYEE 테이블에서 부서코드가 'D6'이거나 급여가 300만원 이상인 사원들의
-- 사원명, 부서코드, 급여 조회
SELECT 
	   EMP_NAME
	 , DEPT_CODE
	 , SALARY
  FROM 
  	   EMPLOYEE
 WHERE 
 	   (DEPT_CODE = 'D6')
 	OR 
 	   (SALARY >= 3000000);

-- EMPLOYEE 테이블로부터 급여컬럼의 값이 350만원 이상이고 500만원 이하인 사람들의
-- 사번(EMP_ID), 이름, 급여 조회
SELECT 
	   EMP_ID
	 , EMP_NAME
	 , SALARY
  FROM 
  	   EMPLOYEE
 WHERE 
 	   (3500000 <= SALARY)
   AND 
   	   (SALARY <= 5000000);
-------------------------------------------
/*
 * < BETWEEN AND >
 * 몇 이상 몇 이하인 범위에 대해서 조건을 제시할 때 사용
 * 
 * [ 표현법 ]
 * 비교대상컬럼명 BETWEEN 하한값 AND 상한값
 */
-- EMPLOYEE 테이블에서 급여가 350 이상 500 이하인 사원들의
-- 사번, 이름, 직급코드(JOB_CODE)
SELECT 
	   EMP_ID
	 , EMP_NAME
	 , JOB_CODE
  FROM 
  	   EMPLOYEE
 WHERE 
 	   SALARY BETWEEN 3500000 AND 5000000;

-- EMPLOYEE 테이블에서 급여가 350 미만 500 초과인 사원들의
-- 사번, 이름, 직급코드
SELECT 
	   EMP_ID
	 , EMP_NAME
	 , JOB_CODE
  FROM 
  	   EMPLOYEE
 WHERE 
 	   SALARY NOT BETWEEN 3500000 AND 5000000;
--> 오라클에서의 NOT은 자바의 !와 동일한 의미(부정)

-- BETWEEN AND 연산자는 DATE형식에도 사용 가능
-- 입사일이 '90/01/01' ~ '03/01/01'인 사원들의 이름 입사일 조회
SELECT 
	   EMP_NAME
	 , HIRE_DATE
  FROM 
  	   EMPLOYEE
 WHERE 
 	   HIRE_DATE BETWEEN '90/01/01' AND '03/01/01';

-------------------------------------------
/*
 * < LIKE '특정패턴' >
 * 비교하려는 컬럼의 값이 내가 지정한 특정 패턴에 만족할 경우 조회
 * 
 * [ 표현법 ]
 * 비교대상컬럼 LIKE '특정패턴'
 * 
 * - 특정패턴 --> 와일드카드
 * '%', '_' 두 가지를 가지고 패턴을 만들 수 있음
 * 
 * '%' : 0글자 이상 
 * 		비교대상컬럼 LIKE 'A%' => 컬럼 값 중 'A'로 시작하는 것만 조회 -> Apple, Add, A
 * 		비교대상컬럼 LIKE '%A' => 컬럼 값 중 'A'로 끝나는 것만 조회 -> BananA, GolilA, A
 * 		비교대상컬럼 LIKE '%A%' => 컬럼 값 중 'A'가 포함되는것을 전부 조회
 * 
 * '_' : 1글자
 * 		비교대상컬럼 LIKE '_A' => 컬럼 값에 'A'앞에 무조건 1글자가 있어야만 패턴에 만족
 * 		비교대상컬럼 LIKE '__A' => 컬럼 값에 'A'앞에 무조건 2글자가 있어야만 패턴에 만족
 */
-- EMPLOYEE 테이블로부터 모든 사원의 이름, 전화번호 조회
SELECT 
	   EMP_NAME
	 , PHONE
  FROM 
  	   EMPLOYEE;

-- EMPLOYEE 테이블에서 성이 '박'씨인 사원들의 사원명, 전화번호

SELECT 
	   EMP_NAME
	 , PHONE
  FROM 
  	   EMPLOYEE
 WHERE 
 	   EMP_NAME LIKE '박%';

-- EMPLOYEE 테이블에서 이름에 '준'이라는 글자가 포함된 사원들의 사원명, 전화번호
SELECT 
	   EMP_NAME
	 , PHONE
  FROM 
  	   EMPLOYEE
 WHERE 
 	   EMP_NAME LIKE '%준%';

-- 이름의 두 번째 글자가 '승'인 사원들의 사원명, 전화번호 / '승'이 아닌 사원들만
SELECT 
	   EMP_NAME
	 , PHONE
  FROM
	   EMPLOYEE
 WHERE 
 	   --EMP_NAME LIKE '_승_';
 	   EMP_NAME NOT LIKE '_승_';

-------------------------------------------
/*
 * < LIKE 실습문제 >
 */
-- 1. EMPLOYEE 테이블로부터 전화번호 4번째 자리가 9로 시작하는 사원들의 사원명, 전화번호
SELECT 
	   EMP_NAME
	 , PHONE
  FROM 
  	   EMPLOYEE
 WHERE 
 	   PHONE LIKE '___9%';

-- 2. EMPLOYEE 테이블로부터 이름이 '영'으로 끝나는 사원들의 이름, 입사일
SELECT 
	   EMP_NAME
	 , HIRE_DATE
  FROM 
  	   EMPLOYEE
 WHERE 
 	   EMP_NAME LIKE '%영';

-- 3. EMPLOYEE 테이블로부터 전화번호 처음 3자리가 010이 아닌 사원들의 이름, 전화번호
SELECT 
	   EMP_NAME
	 , PHONE
  FROM 
  	   EMPLOYEE
 WHERE 
 	   PHONE NOT LIKE '010%';

-- 4. DEPARTMENT 테이블로부터 해외영업과 관련된 부서들의 부서명 조회
SELECT 
	   DEPT_TITLE
  FROM 
  	   DEPARTMENT
 WHERE 
 	   DEPT_TITLE LIKE '%해외영업%';
-------------------------------------------
/*
 * < IS NULL >
 * 
 * [ 표현법 ]
 * 비교대상컬럼 IS NULL : 컬럼값이 NULL일 경우
 * 비교대상컬럼 IS NOT NULL : 컬럼값이 NULL이 아닐 경우
 */

SELECT 
	   EMP_NAME
	 , BONUS
  FROM 
  	   EMPLOYEE;

-- EMPLOYEE테이블로부터 보너스를 받지 않는(보너스가 없는) 사원들의 사원명, 보너스 조회
SELECT 
	   EMP_NAME
	 , BONUS
  FROM 
  	   EMPLOYEE
 WHERE 
	   --BONUS IS NULL;
	   BONUS IS NOT NULL;
-------------------------------------------
/*
 * < 연결연산자 || >
 * 여러개의 칼럼 값들을 마치 하나의 컬럼인것처럼 연결시켜주는 연산자
 * 컬럼값 또는 리터럴(문자열)을 전부 다 합칠 수 있음
 * 
 * System.out.println(num + "asdf"); 느낌
 */

SELECT 
	   EMP_ID || EMP_NAME
  FROM 
  	   EMPLOYEE;

SELECT 
	   EMP_ID || '번 사원 ' || EMP_NAME || '님의 핸드폰 번호는 ' ||
	   PHONE || '입니다.' AS "사원의 정보"
  FROM
  	   EMPLOYEE;

-------------------------------------------
/*
 * < IN >
 * 비교대상 컬럼값에 내가 제시한 목록들 중에 일치하는 값이 있는지
 */
-- EMPLOYEE 테이블로부터 부서코드가 D6이거나 D8이거나 D5인 사원들의 사원명, 부서코드 조회
SELECT 
	   EMP_NAME
	 , DEPT_CODE
  FROM 
  	   EMPLOYEE
 WHERE 
 /*
 	   DEPT_CODE = 'D6'
 	OR 
 	   DEPT_CODE = 'D8'
 	OR
 	   DEPT_CODE = 'D5';
*/
 	   DEPT_CODE IN ('D6', 'D8', 'D5');

-------------------------------------------
/*
 * < 연산자 우선순위 >
 * 
 * 1. ( )
 * 2. 산술연산자
 * 3. 연결연산자
 * 4. 비교연산자
 * 5. IS NULL, LIKE, IN
 * 6. BETWEEN AND
 * 7. NOT
 * 8. AND
 * 9. OR
 */

-------------------------------------------
/*
 * < ★★★★★★★★★ ORDER BY 절 ★★★★★★★★★ >
 * 정렬용도로 사용하는 구문
 * SELECT문에 가장 마지막에 작성하는 문법 + 실행 순서 또한 가장 마지막
 * ORDER BY절을 작성하지않으면 ResultSet은 정렬이 안된 상태
 * 
 * [ 표현법 ]
 * SELECT 
 * 		  컬럼명
 * 		, 컬럼명
 * 		, ...
 *   FROM
 * 		  테이블명
 *  WHERE 
 * 		  조건식(생략가능)
 *  ORDER
 * 	   BY
 * 		  [정렬기준으로 삼고싶은 컬럼명 / 별칭 / 컬럼 순번]
 * 		  [ASC / DESC]
 * 		  [NULLS FIRST / NULLS LAST] (생략가능)
 * 
 * - ASC : 오름차순 정렬(기본값)
 * - DESC : 내림차순 정렬
 * 
 * - NULLS FIRST : 컬럼값이 NULL일 경우 조회결과의 위쪽의 배치(내림차순일 경우 기본값)
 * - NULLS LAST : 컬럼값이 NULL일 경우 조회결과의 아래쪽에 배치(오름차순일 경우 기본값)
 */

SELECT 
	   EMP_ID
	 , EMP_NAME
	 , BONUS
  FROM 
  	   EMPLOYEE
 ORDER
	BY 
--	   BONUS; -- ASC / DESC 생략시 ASC가 기본(오름차순)
--	   BONUS DESC; -- DESC(내림차순 정렬 시)는 기본적으로 NULLS FIRST   
--	   BONUS DESC NULLS LAST;
	   BONUS, EMP_ID, EMP_NAME;
-- 첫 번째로 제시한 정렬기준의 컬럼값이 동일할 경우 다음 정렬기준을 명시할 수 있음

SELECT 
	   EMP_NAME
	 , SALARY * 12 AS "연봉"
  FROM 
  	   EMPLOYEE
 WHERE 
--	   연봉 * 12 > 40000000; 
 	   SALARY * 12 > 40000000
 ORDER
 	BY 
 	   연봉;
-- 	   2; -- 가능은 하나 권장하지 않는 방법(비추천)
-- FROM -> WHERE -> SELECT -> ORDER BY 순이기 때문에 WHERE절은 별칭 사용 X BUT, ORDER BY절에선 사용 가능











