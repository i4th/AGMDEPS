function [ SELECTED_eC ] = selectEc(SYSTEM)



% EMPTY DATA STRUCT
DATA_STRUCT = zeros(SYSTEM.NEIGHBOURHOOD.SIZE, 1, 'uint16');

% FILL DATA STRUCT
i = uint16(1);
j = uint16(1);
while i <= SYSTEM.NO_POS_EVENTS
    if SYSTEM.NEIGHBOURHOOD.STRUCT(i,1) == true
        DATA_STRUCT(j,1) = i;
        j = j + 1;
    end
    i = i + 1;
end

% SELECT FROM DATA STRUCT
SELECTED_eC = DATA_STRUCT(randi([1 SYSTEM.NEIGHBOURHOOD.SIZE]),1);

% DEBUGGER
%disp("SELECTED CONTROLLED EVENT: " + SELECTED_eC);


end


