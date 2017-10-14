Feature: select room availability
  
  As an admin
  So that I can select a room to reserve
  I want to see available rooms
  
Scenario: select room reservation 
 Given I have not reserved a room
 When I am on the home page
 Then I should be able to reserve a room
 
Scenario: select view reservation 
 Given I have reserved a room
 When I am on the home page
 Then I should be able to view my current reservation
    
Scenario: admin reserves room
 Given I am on the room availability page
 When I try to click on a specific room and time
 Then I should be able to reserve a room at a specific time
 
Scenario: admin cancels room reservation
 Given I am viewing my current reservation
 When I select cancel reservation
 Then I should have my reservation cancelled 
    
Scenario: all rooms selected
 Given I am on the room availability page
 When I try to click on a specific room and time
 Then I should not be able to reserve a room at a specific time
 


  
  



  
  
  
  

