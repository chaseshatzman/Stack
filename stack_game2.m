clc;
% clears command window

gameHeight = 18;
gameWidth = 18;
% game size

blockXpos = 7.5;
blockYpos = 1;
blockHeight = 1;
blockWidth = 3;
% bottom block size and position

currentXpos = 1;
currentYpos = 17;
currentHeight = 1;
currentWidth = 3;
direction = 0.2;
% moving block size and starting position

global drop
drop = false;
% variable that tracks whether the block should drop

figure('Color', 'k', 'Name', 'Stack Game', 'NumberTitle', 'off', 'windowstyle', 'normal', 'KeyPressFcn', @keyPress)
% creates the game window and sets key press behavior

axis([0 gameWidth 0 gameHeight])
set(gca,'LineWidth', 2, 'XColor','b', 'YColor', 'b', 'XTick',[],'YTick',[])
set(gca, 'Color', 'k')
box on
hold on;
% sets the game area, border, colors, and removes axis numbers

disableDefaultInteractivity(gca)
% turns off default graph interactions like zooming and draggin

stackXpos = blockXpos;
stackYpos = blockYpos;
stackWidth = blockWidth;
stackHeight = blockHeight;
% stores the current top block of the stack

rectangle('Position', [stackXpos stackYpos stackWidth stackHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
% making bottom block appear

topBlock = rectangle('Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w')
% top moving block appearance

drawnow
% updates the screen so the blocks appear

while true
   if drop
       targetY = stackYpos + stackHeight;
       if currentYpos > targetY + 0.3
           currentYpos = currentYpos - 0.3;
           %moves top block down when space is pressed
       else
           currentYpos = targetY;
           newX=currentXpos;
        

           offset = stackXpos - currentXpos;  
              if abs(offset) >= currentWidth
                  if (currentXpos + currentWidth > 7.5) && (currentXpos < 10)
                      targetFloor = stackYpos - 2 ;
                      %when block drops on stack but not the topmost 
                      %block on the stack, it makes it fall and delete
                  else 
                      targetFloor = 0;
                      %when block misses stack completely, it falls to the
                      %bottom
                  end 
                 
                  %hows block fallign
                  while currentYpos > targetFloor
                      currentYpos = currentYpos - 0.5;
                      
                      %conditional for if -0.5 maeks block fall below
                      %targetFloor
                      if currentYpos < targetFloor
                        currentYpos = targetFloor;
                      end
                      set(topBlock, 'Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
                      drawnow;
                      pause(0.02);
                  end
                  
                  %sets fallen block at coordinates, then deletes it
                  set(topBlock, 'Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w')
                  drawnow;
                  pause(0.02); 
                  delete(topBlock)
                  text(gameWidth/2, gameHeight/2, 'GAME OVER', 'Color', 'r', 'FontSize', 30, 'HorizontalAlignment', 'center')
                  break
              end
              %trims and aligns blocks based off offset
              if currentXpos ~= stackXpos
                  if offset > 0 
                      newX = stackXpos;
                  else
                      newX = currentXpos;     
                  end
                  currentWidth = stackWidth - abs(offset);
              end

              %adds rectangle into stack
              rectangle ('Position', [newX, currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
              
              %updates values in stack because new block was added
              stackXpos = newX;
              stackYpos = currentYpos;
              stackWidth = currentWidth;
              stackHeight = currentHeight;
              
              %deletes moving block generated when at top of game screen
              if stackYpos >= gameHeight - 1
                  delete(topBlock)
                  text(gameWidth/2, gameHeight/2, 'YOU WIN', 'Color', 'g', 'FontSize', 30, 'HorizontalAlignment', 'center')
                  break
              end
              
              %creates new moving block at the top of screen
              currentXpos = 1;
              currentYpos = 17;
              direction = 0.2;
              drop = false;
              delete(topBlock); 
              topBlock = rectangle ('Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
       end 
   else
       currentXpos = currentXpos + direction;
       if currentXpos <= 0 || currentXpos >= 18 - currentWidth
            direction = -direction;
            %moves moving block at top of screen back and forth
            % from left of gamescreen to right
       end
   end 

  set(topBlock, 'Position', [currentXpos currentYpos currentWidth currentHeight])
  % updates the top block's position on the screen
  
  drawnow
  %refereshes the screen so movement is visible
   
  pause(0.02);
  %controls the speed of the loop
  end

function keyPress(~,event)
  global drop
  if strcmp(event.Key,'space')
      drop=true;
  end
% makes the block drop when space is pressed

end


