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
ALTER TABLE SHOPORDER MODIFY (DELIVERY DEFAULT '����غ���');


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

--�̺�Ʈ �Խ��� ���
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


 insert into product values('A-01','�Ѽ���ǻ�� ELEX TV8750 4K HDR �ȵ���̵� TV (���ĵ�, ��缳ġ)','appliances',1090000,'TV','\appliances\tv1.PNG',10);
insert into product values('A-02','LG���� ���Ĺ��̹� 27ART10AKPL (���ĵ�)','appliances',988000,'TV','\appliances\tv2.PNG',10);
insert into product values('A-03','LG ��Ʈ�� HD TV(���ĵ�)','appliances',1091000,'TV','\appliances\tv3.PNG',10);
insert into product values('A-04','LG QNED TV(��������)','appliances',12021300,'TV','\appliances\tv4.PNG',50);
insert into product values('A-05','QLED 214 cm ���ĵ��� + 3.1.2 ä�� ����� Q600A','appliances',4240000,'TV','\appliances\tv5.PNG',10);
insert into product values('A-06','UHD 214 cm ���ĵ���','appliances',2390000,'TV','\appliances\tv6.PNG',10);
insert into product values('A-07','�����÷��� ����� 930 L','appliances',6490000,'RF','\appliances\refrigerator1.PNG',10);
insert into product values('A-08','BESPOKE ����� 4���� �������ĵ� 875 L','appliances',1840000,'RF','\appliances\refrigerator2.PNG',10);
insert into product values('A-09','BESPOKE ��ġ�÷��� 4���� Űģ�� 420 L','appliances',2149000,'RF','\appliances\refrigerator3.PNG',10);

insert into product values('A-10','LG ������� �����','appliances',635000,'RF','\appliances\refrigerator4.PNG',10);
insert into product values('A-11','LG ����� ����� �����','appliances',925000,'RF','\appliances\refrigerator5.PNG',10);
insert into product values('A-12','LG ����� ��Ʈ�� Ÿ�� �������÷���','appliances',3906800,'RF','\appliances\refrigerator6.PNG',10);
insert into product values('A-13','LG �ּ� ��󿡾��� (��Ʈ) �Ÿ������','appliances',2075600,'AC','\appliances\airConditioners1.PNG',10);
insert into product values('A-14','LG SIGNATURE ������','appliances',8330000,'AC','\appliances\airConditioners2.PNG',20);
insert into product values('A-15','LG �ּ� Ÿ�������� (�����)','appliances',1780000,'AC','\appliances\airConditioners3.PNG',10);
insert into product values('A-16','��ǳ������ ������ û�� (56.9 ��)','appliances',2249000,'AC','\appliances\airConditioners4.PNG',10);
insert into product values('A-17','��ǳ������ Ŭ���� û�� (62.6 ��)','appliances',1899000,'AC','\appliances\airConditioners5.PNG',10);
insert into product values('A-18','BESPOKE ����巹�� �Ϲݿ뷮','appliances',1529000,'AD','\appliances\airdresser.PNG',10);

insert into product values('A-19','LG �ּ� ������','appliances',549800,'DR','\appliances\dryer1.PNG',10);
insert into product values('A-20','BESPOKE ť��� Air (106, 53+53 ��)','appliances',999000,'DR','\appliances\dryer2.PNG',10);
insert into product values('A-21','BESPOKE ť��� Air (53 ��) + ���ĵ� ��Ű��','appliances',449000,'DR','\appliances\dryer3.PNG',10);
insert into product values('A-22','�ϸ�ī�� RADIANCE 2400','appliances',5355000,'AU','\appliances\audio1.PNG',10);
insert into product values('A-23','LG �����','appliances',900500,'AU','\appliances\audio2.PNG',30);
insert into product values('A-24','LG ������ 360','appliances',499000,'AU','\appliances\audio3.PNG',10);
insert into product values('A-25','JBL PARTYBOX 710 ��Ƽ ����Ŀ','appliances',999000,'AU','\appliances\audio4.PNG',10);
insert into product values('A-26','LG ��Ʈ���� ���ֽ̹���Ŀ','appliances',549000,'AU','\appliances\audio5.PNG',10);
insert into product values('A-27','JBL LINK ���ͺ�','appliances',199000,'AU','\appliances\audio6.PNG',10);


