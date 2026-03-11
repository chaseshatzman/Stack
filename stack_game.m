clc;

gameHeight = 17;
gameWidth = 17;
%game size

blockXpos = 2;
blockYpos = 2;
blockHeight = 1;
blockWidth = 3;
%block size

figure('Color', 'k', 'Name', 'Stack Game', 'NumberTitle', 'off')

axis([0 gameWidth 0 gameHeight])
axis equal
hold on;

box on
set(gca,'LineWidth',2, 'XColor','b', 'YColor', 'b', 'XTick',[],'YTick',[]) 
set(gca, 'Color', 'k')
%border

disableDefaultInteractivity(gca)

rectangle('Position', [blockXpos blockYpos blockWidth blockHeight], 'FaceColor', 'b', 'EdgeColor', 'b')