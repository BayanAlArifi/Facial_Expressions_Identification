function bestAU = chooseBestDecisionAttribute(originalTree, originalAUs, EmoBinaryTarget)

    %calculate the entropy for binary target vector 
    BinaryTargetEntropy = CalcEntropy(EmoBinaryTarget);

    %to store information gain for all attributes (AUs) to compare them later
    AUsIGs = zeros(length(originalAUs),1);

    for j = 1:length(originalAUs) % traverses columns
        currentAU = originalTree(1:length(originalTree), j);
        numberOnes = sum(currentAU);
        numberZeros = length(currentAU)- numberOnes;
        AUsIGs(j) = BinaryTargetEntropy - (numberOnes/length(currentAU))*AUOnesEntropy(EmoBinaryTarget, currentAU) - (numberZeros/length(currentAU))*AUZerosEntropy(EmoBinaryTarget, currentAU);
    end

    bestAU = AUsIGs(1);

    for i = 2:length(AUsIGs)
        if AUsIGs(i) > bestAU
            bestAU = originalAUs(i);    
        end
    end 
end