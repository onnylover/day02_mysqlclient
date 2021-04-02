
#error 부분은 모듈 재확인해서 수정

import mysql.connector

try:
    db = mysql.connector.connect(host='localhost', port='3306', database='webDB', user='webDB', password='webDB')

    # cursor install
    cursor = db.cursor(dictionary=True)

    # query activate
    query = "select no, first_name, last_name, email from emaillist order by no desc"
    cursor.execute(query)

    #result received
    results = cursor.fetchall()

    #resource close
    cursor.close()
    db.close()

    #print
    for result in results:
        print(result)

except mysql.connector.Error as e:
    print(f"apologize, please try again : (error detail: {e})")