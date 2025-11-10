function s=SimMC(P, s0, T)
%Simulates a state sequence for a Markov chain with probability transition probability matrix P
% INPUT:
%	P:			transition probability matrix
%	s0:			Initial state 
%	T:			length of desired state sequence
% OUTPUT:
%	s:			State sequence

    % Number of states
    N = size(P, 1);

    % Validate inputs
    if s0 < 1 || s0 > N
        error('Initial state index must be between 1 and %d', N);
    end

    % Preallocate the state history
    s = zeros(1, T + 1);
    s(1) = s0;

    % Simulate the chain
    for t = 1:T
        current_state = s(t);
        % Sample the next state based on transition probabilities
        s(t+1,1) = find(rand < cumsum(P(current_state,:)), 1);
    end

	%{
    % Plot the sequence
    figure;
    stairs(0:T, s, 'LineWidth', 2);
    xlabel('Step');
    ylabel('State');
    title('Markov Chain Simulation');
    grid on;
	%}
end