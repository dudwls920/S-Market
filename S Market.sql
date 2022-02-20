/*drop*/
drop table basket;
drop table orderdetail;
drop table shoporder;
drop table eventreply;
drop table USERGESIPAN;
drop table EVENTGESIPAN;
drop sequence EVENT;
drop sequence USERGE;
drop sequence evnetreplyseq;
DROP sequence tbl_cart_seq; 

DROP TABLE tbl_cart; 
drop table product;
drop table member;





CREATE TABLE MEMBER (
	id NVARCHAR2(50) NOT NULL, 
	pw NVARCHAR2(50), 
    membername NVARCHAR2(50), 
	year NVARCHAR2(50),
    month NVARCHAR2(50),
    day NVARCHAR2(50), 
    gender NVARCHAR2(50), 
    email NVARCHAR2(500), 
	address NVARCHAR2(500), 
	phonenum NVARCHAR2(50), 
	AUTHORITY NVARCHAR2(10) 
);

ALTER TABLE MEMBER MODIFY (AUTHORITY DEFAULT '0');

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			id
		);




CREATE TABLE SHOPORDER(
	ordernum number NOT NULL,
	id NVARCHAR2(50),
	paycheck NVARCHAR2(50),
    payname NVARCHAR2(50),
	orderdate DATE,
	DELIVERY NVARCHAR2(20)
);

ALTER TABLE SHOPORDER MODIFY (PAYCHECK DEFAULT 'X');
ALTER TABLE SHOPORDER MODIFY (DELIVERY DEFAULT '배송준비중');


ALTER TABLE SHOPORDER
	ADD
		CONSTRAINT PK_SHOPORDER
		PRIMARY KEY (
			ordernum
		);


CREATE TABLE BASKET (
	id NVARCHAR2(50), 
	productnum NVARCHAR2(50) 
);


CREATE TABLE PRODUCT (
	productnum NVARCHAR2(50) NOT NULL,
	productname NVARCHAR2(50), 
	productkind NVARCHAR2(50),
	productprice NUMBER(10), 
	productcontent NVARCHAR2(500),
	productimage NVARCHAR2(50),
	productsales NUMBER
);

ALTER TABLE PRODUCT
	ADD
		CONSTRAINT PK_PRODUCT
		PRIMARY KEY (
			productnum
		);



CREATE TABLE USERGESIPAN (
	BNO NUMBER(4) NOT NULL,
	id NVARCHAR2(50), 
	TITLE VARCHAR2(100), 
	CONTENT VARCHAR2(4000), 
	REGDATE DATE, 
	VIEWCNT NUMBER 
);

ALTER TABLE USERGESIPAN
	ADD
		CONSTRAINT PK_USERGESIPAN
		PRIMARY KEY (
			BNO
		);


CREATE TABLE EVENTGESIPAN (
	BNO NUMBER(4) NOT NULL, 
	TITLE VARCHAR2(100) not null, 
	CONTENT VARCHAR2(4000), 
    	id NVARCHAR2(50), 
	REGDATE DATE,
	VIEWCNT NUMBER, 
	IMAGE VARCHAR2(100)
);

ALTER TABLE EVENTGESIPAN
	ADD
		CONSTRAINT PK_EVENTGESIPAN
		PRIMARY KEY (
			BNO
		);



CREATE TABLE ORDERDETAIL (
	ordernum number NOT NULL, 
	productnum NVARCHAR2(50), 
	ORDERCOUNT NUMBER(3), 
	orderprice NUMBER(10) 
);


ALTER TABLE SHOPORDER
	ADD
		CONSTRAINT FK_MEMBER_TO_SHOPORDER
		FOREIGN KEY (
			id
		)
		REFERENCES MEMBER (
			id
		);

ALTER TABLE BASKET
	ADD
		CONSTRAINT FK_PRODUCT_TO_BASKET
		FOREIGN KEY (
			productnum
		)
		REFERENCES PRODUCT (
			productnum
		);

ALTER TABLE BASKET
	ADD
		CONSTRAINT FK_MEMBER_TO_BASKET
		FOREIGN KEY (
			id
		)
		REFERENCES MEMBER (
			id
		);



ALTER TABLE USERGESIPAN
	ADD
		CONSTRAINT FK_MEMBER_TO_USERGESIPAN
		FOREIGN KEY (
			id
		)
		REFERENCES MEMBER (
			id
		);

