
-- 회원관리 테이블
CREATE TABLE mvc_user (
	user_id char(100) primary key,
	user_pw char(100) not null,
	user_name char(120) not null,
	user_reg_date timestamp default now()
);

-- 컬럼추가
ALTER TABLE mvc_user ADD COLUMN session_id CHAR(50) NOT NULL DEFAULT 'none';
ALTER TABLE mvc_user ADD COLUMN session_limit TIMESTAMP;