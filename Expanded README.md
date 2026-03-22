For our "Stack Game" project, we wanted to challenge ourselves by creating a code that utilized a user interactive experience as opposed to a code that simply runs. This project has many highs and lows, however in the end we very much enjoyed learning new codes that were specific to our game as well as being exposed to the application MATLAB as opposed to the browser version.

Through this project, we learned how to implement user input in Matlab through using a keypress, how to update both the logical and graphical elements of a figure to represent motion, and use arithmetic to develop gameplay logic such as calculating the offset and determining the overlap between the current block and the one below it. A skill we gained was learning how Github and Matlab interact with each other, through committing, pushing, and pulling our changes incrementally. Further, we learned how to create user dependent results in gameplay through having a separate win and lose screen depending on the user's performance in the game. Additionally, through learning how to use collision detection, we realized we could instead implement a simpler mechanism of detecting the offset to remove the excess part of the block. Finally, we improved our debugging techniques through resolving numerous logical and syntax errors we encountered while we were coding.   


The biggest challenges we faced when coding this project were to do with debugging, as most times after initially coding a feature, it didn't work as intended. Due to the nature of coding stack, especially as our code progressed, a bug could present itself the same way even though the underlying logical error could have originated from many places in our code. This allowed us to develop our debugging skills, not only through using Matlab's debugging feature, but also through manually implementing print lines at different steps of the stacking process, which showed us how the variables we were tracking changed at each stage of our code.   


Our biggest triumph was getting the offset to subtract and disappear when the blocks were stacked on top of each other. Originally, attempting to implement the offset subtraction somehow impacted the stacking function, causing it to stop unexpectedly sometimes and split our base block into many pieces other times. We worked on fixing this for three days, so when we finally got it to function as intended, we were really proud of ourselves as we had completed the most important portion of the game! 

Our biggest "aha" moment was when we figured out why our moving block wasn't reaching the right end of the screen while it was moving back and forth. Though initially it moved back and forth seamlessly, as the block got smaller throughout the game it got farther from the right end of the screen. We realized eventually that this was because we hardcoded the right end of the game screen rather than having it be dependent on the block's width, which shrinks throughout the game. Thus by rewriting it as currentXpos >= 18 - currentWidth, we made it so the collision boundary was calculated depending on the X position and width of the block rather than tailoring it to the dimensions of the block's original size. This solved our issue!

Winning example (Scan QR Code to view!)
<img width="159" height="201" alt="Screenshot 2026-03-21 at 11 29 41 PM" src="https://github.com/user-attachments/assets/8a0eb82a-1e30-474a-89f0-711413e15049" />

Losing example (Scan QR Code to view!)
<img width="356" height="457" alt="Screenshot 2026-03-21 at 9 23 24 PM" src="https://github.com/user-attachments/assets/ff6eab8f-80b3-49d9-8925-14f7cd461454" />



Timeline for Coding 

March 9th - Met to outline our ideas for stack game as well as created files on matlab for program 
Coder + Debugger = Chase and Nainika (3 hours) 

March 11  - Created a gameplay screen background with the first stacking block including colors chosen for both ← Lines 1-26 
Coder = Chase (6 hours)
Debugger = Nainika (5 hours)  

March 12  - Created another block on the top of the screen to move back and forth ← Lines 67 - 90
Coder = Nainika (4 hours) 
Debugger = Chase (1.5 hours) 

March 15 - Fixing unresolved bugs in previous code in order to not move the bottom block and made the top block move horizontally until the end of the screen. Created the space bar key press in order for a block to drop after the space key is pressed onto the previous block at the bottom (making the blocks stack on top of one another) ← Fixing / adding to lines 1-64
Coder = Chase =  (9 hours) 
Debugger = Nainika (6 hours) 

March 16 - First attempt to subtract the "offset" / extra part of the block when the blocks are not perfectly aligned ← Lines 88- 106 + edits on lines 59-72
Coder = Nainika (4 Hours) 
Debugger = Chase (2 Hours) 

March 17 - calculated offset and subtracted it from landed block and generated new block of the same size (bugs: sometimes it took off too much beyond just the excess and also sometimes it didn't land on the previous block because there's a space for some reason) ← Lines 59 -68 and lines 72-76 and others lines throughout (Removing / editing lines before in order to calculate the offset properly) 
Coder = Nainika (4 hours) 
Debugger - Chase (2 Hours) 

March 18 - Made edits from before in stacking (Removed the offset each time correctly, aligning with either the right or left side -- Yay!!). Wrote code for when the block stacks hitting the top of the game window, the game ends. ← Edits on lines 64 - 76 and lines 79-90 as well as other lines throughout 
Coder = Chase (3 Hours) 
Debugger = Nainika (1 Hours) 

March 20 - made it so that when a block missed the top block but landed on one below it, it lands on that block and disappears ← lines 67 - 90 + other line edits throughout 
Coder = Nainika (5 Hours) 
Debugger = Chase (2 Hours) 

March 21 - Finalized gameplay with resolving following block disappearing / movement issues, created text for winning conditions, and fixed the sizing of the blocks as well as gameplay screen
(Part 1) Progress made on fixing the issue of the falling block disappearing on the block lower than the next block it touches.
Coder = Chase (9 hours) 
Debugger = Nainika (8 Hours)
(Part 2) fixed bug in movement left and right of moving block and created text for winning and losing conditions
Coder = Nainika (1.5 hours) 
Debugger = Chase (1 hours)
(Part 3) Finalized gameplay block sizing in order to make the game easier as well as to make the sides of the game itself even (with the block in the center).
Coder = Chase (1 hour)
Debugger = Nainika (1 hour) 

Total Amount of Combined Hours = 78 hours 

