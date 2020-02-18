from tkinter import *
import pyodbc
from datetime import datetime
from tkinter import messagebox as mb
from tkinter import messagebox
import time
import ctypes

time_string = time.strftime('%Y-%m-%d %I:%M%p ')

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=COMPLAB503_PC14;'
                      'Database=db_clothingline;'
                      'Trusted_Connection=yes;')

cursor = conn.cursor()


class Product:
    def __init__(self, name, description, price, size, timestamp):
        self.name = name
        self.description = description
        self.price = price
        self.size = size
        self.timestamp = time_string

    def getName(self):
        return self.name

    def getDescription(self):
        return self.description

    def getPrice(self):
        return self.price

    def getSize(self):
        return self.size

    def getTimestamp(self):
        return self.timestamp

    def updateSelf(self, name, description, price, size, timestamp):
        self.name = name
        self.description = description
        self.price = price
        self.size = size
        self.timestamp = timestamp

        btn1['state'] = DISABLED
        btn2['state'] = NORMAL
        viewProducts()


def clear():
    e1.delete(0, 'end')
    e2.delete(0, 'end')
    e3.delete(0, 'end')
    e4.delete(0, 'end')


def addProduct():
    if (e1.get() == "" or e2.get() == "" or e3.get() == "" or e4.get() == ""):
        mb.showerror("ERROR", "Incomplete credentials")
    else:
        global products
        cursor.execute("insert into tbl_products(name, description, size, price, timestamps) values ('" + e1.get() + "','" + e2.get() + "','" + e3.get() + "','" + e4.get() + "','" + time_string + "')")
        cursor.execute("commit")
        ctypes.windll.user32.MessageBoxW(0, "Item is added to the list", "Notification", 0)
        viewProducts()
        clear()


def deleteProduct(product):
    global products
    MsgBox = messagebox.askquestion ('DELETE','Do you want to delete this product',icon = 'warning')
    if MsgBox == 'yes':
        cursor.execute("DELETE FROM tbl_products WHERE id = "+str(product))
        cursor.execute("commit")
        viewProducts()
    else:
        viewProducts()
    


def updateProduct(product):
    global products
    viewProducts()
    clear()
    e1.insert(0, product[1])
    e2.insert(0, product[2])
    e3.insert(0, product[3])
    e4.insert(0, product[4])

    btn1['state'] = NORMAL
    btn2['state'] = DISABLED

    btn1.configure(command=lambda: updateMyTable(product[0],e1.get(), e2.get(), e3.get(), e4.get(), time_string))

def updateMyTable(id,name, description, size, price, timestamp):
    global products
    cursor = conn.cursor()
    cursor.execute( "UPDATE tbl_products SET name = '" + name + "', price = '" + price + "',size= '" + size + "',description = '" + description + "',timestamps = '" + timestamp + "'  WHERE id = " + str(id))
    cursor.execute("commit")
    products=""
    viewProducts()
    btn2['state'] = NORMAL
    btn1['state'] = DISABLED

def viewProducts():
    global products

    row = 1
    list = separator.grid_slaves()
    for l in list:
        l.destroy()

    addHeaders()

    mycursor = conn.cursor()

    mycursor.execute("SELECT * FROM tbl_products")

    myresult = mycursor.fetchall()

    for product in myresult:
        Label(separator, text=product[1], background=color, width=10).grid(row=row, column=0,  sticky=W + E + N + S, padx=10, pady=5)
        Label(separator, text=product[2], background=color, width=10).grid(row=row, column=1, sticky=W + E + N + S, padx=10, pady=5)
        Label(separator, text=product[3], background=color, width=10).grid(row=row, column=2, sticky=W + E + N + S, padx=10,  pady=5)
        Label(separator, text=product[4], background=color, width=10).grid(row=row, column=3, sticky=W + E + N + S, padx=10, pady=5)
        Label(separator, text=product[5], background=color, width=10).grid(row=row, column=4,sticky=W + E + N + S, padx=10,pady=5)

        btn_a1 = Button(separator, text="Update", bg="#7fcd91", width=7, command=lambda product=product: updateProduct(product))
        btn_a2 = Button(separator, text="Delete", bg="#f64b3c", width=7, command=lambda product=product: deleteProduct(product[0]))

        btn_a1.grid(row=row, column=11, sticky=W, padx=5, pady=5)
        btn_a2.grid(row=row, column=10, sticky=E, padx=5, pady=5)
        row += 1
    cursor.commit()
    clear()


