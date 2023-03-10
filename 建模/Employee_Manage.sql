SELECT * FROM EMP;
SELECT * FROM DEPART;


------------------------------------------------------------------
-- FUNCTION PEPART_ID_TO_NAME: 查找部门名字(deptno)
------------------------------------------------------------------
CREATE OR REPLACE FUNCTION PEPART_ID_TO_NAME(ID IN EMP.EMPID%TYPE)
RETURN DEPART.DEPTNAME%TYPE
AS
   NA DEPART.DEPTNAME%TYPE;
BEGIN
   SELECT DEPART.DEPTNAME INTO NA FROM DEPART WHERE DEPTNO=ID;
   RETURN(NA);
END;
DROP FUNCTION PEPART_ID_TO_NAME;

DECLARE
   NA DEPART.DEPTNAME%TYPE;
BEGIN 
   DBMS_OUTPUT.PUT_LINE(PEPART_ID_TO_NAME('11'));
END; 

SELECT * FROM EMP,DEPART WHERE EMP.DEPTNO=DEPART.DEPTNO;

GRANT EXECUTE ON PEPART_ID_TO_NAME TO ABEL,ALAN,BARD,BART; 
------------------------------------------------------------------
-- VIEW EMP_INFO: EMPLOYEE相关的所有信息
------------------------------------------------------------------
SELECT * FROM EMP;
SELECT * FROM DEPART;
CREATE OR REPLACE VIEW EMP_INFO
AS
    SELECT 
        EMPID,EMPNAME,PRO,MGR,SAL,COMM,EDUCA,
        EXPER,EMPADD,DEPTNAME,LOC,EMPPHONE,EMAIL,HIREDATE
    FROM JEVON.DEPART,JEVON.EMP WHERE EMP.DEPTNO=DEPART.DEPTNO;

SELECT * FROM EMP_INFO;
DROP VIEW EMP_INFO;

GRANT SELECT ON EMP_INFO TO ABEL,ALAN,BARD,BART; 
------------------------------------------------------------------
-- PROCEDURE EMP_INFO_SEARCH_ID: 根据员工ID查询员工所有信息
------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE EMP_INFO_SEARCH_ID
(IN_ID IN EMP_INFO.EMPID%TYPE)
AS 
   OUT_EMP EMP_INFO%ROWTYPE;
BEGIN
   SELECT * INTO OUT_EMP FROM JEVON.EMP_INFO WHERE EMPID=IN_ID;
   DBMS_OUTPUT.PUT_LINE('EmpId: '||OUT_EMP.EmpId);
   DBMS_OUTPUT.PUT_LINE('EmpName: '||OUT_EMP.EmpName);
   DBMS_OUTPUT.PUT_LINE('PRO: '||OUT_EMP.PRO);
   DBMS_OUTPUT.PUT_LINE('MGR: '||OUT_EMP.MGR);
   DBMS_OUTPUT.PUT_LINE('Sal: '||OUT_EMP.Sal);
   DBMS_OUTPUT.PUT_LINE('COMM: '||OUT_EMP.COMM);
   DBMS_OUTPUT.PUT_LINE('Educa: '||OUT_EMP.Educa);
   DBMS_OUTPUT.PUT_LINE('Exper: '||OUT_EMP.Exper);
   DBMS_OUTPUT.PUT_LINE('EmpAdd: '||OUT_EMP.EmpAdd);
   DBMS_OUTPUT.PUT_LINE('DeptNAME: '||OUT_EMP.DEPTNAME);
   DBMS_OUTPUT.PUT_LINE('DEPT_LOC: '||OUT_EMP.LOC);
   DBMS_OUTPUT.PUT_LINE('EmpPhone: '||OUT_EMP.EmpPhone);
   DBMS_OUTPUT.PUT_LINE('Email: '||OUT_EMP.Email);
   DBMS_OUTPUT.PUT_LINE('HireDate: '||OUT_EMP.HireDate);
END;


EXECUTE EMP_INFO_SEARCH_ID('00101');

DROP PROCEDURE EMP_INFO_SEARCH_ID;

GRANT EXECUTE ON EMP_INFO_SEARCH_ID TO ABEL,ALAN,BARD,BART; 