--alter session set "_oracle_script"=true;
--drop user ship cascade;
--create user ship identified by 1234;
--grant connect, resource, unlimited tablespace to ship;
--conn ship/1234;

set line 500;
set pagesize 20;

-- 회원가입한유저
DROP TABLE USR cascade constraint;
DROP SEQUENCE USR_SEQ;
PURGE recyclebin;
CREATE TABLE USR (
	USR_NUM NUMBER constraint USR_PK primary key, -- 회원번호,
	USR_ID VARCHAR2(50) constraint USR_ID_UQ unique NOT NULL, -- 회원 아이디,
	USR_EMAIL VARCHAR2(50) , -- 이메일,constraint USR_EMAIL_UQ unique
	USR_PHONE VARCHAR2(30) , -- 회원 휴대폰번호,
	USR_PWD VARCHAR2(50) NOT NULL, -- 비밀번호,
	USR_NAME VARCHAR2(50) NOT NULL, -- 이름,
	USR_NICKNAME VARCHAR2(50) NOT NULL, -- 닉네임,
	USR_BIRTH DATE NOT NULL, -- 생년월일,
	USR_GENDER VARCHAR2(20) NOT NULL, -- 성별,
	USR_PHOTO NUMBER(1) DEFAULT 0 constraint USR_PHOTO_CK CHECK(USR_PHOTO=0 OR USR_PHOTO=1) , -- 프로필사진,
	USR_CITY NUMBER(2) DEFAULT 0 NOT NULL, --회원도시
	USR_TOWN NUMBER(2) DEFAULT 0 NOT NULL, --회원군구
	USR_PHOTO_PATH VARCHAR2(200) DEFAULT 'default'  NOT NULL, -- 프사주소,
	USR_RDATE DATE DEFAULT SYSDATE NOT NULL -- 가입날짜,
);
CREATE SEQUENCE USR_SEQ increment by 1 start with 1 nocache;


DROP TABLE ONLINE_USR;
PURGE recyclebin;
CREATE TABLE ONLINE_USR (
	USR_NUM NUMBER  -- 회원번호,
);



-- 밴드에속한멤버(해소)
DROP TABLE CREW cascade constraint;
DROP SEQUENCE CREW_SEQ;
PURGE recyclebin;
CREATE TABLE CREW (
	CREW_NUM NUMBER constraint CREW_PK primary key, -- 멤버번호,
	USR_NUM NUMBER NOT NULL, -- 회원번호,
	SHIP_NUM NUMBER NOT NULL, -- 밴드번호,
	CREW_ROLE VARCHAR2(50) DEFAULT 'sailor' NOT NULL, -- 역할,
	CREW_BOOKMARK NUMBER(1) DEFAULT 0 constraint CREW_BOOKMARK_CK CHECK(CREW_BOOKMARK=0 OR CREW_BOOKMARK=1), -- 즐겨찾기,
	CREW_JDATE DATE DEFAULT SYSDATE NOT NULL, -- 가입날짜,
	CREW_PHOTO VARCHAR2(200) DEFAULT 'default' NOT NULL,
	CREW_NICKNAME VARCHAR2(50) NOT NULL -- 닉네임
);
CREATE SEQUENCE CREW_SEQ increment by 1 start with 1 nocache;


-- 쪽지
DROP TABLE NOTE cascade constraint;
DROP SEQUENCE NOTE_SEQ;
PURGE recyclebin;
CREATE TABLE NOTE (
	NOTE_NUM NUMBER constraint NOTE_PK primary key, -- 쪽지번호,
	NOTE_SENDER NUMBER NOT NULL, -- 보내는이,
	NOTE_RECEIVER NUMBER NOT NULL, -- 받는이,
	NOTE_CONTENT VARCHAR2(1000) NOT NULL, -- 내용,
	NOTE_STATUS NUMBER(1) DEFAULT 0 constraint NOTE_STATUS_CK CHECK(NOTE_STATUS=0 OR NOTE_STATUS=1), -- 확인상태,
	NOTE_WDATE DATE DEFAULT SYSDATE NOT NULL -- 보낸날짜
);
CREATE SEQUENCE NOTE_SEQ increment by 1 start with 1 nocache;

DROP TABLE NOTICE cascade constraint;
DROP SEQUENCE NOTICE_SEQ;
PURGE recyclebin;

CREATE TABLE NOTICE(
	NOTICE_NUM NUMBER constraint  NOTICE_PK primary key, 
	NOTICE_TITLE VARCHAR2(2000) NOT NULL,
	NOTICE_CONTENT VARCHAR2(4000) ,
	NOTICE_DATE DATE DEFAULT SYSDATE NOT NULL -- 가입날짜,
);
CREATE SEQUENCE NOTICE_SEQ increment by 1 start with 1 nocache;


