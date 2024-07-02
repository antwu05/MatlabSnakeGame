% Game loop
function gameLoop(~, ~) % function named gameLoop taking two input arguments
data = theGlobalData(); 
% function gameLoop is retrieving from Global variable named theGlobalData

if data.gameOver % if statement for when the game is over
    stop(data.t); % stops timer object
    delete(data.t); % deletes timer object
    close(data.fig); % closes figure window
    theGlobalData('t', data.t); % updates the global variable theGlobaldata with data.t
    theGlobalData('fig', data.t); %updates the global variable theGlobaldata with data.t
    fprintf('Game over! Your score: %d\n', data.score); % displays the score in the command window
    return;
end
% Move snake
switch data.direction 
    % this switch statement determines movement of the snake which is
    % determined the value of data.direction
   % depending the direction of the code the code updates the x and y coordiantes of the snakes body
   
    case 'up' % the value being switched is up
    % concatenating first element of data.x with the all but the last
    % element of the current value of data.x
        data.x = [data.x(1) data.x(1:end-1)]; 
    % adding 1 to the first element of data.y and concatenating it with all
    % but the last element of data.y
        data.y = [data.y(1)+1 data.y(1:end-1)]; 
    
    case 'down' % the value being switched is down
    % concatenating first element of data.x with the all but the last
    % element of the current value of data.x
        data.x = [data.x(1) data.x(1:end-1)]; 
    % subtracting 1 from the first element of the current value of data.y
    % and concatenating with all but the last element of data.y
        data.y = [data.y(1)-1 data.y(1:end-1)];
   
    case 'left' % the value being switched is left
    % subtracting 1 from the first element of the current value of data.x
    % and concatenating with all but the last element of data.x
        data.x = [data.x(1)-1 data.x(1:end-1)]; 
    % concatenating first element of data.x with the all but the last
    % element of the current value of data.x
        data.y = [data.y(1) data.y(1:end-1)];
   
    case 'right' % the value being switched is right
    % adding 1 to the first element of data.x and concatenating it with all
    % but the last element of data.x
        data.x = [data.x(1)+1 data.x(1:end-1)];
    % concatenating first element of data.y with the all but the last
    % element of the current value of data.y
        data.y = [data.y(1) data.y(1:end-1)];
end
% the head of the snake moves in the specified direction by one unit, while
% the body follows the head

% Check for collision with walls or self
if data.x(1) < 1 || data.x(1) > 20 || data.y(1) < 1 || data.y(1) > 20 || ... % checks if the x or y coordinates of the head is out of the bounds 
   any(data.x(2:end) == data.x(1) & data.y(2:end) == data.y(1)) % checks if the head and body have the same x and y coordinates
    data.gameOver = true; % if either statement is true data.gameOver is set to true
end
% Check for collision with fruit
% if the x and y coordinates of the snake's head are equal to x abd y
% coordinates of the fruit
if data.x(1) == data.fruit_x && data.y(1) == data.fruit_y 
    data.score = data.score + 10; % everytime the snake collides with fruit it increases by 10 points
    data.fruit_x = randi([1 20]); % generates new random cooridnates for the fruit on x coordinates
    data.fruit_y = randi([1 20]); % generates new random cooridnates for the fruit on y coordinates
    data.snake_length = data.snake_length + 2; % every fruit collided increases snake length by 2 units
end
% Grow snake if needed
while length(data.x) < data.snake_length % length of the snake is less than data.snake_length
    data.x(end+1) = data.x(end); % adds a new segment to the end of the snake appending the x cooridnate
    data.y(end+1) = data.y(end); % adds a new segment to the end of the snake appending the y cooridnate
end
% Draw game state
clf; % clear figure and reset figure
hold on; % retains plots in the current axes so that new plots added to the axes do not delete existing plots
plot(data.x, data.y, 's', 'MarkerSize', 10, 'MarkerFaceColor', 'k'); % plot data points as black squares with marker size 10
% s stands for square and k specifies the marker face colour (black)
plot(data.fruit_x, data.fruit_y, 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % plot data points as red circles with marker size 10
% o stands for circle and r stands for marker face colour (red)
axis([0 21 0 21]); % axis limits 
title(sprintf('Score: %d', data.score));
drawnow; % update the figure window with latest changes

% updating the values with "data" to global data structure "theGlobaldata
theGlobalData('score', data.score);
theGlobalData('gameOver', data.gameOver);
theGlobalData('x', data.x);
theGlobalData('y', data.y);
theGlobalData('fruit_x', data.fruit_x);
theGlobalData('fruit_y', data.fruit_y);
theGlobalData('snake_length', data.snake_length);
end

