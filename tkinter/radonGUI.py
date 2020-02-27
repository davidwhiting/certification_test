from tkinter import *
import pymysql as mdb
import pandas as pd
import time
from tkinter import messagebox
import datetime
import re
import os

class App(object):
    def __init__(self, window,ip,user,pswd,db):
        self.ip=ip
        self.user=user
        self.pswd=pswd
        self.db=db

        #Set the window title 
        window.wm_title("Database Interface")

        #Set the current row to zero
        self.current_row=0

        '''Query Panel'''
        #Run tag field
        self.runtag_label = Label (window, text= "Run Tag: ")
        self.runtag_label.grid(row=self.current_row,column=0)
        self.runtag_text  = StringVar()
        self.runtag_entry = Entry(window, textvariable=self.runtag_text)
        self.runtag_entry.grid(row=self.current_row,column=1)
        self.current_row += 1

        #Start time field
        self.start_t_label = Label (window, text= "Start Time (YYYY-MM-DD HH:MM:SS): ")
        self.start_t_label.grid(row=self.current_row,column=0)          
        self.start_t_text  = StringVar()
        self.start_t_entry = Entry(window, textvariable=self.start_t_text)
        self.start_t_entry.grid(row=self.current_row,column=1)
        self.current_row  += 1

        #End time field
        self.end_t_label = Label (window, text= "End Time (YYYY-MM-DD HH:MM:SS): ")
        self.end_t_label.grid(row=self.current_row, column=0)          
        self.end_t_text  = StringVar()
        self.end_t_entry = Entry(window, textvariable=self.end_t_text)
        self.end_t_entry.grid(row=self.current_row,column=1)
        self.current_row += 1     

        #Send Query button
        self.query_button = Button (window, text="Send Query")
        self.query_button.configure(command=self.sendQuery)
        self.query_button.grid(row=self.current_row,column=0,columnspan=2)
        self.current_row += 1

        #Query status
        self.querystatus  = Label(window, text='')
        self.querystatus.grid(row=self.current_row,column=0,columnspan=2)
        self.current_row += 1

        '''Saving Panel'''  
        #Line to separate panels
        canvas = Canvas(master=window, width=500, height=40)
        canvas.create_line(0, 20, 500, 20, fill="black")
        canvas.grid(row=self.current_row,column=0,columnspan=2)
        self.current_row += 1
            
        #Label for Entry box
        self.save_label = Label (window, text= "Save Location: ")
        self.save_label.grid(row=self.current_row, column=0, columnspan=2)          
        self.current_row += 1 
             
        #Entry box for save location  
        self.save_text = StringVar()
        self.save_entry = Entry(window, textvariable=self.save_text)
        self.save_entry.grid(row=self.current_row,column=0, columnspan=2)
        self.current_row += 1 

        self.save_button = Button (window, text="Save Data")
        self.save_button.configure(command=self.save_to_csv)
        self.save_button.grid(row=self.current_row,column=0,columnspan=2)
        self.current_row += 1


    def sendQuery(self):
        start_t = self.start_t_text.get()
        end_t = self.end_t_text.get()
        run_tag = self.runtag_text.get()

        #Check that date is valid
        time_format = re.compile('^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$')
        start_t_okay=None
        if (start_t) and (time_format.match(start_t)):
            start_year=int(start_t[0:4])
            start_month=int(start_t[5:7])
            start_day=int(start_t[8:10])
            start_hour=int(start_t[11:13])
            start_min=int(start_t[14:16])
            start_sec=int(start_t[17:19])
            try:
                datetime.datetime(start_year,start_month,start_day,start_hour,start_min,start_sec)
                start_t_okay='yes'
            except:
                start_t_okay='no'


        end_t_okay=None
        if (end_t) and (time_format.match(end_t)):
            end_year=int(end_t[0:4])
            end_month=int(end_t[5:7])
            end_day=int(end_t[8:10])
            end_hour=int(end_t[11:13])
            end_min=int(end_t[14:16])
            end_sec=int(end_t[17:19])
            try:
                datetime.datetime(end_year,end_month,end_day,end_hour,end_min,end_sec)
                end_t_okay='yes'
            except:
                end_t_okay='no'        

        '''Error Handling'''
        #Check that the date is in the correct format
        if (start_t) and (not time_format.match(start_t)):
            messagebox.showinfo('Query Error', 'Error: Start time Must have the format "YYYY-MM-DD HH:MM:SS" or be empty')
        elif (end_t) and (not time_format.match(end_t)):
            messagebox.showinfo('Query Error', 'Error: End time Must have the format "YYYY-MM-DD HH:MM:SS" or be empty')
        #Check that the date is a valid date
        elif (start_t) and (start_t_okay == 'no'):        
            messagebox.showinfo('Query Error', 'Error: Start time is not valid')
        elif (end_t) and (end_t_okay == 'no'):
            messagebox.showinfo('Query Error', 'Error: End time is not valid')
        #Check that start_t < end_t
        elif (start_t) and (end_t) and (start_t > end_t):         
            messagebox.showinfo('Query Error', 'Start time must come before end time')    
        else:
            #Default to not including the conditions in the query
            run_tag_string = ''
            time_string = ''

            #Toggle query conditions on if the GUI field isn't blank

            #Run tag condition
            if run_tag != '':
                run_tag_string = 'AND run_tag = "%s"' %(run_tag)
                
            #Time window condition (in order: both set, only start set, only end set)
            if start_t != '' and end_t != '':
                time_string = 'AND clock_time BETWEEN "%s" AND "%s"' %(start_t,end_t)
            elif start_t != '':
                time_string = 'AND clock_time > "%s"' %(start_t)
            elif end_t != '':
                time_string = 'AND clock_time < "%s"' %(end_t)           
                            
            #Setting the query
            self.query = "SELECT clock_time, amplitude FROM summarydata WHERE amplitude IS NOT NULL %s %s" % (run_tag_string, time_string)

            con = mdb.connect(self.ip, self.user, self.pswd, self.db);

            with con:
                cur = con.cursor()

                #Send select statement
                cur.execute(self.query)

                #Fetch the data from our query
                rows = cur.fetchall()

                #Fill a pandas data frame with timestamps and amplitude info
                self.df = pd.DataFrame()
                self.df['timestamp']=[time.mktime(rows[i][0].timetuple()) for i in range(len(rows))]
                self.df['amplitude'] = [rows[i][1] for i in range(len(rows))]

            self.querystatus.configure(text = "Finished")

            #Check if the query returned data
            if self.df.empty:
                 messagebox.showinfo('Query Warning', 'Warning: Query returned no data')
           


    def save_to_csv(self):
        #Verify that the data frame is not empty
        if self.df.empty:
             messagebox.showinfo('Save Error', 'Error: Can not save empty data frame')

        #If we have data
        else:
            #Get the save location and extract the directory path
            self.save_loc = self.save_text.get() 
            self.save_dir = os.sep.join(self.save_loc.split(os.sep)[:-1])

            #Verify that the directory exists
            if os.path.isdir(self.save_dir):

                #Verify that the filename is more than just '.csv'
                if len(self.save_loc.split(os.sep)[-1]) < 5:
                    messagebox.showinfo('Save Error', 'Error: Path should end in filename.csv')

                #Verify that the filename ends in '.csv'
                elif self.save_loc.split(os.sep)[-1][-4:] != '.csv':
                    messagebox.showinfo('Save Error', 'Error: File should end in filename.csv')

                #Save the data if it passes error checking
                else:
                    self.df.to_csv(self.save_loc)
                    
            #Error if the directory doesn't exist        
            else:
                messagebox.showinfo('Save Error', 'Error: File directory does not exist')



def main(argv):
    '''
    Usage: python radonGUI.py databaseIP username password databaseTable
    '''
    ip = argv[1]
    user = argv[2]
    pswd = argv[3]
    db = argv[4]

    window= Tk()
    start= App(window,ip,user,pswd,db)
    window.mainloop()

if __name__ == "__main__":
    main(sys.argv)