-- 가입신청서
DROP TABLE APPLICATION cascade constraint;
DROP SEQUENCE APPLICATION_SEQ;
PURGE recyclebin;
CREATE TABLE APPLICATION (
	APP_NUM NUMBER constraint APPLICATION_PK primary key, -- 신청서번호,
	USR_NUM NUMBER NOT NULL, -- 회원번호,
	SHIP_NUM NUMBER NOT NULL, -- 밴드번호,
	APP_ANSWER VARCHAR2(200) NOT NULL, -- 가입답변,
	APP_ADATE DATE DEFAULT SYSDATE NOT NULL, -- 신청날짜,
	APP_STATUS NUMBER(1) DEFAULT 0 constraint APP_STATUS_CK CHECK(APP_STATUS=0 OR APP_STATUS=1) -- 신청현황(관리자가 읽었는가 아닌가)
);
CREATE SEQUENCE APPLICATION_SEQ increment by 1 start with 1 nocache;


-- 모임(그룹/SHIP)
DROP TABLE SHIP cascade constraint;
DROP SEQUENCE SHIP_SEQ;
PURGE recyclebin;
CREATE TABLE SHIP (
	SHIP_NUM NUMBER constraint SHIP_PK primary key, -- 밴드번호,
	SHIP_NAME VARCHAR2(100) NOT NULL, -- 이름,
	SHIP_TITLE VARCHAR2(100) NOT NULL, -- 소개,
	SHIP_SURVEY VARCHAR2(100) NOT NULL, -- 소개,	
	SHIP_CAPTAIN VARCHAR2(50) NOT NULL, -- 대표자,
	SHIP_SAMPLE NUMBER(1) NOT NULL, -- 샘플사용여부,
	SHIP_SAMPLE_NAME VARCHAR2(200) NOT NULL, -- 샘플이름,
	SHIP_PHOTO_NAME VARCHAR2(200) NOT NULL, -- 샘플이름,
	SHIP_BANNER_NAME VARCHAR2(200) NOT NULL, -- 샘플배너이름,
	CITY_NUM NUMBER DEFAULT 0 NOT NULL, -- 시도번호,
	TOWN_NUM NUMBER DEFAULT 0 NOT NULL, -- 군구번호,
	DONG_NUM NUMBER DEFAULT 0 NOT NULL, -- 읍면동번호,
	LIMIT_STATUS NUMBER(1) DEFAULT 0 constraint SHIP_LIMIT_STATUS_CK CHECK(LIMIT_STATUS=0 OR LIMIT_STATUS=1), -- 연령제한여부,
	LIMIT_START DATE NULL, -- 연령제한부터,
	LIMIT_END DATE NULL, -- 연령제한까지,
	LIMIT_GENDER NUMBER(1) DEFAULT 0 NOT NULL constraint LIMIT_GENDER_CK CHECK(LIMIT_GENDER=0 OR LIMIT_GENDER=1 OR LIMIT_GENDER=2),
	SHIP_CDATE DATE DEFAULT SYSDATE NOT NULL, -- 개설날짜,
	SHIP_OPEN NUMBER(1) DEFAULT 0 constraint SHIP_OPEN_CK CHECK(SHIP_OPEN=0 OR SHIP_OPEN=1), -- 공개여부
	SHIP_COUNT NUMBER DEFAULT 1 NOT NULL,
	USR_NUM NUMBER NOT NULL
);
CREATE SEQUENCE SHIP_SEQ increment by 1 start with 1 nocache;



-- 모임프로필사진
DROP TABLE SHIP_PHOTO cascade constraint;
DROP SEQUENCE SHIP_PHOTO_SEQ;
PURGE recyclebin;
CREATE TABLE SHIP_PHOTO (
	SHIP_PHOTO_NUM NUMBER constraint SHIP_PHOTO_PK primary key, -- 멤버번호,
	SHIP_PHOTO_NAME VARCHAR2(200) NOT NULL, -- 회원번호,
	SHIP_ORIGIN_PHOTO_NAME VARCHAR2(200) NOT NULL, -- 밴드번호,
	SHIP_PHOTO_STATUS NUMBER(1) DEFAULT 0 NOT NULL, -- 역할,
	SHIP_PHOTO_LDATE DATE DEFAULT SYSDATE NOT NULL, -- 즐겨찾기,
	SHIP_NUM NUMBER NOT NULL -- 가입날짜,
);
CREATE SEQUENCE SHIP_PHOTO_SEQ increment by 1 start with 1 nocache;

