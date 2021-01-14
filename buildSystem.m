function [ SYSTEM ] = buildSystem(SYS_PERMUTATION)

% START TIMER
tic

% BUILD TASK OBJECTS
[ SYSTEM ] = buildSystemTaskObjects();    

% BUILD RESOURCE OBJECTS
[ SYSTEM ] = buildSystemResourceObjects(SYSTEM, SYS_PERMUTATION); 

% EPISODE_LENGTH
SYSTEM.EPISODE_LENGTH = uint32(100000);

% SYSTEM PERMUTATION
SYSTEM.SYS_PERMUTATION = SYS_PERMUTATION;

% END TIMER
sys_build_time = toc;
disp("SYSTEM BUILT IN: " + sys_build_time + " SECONDS"); 
clear sys_build_time

end