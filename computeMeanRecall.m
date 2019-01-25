function [ meanRecall ] = computeMeanRecall(confusionMatrix)

actualSize = size(confusionMatrix,1);
TP = 0;
FN = 0;
recallSum = 0;
meanRecall = 0;

for index = 1:actualSize
    TP = confusionMatrix(index,index);
    FN = sum(confusionMatrix(index,:)) - TP;
    recallSum = recallSum + calculateRecall(TP, FN);
end

meanRecall = recallSum / actualSize;

end

