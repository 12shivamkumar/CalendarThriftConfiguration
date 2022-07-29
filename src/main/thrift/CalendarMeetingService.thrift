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
    1:list<string> listOfEmployee;
    2:string description;
    3:string agenda;
    4:string ownerId;
    5:Date dateOfMeeting;
    6:Time startTime;
    7:Time endTime;
    8:bool isAvailable;
    9:i32 roomId;
}
struct EmployeeMeetingDetails{
    1:i32 meetId;
    2:string status;
    3:string description;
    4:string agenda;
    5:string ownerId;
    6:Date dateOfMeeting;
    7:Time startTime;
    8:Time endTime;
    9:bool isAvailable;
    10:i32 roomId;
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
struct FindFreeMeetingRoomDataRequest{
    list<i32> meetingRoomsInOffice;
    Date dateOfMeeting;
    Time startTime;
    Time endTime;
}
struct MeetingRoomAvailableDataRequest{
    i32 roomId;
    Date dateOfMeeting;
    Time startTime;
    Time endTime;
}
service MeetingSvc
{
   string isAlive();

   bool cancelMeetingOfRemovedEmployee(1:string employeeId);

   bool updateStatusOfRemovedEmployee(1:string employeeId);

   list<string> checkEmployeeAvailability(1:EmployeeAvailabilityDataRequest employeeDetails);

   i32 addMeetingDetails(1:MeetingDetails meetingDetails);

   i32 findFreeMeetingRoom(1:FindFreeMeetingRoomDataRequest findFreeMeetingRoomDataRequest);

   bool meetingRoomAvailable(1:MeetingRoomAvailableDataRequest meetingRoomAvailableDataRequest);

   list<EmployeeMeetingDetails> getEmployeeMeetingDetails(1:string employeeId);

}