ALTER TABLE EVENTGESIPAN
	ADD
		CONSTRAINT FK_MEMBER_TO_EVENTGESIPAN
		FOREIGN KEY (
			id
		)
		REFERENCES MEMBER (
			id
		);


ALTER TABLE ORDERDETAIL
	ADD
		CONSTRAINT FK_SHOPORDER_TO_ORDERDETAIL
		FOREIGN KEY (
			ordernum
		)
		REFERENCES SHOPORDER (
			ordernum
		);



ALTER TABLE ORDERDETAIL
	ADD
		CONSTRAINT FK_PRODUCT_TO_ORDERDETAIL
		FOREIGN KEY (
			productnum
		)
		REFERENCES PRODUCT (
			productnum
		);

--이벤트 게시판 댓글
CREATE TABLE EVENTREPLY (
	BNO NUMBER(4) NOT NULL, 
	RNO NUMBER(4) NOT NULL,
	CONTENT VARCHAR2(1000) NOT NULL,
	id NVARCHAR2(50) NOT NULL,
	REGDATE DATE DEFAULT SYSDATE,
	PRIMARY KEY(BNO,RNO)
);

ALTER TABLE EVENTREPLY ADD CONSTRAINT EVENTREPLY_BNO FOREIGN KEY(BNO) REFERENCES USERGESIPAN(BNO);
ALTER TABLE EVENTREPLY ADD CONSTRAINT EVENTREPLY_ID FOREIGN KEY(ID) REFERENCES MEMBER(ID);

CREATE SEQUENCE EVENTREPLYSEQ START WITH 1 MINVALUE 0;

create table tbl_cart(
    cartNum  number not null,
    id NVARCHAR2(50) not null, 
    productnum NVARCHAR2(50) not null, 
    cartStock NUMBER not null,
    primary key(cartNum)
);

create sequence tbl_cart_seq;

alter table tbl_cart
    add constraint tbl_cart_id foreign key(id)
    references member(id);

alter table tbl_cart
    add constraint cart_productnum foreign key(productnum)
    references PRODUCT (productnum);


 insert into product values('A-01','한성컴퓨터 ELEX TV8750 4K HDR 안드로이드 TV (스탠드, 기사설치)','appliances',1090000,'TV','\appliances\tv1.PNG',10);
insert into product values('A-02','LG전자 스탠바이미 27ART10AKPL (스탠드)','appliances',988000,'TV','\appliances\tv2.PNG',10);
insert into product values('A-03','LG 울트라 HD TV(스탠드)','appliances',1091000,'TV','\appliances\tv3.PNG',10);
insert into product values('A-04','LG QNED TV(벽걸이형)','appliances',12021300,'TV','\appliances\tv4.PNG',50);
insert into product values('A-05','QLED 214 cm 스탠드형 + 3.1.2 채널 사운드바 Q600A','appliances',4240000,'TV','\appliances\tv5.PNG',10);
insert into product values('A-06','UHD 214 cm 스탠드형','appliances',2390000,'TV','\appliances\tv6.PNG',10);
insert into product values('A-07','셰프컬렉션 냉장고 930 L','appliances',6490000,'RF','\appliances\refrigerator1.PNG',10);
insert into product values('A-08','BESPOKE 냉장고 4도어 프리스탠딩 875 L','appliances',1840000,'RF','\appliances\refrigerator2.PNG',10);
insert into product values('A-09','BESPOKE 김치플러스 4도어 키친핏 420 L','appliances',2149000,'RF','\appliances\refrigerator3.PNG',10);