-- 모임프로필사진
DROP TABLE SHIP_BANNER cascade constraint;
DROP SEQUENCE SHIP_BANNER_SEQ;
PURGE recyclebin;
CREATE TABLE SHIP_BANNER (
	SHIP_BANNER_NUM NUMBER constraint SHIP_BANNER_PK primary key, -- 멤버번호,
	SHIP_BANNER_NAME VARCHAR2(200) NOT NULL, -- 회원번호,
	SHIP_ORIGIN_BANNER_NAME VARCHAR2(200) NOT NULL, -- 밴드번호,
	SHIP_BANNER_STATUS NUMBER(1) DEFAULT 0 NOT NULL, -- 역할,
	SHIP_BANNER_LDATE DATE DEFAULT SYSDATE NOT NULL, -- 즐겨찾기,
	SHIP_NUM NUMBER NOT NULL -- 가입날짜,
);
CREATE SEQUENCE SHIP_BANNER_SEQ increment by 1 start with 1 nocache;


-- 가입설문조사
DROP TABLE SURVEY cascade constraint;
DROP SEQUENCE SURVEY_SEQ;
PURGE recyclebin;
CREATE TABLE SURVEY (
	SURVEY_NUM NUMBER constraint SURVEY_PK primary key, -- 질문번호,
	SHIP_NUM NUMBER NOT NULL, -- 밴드번호,
	SURVEY_CONTENT VARCHAR2(200) NOT NULL -- 질문내용
);
CREATE SEQUENCE SURVEY_SEQ increment by 1 start with 1 nocache;


-- 시/도
DROP TABLE CITY cascade constraint;
PURGE recyclebin;
CREATE TABLE CITY (
	CITY_NUM NUMBER constraint CITY_PK primary key, -- 시도번호,
	CITY_NAME VARCHAR2(30) NOT NULL -- 이름
);


-- 군/구
DROP TABLE TOWN cascade constraint;
PURGE recyclebin;
CREATE TABLE TOWN (
	TOWN_NUM NUMBER constraint TOWN_PK primary key, -- 군구번호,
	TOWN_NAME VARCHAR2(30) NOT NULL, -- 이름,
	CITY_NUM NUMBER NOT NULL -- 시도번호
);

-- 읍/면/동
DROP TABLE DONG cascade constraint;
DROP SEQUENCE DONG_SEQ;
PURGE recyclebin;
CREATE TABLE DONG (
	DONG_NUM NUMBER constraint DONG_PK primary key, -- 읍면동번호,
	DONG_NAME VARCHAR2(30) NOT NULL, -- 이름,
	TOWN_NUM NUMBER NOT NULL, -- 군구번호
	DONG_X NUMBER NOT NULL, -- 위도
	DONG_Y NUMBER NOT NULL -- 경도
);
CREATE SEQUENCE DONG_SEQ increment by 1 start with 1 nocache;


-- 게시판
DROP TABLE BOARD cascade constraint;
DROP SEQUENCE BOARD_SEQ;
PURGE recyclebin;
CREATE TABLE BOARD (
	BOARD_NUM NUMBER constraint BOARD_PK primary key, -- 게시글번호,
	BUNDLE_NUM NUMBER NOT NULL, -- 묶음번호,
	BUNDLE_ORDER NUMBER DEFAULT 0 NOT NULL, -- 묶음내순서,DEFAULT 0 constraint SHIP_LIMIT_STATUS_CK CHECK(LIMIT_STATUS=0 OR LIMIT_STATUS=1), -- 연령제한여부,
	BUNDLE_DEPTH NUMBER DEFAULT 0 NOT NULL, -- 묶음내깊이,
	BOARD_WRITER VARCHAR2(50) NOT NULL, -- 작성자,
	BOARD_SUBJECT VARCHAR2(100) NOT NULL, -- 제목,
	BOARD_CONTENT VARCHAR2(4000) NOT NULL, -- 내용,
	BOARD_CHANGE NUMBER(1) DEFAULT 0 constraint BOARD_CHANGE_CK CHECK(BOARD_CHANGE=0 OR BOARD_CHANGE=1), -- 수정여부,
	BOARD_WDATE DATE DEFAULT SYSDATE NOT NULL, -- 게시날짜,
	BOARD_VIEW NUMBER DEFAULT 0 NOT NULL, -- 조회수,
	BOARD_GOOD NUMBER DEFAULT 0 NOT NULL, -- 좋아요,
	BOARD_REPLY NUMBER DEFAULT 0 NOT NULL, -- 댓글수,
	BOARD_OPEN NUMBER(1) DEFAULT 0 constraint BOARD_OPEN_CK CHECK(BOARD_OPEN=0 OR BOARD_OPEN=1), -- 조회대상,
	CREW_NUM NUMBER NOT NULL -- 밴드번호
);
CREATE SEQUENCE BOARD_SEQ increment by 1 start with 1 nocache;



