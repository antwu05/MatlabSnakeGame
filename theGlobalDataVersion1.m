function data = theGlobalDataVersion1(name,value) % taking two input arguments; name and value
persistent variables % use of persistent to store data in variables
if isempty(variables) % intializing the default values for the game before it starts
    variables.gameOver = false; 
    variables.x = [10 10]; % 10 by 10 structure
    variables.y = [10 10]; % 10 by 10 structure
    variables.fruit_x = randi([1 20]); % randomly generate fruit on x coordinate
    variables.fruit_y = randi([1 20]); % randomly generated fruit on y coordinate
    variables.score = 0; % inital score of 0
    variables.direction = 'right'; % initial direction of right
    variables.snake_length = 2; % intial length of snake is 2
end
if nargin > 0 %if there is more than than one input argument
    variables.(name) = value; % sets the value of the specified field in "variables.name" and returns updated variables
end
data = variables % if no input arguments returns the entire "variables" structure
end