insert into product values('A-10','LG 모던엣지 냉장고','appliances',635000,'RF','\appliances\refrigerator4.PNG',10);
insert into product values('A-11','LG 디오스 상냉장 냉장고','appliances',925000,'RF','\appliances\refrigerator5.PNG',10);
insert into product values('A-12','LG 디오스 빌트인 타입 오브제컬렉션','appliances',3906800,'RF','\appliances\refrigerator6.PNG',10);
insert into product values('A-13','LG 휘센 듀얼에어컨 (히트) 매립배관형','appliances',2075600,'AC','\appliances\airConditioners1.PNG',10);
insert into product values('A-14','LG SIGNATURE 에어컨','appliances',8330000,'AC','\appliances\airConditioners2.PNG',20);
insert into product values('A-15','LG 휘센 타워에어컨 (스페셜)','appliances',1780000,'AC','\appliances\airConditioners3.PNG',10);
insert into product values('A-16','무풍에어컨 갤러리 청정 (56.9 ㎡)','appliances',2249000,'AC','\appliances\airConditioners4.PNG',10);
insert into product values('A-17','무풍에어컨 클래식 청정 (62.6 ㎡)','appliances',1899000,'AC','\appliances\airConditioners5.PNG',10);
insert into product values('A-18','BESPOKE 에어드레서 일반용량','appliances',1529000,'AD','\appliances\airdresser.PNG',10);

insert into product values('A-19','LG 휘센 제습기','appliances',549800,'DR','\appliances\dryer1.PNG',10);
insert into product values('A-20','BESPOKE 큐브™ Air (106, 53+53 ㎡)','appliances',999000,'DR','\appliances\dryer2.PNG',10);
insert into product values('A-21','BESPOKE 큐브™ Air (53 ㎡) + 스탠드 패키지','appliances',449000,'DR','\appliances\dryer3.PNG',10);
insert into product values('A-22','하만카돈 RADIANCE 2400','appliances',5355000,'AU','\appliances\audio1.PNG',10);
insert into product values('A-23','LG 사운드바','appliances',900500,'AU','\appliances\audio2.PNG',30);
insert into product values('A-24','LG 엑스붐 360','appliances',499000,'AU','\appliances\audio3.PNG',10);
insert into product values('A-25','JBL PARTYBOX 710 파티 스피커','appliances',999000,'AU','\appliances\audio4.PNG',10);
insert into product values('A-26','LG 울트라기어 게이밍스피커','appliances',549000,'AU','\appliances\audio5.PNG',10);
insert into product values('A-27','JBL LINK 포터블','appliances',199000,'AU','\appliances\audio6.PNG',10);


