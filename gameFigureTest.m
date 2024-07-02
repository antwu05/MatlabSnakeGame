% Testing the interface of the game by plotting the snake and fruit onto
% the x and y coordinates
theGlobalData('x', [1 2 3]); % x coordinates of snake 
theGlobalData('y', [1 2 3]); % y coordinates of snake
theGlobalData('fruit_x', 5); % x coordinates of fruit
theGlobalData('fruit_y', 5); % y coordinates of fruit
theGlobalData('score', 10); % score of the game

% Draw game state
clf; % clear figure and reset figure
hold on; % retains plots in the current axes so that new plots added to the axes do not delete existing plots
data = theGlobalData();
plot(data.x, data.y, 's', 'MarkerSize', 10, 'MarkerFaceColor', 'k'); % plot data points as black squares with marker size 10
% s stands for square and k specifies the marker face colour (black)
plot(data.fruit_x, data.fruit_y, 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % plot data points as red circles with marker size 10
% o stands for circle and r stands for marker face colour (red)
axis([0 21 0 21]); % axis limits 
title(sprintf('Score: %d', data.score));
drawnow; % update the figure window with latest changes.




