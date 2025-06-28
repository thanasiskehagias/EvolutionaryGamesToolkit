function move = Per_nasty(history)
l=size(history,1);
      
    if l<=1
        move=2;
        return;
    end
    
    
    if l>1
        if history(l,1)==2 && history(l-1,1) ==2 %defect defect
            move =1; %cooperate
        else
            move =2;
        end
    end
end