-- 게시판 첨부파일
DROP TABLE BOARD_FILE cascade constraint;
DROP SEQUENCE BOARD_FILE_SEQ;
PURGE recyclebin;
CREATE TABLE BOARD_FILE (
	BOARD_FILE_NUM NUMBER constraint BOARD_FILE_PK primary key, -- 멤버번호,
	BOARD_FILE_NAME VARCHAR2(200) NOT NULL, -- 회원번호,
	BOARD_FILE_SAVE_NAME VARCHAR2(200) NOT NULL, -- 밴드번호,
	BOARD_FILE_SIZE NUMBER NOT NULL, -- 파일 사이즈,
	BOARD_FILE_UDATE DATE DEFAULT SYSDATE NOT NULL, -- 즐겨찾기,
	BOARD_FILE_STATUS NUMBER NOT NULL,
	BOARD_NUM NUMBER NOT NULL -- 부모게시글번호,
);
CREATE SEQUENCE BOARD_FILE_SEQ increment by 1 start with 1 nocache;


-- 댓글
DROP TABLE REPLY cascade constraint;
DROP SEQUENCE REPLY_SEQ;
PURGE recyclebin;
CREATE TABLE REPLY (
	REPLY_NUM NUMBER constraint REPLY_PK primary key, -- 댓글번호,
	CREW_NUM NUMBER NOT NULL, -- 멤버번호,
	BOARD_NUM NUMBER NOT NULL, -- 게시글번호,
	BUNDLE_NUM NUMBER NOT NULL, -- 묶음번호,
	BUNDLE_ORDER NUMBER DEFAULT 0 NOT NULL, -- 묶음내순서,
	BUNDLE_DEPTH NUMBER DEFAULT 0 NOT NULL, -- 묶음내깊이,
	REPLY_CONTENT VARCHAR2(200) NOT NULL, -- 내용,
	REPLY_WDATE DATE DEFAULT SYSDATE NOT NULL, -- 작성날짜,
	REPLY_CHANGE NUMBER DEFAULT 0 constraint REPLY_CHANGE_CK CHECK(REPLY_CHANGE=0 OR REPLY_CHANGE=1), -- 수정여부,
	REPLY_CDATE DATE DEFAULT SYSDATE NOT NULL, -- 수정날짜,
	REPLY_GOOD NUMBER DEFAULT 0 NOT NULL, -- 좋아요,
	REPLY_OPEN NUMBER(1) DEFAULT 0 constraint REPLY_OPEN_CK CHECK(REPLY_OPEN=0 OR REPLY_OPEN=1) -- 조회대상
);
CREATE SEQUENCE REPLY_SEQ increment by 1 start with 1 nocache;

--select REPLY_NUM,BUNDLE_NUM,BUNDLE_ORDER,BUNDLE_DEPTH,CONTENT,WDATE from REPLY;

-- 신고
DROP TABLE REPORT cascade constraint;
DROP SEQUENCE REPORT_SEQ;
PURGE recyclebin;
CREATE TABLE REPORT (
	REPORT_NUM NUMBER constraint REPORT_PK primary key, -- 신고번호,
	USR_NUM NUMBER NOT NULL, -- 회원번호,
	SHIP_NUM NUMBER NOT NULL, -- 밴드번호,
	REPORT_CONTENT VARCHAR2(200) NOT NULL, -- 신고내용,
	REPORT_RDATE DATE DEFAULT SYSDATE NOT NULL, -- 신고날짜,
	REPORT_STATUS NUMBER(1) DEFAULT 0 constraint REPORT_STATUS_CK CHECK(REPORT_STATUS=0 OR REPORT_STATUS=1) -- 처리상태
);
CREATE SEQUENCE REPORT_SEQ increment by 1 start with 1 nocache;


-- 게시판좋아요
DROP TABLE BOARD_GOOD cascade constraint;
DROP SEQUENCE BOARD_GOOD_SEQ;
PURGE recyclebin;
CREATE TABLE BOARD_GOOD (
	BOARD_GOOD_NUM NUMBER constraint BOARD_GOOD_PK primary key, -- 좋아요번호,
	CREW_NUM NUMBER NOT NULL, -- 멤버번호,
	BOARD_NUM NUMBER NOT NULL -- 게시글번호
);
CREATE SEQUENCE BOARD_GOOD_SEQ increment by 1 start with 1 nocache;


