% Testing if the figure displayed includes the snake and fruit on x and y
% cooridnates. No movement involved in this test case 
% Test case for gameLoop function
% Initialize global data
theGlobalData('gameOver', false);
theGlobalData('t', timer());
theGlobalData('fig', figure());
theGlobalData('score', 10);

% Call the gameLoop function
gameLoop([], []);

% Check if the timer and figure are still present
assert(ishandle(theGlobalData().t), 'Timer should not be deleted when game is not over');
assert(ishandle(theGlobalData().fig), 'Figure should not be closed when game is not over');

% Set gameOver to true and call the gameLoop function again
theGlobalData('gameOver', true);
gameLoop([], []);

% Check if the timer and figure have been deleted and closed
assert(~ishandle(theGlobalData().t), 'Timer should be deleted when game is over');
assert(~ishandle(theGlobalData().fig), 'Figure should be closed when game is over');

% assert throws error when condition is false