insert into product values('C-01','���ϸ������Ƽ','cloth',7900,'������ ���� �� �ִ� ���� no.1���ϸ� ��� ��Ƽ','\cloth\cloth1.PNG',30);
insert into product values('C-02','���� ������� ������ ��ī ���ٿ� �ĵ� �ܿ��е�','cloth',28500,'���� ������� ������ ��ī ���ٿ� �ĵ� �ܿ��е�','\cloth\cloth2.PNG',20);
insert into product values('C-03','����Ű���� ���� ��� �����(������)','cloth',484000,' 22SS ������尡��� ������GU00542KT1036','\cloth\cloth3.PNG',10);
insert into product values('C-04','Į��Ʈ �ΰ� ����Ƽ(��)','cloth',36900,' �ñ״��� �ս����� �ΰ� ����Ƽ �� / K231-BLACK','\cloth\cloth4.PNG',44);
insert into product values('C-05',' ���̵� ��� ������_Black','cloth',37500,'���ϸ� ���̵� ��� ������_Black','\cloth\cloth5.PNG',125);
insert into product values('C-06','���� ��Ʈ BLACK','cloth',57000,'����Ʈ��ư ������ ������ ���� ��Ʈ BLACK','\cloth\cloth6.PNG',49);
insert into product values('C-07','����Ʈ ���� [����� �׷���]','cloth',25900,'����Ʈ ���� [����� �׷���] ','\cloth\cloth7.PNG',70);
insert into product values('C-08','������� ���� �ĸ��� �ĵ�����','cloth',24800,'������� ���� �ĸ��� �ĵ����� ��������','\cloth\cloth8.PNG',23);
insert into product values('C-09','�����۵��� ����','cloth',39000,'21 F/W �����۵��� �ڵ���� ����(BZB4PP1104)','\cloth\cloth9.PNG',40);
insert into product values('C-10','NAVAL Academy Heavy Weight Hoodie Grey','cloth',79000,'NAVAL Academy Heavy Weight Hoodie Grey','\cloth\cloth10.PNG',55);
insert into product values('C-11','�������丮 �巹��','cloth',178000,' [D3600] Ʈ�� �� �������丮 �巹�� (350) AFPF221D600-350','\cloth\cloth11.PNG',22);
insert into product values('C-12',' W Ribbon Dress','cloth',10800,' W Ribbon Dress','\cloth\cloth12.PNG',100);
insert into product values('C-13','�뽺���̽� �е�','cloth',299000,'NJ1DN55A ���� 1996 ���� ���� ����','\cloth\cloth13.PNG',20);
insert into product values('C-14','�ǽ����� �� ��ī','cloth',129000,'[������ ver.][3M �Ž�����Ʈ] M-1965 �ǽ����� �� ��ī_Vintage Black','\cloth\cloth14.PNG',12);
insert into product values('C-15',' �����̾� ǻ�� ĳ�ù̾� ���� �̱� ��Ʈ [BLACK] ','cloth',268000,' �����̾� ǻ�� ĳ�ù̾� ���� �̱� ��Ʈ [BLACK] ','\cloth\cloth15.PNG',43);
insert into product values('C-16','�׷����� ����Ƽ���� [Black]','cloth',98000,' [��Ű��] NYC LOCATION LONG SLEEVE T-SHIRTS [LROFCTR721M]','\cloth\cloth16.PNG',220);
insert into product values('C-17',' �� Ʈ��ġ ������ �� ������ ��','cloth',39000,' �� Ʈ��ġ ������ �� ������ ��','\cloth\cloth17.PNG',300);
insert into product values('C-18','������ ��� �̵� ��ĿƮ','cloth',39900,'������ ��� �̵� ��ĿƮ (321X27LYCA)','\cloth\cloth18.PNG',104);
insert into product values('C-19','ȭ��Ʈ�� ������ ��','cloth',179000,'ȭ��Ʈ�� ������ ��','\cloth\cloth19.PNG',10);
insert into product values('C-20',' ���� B-3 ������ ���� ����','cloth',738000,' SPERONE / real B3 mustang jacket brown','\cloth\cloth20.PNG',11);
insert into product values('C-22','W ȣ��Ʈ�Ƴ�����ǽ�(NA)','cloth',199000,' W ȣ��Ʈ�Ƴ�����ǽ�(NA) NAU / 523289','\cloth\cloth22.PNG',70);
insert into product values('C-23','21SS ���� �缱 �ΰ� Ʈ�� ť�� TWCUK5192-199','cloth',259000,' TAYLORMADE APPAREL / TWCUK5192-199','\cloth\cloth23.PNG',120);
insert into product values('C-24','WARM UP QUILTING JACKET BLACK','cloth',99000,' YALE / YB5JK0021BK','\cloth\cloth24.PNG',10);
insert into product values('C-25','���̳� ����Ʈ �ٿ� ����Ʈ [��]','cloth',36900,' MUSINSA STANDARD / MHVE5001-BK','\cloth\cloth25.PNG',20);
insert into product values('C-26','�������� M-1965 �ǽ����� ��ī_Vintage Black','cloth',143500,' [�̵��� ����] [������ ver.][3M �Ž�����Ʈ]�������� M-1965 �ǽ����� ��ī_Vintage Black LAFUDGESTORE / fudge','\cloth\cloth26.PNG',30);
insert into product values('C-27','[��� ����] �ʵ� ���� �� ','cloth',117000,' PARTIMENTO / [Vegan Leather] Field Jacket Black','\cloth\cloth27.PNG',500);


Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-01','��ȭ¥��ҽ�250g','food',5900,'¥��鿡 �ξ�Դ� �ҽ� �Դϴ�.','\food\food-1.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-02','�����Ѱ���','food',9900,'������ �����Դϴ�.','\food\food-2.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-03','��õ�߰���','food',19900,'���ִ� �߰��� �Դϴ�.','\food\food-3.PNG',50);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-04','���� �ձ���','food',27000,'�����Դϴ�.','\food\food-4.PNG',500);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-05','�����ѻ�������','food',17800,'���������Դϴ�.','\food\food-5.PNG',125);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-06','��¥�����ֵ���','food',24900,'�ֵ����Դϴ�.','\food\food-6.PNG',22);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-07','�Ұ��̿���','food',19400,'�̿����Դϴ�.','\food\food-7.PNG',30);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-08','����','food',21900,'�����Դϴ�.','\food\food-8.PNG',800);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-09','���','food',10690,'����Դϴ�.','\food\food-9.PNG',999);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-10','�ѿ���500g','food',51100,'�ѿ����Դϴ�.','\food\food-10.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-11','�ݼ���','food',14070,'�ݼ����Դϴ�.','\food\food-11.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-12','��','food',9810,'���Դϴ�.','\food\food-12.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-13','����','food',13900,'�����Դϴ�.','\food\food-13.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-14','����','food',11340,'�����Դϴ�.','\food\food-14.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-15','����','food',29520,'�����Դϴ�.','\food\food-15.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-16','����','food',10270,'�����Դϴ�.','\food\food-16.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-17','��','food',20900,'���Դϴ�.','\food\food-17.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-18','����','food',18900,'�����Դϴ�.','\food\food-18.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-19','�����','food',11850,'������Դϴ�.','\food\food-19.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-20','�����','food',23880,'������Դϴ�.','\food\food-20.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-21','������','food',20000,'�������Դϴ�.','\food\food-21.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-22','�߰�����','food',620,'�߰������Դϴ�.','\food\food-22.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-23','����','food',12400,'�����Դϴ�.','\food\food-23.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-24','����','food',5400,'�����Դϴ�.','\food\food-24.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-25','������','food',8910,'�������Դϴ�.','\food\food-25.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-26','ǥ�����','food',10780,'ǥ������Դϴ�.','\food\food-26.PNG',1);
Insert into PRODUCT (PRODUCTNUM,PRODUCTNAME,PRODUCTKIND,PRODUCTPRICE,PRODUCTCONTENT,PRODUCTIMAGE,PRODUCTSALES) values ('f-27','���İ�Ƽ��','food',6000,'���İ�Ƽ���Դϴ�.','\food\food-27.PNG',1);



