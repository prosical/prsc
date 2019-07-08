-- 기본 게시판 테이블
CREATE TABLE mvc_board(
	board_no int AUTO_INCREMENT primary key,
	title VARCHAR(200) not null,
	content text null,
	writer VARCHAR(50) not null,
	reg_date TIMESTAMP not null DEFAULT NOW(),
	view_count int default 0
);

-- 게시판에 댓글 수 컬럼 추가
ALTER TABLE mvc_board ADD COLUMN reply_cnt INT DEFAULT 0; 
