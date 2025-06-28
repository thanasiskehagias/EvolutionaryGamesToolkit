function move = Hard_TfT(history)
l=size(history,1);

if l<=1
    move = 1;
else
    if history(l,2) == 2 || history(l-1,2)== 2 % at least one defect in 2 rounds
        move = 2;
    else
        move = 1;
    end
end
return;

end