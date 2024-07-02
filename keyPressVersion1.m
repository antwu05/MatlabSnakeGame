 % Key press callback function

 % the function keyPress retrieves the global data structure
 % "theGlobalData" and checks the value of the "Key" field in the
 % "event "data" structure
 function keyPressVersion1(~, event)
        data=theGlobalData();
        switch event.Key
            case {'uparrow', 'w'} % up arrow or w on keyboard
                % the function checks if the current direction stored in data.direction is not down
                if ~strcmp(data.direction, 'down') 
                    datadirection = 'up'; % if condition is true the snake will move up
                end
            case {'downarrow', 's'} % down  arrow or s on the keyboard
                 % the function checks if the current direction stored in data.direction is not up
                if ~strcmp(datadirection, 'up') 
                    datadirection = 'down'; % if condition is true the snake will move down
                end
            case {'leftarrow', 'a'} % left arrow or a on the keyboard
                  % the function checks if the current direction stored in data.direction is not right
                if ~strcmp(datadirection, 'right')
                    datadirection = 'left'; % if condition is true the snake will move left
                end
            case {'rightarrow', 'd'} % right arrow or d on the keyboard 
                 % the function checks if the current direction stored in data.direction is not left
                if ~strcmp(datadirection, 'left') 
                    datadirection = 'right'; % if condition is true the snake will move right
                end
        end
    end
