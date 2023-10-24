import mysql.connector as sq
from gtts import gTTS
import os
import playsound 
import speech_recognition as sr
import time
import datetime


# to connect to the database
try:
    conn = sq.connect(host='localhost', user='root', password='1234', database='mp2')
except:
    print("connection not successful")
else:
    print(' Connection sucessful ')


# To get train details on the basis of boarding station and destination station
def get_train(board_stat, desti_stat):

    mycrsr=conn.cursor()

    q_board_stat= '%'+board_stat+'%'
    q_desti_stat='%'+desti_stat+'%'

    train_info_sql = ("select train_no,train_name from train_info where train_no in (select train_no from train_info where station_name like %s) AND station_name like %s AND SEQ<>1")
    
    try:
        mycrsr.execute(train_info_sql,(q_board_stat,q_desti_stat))
        result = mycrsr.fetchall()
        if len(result)==0:
            txt="Sorry no trains avialable "
            print(txt)
            return (0,txt)

        elif len(result)>0:    
            txt= ' Details of trains are as follows :-  '
            for item in result:
                item = str(item)
                txt= txt+item
            print(txt)
            mycrsr.close()
            return (1,txt) 

    except:
        txt="Incorrect details provided"
        print(txt)
        return (0,txt)


# to get train no of a train
def get_train_no(train_info):
    try:
        train_info=int(train_info)
        return train_info
    except:
        mycrsr=conn.cursor()
        sql="select distinct(train_no) from train_info where train_name like %s"
        mycrsr.execute(sql,(train_info,))
        result=mycrsr.fetchone()
        train_no=result[0]
        mycrsr.close()
        return train_no
        

# To book ticket on the basis of detils passed to the function
def book_ticket (p_train_info,p_name,p_date,p_board_stat,p_desti_stat,p_sex,p_cell_type):
    
    p_train_info=get_train_no(p_train_info)
    
    mycrsr1=conn.cursor(buffered=True)
    mycrsr2=conn.cursor()

    q_board_stat='%'+p_board_stat+'%'
    q_desti_stat='%'+p_desti_stat+'%'

    train_info_sql1='select * from train_info where station_name like %s and train_no= %s'
    train_info_sql2='select * from train_info where station_name like %s and train_no= %s'


    try:
        mycrsr1.execute(train_info_sql1, (q_board_stat, p_train_info))
        mycrsr2.execute(train_info_sql2, (q_desti_stat, p_train_info))

        result1=mycrsr1.fetchone()
        result2=mycrsr2.fetchone()

        row=result1
        p_arrival_time=row[5]
        p_departure_time=row[6]
        p_board_stat=row[4]
        distance_1=row[7]
        
        row = result2
        p_desti_stat=row[4]
        distance_2=row[7]
    
        p_distance= distance_2-distance_1

        if p_cell_type =='GN':
            fare=p_distance*.76
        elif p_cell_type=='SL':
            fare=p_distance*0.92
        elif p_cell_type=='AC':
            fare=p_distance*1.3
    
        mycrsr1.close()
        mycrsr2.close()

        mycrsr=conn.cursor()

        q_train_info='t_'+ str(p_train_info)

        p_query='update {q_train_info} set p_name = %s,p_date = %s,p_board_stat = %s,p_departure_time =%s,p_desti_stat = %s,p_arrival_time = %s,p_fare = %s,p_distance = %s,gender = %s where cell_type = %s and p_name is null limit 1'.format(q_train_info=q_train_info)

        mycrsr.execute (p_query, ( p_name, p_date, p_board_stat, p_departure_time, p_desti_stat, p_arrival_time, fare, p_distance, p_sex, p_cell_type))
        conn.commit()
        
        # give each paasenger a unique id such that they can see their ticket
        mycrsr.execute('select p_arrival_time,seat_no,concat(train_no,"-",cell_type,"-",seat_no) as unique_no from {q_train_info} where p_name like %s'.format(q_train_info=q_train_info),(p_name,))

        result=mycrsr.fetchone()
        unique_no= (result[2])
        seat_no= (result[1])
        arrival_t= (result[0])
    except:
        txt='''    Incorrect details provided, please try again'''
        print(txt)
        return (0,txt)
    else:
        txt=f'''    Your ticket is booked.
    It has a unique number :- {unique_no}
    Seat number is :- {seat_no}
    Arrival time :- {arrival_t}
    '''
        mycrsr.close()
        print(txt)
        return (1,txt)


