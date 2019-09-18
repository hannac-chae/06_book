-- Book sample project table

/* 테이블 : BOOK                                | 테이블명 : MANAGER
   ---------------------------------------------|------------------------------------------
   컬럼명,      데이터 타입(크기),  제약조건    |컬럼명,        데이터 타입(크기), 제약조건
   ---------------------------------------------|-------------------------------------------
   BOOK_SEQ     NUMBER              PK          |MANAGER_SEQ    NUMBER              PK
   ISBN         VARCHAR2(13)        U           |MANAGER_ID     VARCHAR2(10)        U   
   TITLE        VARCHAR2(50)        NOT NULL    |NAME           VARCHAR2(30)
   AUTHOR       VARCHAR2(30)                    |PASSWORD       VARCHAR2(10)        NOT NULL
   CONTENT      VARCHAR2(3000)                  |REG_ID         VARCHAR2(10)  
   COMPANY_CD   NUMBER(4)                       |REG_DATE       DATE                SYSDATE
   TOTAL_PAGE   NUMBER(4)                       |MOD_ID         VARCHAR2(10) 
   PRICE        NUMBER(6)                       |MOD_DATE       DATE   
   QUANTITY     NUMBER(4)                       |
   REG_ID       VARCHAR2(10)                    |
   REG_DATE     DATE                SYSDATE     |
   MOD_ID       VARCHAR2(10)                    |
   MOD_DATE     DATE                            |
   ==============================================================================================
   */
DROP TABLE BOOK;
CREATE TABLE BOOK
( BOOK_SEQ     NUMBER              
, ISBN         VARCHAR2(13)        
, TITLE        VARCHAR2(50)        NOT NULL    
, AUTHOR       VARCHAR2(30)                    
, CONTENT      VARCHAR2(3000)                  
, COMPANY_CD   NUMBER(4)                       
, TOTAL_PAGE   NUMBER(4)                       
, PRICE        NUMBER(6)                       
, QUANTITY     NUMBER(4)                       
, REG_ID       VARCHAR2(10)                    
, REG_DATE     DATE                DEFAULT SYSDATE     
, MOD_ID       VARCHAR2(10)                    
, MOD_DATE     DATE
, CONSTRAINT PK_BOOK         PRIMARY KEY (BOOK_SEQ)
, CONSTRAINT U_BOOK_ISBN    UNIQUE (ISBN)
);

