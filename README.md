# PersonalCalendar
Java Web App that allows users to dynamically view calendar months for any year.
Users can create accounts with a username and password.
Login information is saved in a SQL database.
Security insertPrepared() parameters are being used to protect from SQL injection attempts.
User can choose a day from any month and year on a calendar, and insert events to meaningful dates.
The events are stored in a seperate table inside the database.

calendarData.java features the bulk of the computational thinking in order to generate accurate calendar layouts.

---

To test the code, open up the terminal window and enter the following:

docker build -t calendar .

docker run -t -d -p 8080:8080 -p 9990:9990 calendar

Navigate to http://localhost:8080/ and you will see my project!

---

I reccommend you create your own username and password using the Sign Up button.