# to get train no, bogi type and seat no from unique no
def get_unique_no(unique_no):

    train_no=''
    for i in range(len(unique_no)):
        if unique_no[i]!="-":
            train_no=train_no+unique_no[i]
        else:
            k=i
            break

    bogi=''
    for i in range(k+1,len(unique_no)):
        if unique_no[i]!="-":
            bogi=bogi+unique_no[i]
        else:
            k=i
            break

    seat_no=''
    for i in range(k,len(unique_no)):
        if unique_no[i]!="-":
            seat_no=seat_no+unique_no[i]

    return(train_no,bogi,seat_no)


# show ticket to the passenger
def show_ticket(unique_no):

    info=get_unique_no(unique_no)
    train_no=int(info[0])
    cell_type=info[1]
    seat_no=int(info[2])

    mycrsr=conn.cursor(buffered=True)
    mycrsr2=conn.cursor(buffered=True)

    p_train_info='t_'+str(train_no)

    sql="select * from {p_train_info} where cell_type like %s and seat_no = %s".format(p_train_info=p_train_info)

    try:
        mycrsr.execute(sql,(cell_type,seat_no))
        rslt=mycrsr.fetchone()

        sql2="select distinct(train_name) from train_info where train_no = %s"
        mycrsr2.execute(sql2,(train_no,))
        rslt2=mycrsr2.fetchone()

        details=f''' The details of your ticket are as follows : 
        Train number : {rslt[11]}
        Train name: {rslt2[0]}
        Coach type : {rslt[1]}
        Seat number : {rslt[0]}
        Boarding station : {rslt[4]}
        Destination station : {rslt[6]}
        Arrival time : {rslt[7]}
        Departure time : {rslt[5]}
        Fare : {rslt[8]}
        Passenger name : {rslt[2]}
        Journey distance : {rslt[9]}
        Passenger Gender : {rslt[10]}
        '''
        mycrsr.close()
        mycrsr2.close()
        return (1,details)
    except:
        txt="Incorrect details, please try again"
        print(txt)
        return (0,txt)


# show all data of train from data data base
def show_ticket_admin(train_no):
    q_train_info="t_"+str(train_no)
    sql="select * from {q_train_info} where p_name is not null".format(q_train_info=q_train_info)
    mycrsr=conn.cursor()
    try:
        mycrsr.execute(sql)
        rslt=mycrsr.fetchall()
        details=''' The details of tickets are as follows : 
        '''
        for row in rslt:
            details=details+f'''
        Train number : {row[11]}
        Coach type : {row[1]}
        Seat number : {row[0]}
        Boarding station : {row[4]}
        Destination station : {row[6]}
        Arrival time : {row[7]}
        Departure time : {row[5]}
        Fare : {row[8]}
        Passenger name : {row[2]}
        Journey distance : {row[9]}
        Passenger Gender : {row[10]}
        '''
        
        mycrsr.close()
        print(details)
        return 1
    except:
        print("Enter correct train number")
        return 0




# delete passenger details from database
def empty_train_info(train_info):
    train_info=get_train_no(train_info)
    q_train_info='t_'+str(train_info)
    mycrsr=conn.cursor()
    q_empty_train='update {q_train_info} set p_name = NULL,p_date = NULL,p_board_stat = NULL,p_departure_time =NULL,p_desti_stat = NULL,p_arrival_time = NULL,p_fare = NULL,p_distance = NULL,gender = NULL'.format(q_train_info=q_train_info)
    try:
        mycrsr.execute(q_empty_train)
        conn.commit()
        txt= f'Passenger details removed successfully from {q_train_info}'
        print(txt)
        mycrsr.close()
        return (1,txt)
    except:
        txt= "Cannot remove train data, try again with correct information"
        print(txt)
        return (0,txt)
    

# only for testing if functions are working properly or not
# currently all funcions are working correctly 02-05-2021

if __name__=='__main__':
    print(empty_train_info(12175))