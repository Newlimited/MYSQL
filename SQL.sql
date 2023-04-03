USE syh_board;
# 회원가입
INSERT INTO USER 
(email, password, nickname, tel_number, 
address, address_detail, consent_personal_information)
VALUES 
('sbh2043@naver.com', sha2('P!ssw0rd', 512), '신비', 
'010-1111-2222', '부산광역시', '부산진구', true);

# 로그인
# 패스워드 암호화가 되어있지 않을 때
SELECT * FROM USER
WHERE email = 'sbh2043@naver.com'
AND password = 'P!ssw0rd';
# 패스워드 암호화가 되어 있을 때
SELECT * FROM USER
WHERE email = 'sbh2043@naver.com';

# 게시물 작성
INSERT INTO Board (title, content, board_image_url, write_datetime, writer_email)
VALUES ('Test Title', 'Test Content', null, now(), 'sbh2043@naver.com');

# 게시물 보기
# 게시물 (게시물제목, 작성자 이메일, 작성자 프로필 사진, 작성자 닉네임,
# 작성일, 내용, 게시물 사진, 좋아요 수, 댓글 수)
# 좋아요 리스트 (유저 프로필 사진, 유저 닉네임)
# 댓글 리스트 (유저 프로필 사진, 유저 닉네임, 작성 시간, 댓글 내용)
SELECT *
FROM Board B, User U, (
	SELECT B.board_number AS board_number, count(L.user_email) AS like_count
	FROM Board B
	LEFT JOIN Liky L
	ON B.board_number = L.board_number
	GROUP BY board_number
) LC,
(
	SELECT B.board_number AS board_number, count(C.user_email) AS comment_count
	FROM Board B
	LEFT JOIN Comment C
	ON B.board_number = C.board_number
	GROUP BY board_number
) CC
WHERE B.writer_email = U.email
AND B.board_number = LC.board_number
AND B.board_number = CC.board_number;

SELECT *
FROM Liky L, User U
WHERE L.user_email = U.email
AND L.board_number = 1;

SELECT *
FROM Comment C, User U
WHERE C.user_email = U.email
AND C.board_number = 1;

CREATE VIEW Board_View AS
SELECT 
	B.board_number AS board_number,
	B.title AS title,
    B.content AS content,
    B.write_datetime AS write_datetime,
    B.board_image_url AS board_image_url,
    U.email AS writer_email,
    U.nickname AS wirter_nickname,
    U.profile_url AS writer_profile_url,
    LC.like_count AS like_count,
    CC.comment_count AS comment_count
FROM Board B, User U, (
	SELECT B.board_number AS board_number, count(L.user_email) AS like_count
	FROM Board B
	LEFT JOIN Liky L
	ON B.board_number = L.board_number
	GROUP BY board_number
) LC,
(
	SELECT B.board_number AS board_number, count(C.user_email) AS comment_count
	FROM Board B
	LEFT JOIN Comment C
	ON B.board_number = C.board_number
	GROUP BY board_number
) CC
WHERE B.writer_email = U.email
AND B.board_number = LC.board_number
AND B.board_number = CC.board_number;

SELECT * FROM Board_View
WHERE board_number = 1;

# 최신 게시물 리스트
SELECT * FROM Board_View
ORDER BY write_datetime DESC;

# 주간 TOP 3 리스트
SELECT * FROM Board_View
WHERE write_datetime >= '2023-03-27'
ORDER BY like_count DESC
LIMIT 3;

# 검색어 리스트
SELECT * FROM Board_View
WHERE title LIKE '%Title%'
OR content LIKE '%Title%';

# 내 게시물 리스트
SELECT * FROM Board_View
WHERE writer_email = 'sbh2043@naver.com';

# 좋아요
INSERT INTO Liky (user_email, board_number)
VALUES ('sbh2043@naver.com', 1);

# 좋아요 취소
DELETE FROM Liky
WHERE user_email = 'sbh2043@naver.com'
AND board_number = 1;

# 댓글 작성
INSERT INTO Comment (user_email, board_number, comment_content, write_datetime)
VALUES ('sbh2043@naver.com', 1, 'Test Comment', now());

# 게시물 수정
UPDATE 
	Board 
SET 
	title = 'Modified Title', 
    content = 'Modified Content', 
    board_image_url = 'http://~~'
WHERE
	board_number = 1;

# 게시물 삭제
DELETE FROM Comment
WHERE board_number = 1;

DELETE FROM Liky
WHERE board_number = 1;

DELETE FROM Board
WHERE board_number = 1;
#CASECAD 걸면 board_number = 1 이거만 해도 관계된거 다 날라감

# 검색 로그 
INSERT INTO Search_Log (search_word) VALUES ('Title');
INSERT INTO Search_Log (search_word, related_search_word) 
VALUE ('modify', 'Title');

# 인기 검색어
SELECT search_word, count(search_word) AS count
FROM Search_Log
GROUP BY search_word
ORDER BY count DESC
LIMIT 10;

# 연관 검색어
SELECT related_search_word, count(related_search_word) AS count
FROM Search_Log
WHERE search_word = 'modify'
GROUP BY related_search_word
ORDER BY count DESC
LIMIT 10;




