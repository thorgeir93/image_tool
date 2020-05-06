#import os
#import smtplib
#from email.mime.text import MIMEText
#from email.mime.image import MIMEImage
#from email.mime.multipart import MIMEMultipart
#
#
#def SendMail(ImgFileName):
#    img_data = open(ImgFileName, 'rb').read()
#    msg = MIMEMultipart()
#    msg['Subject'] = 'test'
#    msg['From'] = 'thorgeirsigurd@gmail.com'
#    msg['To'] = 'thorgeirsigurd@gmail.com'
#
#    text = MIMEText("test")
#    msg.attach(text)
#    image = MIMEImage(img_data, name=os.path.basename(ImgFileName))
#    msg.attach(image)
#
#    s = smtplib.SMTP(Server, Port)
#    s.ehlo()
#    s.starttls()
#    s.ehlo()
#    s.login(UserName, UserPassword)
#    s.sendmail(From, To, msg.as_string())
#    s.quit()


import smtplib                          

#smtpServer='smtp.yourdomain.com'      
smtpServer='smtp.localhost'      

fromAddr='thorgeir@localhost'         
toAddr='thorgeirsigurd@gmail.com'     
text= "This is a test of sending email from within Python."
server = smtplib.SMTP(smtpServer,25)
server.ehlo()
#server.starttls()
server.sendmail(fromAddr, toAddr, text) 
server.quit()
