function Move = Prober(History)
% Starts with D, C, C. If the opponent cooperated at moves 2 and 3, 
% plays defect for the rest of the game. Otherwise plays TFT.
    startingMoves = [2 1 1];
    round = nnz(History(:,1)) +1;
    if round <= length(startingMoves)
        Move = startingMoves(round);
    elseif History(2, 2) == 1 && History(3, 2) == 1
        Move=AllD(History); 
    else
        Move=TitForTat(History);
    end
end