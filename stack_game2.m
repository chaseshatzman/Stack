clc;
% clears command window

gameHeight = 18;
gameWidth = 18;
% game size

blockXpos = 7.5;
blockYpos = 1;
blockHeight = 1;
blockWidth = 2.5;
% bottom block size and position

currentXpos = 1;
currentYpos = 17;
currentHeight = 1;
currentWidth = 2.5;
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
% bottom block appearance

topBlock = rectangle('Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w')
% top moving block appearance

drawnow
% updates the screen so the blocks appear

while true
   if drop
       targetY = stackYpos + stackHeight;
       if currentYpos > targetY + 0.3
           currentYpos = currentYpos - 0.3;
           disp('dropping')
       else
           currentYpos = targetY;
           disp(currentYpos)
           disp(targetY)
           newX=currentXpos;
           disp(currentXpos)
           disp(stackXpos)

           offset = stackXpos - currentXpos;  
              if abs(offset) >= currentWidth
                  if currentXpos + currentWidth < 7.5 || currentXpos > 10
                      targetFloor=1;
                  else
                  targetFloor = blockYpos + blockHeight;

                  end
                 while currentYpos > targetFloor
                     currentYpos = currentYpos - 0.5;
                     if currentYpos < targetFloor
                         currentYpos = targetFloor;
                     end
                     set(topBlock,'Position', [currentXpos targetFloor currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
                     drawnow;
                     pause(0.02);

                 end

                 set(topBlock,'Position', [currentXpos targetFloor currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
                 drawnow;
                 pause(0.02);

                 delete(topBlock) 
               break;
             end

           if currentXpos~=stackXpos
               %offset = stackXpos - currentXpos;
               if offset > 0
                   newX=stackXpos;
                   disp(newX)
                   disp(stackXpos)
               else
                   newX=currentXpos;
                   disp(newX)
                   disp(currentXpos)
               end
               currentWidth = stackWidth - abs(offset);
               disp('calculting offset')
               disp(offset)
           end
           %if currentWidth <=0
            %   break;
           %end

           rectangle('Position', [newX, currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
           disp('new rectangle')
          %draws the block after it lands on the stack
           
          stackXpos = newX;
           stackYpos = currentYpos;
           stackWidth = currentWidth;
           stackHeight = currentHeight;

          if stackYpos >= gameHeight -1
    %rectangle('Position', [newX, currentYpos 0 0], 'FaceColor', 'k', 'EdgeColor', 'k');
    %drop=false
          delete(topBlock)
          break;
          end
        
           currentXpos = 1;
           currentYpos = 17;
           direction = 0.2;
           drop = false;
           delete(topBlock);
           topBlock = rectangle('Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w')
       end
      %makes the landed block the new top of the stack and creates a new
      %moving block
   else
       currentXpos = currentXpos + direction;
       % updates horizontal positions of moving block
       
       if currentXpos <= 0 ||  currentXpos + direction >= 15.5
           direction = -direction;
       end
       % keeps the moving block from going past the screen edges
  
   %if stackYpos >= gameHeight -1
    %rectangle('Position', [newX, currentYpos 0 0], 'FaceColor', 'k', 'EdgeColor', 'k');
    %drop=false
    %break;
%end
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

