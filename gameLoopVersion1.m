% Game loop
function gameLoopVersion1(~, ~)% taking two input arguments
    data=theGlobalData(); % retrieving global data
        if gameOver % if statement for when the game is over
            stop(t); % stops
            delete(t); % delets timer
            close(fig); %closes figure
            fprintf('Game over! Your score: %d\n', data.score);% displays message
            return;
        end