insert into product values('S-01','�Ķ���� ������ ��Ư�� ���뽺/����','sports',30600,'�������Դϴ�.','\sports\sports-1.PNG',0);
insert into product values('S-02','����ŷ ���� ����� � �ⱸ','sports',158000,'�������Դϴ�.','\sports\sports-2.PNG',0);
insert into product values('S-03','�ĵ� ���̹� ����ƾ �뷱�� 304g','sports',21240,'�������Դϴ�.','\sports\sports-3.PNG',0);
insert into product values('S-04','K4�������Ƹ��� �ΰ���ö�� ġ�׵��� ��','sports',88190,'�������Դϴ�.','\sports\sports-4.PNG',0);
insert into product values('S-05','Ʈ���� ���ѷ� ������ �ʶ��׽� EPP 90cm ��','sports',19800,'�������Դϴ�.','\sports\sports-5.PNG',0);
insert into product values('S-06','�����˻���� NBR�䰡��Ʈ 10mm','sports',13470,'�������Դϴ�.','\sports\sports-6.PNG',2);
insert into product values('S-07','�����̾� �ٸ��ڼ�������� �㸮����','sports',19900,'�������Դϴ�.','\sports\sports-7.PNG',0);
insert into product values('S-08','�Ƶ�ٽ�/����Ű/������ ����/��������/���۹�','sports',13800,'�������Դϴ�.','\sports\sports-8.PNG',0);
insert into product values('S-09','�ٶ� ������ 1RM01141E100','sports',49500,'�������Դϴ�.','\sports\sports-9.PNG',0);
insert into product values('S-10','��ǰ ���� �ȭ ĳ�־�ȭ �౸ȭ ������','sports',29000,'�������Դϴ�.','\sports\sports-10.PNG',0);
insert into product values('S-11','��Ű �ִϾ� ��� �Ƶ� ����캸�� �尩','sports',11270,'�������Դϴ�.','\sports\sports-11.PNG',3);
insert into product values('S-12','6 in 1 ��Ƽ ���ӱ� �̴� �籸�� Ź��','sports',11270,'�������Դϴ�.','\sports\sports-12.PNG',0);
insert into product values('S-13','�Ƶ�ٽ� GN2034 ���Ͼ� ���� �����','sports',11270,'�������Դϴ�.','\sports\sports-13.PNG',0);
insert into product values('S-14','�����󸮽� 2000 �౸�� 5ȣ (��ǰ)','sports',49140,'�������Դϴ�.','\sports\sports-14.PNG',0);
insert into product values('S-15','�������� Ŀ�� ��ɼ� ��Ű�� ���庹','sports',70810,'�������Դϴ�.','\sports\sports-15.PNG',0);
insert into product values('S-16','���产�� G7 DUAL 18��ġ ����������','sports',697500,'�������Դϴ�.','\sports\sports-16.PNG',0);
insert into product values('S-17','�ؼ��� ��� �ؿ���/�ĵ� ����/���ѿ�ǰ','sports',5900,'�������Դϴ�.','\sports\sports-17.PNG',0);
insert into product values('S-18','�ö�ƽ ������� ���� ����� ������Ʈ','sports',30000,'�������Դϴ�.','\sports\sports-18.PNG',0);
insert into product values('S-19','�̽������� �޴�� ��ź���� ����','sports',47050,'�������Դϴ�.','\sports\sports-19.PNG',0);
insert into product values('S-20','���� ���ǵ��� ����(���Ͽ�)100g 30��','sports',12900,'�������Դϴ�.','\sports\sports-20.PNG',0);
insert into product values('S-21','���ڵ� 3�� ��꽺ƽ 2P 1��Ʈ','sports',34900,'�������Դϴ�.','\sports\sports-21.PNG',0);
insert into product values('S-22','�̼���� ���Ű�� �� Ʈ�� ���� ��ġ ������','sports',23870,'�������Դϴ�.','\sports\sports-22.PNG',1);
insert into product values('S-23','���ĵ� ����� ���� ������ ������ �⺻��','sports',81080,'�������Դϴ�.','\sports\sports-23.PNG',0);
insert into product values('S-24','���ȷ� ��ü ���� ��������','sports',18650,'�������Դϴ�.','\sports\sports-24.PNG',0);
insert into product values('S-25','���� ������ �ö�ְ� ȫ�� Ʃ��','sports',20700,'�������Դϴ�.','\sports\sports-25.PNG',0);
insert into product values('S-26','��� ��ȣ�� ȸ���ٰ� ���� ���','sports',14660,'�������Դϴ�.','\sports\sports-26.PNG',0);
insert into product values('S-27','�Ƿ�� �㸮��ȣ�� �㸮��ũ �㸮����','sports',23000,'�������Դϴ�.','\sports\sports-27.PNG',0);