-- 댓글좋아요
DROP TABLE REPLY_GOOD cascade constraint;
DROP SEQUENCE REPLY_GOOD_SEQ;
PURGE recyclebin;
CREATE TABLE REPLY_GOOD (
	REPLY_GOOD_NUM NUMBER constraint REPLY_GOOD_PK primary key, -- 댓글좋아요번호,
	CREW_NUM NUMBER NOT NULL, -- 멤버번호,
	REPLY_NUM NUMBER NOT NULL -- 댓글번호
);
CREATE SEQUENCE REPLY_GOOD_SEQ increment by 1 start with 1 nocache;


-- 미팅
DROP TABLE MEET cascade constraint;
DROP SEQUENCE MEET_SEQ;
PURGE recyclebin;
CREATE TABLE MEET (
	MEET_NUM NUMBER constraint MEET_PK primary key, -- 만남번호,
	SHIP_NUM NUMBER NOT NULL, -- 밴드번호,
	MEET_LOC VARCHAR2(200) NOT NULL, -- 만남장소,
	MEET_CONTENT VARCHAR2(200) NOT NULL, -- 만남내용,
	MEET_MDATE DATE NOT NULL, -- 만남날짜,
	MEET_WDATE DATE DEFAULT SYSDATE NOT NULL, -- 작성날짜,
	MEET_STAUS NUMBER(1) DEFAULT 0 constraint MEET_STAUS_CK CHECK(MEET_STAUS=0 OR MEET_STAUS=1), -- 만남상태,
	LIMIT_STATUS NUMBER(1) DEFAULT 0 constraint LIMIT_STATUS_CK CHECK(LIMIT_STATUS=0 OR LIMIT_STATUS=1), -- 인원제한
	LIMIT_END NUMBER DEFAULT 500 NOT NULL -- 인원까지
);
CREATE SEQUENCE MEET_SEQ increment by 1 start with 1 nocache;


-- 미팅신청서
DROP TABLE REGISTRATION cascade constraint;
DROP SEQUENCE REGISTRATION_SEQ;
PURGE recyclebin;
CREATE TABLE REGISTRATION (
	REG_NUM NUMBER constraint REGISTRATION_PK primary key, -- 만남신청서번호,
	CREW_NUM NUMBER NOT NULL, -- 멤버번호,
	MEET_NUM NUMBER NOT NULL, -- 만남번호,
	REG_RDATE DATE NOT NULL -- 만남신청날짜
);
CREATE SEQUENCE REGISTRATION_SEQ increment by 1 start with 1 nocache;


-- 알림
DROP TABLE NOTIFICATION cascade constraint;
DROP SEQUENCE NOTIFICATION_SEQ;
PURGE recyclebin;
CREATE TABLE NOTIFICATION (
	NOTI_NUM NUMBER constraint NOTIFICATION_PK primary key, -- 알림번호,
	NOTI_SUBJECT VARCHAR2(50) NOT NULL, -- 제목,
	NOTI_CONTENT VARCHAR2(50) NOT NULL, -- 내용,
	NOTI_STATUS NUMBER(1) DEFAULT 0 constraint NOTI_STATUS_CK CHECK(NOTI_STATUS=0 OR NOTI_STATUS=1), -- 알림상태,
	NOTI_WDATE DATE NOT NULL, -- 알림등록날짜,
	USR_NUM NUMBER NOT NULL, -- 회원번호,
	SHIP_NUM NUMBER NOT NULL -- 밴드번호
);
CREATE SEQUENCE NOTIFICATION_SEQ increment by 1 start with 1 nocache;


-------------------------------------------------------------------------------------------------------------------------------------------

-- 밴드에속한멤버(해소)
ALTER TABLE CREW
	ADD CONSTRAINT CREW_USR_FK -- 회원가입한유저 -> 밴드에속한멤버(해소)
	FOREIGN KEY (
		USR_NUM -- 회원번호
	)
	REFERENCES USR ( -- 회원가입한유저
		USR_NUM -- 회원번호
	)ON DELETE CASCADE;

-- 밴드에속한멤버(해소)
ALTER TABLE CREW
	ADD CONSTRAINT CREW_SHIP_FK -- 모임(그룹/SHIP) -> 밴드에속한멤버(해소)
	FOREIGN KEY (
		SHIP_NUM -- 밴드번호
	)
	REFERENCES SHIP ( -- 모임(그룹/SHIP)
		SHIP_NUM -- 밴드번호
	)ON DELETE CASCADE;

-- 가입신청서
ALTER TABLE APPLICATION
	ADD CONSTRAINT APPLICATION_USR_FK -- 회원가입한유저 -> 가입신청서
	FOREIGN KEY (
		USR_NUM -- 회원번호
	)
	REFERENCES USR ( -- 회원가입한유저
		USR_NUM -- 회원번호
	)ON DELETE CASCADE;

