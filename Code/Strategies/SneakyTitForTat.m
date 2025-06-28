function Move = SneakyTitForTat(History)
% A player starts by cooperating, then defects once and repents if punished and plays TitForTat, 
% but continues if not punished
    if  History(1,1)==0
        Move = 1;
    elseif History(2,1)==0
        Move = TitForTat(History);
    elseif sum(History(1:find(History(:, 1),1,'last'), 2)==2) == 0
        Move = AllD(History);
    elseif History(find(History(:,1),1,'last'), 2) == 2 && History(find(History(:,1),1,'last') - 1, 1) == 2
        Move = AllC(History);
    else
        Move = TitForTat(History);
    end
end