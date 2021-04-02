
#error 부분은 모듈 재확인해서 수정

import mysql.connector
try:
    db = mysql.connector.connect(host='localhost', port='3306', database='webDB', user='webDB', password='webDB')

    # cursor install
    cursor = db.cursor(dictionary=True)

    # insert query activate
    query = """insert into emaillist values(null, "OH", "SUMMER", "dufma72@naver.com")"""

    # 입력하는거라 결과값을 따로 받지 않고, 처리된 결과에 대해서 확인
    count = cursor.execute(query)

    #commit (insert, update, delete는 qksemtl vlfdygka)
    db.commit()

    #resource close
    cursor.close()
    db.close()

    #결과확인하기
    print(f"activate result: {count==1}")
except mysql.connector.Error as e:
    print(f"apologize, please try again : (error detail: {e})")