function move = Gradual(history)
    persistent punish_count calm_count opponent_defections;

    % Initialize persistent variables on the first call
    if isempty(history)
        punish_count = 0;
        calm_count = 0;
        opponent_defections = 0; % Keep track of total defections by opponent
        move = 1; % Cooperate on the first move
        return;
    end

    % Update opponent_defections
     if history(end, 2) == 2  % If opponent defected in the last round
        opponent_defections = opponent_defections + 1;
    end
    % Punishment phase
    if punish_count > 0
        move = 2; % Defect
        punish_count = punish_count - 1;
        return;
    end

    % Calming phase
    if calm_count > 0
        move = 1; % Cooperate
        calm_count = calm_count - 1;
        return;
    end

    % Check for opponent defection and initiate punishment/calming
    if history(end, 2) == 2
        punish_count = opponent_defections - 1; % Punish based on total defections
        calm_count = 2;         % Enter calming phase after punishment
        move = 2;             % Defect in the first punishment round
        return;
    end

    % Default behavior: Cooperate
    move = 1;
end