INSERT INTO BOOK 
(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
VALUES (SEQ_BOOK.NEXTVAL, '9788936433598', '채식주의자', '한강'
       , '맨부커 상을 받은 한강의 소설', 1001, 247, 10800, 5, 0);

INSERT INTO BOOK 
(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
VALUES (SEQ_BOOK.NEXTVAL, '9788936471019', '정선 목민심서', '정약용'
       , '다산연구회가 1985년에 전 6권으로 완간한 <역주 목민심서>를 각계각층 남녀노소 모두가 읽을 수 있는 대중적인 교양서로 개편한 책이다. 중요한 내용만을 선별하여 한 권으로 대폭 줄이고, 읽기 쉽게 문장을 다듬었다. 1부 6조, 도합 12부 72조로 구성된 체제의 원형은 그대로 유지하고 있다.

<목민심서>는 다산 정약용이 강진의 귤동 유배지에 쓴 대표적인 저술이다. 요즘 개념으로는 지방행정의 지침서로, 민생을 중심에 둔 사고의 방향에서 정치제도의 개혁과 지방행정의 개선을 도모하였다. 풍부한 사실과 논리를 바탕으로 당시의 실상과 관행을 파고들며, 구체적이고 분석적으로 병폐의 원인을 찾고 치유책을 고안하고 있다.', 1001, 343, 13500, 5, 0);

INSERT INTO BOOK 
(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
VALUES (SEQ_BOOK.NEXTVAL, '9788936452247', '지금 독립하는 중입니다', '하지현'
       , '십 대를 위한 마음 처방전
정신과 의사이자, 다양한 심리 관련 저서를 통해 현대인들의 정신 건강 주치의로도 활약하고 있는 하지현이 대한민국 청소년의 마음을 설명하고 조언하는 책을 냈다.『지금 독립하는 중입니다』는 십 대에 나타나는 신체적 정신적 변화부터 공부 스트레스, 친구 문제, 진로 불안까지 지금 청소년이라면 누구나 갖고 있는 대표적인 마음속 갈등과 고민들을 담았다. 20여 년간 수많은 부모와 청소년을 상담하면서 쌓은 경험과 노하우가 집약되어 있다.

저자는 십 대 시절에 찾아오는 다양한 마음의 변화와 파장들을 종합적으로 설명한다. 우선 1부에서는 2차 성징 이후 나타나는 신체적 변화와 뇌의 발달을 이야기한다. 내 몸에 어떤 변화가 일어나고, 그것이 어떤 혼란을 가져오는지 밝힌다. 2부에서는 마음에 더욱 집중한다. 십 대가 되면 왜 마음이 공허해지는지, 자존감은 어떻게 쌓이는지 차근차근 설명한다. 3부에서는 청소년들이 느끼는 공부 스트레스를 설명하면서, 스트레스를 가중시키는 잘못된 공부법에 대해서도 지적한다. 4부와 5부에서는 인간관계의 양상이 달라지고 복잡해지는 것이 자연스러운 과정이며, 그로 인해 찾아오는 자기 개념의 혼란 역시 필요한 과정임을 친절하게 설명한다. 6부에는 진로 고민과 관련해 전해 주고 싶은 말을 주로 담았다.', 1001, 212, 10800, 5, 0);

INSERT INTO BOOK 
(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
VALUES (SEQ_BOOK.NEXTVAL, '9788936486327', '문명의 대전환을 공부하다', '백낙청 외 , 창비담론 아카데미'
       , '근대적응과 근대극복의 지평 속에서 새로운 가능성을 탐구한다!
서로 배우고 가르치며 깨친 문명전환의 지혜
', 1001, 344, 13500, 5, 0);

       
INSERT INTO BOOK 
(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
VALUES (SEQ_BOOK.NEXTVAL, '9791159039690', '어린왕자(초판본)', '생텍쥐페리', '세상에서 가장 순수한 영혼,
‘어린 왕자’ 이야기
오리지널 초판본 표지디자인!
세상에서 가장 순수한 영혼, 《어린 왕자》 오리지널 초판본 표지디자인!
생텍쥐페리는 프랑스의 유명한 소설가로, 그의 작품 《어린 왕자》는 전 세계적으로 《성경》, 《자본론》 다음으로 많이 읽히는 책이다. 250여 개 언어로 번역되었고 1억 부 이상이 팔렸다.
그런데 아이러니하게도 《어린 왕자》는 프랑스가 아니라 미국 뉴욕에서 처음 출판되었다. 당시 생텍쥐페리는 제2차 세계대전으로 미국에서 망명 중이었고, 《어린 왕자》는 1943년 4월 6일에 영어판과 프랑스어판으로 뉴욕에서 동시 출간되었다.
도서출판 더스토리에서 출간한 초판본 《어린 왕자》는 1943년 뉴욕에서 출판된 프랑스어판 초판본 표지디자인을 그대로 되살렸다. 어둡지도 너무 빛바래지도 않은 노란색 표지와 어린 왕자의 연둣빛 옷의 색감이 잘 살아 있으며, 본문에는 생텍쥐페리의 친필 사인이 들어 있다.
또한 작가가 직접 그린 일러스트들이 시적이고 아름다운 어린 왕자의 이야기를 더욱 풍성하게 만들어준다.

“어른들은 모두 처음에는 어린이였다. 그러나 대부분 어린 시절을 기억하지 못한다.”
“사막이 아름다운 이유는 어딘가에 오아시스를 숨기고 있기 때문일 거예요.”
', 1002, 150, 8820, 5, 0);


INSERT INTO BOOK 
(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
VALUES (SEQ_BOOK.NEXTVAL, '9791190182645', '제 인생에 답이 없어요', '선바', '유튜버 선바가 펼치는 조금 이상해도 은근히 설득력 있는 인생 해법!
50만 구독자의 웃음을 책임지는 유튜버 선바의 만담 에세이 『제 인생에 답이 없어요』. 대학을 10년째 다니고 있는 학생이자 게임 스트리밍 전문 유튜버 선바가 방송으로는 못다 한 드립과 생각을 엮은 책으로, 약간 망했어도 즐겁게 내 갈 길을 가는 힘에 대해 이야기한다. 1인 크리에이터로 사는 법, 인터넷 방송과 유머에 대한 그만의 지론은 물론, 인생이 적성이 아닌 사람들을 위한 삶의 TMI와 꿀팁을 풀어놓는다.'
      , 1003, 192, 10800, 5, 0);

INSERT INTO BOOK 
(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
VALUES (SEQ_BOOK.NEXTVAL, '9791196394509', '죽고 싶지만 떡볶이는 먹고 싶어', '백세희', '의심 없이 편안하게 사랑하고 사랑받고 싶은 한 사람의 이야기
10년 넘게 기분부전장애(가벼운 우울 증상이 지속되는 상태)와 불안장애를 겪으며 정신과를 전전했던 저자와 정신과 전문의와의 12주간의 대화를 엮은 『죽고 싶지만 떡볶이는 먹고 싶어』. 지독히 우울하지도 행복하지도 않은 애매한 기분에 시달렸고, 이러한 감정들이 한 번에 일어날 수 있다는 사실을 알지 못해서 괴로웠던 저자는 2017년 잘 맞는 병원을 찾아 약물치료와 상담치료를 병행하고 있다.'
       , 1004, 208, 12000, 5, 0);


INSERT INTO BOOK 
(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
VALUES (SEQ_BOOK.NEXTVAL, '9791196394578', '죽고 싶지만 떡볶이는 먹고 싶어 2', '백세희', '우울에 도취되기보다 나를 긍정하기에 골몰하려고 애쓰는 한 사람의 이야기
10년 넘게 기분부전장애(가벼운 우울 증상이 지속되는 상태)와 불안장애를 겪으며 정신과 전문의와 나눴던 12주간의 대화를 잊지 않기 위해 녹취를 풀어 쓴 것에서 시작된 《죽고 싶지만 떡볶이는 먹고 싶어》로 2018년 한 해 큰 사랑을 받았던 백세희 작가가 1권에 마저 담지 못했던 내용을 포함해 그 이후에 이어진 16주간의 상담기록을 엮은 『죽고 싶지만 떡볶이는 먹고 싶어』 제2권.

사적인 이야기가 가득하지만 어두운 감정만 풀어내기보다는 구체적인 상황을 통해 근본적인 원인을 찾고, 건강한 방향으로 나아가는 것에 중점을 둔 이 책은 겉보기에는 멀쩡하지만 속은 곪아 있는, 지독히 우울하지도 행복하지도 않은 사람들, 타인의 시선으로부터 자유롭지 못하고, 불완전하고, 구질구질한 우리 모두의 이야기이기도 하다. 저자의 진솔한 자기고백이 슬픔을 모두 가져가주지는 못하겠지만, 적어도 울지 않는 사람이 아니라 울고 싶을 때 울 수 있는 사람이 되도록 다시 한 번 도와줄 것이다.'
       , 1004, 264, 12000, 5, 0);


INSERT INTO BOOK 
(BOOK_SEQ, ISBN, TITLE, AUTHOR, CONTENT, COMPANY_CD, TOTAL_PAGE, PRICE, QUANTITY, REG_ID)
VALUES (SEQ_BOOK.NEXTVAL, '9788956055466', '책은 도끼다', '박웅현', '인문학으로 광고하는 박웅현이 들려주는
풍요로운 삶을 위한 깊이 있는 책 읽기의 정수!
‘넥타이와 청바지는 평등하다’, ‘나이는 숫자에 불과하다’, ‘사람을 향합니다’, ‘진심이 짓는다’, ‘생각이 에너지다’ 등 인간을 향한 따뜻한 시선이 담긴 가치 지향적 광고를 만들며 ‘인문학으로 광고하는’ 광고인으로서 자신만의 독보적인 스타일을 구축한 박웅현. 그는 말한다. 창의력의 전장인 광고계에서 30여 년간 광고를 만들 수 있었던 바탕에는 인문학이 있었고, 그 중심에는 ‘책’이 있었다고. 책을 통해 얻은 예민해진 촉수가 자신의 생업을 도왔다고. 『책은 도끼다』는 인문학적 깊이가 느껴지면서도 사람들의 마음에 깊은 울림을 남긴 광고를 만들어온 저자가 자신의 창의성과 감성을 일깨웠던, 이제는 고전으로 손꼽히는 책들을 소개하는 인문교양서이다.'
      , 1005, 348, 16000, 5, 0);
COMMIT;
-------------------------------------------------------------------------   
DROP TABLE MANAGER;
CREATE TABLE MANAGER
( MANAGER_SEQ    NUMBER              
, MANAGER_ID     VARCHAR2(10)        NOT NULL 
, NAME           VARCHAR2(30)
, PASSWORD       VARCHAR2(10)        NOT NULL
, REG_ID         VARCHAR2(10)  
, REG_DATE       DATE                DEFAULT SYSDATE
, MOD_ID         VARCHAR2(10) 
, MOD_DATE       DATE
, CONSTRAINT PK_MANAGER  PRIMARY KEY(MANAGER_SEQ)
, CONSTRAINT U_MANAGER_ID UNIQUE(MANAGER_ID)
);

INSERT INTO MANAGER (MANAGER_SEQ, MANAGER_ID, NAME, PASSWORD, REG_ID)
VALUES (0, 'root', '수퍼관리자', 'root', 0);

INSERT INTO MANAGER (MANAGER_SEQ, MANAGER_ID, NAME, PASSWORD, REG_ID)
VALUES (SEQ_MANAGER.NEXTVAL, 'admin', '관리자', 'admin', 0);

COMMIT;

/*---------------------------------------------|--------------------------------------------
  테이블 명 : CODE                             |
-----------------------------------------------|--------------------------------------------*/
DROP TABLE CODE;
CREATE TABLE CODE 
(  CODE         NUMBER(4)          
 , P_CODE       NUMBER(4)           NOT NULL
 , CODE_NM      VARCHAR2(60)        NOT NULL   
 , CODE_VAL     VARCHAR2(300)       NOT NULL
 , USE_YN       CHAR(1)
 , CODE_DESC    VARCHAR2(300)
 , SORT_ORDER   NUMBER              NOT NULL
 , REG_ID       VARCHAR2(10)
 , REG_DATE     DATE                DEFAULT SYSDATE
 , MOD_ID       VARCHAR2(10)  
 , MOD_DATE     DATE 
 , CONSTRAINT PK_CODE PRIMARY KEY (CODE)
);

/* ---------------------------------------------------------------------------------------------
   출판사 번호와 출판사 이름을 코드로 관리
   출판사 관련 코드는 1000 번대가 출판사 코드
   자세한 개별 출판사의 정보는 1001, 1002, 1003, ... 순서로 증가하도록 실제 데이터를 넣고 시작
*/
-- CODE 출판사 INSERT INTO 구문 작성
INSERT INTO CODE (CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
VALUES (1000, 0, 'COMPANY', '출판사', 'Y', '출판사 코드', 0, 0);
INSERT INTO CODE (CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
VALUES (1001, 1000, 'CHANGBI', '창비', 'Y', '창작과 비평사', 0, 1);
INSERT INTO CODE (CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
VALUES (1002, 1000, 'THE_STORY', '더스토리', 'Y', '더 스토리', 0, 2);
INSERT INTO CODE (CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
VALUES (1003, 1000, 'WISDOM', '위즈덤', 'Y', '위즈덤 하우스', 0, 3);
INSERT INTO CODE (CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
VALUES (1004, 1000, 'HUEN', '흔', 'Y', '독립출판 흔', 0, 4);
INSERT INTO CODE (CODE, P_CODE, CODE_NM, CODE_VAL, USE_YN, CODE_DESC, SORT_ORDER, REG_ID)
VALUES (1005, 1000, 'BOOK_HOUSE', '북하우스', 'Y', '북하우스', 0, 5);
COMMIT;
/*------------------------------------------------------------------------------------------
   시퀀스 명 : SEQ_BOOK, SEQ_MANAGER : NOCYCLE, NOMAXVALUE, 1씩 증가
 ------------------------------------------------------------------------------------------*/
DROP SEQUENCE SEQ_BOOK;
CREATE SEQUENCE SEQ_BOOK   
NOCYCLE
NOMAXVALUE
INCREMENT BY 1
;

DROP SEQUENCE SEQ_MANAGER;
CREATE SEQUENCE SEQ_MANAGER   
NOCYCLE
NOMAXVALUE
INCREMENT BY 1
;