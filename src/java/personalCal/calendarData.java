/**
 * 
 * Document            : the methods and gears to producing dynamic calendar
 * Date Created        : April 5, 2018
 * Author              : Zoe Gray
 */

package personalCal;

import java.util.*;
import java.util.Scanner;

/**
 * Program to produce correct dates for each day in each month every year Uses
 * Gregorian calendar
 *
 * Methods are pure computation
 */
public class calendarData {

    //All instance variables
    private final int[] DAYS_IN_MONTH = {31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 31, 28}; //move ? MAYBE Not
    private String currentMonth;
    private String currentYear;
    private int firstDay;
    private int lastDay;
    private String year;
    private String month;
    private String date;
    private int weeks;
    private int lastAction;
    private int[] calInfo;
    private String[] calendar;
    private int modifyMonth;
    private int modifyYear;

    public calendarData() {
        //Somewhere month and day needs to become int 0-11
        currentMonth = currMonthCalc();
        currentYear = currYearCalc();
        firstDay = 0;
        lastDay = 0;
        year = currentYear;
        month = currentMonth;
        this.modifyMonth = 0;
        this.modifyYear = 0;
        date = "";
        weeks = 0;
        lastAction = 0;
        calInfo = null;
        calendar = null;
    }

    /*
    public calendarData(String currentMonth, String currentYear, int firstDay, 
                        int lastDay, String year, String month, int modifyMonth, int modifyYear, String date, 
                        int weeks, int lastAction, int[] calInfo, String[] calendar) {
        this.currentMonth = currentMonth;
        this.currentYear = currentYear;
        this.firstDay = firstDay;
        this.lastDay = lastDay;
        this.year = year;
        this.month = month;
        this.modifyMonth = modifyMonth;
        this.modifyYear = modifyYear;
        this.date = date;
        this.weeks = weeks;
        this.lastAction = lastAction;
        this.calInfo = calInfo;
        this.calendar = calendar;
    }
     */

    public String getCurrentMonth() {
        //
        return currentMonth;
    }

    private void setCurrentMonth(String currentMonth) {
        this.currentMonth = currentMonth;
    }

    public String getCurrentYear() {
        String currYear = currYearCalc();
        return currYear;
    }

    private void setCurrentYear(String currentYear) {
        this.currentYear = currentYear;
    }

