#주석사용 #은 안띄어도 됨. 
-- 이거도 주석! --은 무조건 앞에 한칸 띄어야 함.
/*부분 주석*/
/*
공간주석
구문 뒤에는 ;(세미클론) 붙여야 함
대소문자 구분 x
but 테이블 명과 필드의 이름은 대소문자 구분함
*/
/* DDL(데이터 정의어)
 데이터 베이스 혹은 테이블(뷰, 인덱스, 프로시저...)을 생성, 수정, 삭제 할 때
 사용하는 SQL문

/* CREATE 문
데이터 베이스, 테이블 등을 생성할 때 사용하는 SQL 문
데이터 베이스 생성
CREATE DATABASE 데이터베이스명; */
CREATE DATABASE Hotel;
SHOW DATABASES;
/* 테이터 베이스를 생성했으면 사용할 데이터베이스를 선택
USE 데이터베이스명;*/
USE Hotel;

/*테이블 생성
CREATE TABLE 테이블명(
필드명 데이터타입(데이터 길이) 제약조건,
...
);  테이블을 한번 만들고 나면 수정은 가능하지만 수정자체를 하지 않는것이 좋다 .
수정을 하게 되면 하위부분이든 다른부분까지 영향이 가기 때문에 복잡해지거나 정상작동이 안 될 수도 있다. */
CREATE TABLE Custom (
    id INT PRIMARY KEY,
    name VARCHARACTER(20) NOT NULL,
    email VARCHAR(30) UNIQUE,
    age INT,
    address TEXT,
    accept_marketing BOOLEAN DEFAULT FALSE
);
# default '부산광역시',문자열 표시엔 '' ,default는 값을 미리지정
SHOW TABLES;
/* 데이터베이스 수정
ALTER DATABASE 데이터베이스명 속성명 = 값;

*테이블 필드 추가
ALTER TABLE 테이블명 ADD 필드명 데이터타입(데이터길이) 제약조건;
*테이블 필드 삭제
ALTER TABLE 테이블명 DROP 필드명;
*테이블 필드 수정
ALTER TABLE 테이블명 MODIFY COLUMN 필드명 데이터타입(데이터길이) 제약조건;

*데이터 베이스 삭제
DROP DATABASE 데이터베이스명;
TURNCATE문은 - 초기화  = > 인덱스가 다시 1번부터 ... 
DELETE 문은 해당 데이터만 날림. => 인덱스가 20번에서 delete하면 21번부터..

*테이블 삭제
DROP TABLE 테이블명; : 테이블의 정의 자체를 제거
테이블이 존재하지 않으면 에러가 발생함 
따라서 DROP TABLE/DATABASE IF EXIST hotel; 이렇게 if를 넣는다.

*TRUNCATE TABLE 테이블명; : 테이블을 정의만 남기고 모두 제거(생성 초기상태로 돌림)

BLOB 과 TEXT는 비슷하지만 TEXT는 문자열의 대소문자를 구분한다.
bin 파일은 2진으로 , 실행하는 파일

*DML (데이터 조작어)
데이터베이스 테이블에 레코드를 삽입, 수정, 삭제, 검색 작업을 수행시키고자 할 때
사용하는 SQL문

-- 삽입문(insert into)
해당 테이블에 레코드를 삽입 할 때 사용하는 SQK 구문
INSERT INTO 테이블명(필드1, 필드2 ,...) 
VALUES(필드1의 데이터, 필드2의 데이터,...);
*/
INSERT INTO Custom(id, name) VALUES(1, 'John Doe');
INSERT INTO Custom(id, email) VALUES(5, 'qweq@qwe'); # 필수값 미입력
INSERT INTO Custom(id, name, email) VALUES(1, 'John Doe', 'asdf@asdf'); # 기본키 중복
SELECT * FROM Custom; # 검색하는 작업 . 커스템 테이블에서 모든 필드를 보겟다.

/*
-모든 필드에 값을 넣을 때
INSERT INTO 테이블명
VALUES(데이터1, 데이터2, ...);
*/

INSERT INTO Custom 
VALUES(10, 'Michle', 'asdf@asdf.com', 30, 'This is address', true);

INSERT INTO Custom
VALUES (11, 'lascls159@gmail.com','jihoon', 31, 'Busan', true);
# 타입이 달라서 안들어감 만약 타입이 같으면 들어가버림
# 그래서 필드명 없이 데이터값을 넣을 땐 위치 잘 지정 해야됨. 

INSERT INTO Custom 
VALUES(12, 'Michle', 'asdf@asdf.com',30,'This is address'); # true 뺀 경우 , 컬럼의 갯수가 맞지 않다.

/* 수정문 (UPDATE)
해당 테이블에서 특정 필드의 값을 수정하고자 할 때 
사용하는 SQL 문

UPDATE 테이블명 SET 필드명1=데이터1, 필드명2 = 데이터2, ... ; */
 
 UPDATE Custom 
SET 
    accept_marketing = FALSE; # 수정과 업데이트를 할 땐 primary key를 지정해줘야 한다. 
    
UPDATE Custom 
SET 
    accept_marketing = true,
    age = 10;
    
/* UPDATE 테이블명 SET 필드명1=데이터1, ...
WHERE 필드명 = 데이터;*/
UPDATE Custom 
SET 
    email = 'email.@email.com'
WHERE
    id = 1; 
 
 /* 삭제문 (DELETE)
 해당 테이블에서 레코드를 삭제할 때 사용하는 SQL문 
 
 DELETE FROM 테이블명; -> 전부 삭제
*/
DELETE FROM Custom; 
 #DELETE FROM 테이블명 WHERE 조건;

DELETE FROM custom 
WHERE
    name = 'john doe';
 
 /* 검색문 (SELECT)
 해당 테이블에서 특정 필드를 검색하고자 할 때 사용하는 SQL문
 
 SELECT 필드명1, 필드명2, ... FROM 테이블명;*/
SELECT 
    id, name;
    # SELECT * FROM 테이블명;
    SELECT * FROM Custom;
    
    # 필드에 별칭 사용
    SELECT 
    name AS 'Full Name'
FROM
    Custom;
    
    # 테이블에 별칭 사용
    SELECT C.name
    From Custom AS C;
    
    # 중복값 제거 (DISTINCT)
    SELECT DISTINCT
    name
FROM
    Custom;
        
    