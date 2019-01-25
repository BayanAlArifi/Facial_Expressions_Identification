function ones = countPos(vector)
    ones = 0;
    for i = 1:length(vector)
        if vector(i)==1
            ones = ones + 1;
        end
    end
end