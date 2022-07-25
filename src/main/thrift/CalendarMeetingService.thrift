namespace java org.example.CalendarThriftConfiguration
struct Date{
    1:i32 dayOfMonth;
    2:i32 month;
    3:i32 year;
}
struct Time{
    1:i32 hours;
    2:i32 mins;
    3:i32 seconds;
}

struct MeetingDetails{
    1:string id;
    2:string description;
    3:string agenda;
    4:string ownerId;
    5:Date dateOfMeeting;
    6:Time startTime;
    7:Time endTime;
    8:bool isAvailable;
    9:i32 roomId;
}
struct EmployeeStatusDataRequest {
    1:string employeeId;
    2:string meetingId;
    3:string status;
    4:Date dateOfMeeting;
}
struct EmployeeAvailabilityDataRequest{
    1:list<string> listOfEmployeeId
    2:Time startTime
    3:Time endTime
    4:Date dateOfMeeting
}
service MeetingSvc
{
   bool cancelMeetingOfRemovedEmployee(1:string employeeId);

   bool updateStatusOfRemovedEmployee(1:string employeeId);

   list<string> checkEmployeeAvailability(1:EmployeeAvailabilityDataRequest employeeDetails);

   bool addMeetingDetails(1:MeetingDetails meetingDetails);

   bool addEmployeeMeetingStatus(1:list<EmployeeStatusDataRequest> employeeMeetingStatus);

}
