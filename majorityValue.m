function mode = majorityValue(vector)
    ones = countPos(vector);
    zeros = length(vector) - ones;
    
    if ones > zeros
        mode = 1;
    else
        mode = 0;
    end
end