/*
	★★★★★★
	< TCL : TRANSACTION CONTROL LANGUAGE > 
			트랜잭션		제어		언어

	* TRANSACTION 
	- 작업단위
	- 데이터베이스의 상태를 변화시키는 논리적 연산단위
	- 여러개의 DML구문을 하나로 묶어 처리하는 매커니즘
	- 데이터의 변경사항(DML)들을 하나의 트랜잭션으로 묶어서 관리
	  COMMIT(확정)하기 전까지의 변동사항들을 하나의 트랜잭션에 담게됨
	- 트랜잭션의 대상이 되는 SQL : INSERT, UPDATE, DELETE
	
	
	COMMIT(트랜잭션을 종료 처리 후 확정), ROLLBACK(트랜잭션 취소), SAVEPOINT
	
	* TRANSACTION의 4가지 속성
	* 
	* ACID
	* 
	* 1. Atomicity(원자성) : 트랜잭션 내의 모든 작업은 전부 수행되거나,
	* 					   전혀 수행되지 않아야한다. 라는 원칙
	* 2. Consistency(일관성) : 트랜잭션이 성공적으로 완료 된 후에도 
	* 						데이터베이스는 유효한 상태를 유지해야한다는 원칙
	* 3. Isolation (고립성) : 동시에 실행되는 여러 트랜잭션이 원칙동시에 성공적으로 수행
	* 
	* 4. Durablity(지속성) : 트랜잭션이 성공적으로 수행되었다면,
	* 					   시스템으에 문제가 발생하더라도 영구적으로 반영이 되어야한다.
*/
SELECT * FROM EMP_COPY

CREATE TABLE EMP_COPY
	AS SELECT EMP_ID, EMP_NAME FROM EMPLOYEE;

-- 사번이 900번인 사원 삭제
DELETE
  FROM 
  	   EMP_COPY
 WHERE 
 	   EMP_ID = 900;

-- 사번이 222번인 사원 삭제
DELETE
  FROM 
  	   EMP_COPY
 WHERE 
 	   EMP_ID = 222;

-- 무 조건 삭제
DELETE FROM EMP_COPY;

ROLLBACK;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
SELECT * FROM EMP_COPY; -- 트랜잭션 아직 안생김--
-------------------------------------------
DELETE FROM EMP_COPY WHERE EMP_ID = 900; -- 트랜잭션 생성

UPDATE EMP_COPY SET EMP_NAME = '고길동' WHERE EMP_NAME = '홍길동';

COMMIT;
ROLLBACK;

----------------------------------------------------------------------------------------------------------------------
-- 사번이 214, 216번인 사원 삭제
SELECT * FROM EMP_COPY;
-------------------------------------------
DELETE 
  FROM 
	   EMP_COPY 
 WHERE EMP_ID IN (214, 216);

-- 2개 행이 삭제된 시점에 SAVEPOINT 지정
SAVEPOINT DELETE2ROWS;

DELETE
  FROM 
  	   EMP_COPY
 WHERE 
 	   EMP_ID = 222;

ROLLBACK TO DELETE2ROWS;

----------------------------------------------------------------------------------------------------------------------
COMMIT;

/*
 * DDL 구문(CRETE, ALTER, DROP)을 수행하는 순간
 * 트랜잭션에 있는 모든 작업사항들을 무조건 COMMIT해서 실제 DB에 반영 한 후 DDL을 수행
 * --> DDL을 써야하는데 이전 트랜잭션이 존재한다 ==> COMMIT / ROLLBACK 수행 후 처리
 */










