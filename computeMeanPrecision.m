function [ meanPrecision ] = computeMeanPrecision( confusionMatrix )
actualSize = size(confusionMatrix,1);
TP = 0;
FP = 0;
precisionSum = 0;
meanPrecision = 0;

for index = 1:actualSize
    TP = confusionMatrix(index,index);
    FP = sum(confusionMatrix(:,index)) - TP;
    precisionSum = precisionSum + calculatePrecision(TP, FP);
end

meanPrecision = precisionSum / actualSize;

end