insert into product values('C-01','데일리흰색면티','cloth',7900,'누구나 입을 수 있는 원조 no.1데일리 흰색 면티','\cloth\cloth1.PNG',30);
insert into product values('C-02','블프 남녀공용 오리털 파카 덕다운 후드 겨울패딩','cloth',28500,'블프 남녀공용 오리털 파카 덕다운 후드 겨울패딩','\cloth\cloth2.PNG',20);
insert into product values('C-03','메종키츠네 폭스 헤드 가디건(베이지)','cloth',484000,' 22SS 폭스헤드가디건 베이지GU00542KT1036','\cloth\cloth3.PNG',10);
insert into product values('C-04','칼하트 로고 긴팔티(블랙)','cloth',36900,' 시그니쳐 롱슬리브 로고 긴팔티 블랙 / K231-BLACK','\cloth\cloth4.PNG',44);
insert into product values('C-05',' 와이드 밴딩 슬랙스_Black','cloth',37500,'데일리 와이드 밴딩 슬랙스_Black','\cloth\cloth5.PNG',125);
insert into product values('C-06','와플 니트 BLACK','cloth',57000,'소프트코튼 드랍숄더 오버핏 와플 니트 BLACK','\cloth\cloth6.PNG',49);
insert into product values('C-07','스웨트 팬츠 [멜란지 그레이]','cloth',25900,'스웨트 팬츠 [멜란지 그레이] ','\cloth\cloth7.PNG',70);
insert into product values('C-08','빅사이즈 양털 후리스 후드집업','cloth',24800,'빅사이즈 양털 후리스 후드집업 남성여성','\cloth\cloth8.PNG',23);
insert into product values('C-09','테이퍼드핏 팬츠','cloth',39000,'21 F/W 테이퍼드핏 코듀로이 팬츠(BZB4PP1104)','\cloth\cloth9.PNG',40);
insert into product values('C-10','NAVAL Academy Heavy Weight Hoodie Grey','cloth',79000,'NAVAL Academy Heavy Weight Hoodie Grey','\cloth\cloth10.PNG',55);
insert into product values('C-11','프레드페리 드레스','cloth',178000,' [D3600] 트윈 팁 프레드페리 드레스 (350) AFPF221D600-350','\cloth\cloth11.PNG',22);
insert into product values('C-12',' W Ribbon Dress','cloth',10800,' W Ribbon Dress','\cloth\cloth12.PNG',100);
insert into product values('C-13','노스페이스 패딩','cloth',299000,'NJ1DN55A 남성 1996 에코 눕시 자켓','\cloth\cloth13.PNG',20);
insert into product values('C-14','피쉬테일 숏 파카','cloth',129000,'[리뉴얼 ver.][3M 신슐레이트] M-1965 피쉬테일 숏 파카_Vintage Black','\cloth\cloth14.PNG',12);
insert into product values('C-15',' 프리미어 퓨어 캐시미어 히든 싱글 코트 [BLACK] ','cloth',268000,' 프리미어 퓨어 캐시미어 히든 싱글 코트 [BLACK] ','\cloth\cloth15.PNG',43);
insert into product values('C-16','그루브라임 긴팔티셔츠 [Black]','cloth',98000,' [패키지] NYC LOCATION LONG SLEEVE T-SHIRTS [LROFCTR721M]','\cloth\cloth16.PNG',220);
insert into product values('C-17',' 빅 트위치 루즈핏 롱 슬리브 블랙','cloth',39000,' 빅 트위치 루즈핏 롱 슬리브 블랙','\cloth\cloth17.PNG',300);
insert into product values('C-18','베이지 밴딩 미디 스커트','cloth',39900,'베이지 밴딩 미디 스커트 (321X27LYCA)','\cloth\cloth18.PNG',104);
insert into product values('C-19','화이트라벨 오버롤 블랙','cloth',179000,'화이트라벨 오버롤 블랙','\cloth\cloth19.PNG',10);
insert into product values('C-20',' 리얼 B-3 무스탕 자켓 브라운','cloth',738000,' SPERONE / real B3 mustang jacket brown','\cloth\cloth20.PNG',11);
insert into product values('C-22','W 호이트아노락원피스(NA)','cloth',199000,' W 호이트아노락원피스(NA) NAU / 523289','\cloth\cloth22.PNG',70);
insert into product values('C-23','21SS 여성 사선 로고 트임 큐롯 TWCUK5192-199','cloth',259000,' TAYLORMADE APPAREL / TWCUK5192-199','\cloth\cloth23.PNG',120);
insert into product values('C-24','WARM UP QUILTING JACKET BLACK','cloth',99000,' YALE / YB5JK0021BK','\cloth\cloth24.PNG',10);
insert into product values('C-25','브이넥 라이트 다운 베스트 [블랙]','cloth',36900,' MUSINSA STANDARD / MHVE5001-BK','\cloth\cloth25.PNG',20);
insert into product values('C-26','오리지널 M-1965 피쉬테일 파카_Vintage Black','cloth',143500,' [이동휘 착용] [리뉴얼 ver.][3M 신슐레이트]오리지널 M-1965 피쉬테일 파카_Vintage Black LAFUDGESTORE / fudge','\cloth\cloth26.PNG',30);
insert into product values('C-27','[비건 레더] 필드 자켓 블랙 ','cloth',117000,' PARTIMENTO / [Vegan Leather] Field Jacket Black','\cloth\cloth27.PNG',500);


Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-01','직화짜장소스250g','food',5900,'짜장면에 부어먹는 소스 입니다.','\food\food-1.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-02','촉촉한고등어','food',9900,'촉촉한 고등어입니다.','\food\food-2.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-03','춘천닭갈비','food',19900,'맛있는 닭갈비 입니다.','\food\food-3.PNG',50);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-04','비비고 왕교자','food',27000,'만두입니다.','\food\food-4.PNG',500);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-05','도톰한산적구이','food',17800,'산적구이입니다.','\food\food-5.PNG',125);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-06','모짜렐라핫도그','food',24900,'핫도그입니다.','\food\food-6.PNG',22);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-07','소고기미역국','food',19400,'미역국입니다.','\food\food-7.PNG',30);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-08','족발','food',21900,'족발입니다.','\food\food-8.PNG',800);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-09','사과','food',10690,'사과입니다.','\food\food-9.PNG',999);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-10','한우등심500g','food',51100,'한우등심입니다.','\food\food-10.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-11','반숙란','food',14070,'반숙란입니다.','\food\food-11.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-12','귤','food',9810,'귤입니다.','\food\food-12.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-13','간장','food',13900,'간장입니다.','\food\food-13.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-14','마늘','food',11340,'마늘입니다.','\food\food-14.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-15','식초','food',29520,'식초입니다.','\food\food-15.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-16','양파','food',10270,'양파입니다.','\food\food-16.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-17','무','food',20900,'무입니다.','\food\food-17.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-18','배추','food',18900,'배추입니다.','\food\food-18.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-19','양배추','food',11850,'양배추입니다.','\food\food-19.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-20','양상추','food',23880,'양상추입니다.','\food\food-20.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-21','옥수수','food',20000,'옥수수입니다.','\food\food-21.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-22','닭가슴살','food',620,'닭가슴살입니다.','\food\food-22.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-23','고구마','food',12400,'고구마입니다.','\food\food-23.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-24','대파','food',5400,'대파입니다.','\food\food-24.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-25','오예스','food',8910,'오예스입니다.','\food\food-25.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-26','표고버섯','food',10780,'표고버섯입니다.','\food\food-26.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-27','스파게티면','food',6000,'스파게티면입니다.','\food\food-27.PNG',1);



