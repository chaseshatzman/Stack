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
% turns off default graph interactions like zooming and dragging

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
       if currentYpos > targetY
           currentYpos = currentYpos - 0.3;
       else
            currentYpos = targetY;
            offset = stackYpos - currentYpos;
            if currentWidth <= abs(offset)
                break;
            end

            if offset > 0
                stackXpos = currentXpos;
            end

            stackWidth = currentWidth - abs(offset);
            stackYpos = currentYpos;

         
           rectangle('Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
          %draws the block after it lands on the stack

           %stackXpos = currentXpos;
           %stackYpos = currentYpos;
           %stackWidth = currentWidth;
           %stackHeight = currentHeight;
        
           currentXpos = 1;
           currentYpos = 17;
           currentWidth=stackWidth;
           direction = 0.2;
           drop = false;
           delete(topBlock);
           topBlock = rectangle('Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w')
      
       end
           offset = currentXpos - stackXpos;
       if abs(offset) >= currentWidth
           break;
       else
           newWidth = currentWidth - abs(offset);
           if offset > 1
               newXpos=currentXpos;
           else
               newXpos = stackXpos;
           end
           
           stackXpos = newXpos;
           stackWidth = newWidth;
           currentWidth = newWidth;

           rectangle('Position', [stackXpos stackYpos stackWidth stackHeight], 'FaceColor', 'b', 'EdgeColor', 'w');

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
   end 

  set(topBlock, 'Position', [currentXpos currentYpos currentWidth currentHeight])
  % Updates the top block's position on the screen

  drawnow
  % Refereshes the screen so movement is visible

   pause(0.02);
  % Controls the speed of the loop
end
function keyPress(~,event)
  global drop
  if strcmp(event.Key,'space')
      drop=true;
  end
% Makes the block drop when space is pressed
end
