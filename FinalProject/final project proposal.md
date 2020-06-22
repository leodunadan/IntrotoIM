### Final Project Proposal

I want to make a more elaborate game building uo on my midterm. The game involves having to keep a diver afloat and having a higher score the longer you manage to not let him sink. 

##### Additions I plan to incorporate 

- four buttons to control racket to move to the left. right, top and bottom. I thought about it and from having used a potentiometer to control up and down movement in my last assignment, I realised that it is too slow for the pace I want the game to have. 
- a health bar 
- an LED that would light up as a warning sign that the diver is getting too low
- background elemends - details to the background (thats meant to be an ocean) to make the game visually more appealing 

##### What Arduino will do?

- determine when either one of the four push buttons is pressed and send the input to Processing 
- receive an output from processing and use it to light up and LED

##### What processing will do?

- take the input from the push buttons and use it to move the racket more to the left, right, top or bottom. (I'm not sure yet how this works)
- determine when the driver gets too low and send this information to Arduino

##### Schematic

![](IntrotoIM/Images/im6.JPG)
