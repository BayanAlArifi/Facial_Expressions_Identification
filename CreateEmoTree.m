function [EmoTree] = CreateEmoTree(originalTree, originalAUs, EmoBinaryTarget)  
    %load('cleandata_students.mat');
    
    %OP is AU index
    %KIDS is an array of 1 row and two columns corresponding to the child nodes
    %CLASS is either 0 or 1 (value of leaf)
    
    EmoTree = struct();
    
    % ****** CASE 1: ALL EXAMPLES ARE CLASSIFIED TO THE EMO LABEL *******
    if sum(EmoBinaryTarget) == length(EmoBinaryTarget)
       %EmoTree = struct('class', 1);
       EmoTree.op = -1;
       EmoTree.kids = cell(0);
       EmoTree.class = 1;
    elseif sum(EmoBinaryTarget) == length(EmoBinaryTarget)
       %EmoTree = struct('class', 0);
       EmoTree.op = -1;
       EmoTree.kids = cell(0);
       EmoTree.class = 0;
    % ***** END CASE 1: ALL EXAMPLES ARE CLASSIFIED TO THE EMO LABEL ****
    
    
    %*************** CASE 2: TREE IS EMPTY => MUST BE LEAF **************
    elseif isempty(originalAUs)
            EmoTree.class = majorityValue(EmoBinaryTarget);
    %*************** END CASE 2: TREE IS EMPTY => MUST BE LEAF **********
   
    
    %*************** CASE 3: INTERNAL NODE (NOT LEAF) *******************
    else
        %choosing best attribute based on info gain 
        bestAU = chooseBestDecisionAttribute(originalTree, originalAUs, EmoBinaryTarget);
   
        EmoTree = struct('op', -1, 'kids', 0, 'class', -1);
        EmoTree.op = bestAU;

        %delete best Attribute column from originalAUs
        for i = 1:length(originalAUs)
            if originalAUs(i)== bestAU;
                AUindex = i;
            end
        end
        originalAUs(AUindex,:) = [];
        
        %create tree branches/children
        subMatrix = []; 
        subEmoBinaryTarget = [];
        
        for i = 0:1
            for z = 1:length(bestAU)
                if (bestAU(z) == i)
                    subMatrix = [subMatrix; originalTree(z,:)];  % check syntax
                    subEmoBinaryTarget = [subEmoBinaryTarget; EmoBinaryTarget(z, i)];
                end
            end
            
            subEmoTree = struct();
            subEmoTree.op = -1;
            subEmoTree.kids = 0;
            subEmoTree.class = -1;
            
            if (isempty(subMatrix))
                subEmoTree.class = majorityValue(EmoBinaryTarget);
            else
                subEmoTree = CreateEmoTree(subEmoBinaryTarget, subMatrix, originalAUs); % right side recursion
            end
            EmoTree.kids{i} = subEmoTree;
        end
    end
    %*************** END CASE 3: INTERNAL NODE (NOT LEAF) ******************
end
            
