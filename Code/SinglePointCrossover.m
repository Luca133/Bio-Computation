function [offSpring] = SinglePointCrossover(offSpring,numOfOffspring, lengthOfCandidate)

crossoverPoint = randi(lengthOfCandidate);
for a = 1:2:numOfOffspring
    for b = crossoverPoint:lengthOfCandidate
        tempVal = offSpring(a, b);
        offSpring(a, b) = offSpring(a + 1, b);
        offSpring(a + 1, b) = tempVal;
    end
end

end

