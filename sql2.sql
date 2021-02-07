# 전체 데이터베이스 조회
SHOW DATABASES;

# `mysql` 데이터 베이스 선택
USE mysql;

# 테이블 조회
SHOW TABLES;

# `db` 테이블의 구조 확인
DESC db;

# 기존에 `board` 데이터베이스가 존재 한다면 삭제
DROP DATABASE IF EXISTS board;

# 새 데이터베이스(`board`) 생성
CREATE DATABASE board;

# 데이터베이스 추가 되었는지 확인
SHOW DATABASES;

# `board` 데이터 베이스 선택
USE board;

# 테이블 조회
SHOW TABLES;

# 게시물 테이블(`article`) 생성.(칼럼은 제목, 내용만 작성)
CREATE TABLE article(
title CHAR(100),
`body` TEXT
);

# 잘 추가되었는지 확인
SHOW TABLES;

# 제목 : 제목1, 내용 : 내용1 데이터 하나 추가 
INSERT INTO article
SET title = '제목1',
`body` = '내용1';

# 제목 조회
SELECT title
FROM article;

# 내용 조회
SELECT `body`
FROM article;

# 제목, 내용 칼럼 데이터 조회
SELECT title, `body`
FROM article;

# 내용, 제목 칼럼 데이터 조회
SELECT `body`, title
FROM article;

# 모든 데이터 조회
SELECT *
FROM article;

# 제목 : 제목1, 내용 : 내용1 데이터 또 하나 추가
INSERT INTO article
SET title = '제목1',
`body` = '내용1';

# 데이터 조회(게시물 구분 안됨)
SELECT *
FROM article;

# 테이블 구조 수정
# 게시물을 구분하기 위해 id 칼럼을 추가.
ALTER TABLE article ADD COLUMN id INT(5);

# 데이터 조회(새로 생긴 id 칼럼의 값은 NULL)
SELECT *
FROM article;

# 기존 데이터의 id값 1로 수정
UPDATE article
SET id = 1;

# 데이터 조회(둘다 수정되어 버림..)
SELECT *
FROM article;

# 기존 데이터 중 1개만 id를 2로 변경
UPDATE article
SET id = 2
LIMIT 1;

# 데이터 조회
SELECT *
FROM article;

# id 없이 데이터 1개 추가
INSERT INTO article
SET title = '제목1',
`body` = '내용1';

# 데이터 조회
SELECT *
FROM article;

# id가 NULL인 데이터 생성이 가능하네?
# id 데이터는 꼭 필수 이기 때문에 NULL을 허용하지 않게 바꾼다.
# 기존의 NULL값 때문에 경고가 뜬다.
# 기존의 NULL값이 0으로 바뀐다.
ALTER TABLE article MODIFY id INT(5) NOT NULL;

# id값 없이 제목3, 내용3 게시물 추가
INSERT INTO article
SET title = '제목3',
`body` = '내용3';

# id값 없이 제목3, 내용3 게시물 한번 더 추가
INSERT INTO article
SET title = '제목3',
`body` = '내용3';

# 데이터 조회
SELECT *
FROM article;

# id가 0인 게시물이 두개 이상 만들어진다. 이러면 id로 구별이 안된다.
# 생각해 보니 모든 행(row)의 id 값은 유니크 해야한다. 
# alter를 이용해 id 칼럼의 옵션에 null 허용하지 않음과 유니크 옵션 붙이기. (not null + unique = primary key)
ALTER TABLE article MODIFY id INT(5) NOT NULL UNIQUE;

# 위 실행은 오류가 난다. 왜냐하면 기존의 데이터 중에서 중복되는 값이 있다.
# 이러한 문제로 테이블을 생성할 때 primary key를 설정하고 생성하는 것이 좋다.

# 기존에 t1 데이터베이스가 존재 한다면 삭제
DROP DATABASE IF EXISTS t1;

# 새 데이터베이스('t1') 생성
CREATE DATABASE t1;

# t1 데이터베이스 선택
USE t1;

# article 테이블 만들기 (id, title, body) - id는 primary key 등록, auto_increment 옵션 추가
CREATE TABLE article(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
title CHAR(100),
`body` TEXT
);

