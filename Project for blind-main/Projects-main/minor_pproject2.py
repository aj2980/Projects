import speech_recognition as sr
import playsound
from gtts import gTTS
import os
import time
import datetime
import db_connection as db

num = 1

def speak(output):
    global num

    # num to rename every audio file
    # with different name to remove ambiguity
    num += 1
    print("Assistant : ", output)

    toSpeak =gTTS(text=output, lang='en', slow=False)
    # saving the audio file given by google text to speech
    file = str(num) + ".mp3"
    toSpeak.save(file)

    # playsound package is used to play the same file.
    playsound.playsound(file, True)
    os.remove(file)


def get_audio():
    rObject = sr.Recognizer()
    audio = ''

    with sr.Microphone() as source:
        print("Speak...")

        # recording the audio using speech recognition
        audio = rObject.listen(source, phrase_time_limit=5)
    print("Stop.")  # limit t secs

    try:

        text = rObject.recognize_google(audio, language='en-US')
        if(text.upper()=='TYPE'):
            speak("You may Type now: ")
            text=input()
        print("You : ", text)
        return text

    except:

        speak("Could not understand your audio, PLease try again ! If you want to type then you may say type.")
        return get_audio()


def book(train_info,board_stat,desti_stat,p_date):
    speak("Please say you name : ")
    fname = get_audio().upper()
    speak("Confirmation")
    fname = confirm(fname)

    speak("What is your gender : ")
    gender = get_audio().upper()
    speak("Confirmation ")
    gender = confirm(gender)
    if gender=='MALE'or gender=='MAIL':
        gender='M'
    elif gender=='FEMALE':
        gender='F'
    else :
        gender = 'T'
    speak("Your gender is : " + gender)

    speak("Say your bogi type i.e. sleeper, ac , general ")
    cell_type=get_audio().upper()
    speak("Confimation")
    cell_type=confirm(cell_type)
    speak("Your bogi type is : " +cell_type)
    if cell_type=='SLEEPER':
        cell_type='SL'
    elif cell_type=='GENERAL':
        cell_type='GN'
    elif cell_type=='AC':
        cell_type='AC'
    


    speak("Please verify your details : ")
    speak("Your name is : " + fname)
    speak("Your gender is : " + gender)
    speak("Your boarding address : " + board_stat)
    speak("Your destination address : " + desti_stat)
    speak("Your boarding date : " + p_date)
    speak("Train number : " + train_info)
    speak("Your bogi type : "+cell_type)
    speak("Are you sure you want to book ticket")
    l = get_audio().upper()
    if l == "YES":
        txt=db.book_ticket(train_info,fname,p_date,board_stat,desti_stat,gender,cell_type)
        
        if txt[0]==1:
            speak(txt[1])
            speak("Thanks for using our interference, Have a good day.")
        if txt[0]==0:
            speak(txt[1])
            book(train_info,board_stat,desti_stat,p_date)
    else:
        speak("Thanks for using our interface. Hope you have a good day ahead. ")
        return 0


def confirm(v):
    speak("you said " + v)
    if(v.upper()!='TYPE'):
        speak("what you said is correct : yes or no")
        co = get_audio().upper()
        if co == "YES":
            return v
        else:
            speak("Try saying again or you may say type if you want to type.")
            v = get_audio().upper()
            v = confirm(v)
            return v
    else:
        return v


def show_ticket():
    
    try:
        speak("Say your train number : ")
        train_no=get_audio().upper()

        speak("Say your Bogi type : ")
        bogi_type=get_audio().upper()
        if bogi_type=='SLEEPER':
            bogi_type='SL'
        elif bogi_type=='GENERAL':
            bogi_type='GN'
        elif bogi_type=='AC':
            bogi_type='AC'

        speak("Say your seat number : ")
        seat_no=get_audio().upper()

        unique_no=train_no+"-"+bogi_type+"-"+seat_no

        txt=db.show_ticket(unique_no)
        speak(txt[1])
        if txt[0]==0:
            show_ticket()
    except:
        show_ticket()



