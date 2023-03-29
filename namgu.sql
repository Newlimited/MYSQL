SELECT * FROM hotel.namgu;
# namgu 데이터전체에서 구분,세대수 면적만 검색
SELECT 구분, 세대수, 면적
FROM namgu;
# namgu 테이블에서 면적 구분 세대수 중복제거
SELECT distinct 면적, 구분, 세대수
FRom namgu;
# namgu 테이블에서 특정 문자열포함 한 데이터 검색
SELECT * FROM namgu WHERE 구분 = '문현1동 ';
SELECT * FROM namgu WHERE 구성비 = '3';
SELECT * FROM namgu WHERE 구분 LIKE '문현%';
# % = 0개 이상의 문자를 대체함 , - 1개의 문자를 대체함

SELECT * FROM namgu where 구분 like '문_%동 ';

# namgu 테이블에서 비교연산자로 값 추출
SELECT * FROM namgu WHERE 세대수 >= 10000;
SELECT * FROM namgu WHERE 세대수 <= 5000;

# 5천보다 크고 1만보다 낮은곳
SELECT * FROM namgu WHERE 세대수 <= 10000 AND 세대수 >= 5000;
SELECT * FROM namgu WHERE 세대수 BETWEEN 5000 AND 10000;

SELECT * FROM namgu WHERE 통 IN (21, 22, 23);
SELECT * FROM namgu WHERE 통 NOT IN (21, 22, 23);
 
# Namgu 테이블에서
# 인구수가 10000명 이상이면서 18세이상인구수 12000명 이하인 레코드를 검색
SELECT * FROM namgu WHERE 인구수 >= 10000 AND 18세이상인구수<= 12000;

# Namgu 테이블에서
# 통수가 20 이상이거나 반수가 100보다 작은 곳 
# 구분, 세대수, 인구수, 통, 반 필드검색
SELECT 구분, 세대수, 인구수, 통, 반 FROM namgu WHERE 통 >=20 OR 반 <=100;

# AND 와 OR 의 주의점
# Namgu 테이블에서
# 인구수가 10000명 (이상이면서-> 이상인 레코드중) 
# 18세이상인구수 12000명 이하이거나 반이 100 이상인 레코드를 검색 
# 명확하게 표현해야한다. (이상이면서 이하이거나) / 이상인 일 수 도있고 이상이면서/(이하이거나 이상)일 수도있다.
# 그래서 정확하게 하기 위해서 괄호를 쳐야 한다. 그렇지않으면 값이 완전 달라질 수 있다. 

SELECT * FROM namgu WHERE 인구수 >= 10000 AND (18세이상인구수 <= 12000 OR 반 >= 100);
SELECT * FROM namgu WHERE (인구수 >= 10000 AND 18세이상인구수 <= 12000 )OR 반 >= 100;

# 테이블 직접 만들어보거나 데이터 찾아보고.... 뭐 
