CREATE TABLE IF NOT EXISTS `weather`.`review_board` (
  `board_no` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `nickname` VARCHAR(50) NOT NULL,
  `reg_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view_cnt` INT NULL DEFAULT '0',
  `like_cnt` INT NULL DEFAULT '0',
  `reply_cnt` INT NULL DEFAULT '0',
  `member_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`board_no`),
  INDEX `fk_review_board_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_board_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `weather`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci


CREATE TABLE IF NOT EXISTS `weather`.`review_board` (
  `board_no` INT NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `nickname` VARCHAR(50) NOT NULL,
  `reg_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view_cnt` INT NULL DEFAULT '0',
  `like_cnt` INT NULL DEFAULT '0',
  `reply_cnt` INT NULL DEFAULT '0',
  `member_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`board_no`),
  INDEX `fk_review_board_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_board_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `weather`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci


CREATE TABLE IF NOT EXISTS `weather`.`city_dr` (
  `city_name` VARCHAR(20) NOT NULL,
  `city_info` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`city_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci


CREATE TABLE IF NOT EXISTS `mydb`.`add_file` (
  `add_file` VARCHAR(100) NOT NULL,
  `board_no` INT NOT NULL,
  `reg_date` TIMESTAMP NULL,
  PRIMARY KEY (`add_file`),
  INDEX `fk_add_file_review_board_idx` (`board_no` ASC) VISIBLE,
  CONSTRAINT `fk_add_file_review_board`
    FOREIGN KEY (`board_no`)
    REFERENCES `weather`.`review_board` (`board_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `weather`.`reply` (
  `reply_no` INT NOT NULL,
  `board_no` INT NOT NULL DEFAULT '0',
  `reply_content` TEXT NOT NULL,
  `nickname` VARCHAR(50) NOT NULL,
  `reg_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_no`),
  CONSTRAINT `reply_ibfk_1`
    FOREIGN KEY (`board_no`)
    REFERENCES `weather`.`review_board` (`board_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci


CREATE TABLE IF NOT EXISTS `weather`.`reply` (
  `reply_no` INT NOT NULL,
  `board_no` INT NOT NULL DEFAULT '0',
  `reply_content` TEXT NOT NULL,
  `nickname` VARCHAR(50) NOT NULL,
  `reg_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_no`),
  CONSTRAINT `reply_ibfk_1`
    FOREIGN KEY (`board_no`)
    REFERENCES `weather`.`review_board` (`board_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci


CREATE TABLE IF NOT EXISTS `weather`.`reply` (
  `reply_no` INT NOT NULL,
  `board_no` INT NOT NULL DEFAULT '0',
  `reply_content` TEXT NOT NULL,
  `nickname` VARCHAR(50) NOT NULL,
  `reg_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_no`),
  CONSTRAINT `reply_ibfk_1`
    FOREIGN KEY (`board_no`)
    REFERENCES `weather`.`review_board` (`board_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci