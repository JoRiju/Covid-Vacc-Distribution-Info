clc,clear, close all
UsVACC = readtable('us_state_vaccinations.csv');
k= 0;
%While loop makes sure that the  state netered is an actual state and not a
%random string by user
AllState = categorical(UsVACC.location);%seperates all the states into a seperate matrix
while k == 0 
    state = input('Name the state for which you would like to gather data: ',"s");
    states=sum(AllState == state);
    %Checks weather the State entered by the user is a state if not will
    %repeat warning till a state is entered
    if states == 0
        warning('The input you entered is wrong please try again');
        k = 0;
    else
        k =+1;
    end
end
[average,max] = UsVaccineData(state,UsVACC);
for y = 1:3
    if y == 1
        fprintf('The average amount of vaccines in the state of %s is %0.2f vaccinations \n', state, average(y))
        fprintf('The maximum amount of vaccines given out daily in the state of %s was %0.2f vaccinations\n', state, max(y))
    else if y == 2
            fprintf('The average amount of vaccine distribution in the state of %s is %0.2f vaccinations\n', state, average(y))
        else
            fprintf('The average amount of people that recieved vaccines in the state of %s is %0.0f\n', state, average(y))
        end
    end
end
