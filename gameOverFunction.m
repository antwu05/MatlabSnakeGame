% function gameOver, displays the total score collected by the user once
% the game is over
function gameOverFunction(data)
    if data.gameOver % if statement for when the game is over
        stop(data.t); % stops timer object
        delete(data.t); % deletes timer object
        close(data.fig); % closes figure window
        theGlobalData('t', data.t); % updates the global variable theGlobaldata with data.t
        theGlobalData('fig', data.t); %updates the global variable theGlobaldata with data.t
        fprintf('Game over! Your score: %d\n', data.score); % displays the score in the command window
        return;
    end
end