# title = '제목2', body = '내용2' 데이터 하나 추가
INSERT INTO article
SET title = '제목2',
`body` = '내용2';

# title = '제목3', body = '내용3' 데이터 하나 추가
INSERT INTO article
SET title = '제목3',
`body` = '내용3';

# title = '제목1', body = '내용1' 데이터 하나 추가
INSERT INTO article
SET title = '제목1',
`body` = '내용1';

# 모든 데이터 조회
SELECT *
FROM article;

# 모든 데이터 id로 오름차순 정렬 조회
SELECT *
FROM article
ORDER BY id ASC;

# 모든 데이터 id로 내림차순 정렬 조회
SELECT *
FROM article
ORDER BY id DESC;

# title = '제목1', body = '내용1' 데이터 하나 추가
INSERT INTO article
SET title = '제목1',
`body` = '내용1';

# title = '제목2', body = '내용2' 데이터 하나 추가
INSERT INTO article
SET title = '제목2',
`body` = '내용2';

# 모든 게시물의 제목을 aaa로, 내용을 bbb로 변경
UPDATE article
SET title = 'aaa', `body` = 'bbb';

# 1번 게시물만 조회
SELECT *
FROM article
WHERE id = 1;

# 1번 게시물의 제목을 제목1으로 변경
UPDATE article 
SET title = '제목1'
WHERE id = 1;

# 2번 게시물만 조회
SELECT *
FROM article
WHERE id = 2;

# 2번 게시물의 내용을 내용2으로 변경
UPDATE article
SET `body` = '내용2'
WHERE id = 2;

# 3번 게시물만 조회
SELECT *
FROM article
WHERE id = 3;

# 3번 게시물의 제목을 제목3, 내용을 내용3으로 변경
UPDATE article
SET title = '제목3',
`body` = '내용3'
WHERE id = 3;

# 모든 게시물 데이터 삭제
DELETE FROM article;

# 모든 데이터 조회
SELECT *
FROM article;

# id = 1, title = '제목1', body = '내용1' 데이터 하나 추가
INSERT INTO article
SET id = 1,
title = '제목1',
`body` = '내용1';

# id = 2, title = '제목2', body = '내용2' 데이터 하나 추가
INSERT INTO article
SET id = 2,
title = '제목2',
`body` = '내용2';

# id = 3, title = '제목3', body = '내용3' 데이터 하나 추가
INSERT INTO article
SET id = 3,
title = '제목3',
`body` = '내용3';

# id가 1인 게시물 삭제
DELETE
FROM article
WHERE id = 1;

# 모든 데이터 조회
SELECT *
FROM article;

# 제목이 제목2인 게시물 삭제
DELETE
FROM article 
WHERE title = '제목2';

# 모든 데이터 조회
SELECT *
FROM article;

# 내용이 내용3인 게시물 삭제
DELETE
FROM article
WHERE `body` = '내용3';

# 모든 데이터 조회
SELECT *
FROM article;

# 나머지 모든 컬럼에 not null 제약 걸기
ALTER TABLE article 
MODIFY title CHAR(100) 
NOT NULL;

ALTER TABLE article
MODIFY `body` 
TEXT NOT NULL;

# id에 unsigned 제약 걸기
ALTER TABLE article 
MODIFY id INT(5) UNSIGNED NOT NULL AUTO_INCREMENT;

# 작성자(writer) 칼럼을 title 칼럼 다음에 추가.
SELECT * FROM article;
ALTER TABLE article ADD writer CHAR(50) NOT NULL;
DESC article;

# 모든 데이터 조회
SELECT *
FROM article;

# 작성자(writer) 칼럼의 이름을 nickname 으로 변경.
ALTER TABLE article CHANGE writer nickname CHAR(50);

# nickname 칼럼의 위치를 body 밑으로 보내주세요.
ALTER TABLE article 
MODIFY nickname CHAR(50) NOT NULL
AFTER `body`;

# article 구조 확인
DESC article;

# hit 조회수 칼럼 추가.
ALTER TABLE article 
ADD hit INT(5) NOT NULL;

# 테스트 데이터 추가
# 데이터 추가
INSERT INTO article
SET title = '제목1',
`body` = '내용1',
nickname = '유저1',
hit = 20;

