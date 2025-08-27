/*
	
	
	< DML : DATA MANIPULATION LANGUAGE >
			데이터 조작			  언어
			
	*SELECT : DML 혹은 DQL(DATA QUERY LANGUAGE)
	
	INSERT / UPDATE / DELETE
	
	테이블에 새로운 데이터를 삽입(INSERT)하거나,
	테이블에 존재하는 데이터를 수정(UPDATE)하거나,
	테이블에 존재하는 데이터를 삭제(DELETE)하는 구문
*/
/*
 * 1. INSERT : 테이블에 새로운 행을 추가해주는 구문
 * 
 * [ 표현법 ]
 * 
 * 1) INSERT INTO 테이블명 VALUES (값, 값, 값, ...);
 * 								컬럼의 개수만큼
 * => 해당 테이블에 모든 컬럼에 추가하고자 하는 값을 직접 입력해서 한 행을 INSERT할 때 사용
 * ※ 주의할 점 : 값의 순서를 컬럼의 순서와 동일하게 작성해야 함
 */
SELECT * FROM EMPLOYEE;

INSERT
  INTO 
       EMPLOYEE
VALUES 
	   (
	   223
	 , '김태호'
	 , '991231-9999999'
	 , 'kth04@kh.or.kr'
	 , '01004044040'
	 , 'D9'
	 , 'J5'
	 , 'S4'
	 , 5000000
	 , NULL
	 , NULL
	 , SYSDATE
	 , NULL
	 , 'N'
	   );
/*
 * 2) INSERT INTO 테이블명(컬럼명, 컬럼명, 컬럼명) VALUES(값, 값, 값);
 * => 테이블 특정 컬럼만 선택해서 컬럼에 값을 추가하면서 행을 추가할 때 사용
 * INSERT는 무조건 한 행 단위로 추가가 되기 때문에 작성하지 않은 컬럼은 NULL값이 들어감
 * 
 * 주의할 점) NOT NULL이 달려있는 컬럼은 반드시 테이블 명 뒤에 컬럼명을 적어야함
 * 예외 사항) NOT NULL제약조건이 달려있는데 기본값이 있는경우는 DEFAULT VALUE가 들어감
 */
INSERT
  INTO
	   EMPLOYEE
	   (
	   EMP_ID
	 , EMP_NAME
	 , EMP_NO
	 , JOB_CODE
	 , SAL_LEVEL
	   )
VALUES 
	   (
	   900
	 , '고길동'
	 , '770909-0909090'
	 , 'J5'
	 , 'S1'
	   );
-----------------------------------------------------------
/*
 * 3) INSERT INT 테이블명 (서브쿼리);
 * => VALUES 대신에 서브쿼리를 작성해서 INSERT 할 수 있음
 */
-- 새 테이블 하나 만들기
CREATE TABLE EMP_01(
  EMP_NAME VARCHAR2(20),
  DEPT_TITLE VARCHAR2(20)
);
SELECT * FROM EMP_01;

-- EMPLOYEE테이블에 존재하는 모든 사원 사원명과, 부서명을 새로만든 EMP_01에 INSERT
INSERT
  INTO
  	   EMP_01
  	   (
  	   SELECT 
  	   		  EMP_NAME
  	   		, DEPT_TITLE
  	     FROM 
  	     	  EMPLOYEE
  	     	, DEPARTMENT
  	    WHERE 
  	    	  DEPT_CODE = DEPT_ID(+)
  	   );
-----------------------------------------------------------
/*
 * 4) INSERT ALL ★★★
 * 하나의 테이블에 여러 행을 한꺼번에 INSERT 할 때 사용
 * INSERT ALL
 *   INTO 테이블명 VALUES(값, 값, 값, ...)
 *   INTO 테이블명 VALUES(값, 값, 값, ...)
 * SELECT *
 *   FROM DUAL;
 */
INSERT INTO EMP_01 VALUES('사원1', '부서1');
INSERT INTO EMP_01 VALUES('사원2', '부서2');

