function [ res ] = goThroughTree( tree, AU )
%GOTHROUGHTREE takes a row of AU values and process it through a tree
    if (isempty(tree.kids))
       res = tree.class;
       return
    end
    
    if (AU(tree.op) == 0)
        goThroughTree(tree.kids{0})
    else
        goThroughTree(tree.kids{1})
    end
end

