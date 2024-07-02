% Test case for keyPress function

% Initialize global data
theGlobalData('direction', 'right');

% Create a mock event structure for simulating a key press
event = struct('Key', 'leftarrow');

% Call the keyPress function with the mock event
keyPress([], event);

% Check if the direction was updated correctly
data = theGlobalData();
assert(strcmp(data.direction, 'left'));

% This test case initializes the global data with a starting direction of 'right'. 
% It then creates a mock `event` structure to simulate pressing the left arrow key. 
% The `keyPress` function is called with this mock event, and the test checks if 
% the direction was updated correctly to 'left'.