# 데이터 추가
INSERT INTO article
SET title = '제목2',
`body` = '내용2',
nickname = '유저2',
hit = 30;

# 데이터 추가
INSERT INTO article
SET title = '제목3',
`body` = '내용3',
nickname = '유저3',
hit = 10;

# 데이터 추가
INSERT INTO article
SET title = '제목4',
`body` = '내용4',
nickname = '유저4',
hit = 55;

# 데이터 추가
INSERT INTO article
SET title = '제목5',
`body` = '내용5',
nickname = '유저5',
hit = 10;

# 데이터 추가
INSERT INTO article
SET title = '제목6',
`body` = '내용6',
nickname = '유저6',
hit = 100;

# 조회수 가장 많은 게시물 3개 만 보여주세요., 힌트 : ORDER 
SELECT *
FROM article
ORDER BY hit DESC
LIMIT 3;

# 작성자명이 '1'을 포함하는 게시물만 보여주세요., 힌트 : LIKE
SELECT *
FROM article
WHERE nickname 
LIKE '%1%';

# 조회수가 10 이상 55 이하 인것만 보여주세요., 힌트 : AND
SELECT *
FROM article
WHERE hit >= 10 AND hit <= 55;

# 작성자가 '유저1'이 아니고 조회수가 50 이하인 것만 보여주세요., 힌트 : !=
SELECT *
FROM article
WHERE nickname != '유저1' AND hit <= 50;

# 작성자가 '유저1' 이거나 조회수가 55 이상인 게시물을 보여주세요. 힌트 : OR
SELECT *
FROM article
WHERE nickname = '유저1' OR hit >= 55;

CREATE TABLE t_article(
	id INT(5) PRIMARY KEY AUTO_INCREMENT,
	title CHAR(200) NOT NULL,
	`body` TEXT NOT NULL,
	regDate DATETIME NOT NULL
);

DESC t_article;

SELECT *
FROM t_article;

SELECT NOW();

# 추가
INSERT INTO t_article
SET title = 'aaa',
`body` = 'bbb',
regDate = NOW();

# 조회
SELECT *
FROM t_article;

# 수정
UPDATE t_article
SET title = 'ccc',
`body` = 'ddd'
WHERE id = 1;

# 삭제
DELETE
FROM t_article
WHERE id = 1;

SELECT *
FROM t_article;

# ======================================================================
# ======================================================================
# ======================================================================

DROP DATABASE s1;

CREATE DATABASE s1;

USE s1;

CREATE TABLE t_order(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
userNo INT(5) NOT NULL,
productNo INT(5) NOT NULL
);

CREATE TABLE t_user(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
userId CHAR(200) NOT NULL,
userPw CHAR(200) NOT NULL,
userName CHAR(50) NOT NULL,
addr CHAR(200) NOT NULL
);

CREATE TABLE t_product(
id INT(5) PRIMARY KEY AUTO_INCREMENT,
pname CHAR(100) NOT NULL,
price INT(10) NOT NULL
);


INSERT INTO t_product
SET pName = '운동화',
price = 1000000;

INSERT INTO t_product
SET pName = '코트',
price = 100000;

INSERT INTO t_product
SET pName = '반바지',
price = 30000;

INSERT INTO t_product
SET pName = '스커트',
price = 15000;

INSERT INTO t_product
SET pName = '코트',
price = 100000;

INSERT INTO t_product
SET pName = '티셔츠',
price = 9000;

INSERT INTO t_product
SET pName = '운동화',
price = 200000;

INSERT INTO t_product
SET pName = '모자',
price = 30000;



INSERT INTO t_user
SET userId = 'user1',
userPw = 'pass1',
userName = '손흥민',
addr = '런던';

INSERT INTO t_user
SET userId = 'user2',
userPw = 'pass2',
userName = '설현',
addr = '서울';

INSERT INTO t_user
SET userId = 'user3',
userPw = 'pass3',
userName = '원빈',
addr = '대전';

INSERT INTO t_user
SET userId = 'user4',
userPw = 'pass4',
userName = '송혜교',
addr = '대구';

INSERT INTO t_user
SET userId = 'user5',
userPw = 'pass5',
userName = '소지섭',
addr = '부산';

INSERT INTO t_user
SET userId = 'user6',
userPw = 'pass6',
userName = '김지원',
addr = '울산';


