gameHeight = 12
gameWidth = 12
%game size

blockXpos = 2
blockYpos = 2
blockHeight = 1
blockWidth = 3
%block size

figure('Color', 'k')
axis([0 gameWidth 0 gameHeight])
hold on;

box on
set(gca,'LineWidth',2,'Xcolor','b', 'Ycolor', 'b', 'XTick'[],'YTick',[]) 
%border
