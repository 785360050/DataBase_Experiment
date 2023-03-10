-- ABEL,ALAN,BARD,BART
SHOW USER;

SELECT * FROM JEVON.EMP;

--VIEW
SELECT * FROM JEVON.EMP_INFO;

--根据员工ID查询员工所有信息
EXECUTE JEVON.EMP_INFO_SEARCH_ID('00101');

--查找部门名字
DECLARE
   NA JEVON.EMP_INFO.DEPTNAME%TYPE;
BEGIN 
   DBMS_OUTPUT.PUT_LINE(JEVON.PEPART_ID_TO_NAME('11'));
END; 

--ABEL,ALAN,BARD,Beau
SHOW USER;
SELECT * FROM JEVON.STOCK;

--查询产品缺少数量
EXECUTE JEVON.SHOW_PRODUCT_LACK_INFO;

--ABEL,ALAN,DAN
SHOW USER;

--用户订单信息
SELECT * FROM JEVON.CUSTOMR_ORDERED_INFO;

--查询订单编号输出客户信息和订单信息
EXECUTE JEVON.SHOW_ORDER_CUSTOMER('CR09');

--查找客户联系方式
DECLARE 
   PH JEVON.CUSTOMR_ORDERED_INFO.CUSTPHONE%TYPE;
BEGIN
   DBMS_OUTPUT.PUT_LINE(JEVON.CUSTOMER_CONTACT('C009'));
END;

--取消订单,同步删除发票
SELECT * FROM JEVON.ORD;
SELECT * FROM JEVON.INVOICE;

-- 利用触发器同步删除发票记录

alter table INVOICE  disable constraint FK_INVOICE_REFERENCE_ORD   CASCADE;
alter table INVOICE  ENABLE constraint FK_INVOICE_REFERENCE_ORD;

DELETE FROM JEVON.ORD WHERE ORDID='CR03';


--ABEL,ALAN,DES
SHOW USER;

--查询剩余库存空间
DECLARE
    CNT JEVON.STOCK.STIQTY%TYPE;
BEGIN
    CNT:=JEVON.STOCK_QUANTITY;
    DBMS_OUTPUT.PUT_LINE(CNT);
END;

--仓管入库产品，更新PROBUY库存信息
alter table STOCK  disable constraint FK_STOCK_REFERENCE_PRODUCT   CASCADE;
alter table STOCK  disable constraint PK_STOCK   CASCADE;

-- 利用触发器同步更新关联的数据
UPDATE JEVON.STOCK SET STIQTY=STIQTY+10 WHERE PROID='P002';
UPDATE JEVON.PROBUY SET STIQTY=STIQTY-20 WHERE PROID='P005';

alter table STOCK enable constraint FK_STOCK_REFERENCE_PRODUCT;
alter table STOCK enable constraint PK_STOCK;

SELECT * FROM JEVON.STOCK;
SELECT * FROM JEVON.PROBUY;

--防止库存数量小于0
SELECT * FROM JEVON.STOCK;

UPDATE JEVON.STOCK SET STIQTY=STIQTY-50 WHERE PROID='P002';



--ABEL,ALAN,DES,FORD
SHOW USER;
--生产管理科查询可交付的订单
EXECUTE JEVON.SHOW_AVAILABLE_ORDER;


--FORD
SHOW USER;
SELECT * FROM JEVON.EMP;
SELECT * FROM JEVON.STOCK;


