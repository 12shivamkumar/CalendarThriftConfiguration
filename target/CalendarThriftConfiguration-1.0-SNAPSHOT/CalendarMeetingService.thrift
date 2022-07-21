service MeetingSvc
{
   bool cancelMeetingOfRemovedEmployee(1:string employeeId);

   bool updateStatusOfRemovedEmployee(1:string employeeId);
}