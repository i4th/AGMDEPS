

load('EXAMPLE_RESULTS_MILLIONSEARCHES_MAX6.mat')




i = 1;

while i<= 221
    UNIVERSE(i).PERMUTATION = DATA.FEAS_PERMS(i,:);
    i = i+1;
end

