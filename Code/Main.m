% SimpleGeneticAlgorithm
% Program to optimise fitness

format long
close all
clear
clc
fclose('all');

%% Initialise settings and starting population

% Only works with data sets 1 and 2
dataName = 'data1.txt';

% To change candidate length (ie number of rules) change lengthOfCandidate
if strcmp(dataName, 'data1.txt') == 1
    lengthOfCandidate = 60; % Must be a multiple of 6
elseif strcmp(dataName, 'data2.txt') == 1
    lengthOfCandidate = 80; % Must be a multiple of 8
end

[input, output] = ImportData(dataName);

% Other variables to manipulate
numOfCandidates = 50;
numOfOffspring = numOfCandidates; % population of each generation
mutationRate = 1; % must be an integer less than 100
numOfGenerations = 50;
numOfRuns = 50;

    
fitnessAvg = zeros(numOfRuns, numOfGenerations);
fitnessBestAvg = zeros(numOfRuns, numOfGenerations);
fitnessWorstAvg = zeros(numOfRuns, numOfGenerations);

for r = 1:numOfRuns
    
    geneArr = randi([0 2], numOfCandidates, lengthOfCandidate);
    
    offSpring = geneArr;
    
    fitnessArr = EvaluateSolutions(numOfCandidates, lengthOfCandidate, offSpring, input, output);
    
    % Find best candidate in initial population
    bestCandidate = offSpring(1,:);
    fitnessOfBest = fitnessArr(1);
    
    for z = 1:numOfCandidates
        if fitnessArr(z) > fitnessOfBest
            bestCandidate = offSpring(z,:);
            fitnessOfBest = fitnessArr(z);
        end
    end
    
    %%
    for a = 1:numOfGenerations
        %% Single point crossover
        
        offSpring = SinglePointCrossover(offSpring,numOfOffspring, lengthOfCandidate);
        
        %% Bit-wise mutation
        
        offSpring = BitwiseMutation(offSpring,numOfOffspring, mutationRate, lengthOfCandidate);
        
        fitnessArr = EvaluateSolutions(numOfCandidates, lengthOfCandidate, offSpring, input, output);
        
        %% Select new offspring and calculate their fitness
        offSpring = SelectOffspring(numOfOffspring, offSpring, lengthOfCandidate, numOfCandidates, fitnessArr);
        
        fitnessArr = EvaluateSolutions(numOfCandidates, lengthOfCandidate, offSpring, input, output);
        
        indexOfWorst = 1;
        
        for c = 2:numOfCandidates
            if fitnessArr(c) < fitnessArr(indexOfWorst)
                indexOfWorst = c;
            end
        end
        
        for z = 1:numOfCandidates
            if fitnessArr(z) > fitnessOfBest
                bestCandidate = offSpring(z,:);
                fitnessOfBest = fitnessArr(z);
            end
        end
        
        offSpring(indexOfWorst,:) = bestCandidate;
        
        fitnessArr = EvaluateSolutions(numOfCandidates, lengthOfCandidate, offSpring, input, output);
        
        %% Stuff for graphs
        fitnessAvg(r, a) = sum(fitnessArr) / numOfCandidates;
        fitnessBestAvg(r, a) = max(fitnessArr);
        fitnessWorstAvg(r,a) = min(fitnessArr);
        
    end
end

%% Plot all the lines
fitnessAvg = mean(fitnessAvg);
fitnessBestAvg = mean(fitnessBestAvg);
fitnessWorstAvg = mean(fitnessWorstAvg);

yaxis = fitnessAvg;
best = fitnessBestAvg;
worst = fitnessWorstAvg;

plot(yaxis);
hold on;
plot(best);
plot(worst);

if strcmp(dataName, 'data1.txt') == 1
    ylim([0 32])
elseif strcmp(dataName, 'data2.txt') == 1
    ylim([0 70])
end

legend('Mean Candidate','Best Candidate','Worst Candidate','location','southeast');

xlabel('Number of Runs');
ylabel('Fitness');

hold off;