insert into product values('S-01','뮬라웨어 설빅세일 초특가 레깅스/자켓','sports',30600,'스포츠입니다.','\sports\sports-1.PNG',0);
insert into product values('S-02','엑스킹 전신 유산소 운동 기구','sports',158000,'스포츠입니다.','\sports\sports-2.PNG',0);
insert into product values('S-03','후디스 하이뮨 프로틴 밸런스 304g','sports',21240,'스포츠입니다.','\sports\sports-3.PNG',0);
insert into product values('S-04','K4스포츠아몸디 턱걸이철봉 치닝디핑 블랙','sports',88190,'스포츠입니다.','\sports\sports-4.PNG',0);
insert into product values('S-05','트라택 폼롤러 마사지 필라테스 EPP 90cm 블랙','sports',19800,'스포츠입니다.','\sports\sports-5.PNG',0);
insert into product values('S-06','인증검사받은 NBR요가매트 10mm','sports',13470,'스포츠입니다.','\sports\sports-6.PNG',2);
insert into product values('S-07','프리미엄 바른자세교정밴드 허리교정','sports',19900,'스포츠입니다.','\sports\sports-7.PNG',0);
insert into product values('S-08','아디다스/나이키/뉴에라 힙색/보조가방/쇼퍼백','sports',13800,'스포츠입니다.','\sports\sports-8.PNG',0);
insert into product values('S-09','휠라 레인저 1RM01141E100','sports',49500,'스포츠입니다.','\sports\sports-9.PNG',0);
insert into product values('S-10','정품 남녀 운동화 캐주얼화 축구화 모음전','sports',29000,'스포츠입니다.','\sports\sports-10.PNG',0);
insert into product values('S-11','스키 주니어 어린이 아동 스노우보드 장갑','sports',11270,'스포츠입니다.','\sports\sports-11.PNG',3);
insert into product values('S-12','6 in 1 멀티 게임기 미니 당구대 탁구','sports',11270,'스포츠입니다.','\sports\sports-12.PNG',0);
insert into product values('S-13','아디다스 GN2034 리니어 스몰 더블백','sports',11270,'스포츠입니다.','\sports\sports-13.PNG',0);
insert into product values('S-14','더폴라리스 2000 축구공 5호 (정품)','sports',49140,'스포츠입니다.','\sports\sports-14.PNG',0);
insert into product values('S-15','남여공용 커플 기능성 스키복 보드복','sports',70810,'스포츠입니다.','\sports\sports-15.PNG',0);
insert into product values('S-16','모토벨로 G7 DUAL 18인치 전기자전거','sports',697500,'스포츠입니다.','\sports\sports-16.PNG',0);
insert into product values('S-17','극세사 기모 넥워머/후드 워머/방한용품','sports',5900,'스포츠입니다.','\sports\sports-17.PNG',0);
insert into product values('S-18','플라스틱 얼음썰매 빙판 눈썰매 스케이트','sports',30000,'스포츠입니다.','\sports\sports-18.PNG',0);
insert into product values('S-19','미스터히터 휴대용 부탄가스 난로','sports',47050,'스포츠입니다.','\sports\sports-19.PNG',0);
insert into product values('S-20','국산 해피데이 핫팩(포켓용)100g 30매','sports',12900,'스포츠입니다.','\sports\sports-20.PNG',0);
insert into product values('S-21','어코드 3단 등산스틱 2P 1세트','sports',34900,'스포츠입니다.','\sports\sports-21.PNG',0);
insert into product values('S-22','미수기네 모노키니 옆 트임 섹시 비치 수영복','sports',23870,'스포츠입니다.','\sports\sports-22.PNG',1);
insert into product values('S-23','스탠딩 샌드백 복싱 격투기 물통형 기본블랙','sports',81080,'스포츠입니다.','\sports\sports-23.PNG',0);
insert into product values('S-24','버팔로 입체 성형 구명조끼','sports',18650,'스포츠입니다.','\sports\sports-24.PNG',0);
insert into product values('S-25','대형 물놀이 플라밍고 홍학 튜브','sports',20700,'스포츠입니다.','\sports\sports-25.PNG',0);
insert into product values('S-26','어깨 보호대 회전근개 고정 밴드','sports',14660,'스포츠입니다.','\sports\sports-26.PNG',0);
insert into product values('S-27','의료용 허리보호대 허리디스크 허리복대','sports',23000,'스포츠입니다.','\sports\sports-27.PNG',0);

