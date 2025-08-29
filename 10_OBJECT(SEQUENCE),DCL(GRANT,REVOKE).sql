/*
 * < 시퀀스 SEQUENCE >
 * 자동으로 번호를 발생시켜주는 역할을 하는 객체
 * 정수값을 자동으로 순차증가시켜 생성해줌
 * 
 * -- 회원번호, 사원번호, 게시글번호, 예약번호, 주문번호 등등 채번 할 때 주로 사용함
 * 
 * 1. 시퀀스 객체 생성 구문
 * 
 * [ 표현법 ]
 * CREATE SEQUENCE 시퀀스명
 *  START WITH 시작숫자 -> 시작값을 지정하는 옵션
 *  INCREMENT BY 증가값 -> 값을 증가시킬 때 몇 씩 증가할건지 지정하는 옵션
 *  MAXVALUE 최대값 -> 최대값 지정 옵션
 *  MINVALUE 최소값 -> 최소값 지정 옵션
 *  CYCLE / NOCYCLE -> 순환 여부 지정
 *  --------------- 위옵션 생략가능
 * CACHE 바이트크기 / NOCACHE -> 캐시메모리 사용 여부
 * 						   -> CACHE_SIZE 기본값은 20 BYTE
 * * CACHE : 미리 발생할 값을 생성해서 저장을 할지 여부 지정
 * 			 값이 필요할 때마다 매 번 새롭게 값을 생성해내는것 보다는
 * 			 캐시공간에 미리 생성된 값들을 가져다 쓰는것이 훨씩 속도적인 측면에서 이득.
 * 			 단, 접속이 끊기고나서 재접속 후 기존 생성된 값들이 다 날아가고 없음
 */
/*
 * * 접두사
 * - 테이블명 : TB_
 * - 뷰 : VW_
 * - 시퀀스 : SEQ_
 * - 트리거 : TRG_
 */
SELECT * FROM EMPLOYEE;

CREATE SEQUENCE SEQ_EMPNO 
 START WITH 224
 NOCACHE;

/*
 * 2. 시퀀스를 사용하는 방법
 * 시퀀스명.CURRVAL : 현재 시퀀스의 값(마지막으로 성공적으로 만들어진 NEXTVAL 값)
 * 시퀀스명.NEXTVAL : 시퀀스값을 증가시킨 뒤 증가된 시퀀스의 값
 * 				   기존 시퀀스 값에서 INCREMENT BY값만큼 증가한 값
 * 				   (시퀀스명.CURRVAL + INCREMENT BY값(기본값 1))
 * 
 * 시퀀스 생성 시 첫 NEXTVAL은 START WITH로 지정한 시작값으로 발생
 */

SELECT SEQ_EMPNO.CURRVAL FROM DUAL;
-- NEXTVAL를 한 번이라도 수행하지 않으면 CRURRVAL을 사용할 수 없음
-- CURRVAL은 마지막에 성공적으로 만들어진 NEXTVAL를 보여주는 임시 값

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;
SELECT * FROM USER_SEQUENCES;
-- LAST_NUMBER : 지금 NEXTVAL하면 나오는 값

-- 수정 : ALTER --> START WITH는 변경 불가능, DROP하고 다시 CREATE 해야함
-- 삭제 : DROP

CREATE SEQUENCE SEQ_EID
 START WITH 224;

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
	   SEQ_EID.NEXTVAL
	 , '강호동'
	 , '222222-111111'
	 , 'J3'
	 , 'S2'
	   );

SELECT * FROM EMPLOYEE;

----------------------------------------------------------------------------------------------------------------------
/*
 * < DCL : DATA CONTROL LANGUAGE >
 * 		   데이터 제어		언어
 * 
 * 계정에게 시스템 권한 또는 객체 접근 권한을 부여(GRANT)하거나 회수(REVOKE)G하는 언어
 * 
 * * 권한 부여(GRANT)
 * - 시스템 권한	: DB에 접근하는 권한, 객체를 생성할 수 있는 권한
 * - 객체 접근 권한	: 특정 객체들에 접근해서 조작할 수 권한
 * 
 * -- 객체 접근권한 부여하는 법
 * [ 표현법 ]
 * GRANT 권한종류(SELECT, INSERT, UPDATE, DELETE) ON 객체명(테이블명) TO 계정명;
 * 
 * * 시스템권한은 종류
 * - CREATE SESSION : 계정에 접속할 수 있는 권한
 * - CREATE TABLE : 테이블을 생성할 수 있는 권한
 * - CREATE VIEW : 뷰를 생성할 수 있는 권한
 * - CREATE SEQUENCE : 시퀀스를 생성할 수 있는 권한
 * 
 * GRANT 권한1, 권한2, ... TO 계정명;
 * 
 * < ROLE >
 * 특정 권한들을 하나의 집합으로 모아놓은 것
 * 
 * CONNECT, RESOURCE
 * 
 * < 권한 회수 REVOKE >
 * [ 표현법 ]
 * REVOKE 권한1, 권한2... FROM 사용자명;
 */
SELECT 
	  *
  FROM 
  	   ROLE_SYS_PRIVS;
 WHERE 
 	   ROLE IN()








