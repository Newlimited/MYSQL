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
    name VARCHAR(20) NOT NULL,
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
VALUES (12, 'lascls159@gmail.com','jihoon', 31, 'Busan', true);
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
    id, name FROM Custom;
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
    
# 연산자
# 비교연산

# BETWEEN a AND b
# a보다 크거나 같으면서 b 보다 작거나 같으면 true를 반환함 ) a<= x <= b     
SELECT * FROM Custom
WHERE age BETWEEN 10 AND 20;

# IN()
# 인수로 전달된 값과 동일한 값이 하나라도 존재한다면 true를 반환
SELECT * FROM custom
WHERE name IN ('John Doe', 'Michle', 'James');
# 풀어쓰면
# SELECT * FROM Custom
# WHERE name = 'John Doe'
# OR name = 'Micle'
# OR name = 'James';

# IS
# 비교대상이 Boolean 형태일 때 사용하는 비교 연산자
SELECT * FROM Custom
WHERE accept_marketing IS true;

# IS NULL
# 비교대상이 Null 이면 true를 반환
SELECT * FROM Custom
WHERE email IS NULL;

# LIKE
# 문자열의 패턴을 비교하여 동일한 패턴을 가지고 있는 문자열이면 true를 반환

# 와일드 카드
# %  : 0개 이상의 패턴
# _  : 1개의 패턴 (정확한 값을 찾을 때 사용)
SELECT * FROM Custom                        
WHERE email LIKE '%gmail%';

# Constraints (제약조건)
# RDBMS에거 삽입, 수정, 삭제에 대해서 무결성을 보장해주는 조건 

# NOT NULL
# 입력 혹은 수정 작업에 있어서 해당 필드에 Null이 올 수 없도록 하는 제약조건
# 제약조건

#create 문에서 작성 예시
CREATE TABLE NotnullTable (
    notnull_field INT NOT NULL
);

#Alter 문에서 작성     
# Alter로 NOT NULL 제약조건을 추가할 땐 원래 존재하는 레코드에서 
# 해당 필드의 데이터가 Null이 존재하면 안됨
 CREATE TABLE NotnullTable (
    notnull_field INT 
);
ALTER TABLE NotnullTable1
MODIFY COLUMN notnull_field INT NOT NULL;


#Default
# 입력 작업아세ㅓ 해당 필드의 값이 들어오지 않으면 기본값으로 지정 해주는 제약조건

#CREATE 문으로 설정
CREATE TABLE defaultTable1 (
default_table INT DEFAULT 1
);

#ALTER 문으로 설정
CREATE TABLE defaultTable2(
default_field INT
);
ALTER TABLE defaultTable2
MODIFY COLUMN default_field INT DEFAULT 1;
  
# UNIQUE
# 삽입, 수정 작업에서 해당 제약조건이 걸려있는 
#필드의 데이터에 대해 중복을 허용하지않는 제약조건

#CREATE 문으로
CREATE TABLE Unique_Table1(
unique_field INT UNIQUE
);
CREATE TABLE Unique_table2(
unique_field INT,
CONSTRAINT unique_key_1 UNIQUE (unique_field)
);

#Alter 문으로
CREATE TABLE Unique_table3(
unique_field INT
);
ALTER TABLE Unique_Table3 MODIFY unique_field INT UNIQUE;

CREATE TABLE Unique_Table4 (
    unique_filed INT
);
Alter table Unique_Table4
add constraint unique_key_1 unique (unique_field);

# PRIMARY KEY
# 기본키에 대한 제약조건, NOT NULL/ UNIQUE 가 포함되어 있음
# 삽입, 수정시에 NULL을 포함할 수 없음, 중복된 데이터를 포함할 수 없음

# CREATE
CREATE TABLE primary_table1(
	primary_field INT primary key
);

CREATE TABLE primary_table2 (
    primary_field INT,
    CONSTRAINT primary_key_1 
    PRIMARY KEY (primary_field)
);

#ALTER
CREATE TABLE primary_table3(
	primary_field INT
);
ALTER table primary_table3
MOdify column primary_field INT primary key;

CREATE TABLE primary_table4(
primary_field INT
);
ALTER Table primary_table4
add constraint primary_key_1 primary KEy (primary_field);

# FOREIGN KEY
# 참조 제약조건, 해당 테이블을 해당 필드를 기준으로
# 외부 테이블의 외부 필드를 참조하도록 하는 제약조건
# 해당 제약조건이 걸려있는 필드의 경우 참조하는 테이블의 참조 필드에 데이터가
# 존재하는 데이터만 삽입 할 수 있음