-- ...
SELECT * FROM EMP_01;
INSERT INTO EMP_01 VALUES('사원3', '부서3');

INSERT
   ALL 
   	   INTO EMP_01 VALUES('사원4', '부서4')
   	   INTO EMP_01 VALUES('사원5', '부서5')
   	   INTO EMP_01 VALUES('사원6', '부서6')
SELECT 
	   *
  FROM 
  	   DUAL;
-----------------------------------------------------------
/*
 * 2. UPDATE
 * 테이블에 기록된 기존의 데이터를 수정하는 구문
 * 
 * [ 표현법 ]
 * UPDATE 
 * 	      테이블명
 * 	  SET 
 * 		  컬럼명 = 바꿀값
 * 		, 컬럼명 = 바꿀값
 * 		, ... => 여러 개의 컬럼값을 바꿀 수 있음(,써야함! AND사용 X!)
 *  WHERE 
 * 		  조건식; => 생략 가능
 */

-- 테이블 복사하기
CREATE TABLE DEPT_COPY2
	AS SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;

-- DEFT_COPY 테이블에서 총무부 부서명을 미래사업부로 변경
UPDATE 
	   DEPT_COPY2
   SET
       DEPT_TITLE = '미래사업부';

SELECT  * FROM DEPT_COPY2;
-- 전체 행의 모든 DEPT_TITLE 컬럼 값이 전부 미래사업부로 UPDATE

UPDATE 
	   DEPT_COPY2
   SET 
   	   DEPT_TITLE = '미래사업부'
 WHERE 
 	   DEPT_TITLE = '총무부';

SELECT * FROM DEPT_COPY2

SELECT * FROM EMPLOYEE;

UPDATE 
	   EMPLOYEE
   SET 
   	   SALARY = 100
 WHERE 
 	   EMP_NAME = '김하늘';

-- 전체 사원들 급여를 기존급여에서 5%인상해
UPDATE 
       EMPLOYEE
   SET 
   	   SALARY = SALARY * 1.05;
-----------------------------------------------------------
/*
 * UPDATE 사용 시 서브쿼리 사용해보기
 * 
 * UPDATE 
 * 	      테이블명
 * 	  SET 
 * 	      컬럼명 = (서브쿼리)
 *  WHERE 
 * 		  조건;
 */
-- 안예성 사원의 급여를 김하늘 사원의 급여만큼으로 갱신
UPDATE 
	   EMPLOYEE
   SET 
   	   SALARY = (SELECT 
   	   					SALARY
   	   			   FROM 
   	   			   		EMPLOYEE
   	   			  WHERE 
   	   			  		EMP_NAME = '김하늘')
WHERE    	   			  
	  EMP_ID = (SELECT 
	  				   EMP_ID
	  			  FROM 
	  			  	   EMPLOYEE
	  			 WHERE 
	  			 	   EMP_NAME = '안예성');

SELECT * FROM EMPLOYEE;
-----------------------------------------------------------
/*
 * 3. DELETE
 * 테이블에 기록된 행을 삭제하는 구문 
 * 
 * [ 표현법 ]
 * DELETE 
 * 	 FROM
 * 	      테이블명
 *  WHERE 
 * 		  조건; => 생략가능
 * WHERE 조건절을 작성하지 않으면 모든 행 삭제
 */
SELECT * FROM DEPT_COPY2;

DELETE
  FROM 
  	   DEPT_COPY2
 WHERE 
 	   DEPT_TITLE = '미래사업부';
-----------------------------------------------------------
/*
 * *TRUNCATE : 테이블의 저넻 행을 삭제하는 사용하는 구문(절삭)
 * 			   DELETE보다 빠름(이론적으로)
 * 			   별도의 조건을 부여할 수 없음 ROLLBACK불가능!
 */

DELETE FROM DEPT_COPY; 		-- 0.004s
TRUNCATE TABLE DEPT_COPY2;	-- 0.025s