-- 가입신청서
ALTER TABLE APPLICATION
	ADD CONSTRAINT APPLICATION_SHIP_FK -- 모임(그룹/SHIP) -> 가입신청서
	FOREIGN KEY (
		SHIP_NUM -- 밴드번호
	)
	REFERENCES SHIP ( -- 모임(그룹/SHIP)
		SHIP_NUM -- 밴드번호
	)ON DELETE CASCADE;

-- 가입설문조사
ALTER TABLE SURVEY
	ADD CONSTRAINT SURVEY_SHIP_FK -- 모임(그룹/SHIP) -> 가입설문조사
	FOREIGN KEY (
		SHIP_NUM -- 밴드번호
	)
	REFERENCES SHIP ( -- 모임(그룹/SHIP)
		SHIP_NUM -- 밴드번호
	)ON DELETE CASCADE;

-- 군/구
ALTER TABLE TOWN
	ADD CONSTRAINT TOWN_CITY_FK -- 시/도 -> 군/구
	FOREIGN KEY (
		CITY_NUM -- 시도번호
	)
	REFERENCES CITY ( -- 시/도
		CITY_NUM -- 시도번호
	)ON DELETE CASCADE;

-- 게시판
ALTER TABLE BOARD
	ADD CONSTRAINT BOARD_CREW_FK -- 모임(그룹/SHIP) -> 게시판
	FOREIGN KEY (
		CREW_NUM -- 밴드번호
	)
	REFERENCES CREW ( -- 모임(그룹/SHIP)
		CREW_NUM -- 밴드번호
	)ON DELETE CASCADE;

-- 게시판첨부파일
ALTER TABLE BOARD_FILE
	ADD CONSTRAINT BOARD_FILE_FK -- 게시판첨부파일(자식) -> 게시판(부모)
	FOREIGN KEY (
		BOARD_NUM -- 밴드번호
	)
	REFERENCES BOARD ( -- 모임(그룹/SHIP)
		BOARD_NUM -- 밴드번호
	)ON DELETE CASCADE;


-- 댓글
ALTER TABLE REPLY
	ADD CONSTRAINT REPLY_BOARD_FK -- 게시판 -> 댓글
	FOREIGN KEY (
		BOARD_NUM -- 게시글번호
	)
	REFERENCES BOARD ( -- 게시판
		BOARD_NUM -- 게시글번호
	)ON DELETE CASCADE;

-- 댓글
ALTER TABLE REPLY
	ADD CONSTRAINT REPLY_CREW_FK -- 밴드에속한멤버(해소) -> 댓글
	FOREIGN KEY (
		CREW_NUM -- 멤버번호
	)
	REFERENCES CREW ( -- 밴드에속한멤버(해소)
		CREW_NUM -- 멤버번호
	)ON DELETE CASCADE;

-- 신고
ALTER TABLE REPORT
	ADD CONSTRAINT REPORT_USR_FK -- 회원가입한유저 -> 신고
	FOREIGN KEY (
		USR_NUM -- 회원번호
	)
	REFERENCES USR ( -- 회원가입한유저
		USR_NUM -- 회원번호
	)ON DELETE CASCADE;

-- 신고
ALTER TABLE REPORT
	ADD CONSTRAINT REPORT_SHIP_FK -- 모임(그룹/SHIP) -> 신고
	FOREIGN KEY (
		SHIP_NUM -- 밴드번호
	)
	REFERENCES SHIP ( -- 모임(그룹/SHIP)
		SHIP_NUM -- 밴드번호
	)ON DELETE CASCADE;

-- 게시판좋아요
ALTER TABLE BOARD_GOOD
	ADD CONSTRAINT BOARD_GOOD_BOARD_FK -- 게시판 -> 게시판좋아요
	FOREIGN KEY (
		BOARD_NUM -- 게시글번호
	)
	REFERENCES BOARD ( -- 게시판
		BOARD_NUM -- 게시글번호
	)ON DELETE CASCADE;

-- 게시판좋아요
ALTER TABLE BOARD_GOOD
	ADD CONSTRAINT BOARD_GOOD_CREW_FK -- 밴드에속한멤버(해소) -> 게시판좋아요
	FOREIGN KEY (
		CREW_NUM -- 멤버번호
	)
	REFERENCES CREW ( -- 밴드에속한멤버(해소)
		CREW_NUM -- 멤버번호
	)ON DELETE CASCADE;

-- 댓글좋아요
ALTER TABLE REPLY_GOOD
	ADD CONSTRAINT REPLY_GOOD_REPLY_FK -- 댓글 -> 댓글좋아요
	FOREIGN KEY (
		REPLY_NUM -- 댓글번호
	)
	REFERENCES REPLY ( -- 댓글
		REPLY_NUM -- 댓글번호
	)ON DELETE CASCADE;