INSERT INTO t_order
SET userNo = 1,
productNo = 1;

INSERT INTO t_order
SET userNo = 2,
productNo = 2;

INSERT INTO t_order
SET userNo = 3,
productNo = 3;

INSERT INTO t_order
SET userNo = 4,
productNo = 4;

INSERT INTO t_order
SET userNo = 5,
productNo = 5;

INSERT INTO t_order
SET userNo = 6,
productNo = 6;

INSERT INTO t_order
SET userNo = 6,
productNo = 7;

INSERT INTO t_order
SET userNo = 1,
productNo = 5;

INSERT INTO t_order
SET userNo = 4,
productNo = 4;

INSERT INTO t_order
SET userNo = 1,
productNo = 1;

INSERT INTO t_order
SET userNo = 5,
productNo = 8;

SELECT * FROM t_order;
SELECT * FROM t_user;
SELECT * FROM t_product;

# 1. 손흥민의 주문 개수는? 3
SELECT * 
FROM t_order;
DESC t_user;

SELECT *
FROM t_order
WHERE userNo = 1;

SELECT id
FROM t_user
WHERE userName = '손흥민';

# 2. 손흥민이 산 상품은? 운동화, 코트
SELECT *
FROM t_order
WHERE userNo = 1;

SELECT *
FROM t_product;

DESC t_product;

SELECT *
FROM t_product
WHERE id = 1 OR id = 5;

# 3. 스커트를 산 사람은? 송혜교
DESC t_product;

SELECT id
FROM t_product
WHERE pname = '스커트';

SELECT userNo
FROM t_order
WHERE productNo = 4;

SELECT userName
FROM t_user
WHERE id = 4;

# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는? 손흥민(user1) 3개
SELECT *
FROM t_order
ORDER BY userNo;

SELECT userId, userName
FROM t_user
WHERE id = 1;

# 5. 소지섭이 사용한 총 금액은? 130,000
SELECT id
FROM t_user
WHERE userName = '소지섭';

SELECT *
FROM t_order
WHERE userNo = 5;

SELECT price
FROM t_product
WHERE id = 5 OR id = 8;


# 테이블 2개를 합쳐서 보는 방법 : JOIN
SELECT *
FROM t_user;

# 기본 JOIN. 카르테시언 곱 
SELECT *
FROM t_order
INNER JOIN t_user
ON t_order.userNo = t_user.id;

SELECT *
FROM t_order
INNER JOIN t_user
ON t_order.userNo = t_user.id
INNER JOIN t_product
ON t_order.productNo = t_product.id;

# 1. 손흥민의 주문 개수는? 3
#집계함수

SELECT COUNT(*)
FROM t_order
INNER JOIN t_user
ON t_order.userNo = t_user.id
WHERE t_user.userName = '손흥민';

# 2. 손흥민이 산 상품은? 운동화, 코트 dintinct - 중복행 제거
SELECT *
FROM t_user;

SELECT p.*
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
WHERE u.userName = '손흥민'
ORDER BY p.id;

# 3. 스커트를 산 사람은? 송혜교 GROUP BY - 중복행 제거
SELECT u.userName
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
WHERE p.pname = '스커트'
GROUP BY u.userName;

# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는? max(), min()
SELECT u.userid, u.userName, COUNT(*) cnt
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
GROUP BY userName
ORDER BY cnt DESC
LIMIT 1;

# 5. 소지섭이 사용한 총 금액은? count() - 행의 개수, 행의 값을 다 더해주는 거 - sum()
SELECT SUM(p.price)
FROM t_order o 
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
WHERE u.userName = '소지섭';

#합구하기
SELECT SUM(price)
FROM t_product;

#최댓값 구하기
SELECT MAX(price)
FROM t_product;

#최솟값 구하기
SELECT MIN(price)
FROM t_product;

#평균값 구하기
SELECT AVG(price)
FROM t_product;












#------------------------------------------------------------------------------------------------
SELECT userNo
FROM t_order
ORDER BY userNo;

SELECT userNo, COUNT(userNo)
FROM t_order
GROUP BY userNo;

SELECT userNo
FROM t_order
GROUP BY userNo
ORDER BY userNo;
