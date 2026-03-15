clc;

gameHeight = 17;
gameWidth = 17;
%game sizes

blockXpos = 2;
blockYpos = 2;
blockHeight = 1;
blockWidth = 3;
%block size

currentXpos = 0;
currentYpos = 12;
currentHeight = 1;
currentWidth = 3;
direction = 0.1;

figure('Color', 'k', 'Name', 'Stack Game', 'NumberTitle', 'off')

axis([0 gameWidth 0 gameHeight])
axis equal
hold on;

box on
set(gca,'LineWidth',2, 'XColor','b', 'YColor', 'b', 'XTick',[],'YTick',[]) 
set(gca, 'Color', 'k')
%border

disableDefaultInteractivity(gca)

%bottomBlock = rectangle('Position', [blockXpos blockYpos blockWidth blockHeight], 'FaceColor', 'b', 'EdgeColor', 'w')
%topBlock = rectangle('Position', [currentXpos currentYpos currentWidth blockHeight], 'FaceColor', 'b', 'EdgeColor', 'w')

% Initialize the game loop
while true
    
    % Clear the current rectangle before redrawing
     cla;

     axis([0 gameWidth 0 gameHeight])
     axis equal
     hold on
     box on
     set(gca, 'LineWidth', 2, 'XColor', 'b', 'YColor', 'b', 'XTick', [], 'YTick', [])
     set(gca,'Color', 'k')
     disableDefaultInteractivity(gca)

    
    % Redraw the block and current position
    rectangle('Position', [blockXpos blockYpos blockWidth blockHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
    rectangle('Position', [currentXpos currentYpos currentWidth currentHeight], 'FaceColor', 'b', 'EdgeColor', 'w');
   
    currentXpos = currentXpos +direction;
    
    % Update the current position based on the direction
    if currentXpos <= 0 ||  currentXpos + direction >= gameWidth
        direction = -direction;
    end

    %set(topBlock, 'Position', [currentXpos currentYpos currentWidth currentHeight])

    pause(0.02); % Control the speed of the loop
end 