-- 댓글좋아요
ALTER TABLE REPLY_GOOD
	ADD CONSTRAINT REPLY_GOOD_CREW_FK -- 밴드에속한멤버(해소) -> 댓글좋아요
	FOREIGN KEY (
		CREW_NUM -- 멤버번호
	)
	REFERENCES CREW ( -- 밴드에속한멤버(해소)
		CREW_NUM -- 멤버번호
	)ON DELETE CASCADE;

-- 미팅
ALTER TABLE MEET
	ADD CONSTRAINT MEET_SHIP_FK -- 모임(그룹/SHIP) -> 미팅
	FOREIGN KEY (
		SHIP_NUM -- 밴드번호
	)
	REFERENCES SHIP ( -- 모임(그룹/SHIP)
		SHIP_NUM -- 밴드번호
	)ON DELETE CASCADE;

-- 미팅신청서
ALTER TABLE REGISTRATION
	ADD CONSTRAINT REGISTRATION_MEET_FK -- 미팅 -> 미팅신청서
	FOREIGN KEY (
		MEET_NUM -- 만남번호
	)
	REFERENCES MEET ( -- 미팅
		MEET_NUM -- 만남번호
	)ON DELETE CASCADE;

-- 미팅신청서
ALTER TABLE REGISTRATION
	ADD CONSTRAINT REGISTRATION_CREW_FK -- 밴드에속한멤버(해소) -> 미팅신청서
	FOREIGN KEY (
		CREW_NUM -- 멤버번호
	)
	REFERENCES CREW ( -- 밴드에속한멤버(해소)
		CREW_NUM -- 멤버번호
	)ON DELETE CASCADE;

-- 알림
ALTER TABLE NOTIFICATION
	ADD CONSTRAINT NOTIFICATION_USR_FK -- 회원가입한유저 -> 알림
	FOREIGN KEY (
		USR_NUM -- 회원번호
	)
	REFERENCES USR ( -- 회원가입한유저
		USR_NUM -- 회원번호
	)ON DELETE CASCADE;

-- 알림
ALTER TABLE NOTIFICATION
	ADD CONSTRAINT NOTIFICATION_SHIP_FK -- 모임(그룹/SHIP) -> 알림
	FOREIGN KEY (
		SHIP_NUM -- 밴드번호
	)
	REFERENCES SHIP ( -- 모임(그룹/SHIP)
		SHIP_NUM -- 밴드번호
	)ON DELETE CASCADE;

-- SHIP
ALTER TABLE SHIP
	ADD CONSTRAINT SHIP_USR_FK -- 회원가입한유저 -> 모임(그룹/SHIP)
	FOREIGN KEY (
		USR_NUM -- 유저번호
	)
	REFERENCES USR ( -- 회원가입한유저
		USR_NUM -- 유저번호
	)ON DELETE CASCADE;

commit;



----------------------------------------------------------------------------------------------------------------------------------
--보류


-- 프사
--DROP TABLE USER_PHOTO cascade constraint;
--DROP SEQUENCE USER_PHOTO_SEQ;
--PURGE recyclebin;
--CREATE TABLE USER_PHOTO (
--	USER_PHOTO_NUM NUMBER constraint USER_PHOTO_PK primary key, -- 프사번호,
--	USER_PHOTO_NAME VARCHAR2(50) constraint USER_PHOTO_NAME_UQ unique, -- 저장이름,
--	USER_PHOTO_ORIGIN_NAME VARCHAR2(50) NOT NULL, -- 원본이름,
--	USER_PHOTO_PROFILE_SIZE NUMBER NOT NULL, -- 용량,
--	USER_PHOTO_LDATE DATE NOT NULL, -- 최근사용날짜,
--	USER_PHOTO_STATUS NUMBER NOT NULL, -- 사용중인상태,
--	USR_NUM NUMBER NOT NULL -- 회원번호
--);
--CREATE SEQUENCE USER_PHOTO_SEQ increment by 1 start with 1 nocache;

-- 모임대표프사
--DROP TABLE SHIP_PHOTO cascade constraint;
--DROP SEQUENCE SHIP_PHOTO_SEQ;
--PURGE recyclebin;
--CREATE TABLE SHIP_PHOTO (
--	BPHOTO_NUM NUMBER constraint SHIP_PHOTO_PK primary key, -- 대표사진번호,
--	NAME VARCHAR2(20) constraint SHIP_PHOTO_UQ unique, -- 저장이름,
--	ORIGIN_NAME VARCHAR2(20) NOT NULL, -- 원본이름,
--	BPHOTO_SIZE NUMBER NOT NULL, -- 용량,
--	SHIP_NUM NUMBER NOT NULL -- 밴드번호
--);
--CREATE SEQUENCE SHIP_PHOTO_SEQ increment by 1 start with 1 nocache;

