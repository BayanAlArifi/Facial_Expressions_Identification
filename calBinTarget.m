function [binary] = calBinTarget(lable)
    load('cleandata_students.mat');
    binary = zeros(length(x), 1);
    for i = 1:length(y)
        if y(i) == lable
            binary(i) = 1;
        end
    end
end
        
  
