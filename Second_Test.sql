CREATE DATABASE Humaonly_readnREsource;

USE HumanREsource;
CREATE TABLE Department(
department_code VARCHAR(10) PRIMARY KEY,
department_name VARCHAR(10) NOT NUll,
department_tel_number VARCHAR(20) NOT NULL UNIQUE,
department_address VARCHAR(50) NOT NULL,
head_employee_number INT
);
INSERT INTO Department(department_code , department_name, department_tel_number, department_address,
head_employee_number) VALUES ('DEV', '개발부', '051-240-1155', '부산광역시 부산진구', 2023010101);

CREATE TABLE Posit(
position_code VARCHAR(3) PRIMARY KEY,
position_name VARCHAR(10) NOT NULL
);
INSERT INTO Posit(position_code, position_name) VALUES ('PO1', '사원');

CREATE TABLE Employee(
employee_number INT PRIMARY KEY,
employee_name VARCHAR(10) NOT NULL,
employee_birth_date DATE NOT NULL,
employee_tel_number VARCHAR(20) NOT NULL UNIQUE,
employee_address VARCHAR(50) NOT NULL,
department_code VARCHAR(10) ,
FOREIGN KEY (department_code) REFERENCES Department (department_code) , 
position_code VARCHAR(3) ,
FOREIGN KEY (position_code) REFERENCES Posit (position_code)
);
INSERT INTO Employee(employee_number, employee_name, employee_birth_date, employee_tel_number, employee_address, department_code, position_code)
 VALUES (2023010101, 'John Doe' , '1980-11-12', '010-9184-6574', '부산광역시 부산진구', 'DEV', 'PO1');
CREATE TABLE Annual_Income(
department_code VARCHAR(10),
position_code VARCHAR(3),
annual_income_amount INT NOT NULL
);
ALTER TABLE Annual_Income
ADD CONSTRAINT Annual_Income_foreign_key1
FOREIGN KEY (department_code)
REFERENCES Department (department_code);

ALTER TABLE Annual_Income 
ADD CONSTRAINT Annual_Income_foreign_key2
 FOREIGN KEY (position_code)
 REFERENCES Posit (position_code);
 
 ALTER TABLE Annual_Income
 ADD CONSTRAINT Annual_Income_fK
 FOREIGN KEY (department_code, position_code)
 REFERENCES annual_income_amount;
 
/* CREATE TABLE Annual_Income (
    department_code VARCHAR(3),
    position_code VARCHAR(3),
    annual_income_amount INT NOT NULL,
    CONSTRAINT Annual_Income_PK
    PRIMARY KEY (department_code, position_code),
    CONSTRAINT Annual_Income_Department_FK
    FOREIGN KEY (department_code)
    REFERENCES Department(department_code),
    CONSTRAINT Annual_Income_Posit_FK
    FOREIGN KEY (position_code)
    REFERENCES Posit(position_code)
);*/
 
 INSERT INTO Annual_Income(annual_income_amount) VALUES (38000000);
 
SELECT D.department_code AS '부서코드' , D.department_name AS '부서명', E.employee_name AS '부서장 이름', E.employee_tel_number AS '부서장 전화번호'
FROM Department D RIGHT JOIN Employee E
ON E.employee_number = D.heard_employee_number 
WHERE D.department_code = 'DEV';

INSERT INTO Employee(employee_number, employee_name, employee_birth_date, employee_tel_number, employee_address, department_code, position_code)
VALUES (2023010102, 'raynor seo', '1993-06-02', '010-4736-1346', '부산광역시 서구', 'DEV', 'PO1');
COMMIT;
 
CREATE INDEX positioncode_departmentcode 
ON Employee (position_code,department_code);


CREATE VIEW Only_read AS 
SELECT D.department_code AS '부서코드' , D.department_name AS '부서명', E.employee_name AS '부서장 이름', E.employee_tel_number AS '부서장 전화번호'
FROM Department D RIGHT JOIN Employee E
ON D.head_employee_number = E.employee_number 
WHERE D.department_code = 'DEV';

