
import mysql.connector

try:
    #비밀번호나 유저 같은 정보는 직접 입력대신 파일을 연계해서 숨겨둠
    db = mysql.connector.connect(host='localhost', port='3306', database='1webDB', user='webDB', password='webDB')
    print("ok")
except mysql.connector.Error as e:
    print(f"apologize, please try again : (error detail: {e})")



