from emaillistapp import model

def run_list():
    results = model.findall()
    #index = 1
    for index,result in enumerate(results):
        print(f'{index+1} : {result["first_name"]} {result["last_name"]} : {result["email"]}')
        #index += 1 #바로 인덱스 처리 할수 있음 enumerate

def run_add():
    #잘못 넣는것에 대해서는 기능 추가 할 수 있음
    firstname = input ("first name? : ")
    lasttname = input("last name? : ")
    email = input("email? : ")
    model.insert(firstname,lasttname,email)

    #입력내용 확인을 위한 리스트 함수 콜
    run_list()

def run_dele():
    email = input("email? :")
    model.deletebyemail(email)
    run_list()

def main() :
    while True:
        cmd = input(f"(l)ist, (a)dd, (d)elete, (q)uit : ")
        if cmd == "q":
            break
        elif cmd == "l":
            run_list()
        elif cmd == "a":
            run_add()
        elif cmd == "d":
            run_dele()
        #print(f"execute {cmd}")
        else:
            print("wrong input, please again")

#if 문 대신에 이중 Ture로 실행조건 확인해서 처리 되는게 가능함
__name__ == "__main__" and main()

# if __name__ == "__main__":
#     main()