def addHeaders():
    separator.grid(row=9, column=0, columnspan=5, pady=5, sticky=W + E + N + S)
    Label(separator, text="Name", background=color, width=10,font="Helvetic 8 bold").grid(row=0, column=0, sticky=W, padx=10, pady=5)
    Label(separator, text="Description", background=color, width=10,font="Helvetic 8 bold").grid(row=0, column=1, sticky=W, padx=10, pady=5)
    Label(separator, text="Size", background=color, width=10,font="Helvetic 8 bold").grid(row=0, column=2, sticky=W, padx=10, pady=5)
    Label(separator, text="Price", background=color, width=10,font="Helvetic 8 bold").grid(row=0, column=3, sticky=W, padx=10, pady=5)
    Label(separator, text="Timestamp", background=color, width=10,font="Helvetic 8 bold").grid(row=0, column=4, sticky=W, padx=50, pady=5,columnspan=2)


products = [] 
color = "#f3dfe3"

root = Tk() ; root.title("The Inventory") ; root.resizable(False, False)
window_width = 700 ; window_height = 530
screen_width = root.winfo_screenwidth() ; screen_height = root.winfo_screenheight()
x_cordinate = int((screen_width/2) - (window_width/2)) ; y_cordinate = int((screen_height/2) - (window_height/2))
root.geometry("{}x{}+{}+{}".format(window_width,window_height, x_cordinate, y_cordinate)) 
root["bg"] = "#d9fcfc"

root.geometry("700x530")


Label(root, text="Products Information", bg="#d9fcfc",fg="black",font="Helvetic 10 bold").grid(row=0, column=0, sticky=W, padx=10, pady=5)
Label(root, text="Product Name: ", bg="#d9fcfc",fg="black",font="Helvetic 10 bold").grid(row=1, column=0, sticky=W, padx=10, pady=5)
Label(root, text="Product Description: ", bg="#d9fcfc",fg="black",font="Helvetic 10 bold").grid(row=2, column=0, sticky=W, padx=10, pady=5)
Label(root, text="Product Size: ", bg="#d9fcfc",fg="black",font="Helvetic 10 bold").grid(row=3, column=0, sticky=W, padx=10, pady=5)
Label(root, text="Product Price: ", bg="#d9fcfc",fg="black",font="Helvetic 10 bold").grid(row=4, column=0, sticky=W, padx=10, pady=5)
Label(root, text="Product Timestamp: ", bg="#d9fcfc",fg="black",font="Helvetic 10 bold").grid(row=5, column=0, sticky=W, padx=10, pady=5)

e1 = Entry(root, width=45, background = 'BLACK', borderwidth = 1)
e2 = Entry(root, width=45)
e3 = Entry(root, width=45)
e4 = Entry(root, width=45)
e5 = Label(root, text=time_string,bg="#d9fcfc",fg="black",font="Helvetic 10 bold")

e1.grid(row=1, column=1, sticky=W, padx=10, pady=5, columnspan=2)
e2.grid(row=2, column=1, sticky=W, padx=10, pady=5, columnspan=2)
e3.grid(row=3, column=1, sticky=W, padx=10, pady=5, columnspan=2)
e4.grid(row=4, column=1, sticky=W, padx=10, pady=5, columnspan=2)
e5.grid(row=5, column=1, padx=10, pady=5, columnspan=2)

btn1 = Button(root, text="Update Product",bg="#81f5ff", width=15, state=DISABLED)
btn2 = Button(root, text="Add Product", bg="#81f5ff", width=15, state=NORMAL, command=addProduct)

btn1.grid(row=8, column=1, sticky=W, padx=10, pady=5)
btn2.grid(row=8, column=2, sticky=E, padx=10, pady=5)

separator = Canvas(root, height=100, width=420, background=color, relief=SUNKEN)
addHeaders()

root.mainloop()