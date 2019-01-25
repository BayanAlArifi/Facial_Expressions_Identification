function F = CalcF(precision, recall)
    F = 2 * ((precision * recall) / (precision + recall));
end