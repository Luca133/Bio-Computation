function [offSpring] = BitwiseMutation(offSpring,numOfOffspring, mutationRate, lengthOfCandidate)

for a = 1:numOfOffspring
    for b = 1:lengthOfCandidate
        if randi(100) <= mutationRate
            if offSpring(a, b) == 0
                if randi([0 1]) == 0
                   offSpring(a, b) = 1;
                else
                    offSpring(a, b) = 2;
                end
            elseif offSpring(a, b) == 1
                if randi([0 1]) == 0
                   offSpring(a, b) = 0;
                else
                    offSpring(a, b) = 2;
                end
            elseif offSpring(a, b) == 2
                if randi([0 1]) == 0
                   offSpring(a, b) = 0;
                else
                    offSpring(a, b) = 1;
                end
            end
        end
    end
end

end

