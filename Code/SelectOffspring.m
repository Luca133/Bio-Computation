function [offSpring] = SelectOffspring(numOfOffspring, geneArr, lengthOfCandidate, numOfCandidates, fitnessArr)

offSpring = zeros(numOfOffspring, lengthOfCandidate);

for a = 1:numOfOffspring
    x = randi([1, numOfCandidates]);
    y = randi([1, numOfCandidates]);
    
    if fitnessArr(x) > fitnessArr(y)
        for b = 1:lengthOfCandidate
            offSpring(a, b) = geneArr(x, b);
        end
    else
        for b = 1:lengthOfCandidate
            offSpring(a, b) = geneArr(y, b);
        end
    end
end

end

