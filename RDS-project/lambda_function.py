import sys
import logging
import pymysql

rds_host  = "publicrds.ccv7zxmdbpcr.us-east-1.rds.amazonaws.com"
name = "admin"
password = "zaraf123"
db_name = "testdb"
port = 3306
conn = pymysql.connect(host=rds_host, user=name,password=password,db=db_name,port=port) 


def lambda_handler(event, context):
    """
    This function inserts content into mysql RDS instance
    """
    item_count = 0

    with conn.cursor() as cur:
        cur.execute("create table Employee_test (EmpID  int NOT NULL, Name varchar(255) NOT NULL, PRIMARY KEY (EmpID))")
        cur.execute('insert into Employee_test (EmpID, Name) values(1, "Joe")')
        cur.execute('insert into Employee_test (EmpID, Name) values(2, "Bob")')
        cur.execute('insert into Employee_test (EmpID, Name) values(3, "Mary")')
        conn.commit()
        cur.execute("select * from Employee_test")
        for row in cur:
            item_count += 1
    return "Added %d items to RDS MySQL table" %(item_count)