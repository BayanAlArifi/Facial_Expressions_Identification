function BinaryTargetEntropy = CalcEntropy(BinaryTargetvector)
    pos = sum(BinaryTargetvector);
    neg = length(BinaryTargetvector)-pos;
    
    posProportion = pos /length(BinaryTargetvector);
    negProportion = neg /length(BinaryTargetvector);

    BinaryTargetEntropy = - posProportion*log2(posProportion) - p(negProportion)*log2(negProportion);
end