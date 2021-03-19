function [fitness] = CalculateFitness(lengthOfCandidate, currentRuleSet, input, output)

% Function to calculate the fitness of a candidate

fitness = 0;
temp = 0;

[numOfRules,ruleLength] = size(input);

for a = 1:numOfRules
    currentRule = input(a,:);
    for choppedUp = 1:ruleLength+1:lengthOfCandidate
        
        candidate = currentRuleSet(choppedUp:choppedUp+ruleLength-1);
        
        temp = 0;
        
        for b = 1:ruleLength
            if (candidate(b) == 2) || (currentRule(b) == candidate(b))
                temp = temp + 1;
            end
        end
        
        if temp == ruleLength
            if output(a) == currentRuleSet(choppedUp+ruleLength)
                fitness = fitness + 1;
            end
            break;
        end
    end
end
end