# CREATE
CREATE TABLE Referenced_Table (
    primary_key INT PRIMARY KEY
);
# 이녀석을 참조하는 테이블을 만들거임
# CREATE 시에 참조 제약조건을 추가할 때 선행적으로 참조할 테이블과 필드가 존재해야함
# 참조할 필드가 PRIMARY KEY 혹은 UNIQUE 로 제약조건이 지정 되어있어야 함
# 참조 제약조긴이 걸리는 필드는 참조할 필드의 데이터타입과 일치해야함
CREATE TABLE Foreign_Table1 (
    foreign_field INT,
    CONSTRAINT foreign_key_1 FOREIGN KEY (foreign_field)
        REFERENCES Referenced_Table (primary_key)
); 	

# ALTER
CREATE TABLE Foreign_Table2(
foreign_field2 INT
);

ALTER TABLE Foreign_Table2
ADD constraint foreign_key1
FOREIGN KEY (foreign_field2)
REFERENCES Referenced_Table (primary_key);
-------------------------------------------------------------------------
# Join을 하기 위해서 테이블을 하나 만듬
CREATE TABLE Room(
    room_number VARCHAR(4) PRIMARY KEY,
    room_type VARCHAR(20) NOT NULL,
    room_amount INT NOT NULL,
    custom_id INT,
    #(null)허용, 지금은 임시로 그냥 한거라서 관계가 맞지 않음. 하려면 따로 만들어야댐 
    CONSTRAINT Room_Foreign_key FOREIGN KEY (custom_id)
        REFERENCES Custom(id)
);
# 값 넣음
INSERT INTO Room VALUES ('1001','비지니스',200,1);
INSERT INTO Room VALUES ('1203','VIP',1000,10);
INSERT INTO Room VALUES ('1801','VIP',1000,12);

INSERT INTO Room VALUES ('1002','비지니스',200,1);
INSERT INTO Room VALUES ('1204','VIP',1000,10);
INSERT INTO Room VALUES ('1802','VIP',1000,12);

INSERT INTO Room VALUES ('1003','비지니스',200,null);
INSERT INTO Room VALUES ('1205','VIP',1000,null);
INSERT INTO Room VALUES ('1803','VIP',1000,null);

SELECT * FROM Room ;

# JOIN
# 여러개의 테이블에서 관계로 연결되어 있는 표현을 하나로 검색하도록 해주는 쿼리

#INNER JOIN 
# FROM 첫번째테이블 INNER JOIN 두번째테이블 ON 조건
# FROM 첫번째테이블 JOIN 두번째테이블 ON 조건
# FROM 첫번째테이블, 두번째테이블 WHERE 조건
SELECT R.room_number AS '방번호', C.name AS '고객이름'
FROM Room R INNER JOIN Custom C 
ON C.id = R.custom_id;

SELECT * FROM  Room JOIN  Custom;

SELECT *
FROM Room, Custom
WHERE Room.custom_id = Custom.id;

# LEFT JOIN
# FROM 첫번째테이블 LEFT JOIN 두번째테이블 ON 조건

SELECT * 
FROM Room LEFT JOIN Custom
ON Room.custom_id = Custom.id;

INSERT INTO Custom
VALUES (20, 'David', 'David@gmail.com' , 30, 'New york', 1);
# RIGHT JOIN
# FROM 첫번째테이블 RIGHT JOIN 두번째테이블 ON 조건

SELECT *
FROM Room RIGHT JOIN Custom
ON Room.custom_id = Custom.id;

# Sub Query
# 복잡한 JOIN 문을 조금더 간결하게 사용할 수 있도록 해주는 쿼리문
# SELECT , INSERT, UPDATE, DELETE, SET, DO 에서 사용가능
# FROM ,WHERE 절에서 쓸 수있다. 

# WHERE절 사용
SELECT * 
FROM Room
WHERE custom_id IN ( # 조건 판단을 잘해줘야함. 
SELECT id
FROM Custom
WHERE name = 'Michle' # 중복되는값이 있는지.....
);

# IN 연산 <특정한 계열의 값을 있을 때 하나라도 해당값이 존재한다면 반환시키는 연산>
# IN 연산 + LIKE 쓸때 서브쿼리를 써주면 편하다
select * 
FROM Custom 
WHERE id in (
SELECT id
FROM Custom
WHERE name LIKE 'M%' 
OR name LIKE 'D%'
);

# FROM 절에서 사용
SELECT CustomID 
FROM(
SELECT id AS CustomId, email AS CustomEmail 
FROM Custom
) C; # 무조건 별칭을 지정해줘야함 FROM절에서쓸때 . 그리고 반환되는거를 SELECT에 넣어줘야함

SELECT id AS CustomId, email AS CustomEmail 
FROM Custom ;

# ORDER BY(정렬)
# 특정필드를 기준으로 오름차순 내림차순 정렬하여 결과를 반환
# DESC 내림차순
SELECT *
FROM namgu;

SELECT *
FROM namgu
ORDER BY 세대수 DESC;

# 오름차순 ASC
SELECT * FROM Namgu
ORDER BY 통 DESC, 반 ASC;