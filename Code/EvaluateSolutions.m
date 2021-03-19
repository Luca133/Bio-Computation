function [fitnessArr] = EvaluateSolutions(numOfCandidates, lengthOfCandidate, currentRuleSet, input, output)

% Function to calculate the fitness of aall candidates
fitnessArr = zeros(numOfCandidates, 1);

for a = 1:numOfCandidates
    fitnessArr(a) = CalculateFitness(lengthOfCandidate, currentRuleSet(a,:), input, output);
end
    
end

