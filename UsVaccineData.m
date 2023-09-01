function [Average,Max] = UsVaccineData(State,DataT)
%Given the Input which is a state name and the Matrix. It will find the highest amount
%of vaccination given by the state in a day. The second output will be
%the average of the toal distribution of the state averagge total
%vaccinations and average amount of people vaccinated.
n = 1;
Data= table2array(DataT(:,3:end));
DataS = categorical(DataT.location);
ind = State==DataS;
in = find(ind == 1);
index = in(1); % Finds the first index where the state comes
value = sum(ind); % finds how many times the state occurs in the matrix
indexB = index + (value-1); % Find the Index in which the state ends
Data2 = rmmissing(Data((index:indexB),1:3));%Takes the the data without the NaN 
while n == 1
    avg = [];
    lol =[];
    if value == 0
        error('The name of the state given does not exist')
    else
        % This finds the amount of recording are done in regards with the state Index will give all the indexes and values the matrix
        %for loop finds out the average for the total vaccines distributed, had,
        %and given
        for x = 1:3
            avg = [avg, mean(Data2(:,x))];
        end
    end
    %Calculates the maximum vaccines that were given out in a day
    Max = [lol,max(Data((index:indexB),10))];
    Average = avg;
    n = n +1;
end


end