create sequence EVENT;
INSERT INTO MEMBER VALUES('ADMIN','1111','관리자','1999','12','28','남자','ADMIN@NAVER.COM','대한민국 서울특별시 영등포구 63로 50 (여의도동)','010-1234-5678','1');
INSERT INTO MEMBER VALUES('TEST123','11112','사용자','1995','06','28','남자','TEST123@NAVER.COM','충남천안시','010-1434-1548',NULL);
INSERT INTO MEMBER VALUES('TEST1245','111123','사용자','1969','12','28','남자','TEST1234@NAVER.COM','충남아산시','010-1454-5125','');

insert into eventgesipan values(EVENT.nextval,'2월02일까지 TV할인 이벤트 !!','중요!이벤트 유의사항 참여기간 : 2022-01-27 ~ 2022-02.02(7일간) 참여방법: 브랜드별 참여방법은 스토어 메인 or 상품 상세페이지 내 이벤트 내용 참조 대상 상품: 본 기획전 내 노출된 상품 ','ADMIN',To_DATE('2022/01/27','YYYY/MM/DD'),0,'event1');
insert into eventgesipan values(EVENT.nextval,'이벤트게시판입니다2','내용입니다','ADMIN',sysdate,0,'event-2');
insert into eventgesipan values(EVENT.nextval,'이벤트게시판입니다3','이벤트내용입니다','ADMIN',sysdate,0,'event-3');
insert into eventgesipan values(EVENT.nextval,'이벤트게시판입니다4','내용입니다','ADMIN',sysdate,0,'event-4');
insert into eventgesipan values(EVENT.nextval,'이벤트게시판입니다5','내용입니다','ADMIN',sysdate,0,'event-5');
insert into eventgesipan values(EVENT.nextval,'이벤트게시판입니다7','내용입니다','ADMIN',sysdate,0,'event-6');
insert into eventgesipan values(EVENT.nextval,'이벤트게시판입니다8','내용입니다','ADMIN',sysdate,0,'event-7');
insert into eventgesipan values(EVENT.nextval,'이벤트게시판입니다9','내용입니다','ADMIN',sysdate,0,'event-8');
insert into eventgesipan values(EVENT.nextval,'이벤트게시판입니다10','내용입니다','ADMIN',sysdate,0,'event-9');
insert into eventgesipan values(EVENT.nextval,'이벤트게시판입니다11','내용입니다','ADMIN',sysdate,0,'event-10');
insert into eventgesipan values(EVENT.nextval,'이벤트게시판입니다12','내용입니다','ADMIN',sysdate,0,'event-11');




create sequence USERGE;
insert into usergesipan values(USERGE.nextval,'ADMIN','유저게시판입니다.','내용입니다',sysdate,0);
insert into usergesipan values(USERGE.nextval,'ADMIN','유저게시판입니다2.','내용입니다',sysdate,0);


--게시판댓글
INSERT INTO EVENTREPLY(BNO,RNO,CONTENT,ID) VALUES (1,EVENTREPLYSEQ.NEXTVAL,'테스트댓글','ADMIN');

commit;




