function data = theGlobalData(name,value) % takes two inputs "name" and "value"
persistent variables % persistent is used to create "variables"
% checks if "variables" is empty. If empty the function intializes the
% fields of "variables" structure with default values of the game
if isempty(variables)
    variables.gameOver = false; % game over status
    variables.x = [10 10]; % x coordinates of snake
    variables.y = [10 10]; % y coordinates of snake
    variables.fruit_x = randi([1 20]); % x coordinates of fruit
    variables.fruit_y = randi([1 20]); % y coordinates of fruit
    variables.score = 0; % starting score of 0
    variables.direction = 'right'; % snake starting direction of right
    variables.snake_length = 2; % starting length of 2
 % creates a figure using function and sets its KeyPressFcn property to
    % @keyPress. When a key is pressed the function keyPress will be called
    % upon
    variables.fig = figure('KeyPressFcn', @keyPress);
   % creates a timer. the TimerFcn property is set to @gameLoop, which
   % means gameLoop function will be called upon when timer starts. Period
   % is set to 0.1, meaning timer will fire every 0.1 seconds.
   % ExecutionMode property is set to fixedRate which means that the timer
   % will fire at fixed intervals regardless of how long it takes to
   % execute the callback function.
    variables.t = timer('TimerFcn', @gameLoop, 'Period', 0.1, 'ExecutionMode', 'fixedRate');
end
if nargin == 1 % if there is only one input argument, 
    % it returns the value of the specificed field in "variables"
    data = variables.(name);
elseif nargin > 0 % if there is more than than one input argument
    variables.(name) = value; % sets the value of the specified field in "variables.name" and returns updated variables
    data = variables;
else
    data = variables; % if no input arguments returns the entire "variables" structure
end

end
% Reference
% https://au.mathworks.com/matlabcentral/answers/369955-once-more-avoid-global-variable