    public String getYear() { //Adds modified year to year
        int yearNum = Integer.parseInt(getCurrentYear()); //Get current year?
        int yearAdd = getModifyYear();
        yearNum = yearNum + yearAdd;
        String yearString = Integer.toString(yearNum);
        setYear(yearString);
        return yearString;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getMonth() {
        //String currMonth = getCurrentMonth();
        String monthAlt = monthModification();
        setMonth(monthAlt);
        return monthAlt;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getModifyMonth() {
        return this.modifyMonth;
    }

    public void setModifyMonth(int modifyMonth) {
        setLastAction(modifyMonth);
        this.modifyMonth = this.modifyMonth + modifyMonth;
    }

    public int getModifyYear() {
        return modifyYear;
    }

    public void setModifyYear(int modifyYear) {
        this.modifyYear = modifyYear;
    }

    public String getDate() {
        return date;
    }

    public void setDay(String date) {
        this.date = date;
    }

    public int getWeeks() {
        return weeks;
    }

    private void setWeeks(int weeks) {
        this.weeks = weeks;
    }

    public int getLastAction() {
        return lastAction;
    }

    public void setLastAction(int lastAction) {
        this.lastAction = lastAction;
    }

    public int getFirstDay() {
        return firstDay;
    }

    public int getLastDay() {
        return lastDay;
    }

    public void setLastDay(int lastDay) {
        this.lastDay = lastDay;
    }

    private void setFirstDay(int firstDay) {
        this.firstDay = firstDay;
    }

    public int[] getCalInfo() {
        calInfo = createCalendarFull(year, month); // HERE
        return calInfo;
    }

    private void setCalInfo(int[] calInfo) {
        this.calInfo = calInfo;
    }

    public String[] getCalendar() {
        calendar = calendarCreate(year, month);
        return calendar;
    }

    public void setCalendar(String[] calendar) {
        this.calendar = calendar;
    }

    public String currMonthCalc() {
        Date d = new Date(); //Creating date
        String myDate = d.toString(); //Turning date to stirng
        Scanner sc = new Scanner(myDate); //Putting in a scanner
        String monthNow;
        monthNow = sc.next();
        for (int i = 0; i < 1; i++) {
            monthNow = sc.next();
        }
        monthNow = monthName(monthNow);
        return monthNow;
    }

    public String currYearCalc() {
        Date d = new Date(); //Creating date
        String myDate = d.toString(); //Turning date to stirng
        Scanner sc = new Scanner(myDate); //Putting in a scanner
        String yearNow;
        yearNow = sc.next();
        for (int i = 0; i < 5; i++) { //Loop until
            yearNow = sc.next();
        }
        return yearNow;
    }

    //Method to return boolean true if leap year
    public boolean isLeapYear(String year) {
        int leapYear = Integer.parseInt(year);
        if ((leapYear % 4 == 0) && (leapYear % 100 != 0)) {
            return true;
        }
        if (leapYear % 400 == 0) {
            return true;
        }
        return false;
    }

    //Method turning Date class months into my months
    public String monthName(String month) {
        String m = "";
        if (month.equals("Jan")) {
            m = "January";
        }
        if (month.equals("Feb")) {
            m = "February";
        }
        if (month.equals("Mar")) {
            m = "March";
        }
        if (month.equals("Apr")) {
            m = "April";
        }
        if (month.equals("May")) {
            m = "May";
        }
        if (month.equals("Jun")) {
            m = "June";
        }
        if (month.equals("Jul")) {
            m = "July";
        }
        if (month.equals("Aug")) {
            m = "August";
        }
        if (month.equals("Sep")) {
            m = "September";
        }
        if (month.equals("Oct")) {
            m = "October";
        }
        if (month.equals("Nov")) {
            m = "November";
        }
        if (month.equals("Dec")) {
            m = "December";
        }

        return m;
    }

    //Method to return month as an int
    public int monthNumber(String month) {
        int m = 0;
        if (month.equals("January")) {
            m = 11;
        }
        if (month.equals("February")) {
            m = 12;
        }
        if (month.equals("March")) {
            m = 1;
        }
        if (month.equals("April")) {
            m = 2;
        }
        if (month.equals("May")) {
            m = 3;
        }
        if (month.equals("June")) {
            m = 4;
        }
        if (month.equals("July")) {
            m = 5;
        }
        if (month.equals("August")) {
            m = 6;
        }
        if (month.equals("September")) {
            m = 7;
        }
        if (month.equals("October")) {
            m = 8;
        }
        if (month.equals("November")) {
            m = 9;
        }
        if (month.equals("December")) {
            m = 10;
        }

        return m;
    }

    //Method to return int month as String
    public String numberMonth(int month) {
        String m = "";
        if (month == 11) {
            m = "January";
        }
        if (month == 12) {
            m = "February";
        }
        if (month == 1) {
            m = "March";
        }
        if (month == 2) {
            m = "April";
        }
        if (month == 3) {
            m = "May";
        }
        if (month == 4) {
            m = "June";
        }
        if (month == 5) {
            m = "July";
        }
        if (month == 6) {
            m = "August";
        }
        if (month == 7) {
            m = "September";
        }
        if (month == 8) {
            m = "October";
        }
        if (month == 9) {
            m = "November";
        }
        if (month == 10) {
            m = "December";
        }

        return m;
    }

    /**
     * FORMULA: calculates day of certain date f = k + [(13*m-1)/5] + D + [D/4]
     * + [C/4] - 2*C. k = date of month m = month number (special rules) d =
     * year (last two digits of year) c = century (first two digits of year) 0 =
     * sunday 6 = saturday
     */
    public int dayOfWeek(String year, String month, String date) {
        int k = Integer.parseInt(date);
        int c = Integer.parseInt(year.substring(0, 2));
        int d = Integer.parseInt(year.substring(2, 4));
        int m = 0, f = 0, gm = 0;
        int remainder;
        m = monthNumber(month);
        if (m == 11 || m == 12) {
            d--;
        }
        f = k + ((13 * m - 1) / 5) + d + (d / 4) + (c / 4) - 2 * c; //Formula
        if (f < 0) {
            for (int s = 1; gm > f; s++) {
                gm = (-7 * s); //Find greatest multiple of 7 less than f
            }
            remainder = f - gm;
        } else {
            remainder = f % 7;
        }

        return remainder;
    }

    //Method to calculate number of days needed in calendar  
    public int dayNumber(String year, String month) {//get day of highest date (calc if leap year in case 29 not 28) add day number divide by 7 if double is bigger than int, add one (4.18 is 5 weeks not four, roung up maybe)
        int monthNum;
        boolean leapYear;
        monthNum = monthNumber(month);
        int daysInMonth = DAYS_IN_MONTH[monthNum - 1]; //-1 to match index
        leapYear = isLeapYear(year);
        if (monthNum == 12) {
            if (leapYear) {
                daysInMonth++;
            }
        }

        return daysInMonth;
    }

    //Method to calculate number of weeks needed in calendar   
    public int weekNumber(String year, String month) {//get day of highest date (calc if leap year in case 29 not 28) add day number divide by 7 if double is bigger than int, add one (4.18 is 5 weeks not four, roung up maybe)
        int monthNum;
        int day;
        double weeksDub;
        int weeks;

        boolean leapYear;
        monthNum = monthNumber(month);
        int daysInMonth = DAYS_IN_MONTH[monthNum - 1];
        leapYear = isLeapYear(year);
        if (monthNum == 12) {
            if (leapYear) {
                daysInMonth++;
            }
        }
        day = dayOfWeek(year, month, "1");
        weeksDub = ((double) daysInMonth + (double) day) / (double) 7;
        weeks = (int) Math.ceil(weeksDub);

        return weeks;
    }

    public int[] createCalendarFull(String year, String month) { //Not full sends array of 3 ints
        //calendarData cdObject = new calendarData();
        int[] calInformation = new int[3];
        final String FIRST_DAY = "1"; //Constant for 1 day in every month
        int startDay = dayOfWeek(year, month, FIRST_DAY); //Finding first day of month
        setFirstDay(startDay); //Can i do this?

        int weekNum = weekNumber(year, month); //Finding number of weeks needed

        String dayNumNeeded = Integer.toString(dayNumber(year, month));

        int theLastDay = dayOfWeek(year, month, dayNumNeeded);

        setWeeks(weekNum); //Setting weeks
        calInformation[0] = weekNum; // Number of weeks needed
        calInformation[1] = startDay; // Day of first date and number of blanks
        calInformation[2] = theLastDay; //Day of last date

        return calInformation;
    }

    public String[] calendarCreate(String year, String month) { //FULL CALENDAR
        final String FIRST_DAY = "1"; //Constant for 1 day in every month
        int startDay = dayOfWeek(year, month, FIRST_DAY); //Finding first day of month // . HERE
        int monthDays = dayNumber(year, month);
        int weekNum = weekNumber(year, month); //Finding number of weeks needed
        int totalDays = weekNum * 7;
        String[] calInformation = new String[totalDays];

        int index = 1;
        for (int a = 0; a < totalDays; a++) {
            if (a < startDay) {
                calInformation[a] = "";
            } else if ((a - startDay) < monthDays) {
                calInformation[a] = Integer.toString(index);
                index++;
            } else if (a < totalDays) {
                calInformation[a] = "";
            }
        }

        return calInformation;
    }

    public String monthModification() {
        int newMonthNum = monthNumber(currentMonth) + this.modifyMonth;
        //int yearNum = Integer.parseInt(getYear());
        //Adjusts for variations in months

        //newMonthNum = newMonthNum%12;
        //
        if (newMonthNum > 12) {
            newMonthNum = newMonthNum % 12;
        }
        if (modifyMonth < 0) {
            newMonthNum = Math.abs(Math.abs(12 + (newMonthNum % 12)) % 12 /*+ (((newMonthNum)/12)*12)*/); //Negatives harder to work with
        }
        if (newMonthNum == 13 && lastAction == 1) //Wont need? Changes Feb to March
        {
            newMonthNum = 1;
        }
        if (newMonthNum == 0 && lastAction == -1) //Changes March to Feb
        {
            newMonthNum = 12;
        }

        //Adjusts for changes in year
        if (newMonthNum == 11 && lastAction == 1) {
            setModifyYear(getModifyYear() + 1); //Changes year from Dec to Jan
        }
        if (newMonthNum == 10 && lastAction == -1) {
            setModifyYear(getModifyYear() - 1); //Changes year from Jan to Dec
        }
        String newMonth = numberMonth(newMonthNum);
        return newMonth;
    }
    //Method to construct the three days (do i even need this?)

    //Method to convert day int back into string
    public String dayName(int dayPlacement) {
        String dayName = "";
        if (dayPlacement == 0) {
            dayName = "Sunday";
        }
        if (dayPlacement == 1) {
            dayName = "Monday";
        }
        if (dayPlacement == 2) {
            dayName = "Tuesday";
        }
        if (dayPlacement == 3) {
            dayName = "Wednesday";
        }
        if (dayPlacement == 4) {
            dayName = "Thursday";
        }
        if (dayPlacement == 5) {
            dayName = "Friday";
        }
        if (dayPlacement == 6) {
            dayName = "Saturday";
        }

        return dayName;
    }

    //Tests
    /*
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        calendarData cdObject = new calendarData();
        
        //Prompting for user input
        /*System.out.print("Year (xxxx) >> ");
        String year = sc.nextLine();
        System.out.print("Month >> ");
        String month = sc.nextLine();
        System.out.print("Date >> ");
        String date = sc.nextLine();
        System.out.println("4 " + year);
        int day = cdObject.dayOfWeek(year, month, date);
        String dayName = cdObject.dayName(day);
        
        System.out.println("\nDay: " + day + " or " + dayName);
        
        System.out.println("\nMonth of: " + month.toUpperCase());
        int weekNum = cdObject.weekNumber(year, month);
        System.out.println("Number of weeks: " + weekNum);
        String calendar[] = cdObject.calendarCreate(year, month);
        System.out.println("--------");
        for (int i=0; i<calendar.length; i++) {
            System.out.println(calendar[i]);
        }
        System.out.println("--------");
        String myMonth = cdObject.getCurrentMonth();
        String myYear = cdObject.getCurrentYear();
        
        System.out.println("Current Month: " + myMonth);
        System.out.println("Current Year: " + myYear);
        
        int next =1;
        int previous= -1;
        String newMonth;
        String newYear;
        
        //BEFORE
        String currentMonth = cdObject.getMonth();
        String currentYear = cdObject.getYear();
        System.out.println(currentMonth + " " + currentYear + "\n");
        
        //AFTER
        for (int i =0;i<28; i++){
            cdObject.setModifyMonth(previous); //Setting modifyMonth //NEXT PREVIOUS
            newMonth = cdObject.getMonth(); //Getting month
            newYear =cdObject.getYear(); //Getting year
            System.out.println(newMonth + " " + newYear + "\n");
        }
    }
     */
    public static void main(String[] args) {
        calendarData myObj = new calendarData();

        for (int i=0; i<13; i++){
            myObj.setModifyMonth(-1);
            System.out.println("Month" + myObj.getMonth());
            System.out.println("Year" + myObj.getYear());
            System.out.println("Mod Month" + myObj.getModifyMonth());
            System.out.print("\n");
        }
    }
}
