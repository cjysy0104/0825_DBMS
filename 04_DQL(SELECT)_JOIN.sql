SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;

-- 전체사원들의 사번, 사원명, 부서코드, 부서명을 한꺼번에 조회하고 싶다.
SELECT 
	   EMP_ID
	 , EMP_NAME
	 , DEPT_CODE
  FROM 
  	   EMPLOYEE;
SELECT 
	   DEPT_ID
	 , DEPT_TITLE
  FROM 
  	   DEPARTMENT;

-- 전체사원들의 사번, 사원명, 직급코드, 직급명을 한 번에 조회
SELECT 
	   EMP_ID
	 , EMP_NAME
	 , DEPT_CODE
  FROM 
  	   EMPLOYEE;
SELECT 
	   JOB_CODE
	 , JOB_NAME 
  FROM 
  	   JOB;

-------------------------------------------

--> JOIN을 통해 연결고리에 해당하는 컬럼만 매칭시킨다면 마치 하나의 조회 결과물처럼 조회 가능

-- KH
-- 어떤 강의장에 어떤 강사가 수업을 하고 있는가?

CREATE TABLE CLASS_ROOM(
	CLASS_ID CHAR(1),
	LECTURE_NAME VARCHAR2(20)

);
SELECT * FROM CLASS_ROOM;

INSERT INTO CLASS_ROOM VALUES('A', '이승철');
INSERT INTO CLASS_ROOM VALUES('B', '홍길동');
INSERT INTO CLASS_ROOM VALUES('C', '고길동');

CREATE TABLE STUDENT(
	CLASS_ID CHAR(1),
	STUDENT_NAME VARCHAR2(20)
);
SELECT * FROM STUDENT;

INSERT INTO STUDENT VALUES('A', '이승욱');
INSERT INTO STUDENT VALUES('A', '채정민');
INSERT INTO STUDENT VALUES('B', '김윤기');
INSERT INTO STUDENT VALUES('C', '김태호');
COMMIT;