create sequence EVENT;
INSERT INTO MEMBER VALUES('ADMIN','1111','������','1999','12','28','����','ADMIN@NAVER.COM','���ѹα� ����Ư���� �������� 63�� 50 (���ǵ���)','010-1234-5678','1');
INSERT INTO MEMBER VALUES('TEST123','11112','�����','1995','06','28','����','TEST123@NAVER.COM','�泲õ�Ƚ�','010-1434-1548',NULL);
INSERT INTO MEMBER VALUES('TEST1245','111123','�����','1969','12','28','����','TEST1234@NAVER.COM','�泲�ƻ��','010-1454-5125','');

insert into eventgesipan values(EVENT.nextval,'2��02�ϱ��� TV���� �̺�Ʈ !!','�߿�!�̺�Ʈ ���ǻ��� �����Ⱓ : 2022-01-27 ~ 2022-02.02(7�ϰ�) �������: �귣�庰 ��������� ����� ���� or ��ǰ �������� �� �̺�Ʈ ���� ���� ��� ��ǰ: �� ��ȹ�� �� ����� ��ǰ ','ADMIN',To_DATE('2022/01/27','YYYY/MM/DD'),0,'event1');
insert into eventgesipan values(EVENT.nextval,'�̺�Ʈ�Խ����Դϴ�2','�����Դϴ�','ADMIN',sysdate,0,'event-2');
insert into eventgesipan values(EVENT.nextval,'�̺�Ʈ�Խ����Դϴ�3','�̺�Ʈ�����Դϴ�','ADMIN',sysdate,0,'event-3');
insert into eventgesipan values(EVENT.nextval,'�̺�Ʈ�Խ����Դϴ�4','�����Դϴ�','ADMIN',sysdate,0,'event-4');
insert into eventgesipan values(EVENT.nextval,'�̺�Ʈ�Խ����Դϴ�5','�����Դϴ�','ADMIN',sysdate,0,'event-5');
insert into eventgesipan values(EVENT.nextval,'�̺�Ʈ�Խ����Դϴ�7','�����Դϴ�','ADMIN',sysdate,0,'event-6');
insert into eventgesipan values(EVENT.nextval,'�̺�Ʈ�Խ����Դϴ�8','�����Դϴ�','ADMIN',sysdate,0,'event-7');
insert into eventgesipan values(EVENT.nextval,'�̺�Ʈ�Խ����Դϴ�9','�����Դϴ�','ADMIN',sysdate,0,'event-8');
insert into eventgesipan values(EVENT.nextval,'�̺�Ʈ�Խ����Դϴ�10','�����Դϴ�','ADMIN',sysdate,0,'event-9');
insert into eventgesipan values(EVENT.nextval,'�̺�Ʈ�Խ����Դϴ�11','�����Դϴ�','ADMIN',sysdate,0,'event-10');
insert into eventgesipan values(EVENT.nextval,'�̺�Ʈ�Խ����Դϴ�12','�����Դϴ�','ADMIN',sysdate,0,'event-11');




create sequence USERGE;
insert into usergesipan values(USERGE.nextval,'ADMIN','�����Խ����Դϴ�.','�����Դϴ�',sysdate,0);
insert into usergesipan values(USERGE.nextval,'ADMIN','�����Խ����Դϴ�2.','�����Դϴ�',sysdate,0);


--�Խ��Ǵ��
INSERT INTO EVENTREPLY(BNO,RNO,CONTENT,ID) VALUES (1,EVENTREPLYSEQ.NEXTVAL,'�׽�Ʈ���','ADMIN');

commit;




