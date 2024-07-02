 % Key press callback function

 % the function keyPress retrieves the global data structure
 % "theGlobalData" and checks the value of the "Key" field in the
 % "event "data" structure
function keyPress(~, event)
data=theGlobalData();
switch event.Key
    case {'uparrow', 'w'}  % up arrow or w on keyboard
          % the function checks if the current direction stored in data.direction is not down
        if ~strcmp(data.direction, 'down')
            theGlobalData('direction', 'up');% if condition is true the snake will move up
        end
    case {'downarrow', 's'}% down  arrow or s on the keyboard
        % the function checks if the current direction stored in data.direction is not up
        if ~strcmp(data.direction, 'up')
            theGlobalData('direction', 'down'); % if condition is true the snake will move down
        end
    case {'leftarrow', 'a'} % left arrow or a on the keyboard
        % the function checks if the current direction stored in data.direction is not right
        if ~strcmp(data.direction, 'right') 
            theGlobalData('direction', 'left'); % if condition is true the snake will move left
        end
    case {'rightarrow', 'd'} % right arrow or d on the keyboard 
       % the function checks if the current direction stored in data.direction is not left
        if ~strcmp(data.direction, 'left')
            theGlobalData('direction', 'right');  % if condition is true the snake will move right
        end
end
end
