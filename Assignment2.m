load cleandata_students.mat

cleandata_students
If you have a mztrix of the type (m,n), you could write

examples = reshape(textread('words.txt', '%s'),n,m)
%load specific variable from file
%load('handel.mat','y')
%SYNTAX
%function [output1,output2] = filename(input1,input2,input3)
function [ Decision Tree ] = DTLearning( examples,attributes,binary_targets )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if all examples have the same value of binary_targets
    then return a leaf node with this value

    else if attributes is empty
    then return a leaf node with value = MAJORITY-VALUE(binary_targets)

    else
    best_attribute  CHOOSE-BEST-DECISION-ATTRIBUTE(examples,attributes, binary_targets)
    tree  a new decision tree with root as best_attribute

    for each possible value υi of best_attribute do (note that there are 2 values: 0 and 1)
    add a branch to tree corresponding to best_attibute = υi
    {examplesi , binary_targets i} {elements of examples with best_attribute = υi and the corresponding binary_targetsi }

    if examplesi is empty
    then return a leaf node with value = MAJORITY-VALUE(binary_targets)

    else subtree  DECISION-TREE-LEARNING(examplesi ,attributes-{best_attribute}, binary_targetsi)

    return tree

function DecisionTreeClassifier(trainingFile, testingFile, labelsFile, outputFile)
training = csvread(ANNdata);
labels   = csvread(labelsFile);
testing  = csvread(testingFile);
tree = ClassificationTree.fit(training,labels)
prediction = predict(tree, testing)
csvwrite(outputFile, prediction)    

