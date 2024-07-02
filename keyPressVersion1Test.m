global data; 
data.direction = 'right'; % set direction field to right
fig = figure; % create figure window
set(fig, 'WindowKeyPressFcn',@keyPressVersion1); % when key is pressed function "keyPressVersion1" will be called upon

global data;
data.direction = 'left'; % set direction field to left
fig = figure; % create figure window
set(fig, 'WindowKeyPressFcn',@keyPressVersion1); % when key is pressed function "keyPressVersion1" will be called upon

