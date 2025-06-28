function move = Per_kind(history)

l=size(history,1);
      
    if l<=1
        move=1;
        return;
    end
    
    
    if l>1
        if history(l,1)==1 && history(l-1,1) ==1 %cooperate cooperate
            move =2; %defect
        else
            move =1;
        end
    end

end