% Anthony Snake game attempt
% Set initial values
   % function theGlobalData
   theGlobalData();
   data = theGlobalData();

    % Set up figure and timer
    fig = figure('KeyPressFcn', @keyPress);
    t = timer('TimerFcn', @gameLoop, 'Period', 0.1, 'ExecutionMode', 'fixedRate');
    start(t);

    % Game loop
 gameLoop();
        % Move snake
        switch direction
            case 'up'
                x = [x(1) x(1:end-1)];
                y = [y(1)+1 y(1:end-1)];
            case 'down'
                x = [x(1) x(1:end-1)];
                y = [y(1)-1 y(1:end-1)];
            case 'left'
                x = [x(1)-1 x(1:end-1)];
                y = [y(1) y(1:end-1)];
            case 'right'
                x = [x(1)+1 x(1:end-1)];
                y = [y(1) y(1:end-1)];
        end

        % Check for collision with walls or self
        if x(1) < 1 || x(1) > 20 || y(1) < 1 || y(1) > 20 || ...
           any(x(2:end) == x(1) & y(2:end) == y(1))
            gameOver = true;
        end

        % Check for collision with fruit
        if x(1) == fruit_x && y(1) == fruit_y
            score = score + 10;
            fruit_x = randi([1 20]);
            fruit_y = randi([1 20]);
            snakeLength = snakeLength + 2;
        end

        % Grow snake if needed
        while length(x) < snakeLength
            x(end+1) = x(end);
            y(end+1) = y(end);
        end

        % Draw game state
        clf;
        hold on;
        plot(x, y, 's', 'MarkerSize', 20, 'MarkerFaceColor', 'k');
        plot(fruit_x, fruit_y, 'o', 'MarkerSize', 20, 'MarkerFaceColor', 'r');
        axis([0 21 0 21]);
        title(sprintf('Score: %d', score));
        drawnow;

    % Key press callback function
    keyPress();