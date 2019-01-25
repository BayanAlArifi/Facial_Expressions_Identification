load('cleandata_students.mat');

originalTree = x;
originalAUs= [1:45]';

AngerTargets = calBinTarget(1);
AngerTree = CreateEmoTree(originalTree, originalAUs, AngerTargets);

originalTree = x;
DisgustTargets = calBinTarget(2);
DisgustTree = CreateEmoTree(originalTree, originalAUs, DisgustTargets);

originalTree = x;
FearTargets = calBinTarget(3);
FearTree = CreateEmoTree(originalTree, originalAUs, FearTargets);

originalTree = x;
HappinessTargets = calBinTarget(4);
HappinessTree = CreateEmoTree(originalTree, originalAUs, HappinessTargets);

originalTree = x;
SadnessTargets = calBinTarget(5);
SadnessTree = CreateEmoTree(originalTree, originalAUs, SadnessTargets);

originalTree = x;
SurpriseTargets = calBinTarget(6);
SurpriseTree = CreateEmoTree(originalTree, originalAUs, SurpriseTargets);