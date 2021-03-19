function [dataSet, rules] = ImportData(dataName)

if strcmp(dataName, 'data1.txt') == 1
    dataLength = 5;
    dataRow = 32;
elseif strcmp(dataName, 'data2.txt') == 1
    dataLength = 7;
    dataRow = 64;
end

dataSet = zeros(dataRow, dataLength);

fileID = fopen(dataName);

C = textscan(fileID, '%s %s');

for i = 1:dataRow
    string = C{1}{i};
    
    rules(i) = str2double(C{2}{i});
    rules = rules';
    
    for j = 1:dataLength
        stringTemp = str2double(string(j));
        
        dataSet(i, j) = stringTemp;        
    end
end

end