-- 프사
--ALTER TABLE USER_PHOTO
--	ADD CONSTRAINT USER_PHOTO_USR_FK -- 회원가입한유저 -> 프사
--	FOREIGN KEY (
--		USR_NUM -- 회원번호
--	)
--	REFERENCES USR ( -- 회원가입한유저
--		USR_NUM -- 회원번호
--	);

-- 모임대표프사
--ALTER TABLE SHIP_PHOTO
--	ADD CONSTRAINT SHIP_PHOTO_SHIP_FK -- 모임(그룹/SHIP) -> 모임대표프사
--	FOREIGN KEY (
--		SHIP_NUM -- 밴드번호
--	)
--	REFERENCES SHIP ( -- 모임(그룹/SHIP)
--		SHIP_NUM -- 밴드번호
--	);

ALTER TABLE SHIP_PHOTO
	ADD CONSTRAINT SHIP_PHOTO_FK -- 유저 -> 채팅
	FOREIGN KEY (
		SHIP_NUM -- 회원번호
	)
	REFERENCES SHIP ( -- 유저
		SHIP_NUM -- 회원번호
	)ON DELETE CASCADE;

ALTER TABLE SHIP_BANNER
	ADD CONSTRAINT SHIP_BANNER_FK -- 유저 -> 채팅
	FOREIGN KEY (
		SHIP_NUM -- 회원번호
	)
	REFERENCES SHIP ( -- 유저
		SHIP_NUM -- 회원번호
	)ON DELETE CASCADE;
DROP TABLE ROOM cascade constraint;
DROP TABLE CHATTING cascade constraint;
DROP TABLE CALENDAR cascade constraint;
DROP SEQUENCE ROOM_SEQ;
DROP SEQUENCE CHATTING_SEQ;
DROP SEQUENCE CALENDAR_SEQ;
DROP SEQUENCE CALENDAR_GROUP_ID_SEQ;
PURGE recyclebin;	

CREATE TABLE ROOM (
	ROOM_NUM NUMBER constraint ROOM_PK primary key,
	ROOM_ID NUMBER, -- 방 번호,
	ROOM_NAME VARCHAR2(200),  -- 방 이름,
	ROOM_MEMBER   NUMBER NOT NULL -- 채팅 멤버
);
CREATE SEQUENCE ROOM_SEQ increment by 1 start with 1 nocache;

CREATE TABLE CHATTING (
	CHAT_ID NUMBER constraint CHAT_ID_PK primary key, -- 채팅 아이디,
	ROOM_ID  NUMBER, -- 방 아이디,
	CHAT_SENDER NUMBER NOT NULL, -- 보내는이,
	CHAT_CONTENT VARCHAR2(200) NOT NULL, -- 내용,
	USR_PHOTO_PATH VARCHAR2(200) NOT NULL, -- 내용,
	CHAT_WDATE DATE DEFAULT SYSDATE NOT NULL -- 보낸날짜
);
CREATE SEQUENCE CHATTING_SEQ increment by 1 start with 1 nocache;

CREATE TABLE CALENDAR (
	CALENDAR_ID NUMBER constraint CALENDAR_ID_PK primary key,
	CALENDAR_GROUP_ID NUMBER,
	SHIP_NUM NUMBER,
	USR_NUM NUMBER,
	CALENDAR_TITLE VARCHAR2(50),
	CALENDAR_WRITER VARCHAR2(50),
	CALENDAR_CONTENT VARCHAR2(1000),
	CALENDAR_START1 DATE,
	CALENDAR_END1 DATE,
	CALENDAR_ALL_DAY NUMBER(1),
	CALENDAR_TEXT_COLOR VARCHAR(50),
	CALENDAR_BACKGROUND_COLOR VARCHAR2(50),
	CALENDAR_BORDER_COLOR VARCHAR2(50)
);
CREATE SEQUENCE CALENDAR_SEQ increment by 1 start with 1 nocache;
CREATE SEQUENCE CALENDAR_GROUP_ID_SEQ increment by 1 start with 1 nocache;

ALTER TABLE CHATTING 
	ADD CONSTRAINT CHAT_SENDER_FK -- 유저 -> 채팅
	FOREIGN KEY (
		CHAT_SENDER-- 회원번호
	)
	REFERENCES USR ( -- 유저
		USR_NUM -- 회원번호
	);

ALTER TABLE ROOM
	ADD CONSTRAINT ROOM_MEMBER_FK -- 유저 -> 채팅
	FOREIGN KEY (
		ROOM_MEMBER -- 회원번호
	)
	REFERENCES USR ( -- 유저
		USR_NUM -- 회원번호
	);

commit;
