function move = Pavlov(history)
    l=size(history,1);

    if l==0 %no moves yet
        move=1;
        return;
    end

    if history(l,1)==history(l,2) %same move last turn
        move=1;
    else
        move=2;
    end
end

