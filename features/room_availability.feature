Feature: select room availability
  
  As an admin
  So that I can select a room to reserve
  I want to see available rooms
  
Scenario: select room reservation 
 Given I have not reserved a room
 When I am on the room availability page
 Then I should be able to reserve a room for a time and day
 
 Scenario: all rooms selected
 Given I have not reserved a room 
 When I am on the room availability page 
 And I see all rooms and times are reserved
 Then I should not be able to reserve a room at a specific time
 
Scenario: select view reservation 
 Given I have reserved a room
 When I am on the room availability page 
 And I press "View Reservation"
 Then I should be able to view my current reservation
 
Scenario: select view reservation without room reserved
 Given I have not reserved a room
 When I am on the room availability page 
 And I press "View Reservation"
 Then I should see an appropriate message
    
Scenario: admin cancels room reservation
 Given I have reserved a room
 When I am on the current reservation page
 And I select "Cancel Reservation"
 Then I should have my reservation cancelled 

    
    

 


  
  



  
  
  
  

