import mysql.connector

def conn():
    return  mysql.connector.connect(host='localhost', port='3306', database='webDB', user='webDB', password='webDB')

def findall():
    db = conn()

    # cursor install
    cursor = db.cursor(dictionary=True)

    # query activate
    query = "select no, first_name, last_name, email from emaillist order by no desc"
    cursor.execute(query)

    # result received
    results = cursor.fetchall()

    # resource close
    cursor.close()
    db.close()

    #반환
    return results

def insert (firstname, lastname, email):
    db = conn()

    # cursor install
    cursor = db.cursor(dictionary=True)

    # insert query activate
    query = """insert into emaillist values(null, %s, %s, %s) """

    # 입력하는거라 결과값을 따로 받지 않고, 처리된 결과에 대해서 확인
    count = cursor.execute(query, (firstname,lastname,email))

    # commit (insert, update, delete는 qksemtl vlfdygka)
    db.commit()

    # resource close
    cursor.close()
    db.close()

    #return
    return count == 1

def deletebyemail(email):
    db = conn()

    # cursor install
    cursor = db.cursor(dictionary=True)

    # insert query activate
    query = f'''delete from emaillist where email="{email}"'''

    # 입력하는거라 결과값을 따로 받지 않고, 처리된 결과에 대해서 확인
    count = cursor.execute(query)

    # commit (insert, update, delete는 qksemtl vlfdygka)
    db.commit()

    # resource close
    cursor.close()
    db.close()