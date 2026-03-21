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
       else
           currentYpos = targetY;
           newX=currentXpos;
        

           offset = stackXpos - currentXpos;  
              if abs(offset) >= currentWidth
                  if (currentXpos + currentWidth > 7.5) && (currentXpos < 10)
                      targetFloor = stackYpos - 2 ;
                  else 
                      targetFloor = 0;
                  end 
                 
                  while currentYpos > targetFloor
                      currentYpos = currentYpos - 0.5;
                      if currentYpos < targetFloor
                        currentYpos = targetFloor;
                      end
                      set(topBlock, 'Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
                      drawnow;
                      pause(0.02);
                  end
                  set(topBlock, 'Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w')
                  drawnow;
                  pause(0.02); 
                  delete(topBlock)
                  text(gameWidth/2, gameHeight/2, 'GAME OVER', 'Color', 'r', 'FontSize', 30, 'HorizontalAlignment', 'center')
                  break
              end
              if currentXpos ~= stackXpos
                  if offset > 0 
                      newX = stackXpos;
                      disp(newX)
                      disp(stackXpos)
                  else
                      newX = currentXpos;     
                  end
                  currentWidth = stackWidth - abs(offset);
              end
              rectangle ('Position', [newX, currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
              stackXpos = newX;
              stackYpos = currentYpos;
              stackWidth = currentWidth;
              stackHeight = currentHeight;
              if stackYpos >= gameHeight - 1
                  delete(topBlock)
                  text(gameWidth/2, gameHeight/2, 'YOU WIN', 'Color', 'g', 'FontSize', 30, 'HorizontalAlignment', 'center')
                  break
              end
              currentXpos = 1;
              currentYpos = 17;
              direction = 0.2;
              drop = false;
              delete(topBlock); ...
              topBlock = rectangle ('Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
       end 
   else
       currentXpos = currentXpos + direction;
       if currentXpos <= 0 || currentXpos >= 18 - currentWidth
            direction = -direction;
       end
   end 

  set(topBlock, 'Position', [currentXpos currentYpos currentWidth currentHeight])
  % updates the top block's position on the screen
  
  drawnow
  %refereshes the screen so movement is visible
   
  pause(0.02); % Control the speed of the loop
  %controls the speed of the loop
  end

function keyPress(~,event)
  global drop
  if strcmp(event.Key,'space')
      drop=true;
  end
% makes the block drop when space is pressed

end