if __name__ =='__main__':
        
    con=0
    
    while con<3:
        
        print(" Book ticket")
        print(" Show ticket")

        speak("Welcome user. I am your assistant and i will guide you throughout this project.")
        time.sleep(2)

        speak("Please call your name.")

        a = get_audio().lower()
        speak("welcome " + a + ", hope you are fine.")
        z = "none"
        a = "none"
        board_stat = "none"
        desti_stat = "none"
        date = "none"
        e = "none"  # train number
        f = "none"
        name = "none"
        age = "none"
        k = "none"
        speak("Hello")
        time.sleep(2)
        speak("Say Book Ticket, to book your ticket or say Show Ticket, to show your previously booked tickets : ")
        j=get_audio().upper()
        speak("Confirmation")
        j=confirm(j)
        
        
        if j=='BOOK TICKET':

            j=1
            while(j):
                speak("What is your boarding date. Note that ticket could only booked from tomorrow onwards. ")
                date = get_audio().lower()
                speak("Confirmation")
                date = confirm(date)

                s = date.split()
                s[1]=s[1].lower()
                if s[1] == "january":
                    s[1] = "01"
                elif s[1] == "february":
                    s[1] = "02"
                elif s[1] == "march":
                    s[1] = "03"
                elif s[1] == "april":
                    s[1] = "04"
                elif s[1] == "may":
                    s[1] = "05"
                elif s[1] == "june":
                    s[1] = "06"
                elif s[1] == "july":
                    s[1] = "07"
                elif s[1] == "august":
                    s[1] = "08"
                elif s[1] == "september":
                    s[1] = "09"
                elif s[1] == "october":
                    s[1] = "10"
                elif s[1] == "november":
                    s[1] = "11"
                elif s[1] == "december":
                    s[1] = "12"

                s1 = s[0]
                s2 = s[1]
                s3 = "2021"
                s4 = s1 + "/" + s2 + "/" + s3
                d1 = datetime.datetime.now()
                d2 = datetime.datetime.strptime(s4, '%d/%m/%Y')
                diff = str(d2 - d1)
                diff1 = diff.split()
                diff1 = int(diff1[0])
                d2=str(d2)
                d2=d2.replace('00:00:00','')
                if diff1 > 0:
                    print("valid")
                    j=0
                    #i = -1
                # break
                else:
                    speak("Please enter a valid date.")
                    #i = i - 1
            stat_count=0
            while stat_count==0:

                speak("What is your boarding station")
                board_stat = get_audio().upper()
                speak("Confirmation")
                board_stat = confirm(board_stat)
                speak("You want to go from " + board_stat)

                speak("Now you have to tell where you want to go ")
                desti_stat = get_audio().upper()
                speak("Confirmation")
                desti_stat = confirm(desti_stat)
                speak("You want to go to " + desti_stat)
                # while i>0: i=2
                

                speak("You want to go on " + date)

                speak("Based on your given details here are the trains running from " + board_stat + " to " + desti_stat)
                txt=db.get_train(board_stat,desti_stat)
                speak(txt[1])
                if txt[0]==1:
                    stat_count=1

            speak("Say train number or name from the above info ")
            train_info= get_audio().upper()
            train_info=confirm(train_info)

            speak("You have selected train : "+train_info)
            speak("Do yo want to book ticket : ")
            f = get_audio().upper()
            if f == "YES":
                book(train_info,board_stat,desti_stat,d2)
            else:
                speak("Thanks for using our interface. Hope you have a good day ahead. ")
        
        elif j=='SHOW TICKET':
            show_ticket()
        
        y=input('''
If you want to delete passemger information from database : press D
If you want to show ticket data base in train : press S
    ''')
        if y=="D":
            no=input("Enter train number : ")
            txt=db.empty_train_info(no)
            while txt[0]==0:
                no=input("Enter train number : ")
                txt=db.empty_train_info(no)

        if y=="S":
            no=input("Enter train number : ")
            txt =db.show_ticket_admin(no)
            while txt==0:
                no=input("Enter train number : ")
                txt =db.show_ticket_admin(no)
        
        speak("Say yes if you want to exit")
        ex=get_audio().upper()
        if ex=="YES":
            con=3
    
        con=con+1