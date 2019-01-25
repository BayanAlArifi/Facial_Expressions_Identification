# Machine Learning: Decision Trees

## Table of Contents
<ul>
<li><a href="#intro">Introduction</a></li>
<li><a href="#data">Data</a></li>
<li><a href="#evaluation">System Evaluation</a></li>
<li><a href="#algorithm">Decision Trees Algorithm</a></li>
<li><a href="#nn">Artificial Neural Network</a></li>
<li><a href="#test">T-test</a></li>
</ul>

<a id='intro'></a>
## Introduction
A hands-on experience in implementing and testing basic machine learning techniques. The techniques that will be examined are Decision Trees (DT) amd Artificial Neural Networks (ANN). Each of these techniques will be used in order to identify six basic emotions from the
human facial expressions (anger, disgust, fear, happiness, sadness and surprise) based on a labelled set of facial Action Units (AUs). The latter correspond to contractions of human facial muscles, which underlie each and every facial expression, including facial expressions
of the six basic emotions. The implementation of the aforementioned techniques requires understanding of these techniques. For this reason, following the lectures of the course is strongly advised.

## The Facial Action Coding System and the basic emotions
One of the great challenges of our times in computer science research is the automatic recognition of human facial expressions. Machines capable of performing this task have many applications in areas as diverse as behavioural sciences, security, medicine, gaming and
human-machine interaction (HMI). The importance of facial expressions in inter-human communication has been shown by numerous cognitive scientists. For instance, we use our facial expressions to synchronize a conversation, to show how we feel and to signal agreement, denial, understanding or confusion, to name just a few. Because humans communicate in a far more natural way with each other then they do with machines, it is a logical step to design machines that can emulate inter-human interaction in order to come to the same natural interaction between man and machine. To do so, machines should be able to detect and understand our facial expressions, as they are an essential part of inter-human communication.

### FACS
Traditionally, facial expression recognition systems attempt to recognize a discrete set of facial expressions. This set usually includes six 'basic' emotions: anger, disgust, fear, happiness, sadness and surprise. However, the number of possible facial expressions that humans can use numbers about 10,000, many of which cannot be put in one of the six basic emotion categories (think for example of expressions of boredom, 'I don't know', or a brow-flash greeting). In addition, there is more than one ways to display the same feeling or emotion. Therefore, describing a facial expression in such loose terms as 'happy', 'sad' or 'surprised' is certainly not very exact, greatly depending on who is describing the currently displayed facial expression while leaving a large variation of displayed expressions possible within the emotion classes. The activation of the facial muscles on the other hand can be described very precisely, as each muscle or group of muscles can be said to be either relaxed or contracted at any given time. As every human has the same configuration of facial muscles, describing a facial expression in terms of facial muscle activations would result in the same description of a facial expression, regardless of the person displaying the expression and regardless of who was asked to describe the facial expression. The Facial Action Coding System [FACS](P. Ekman and W.V. Friesen, The Facial Action Coding System: A Technique for the Measurement of Facial
Movement, San Francisco: Consulting Psychologist, 1978), proposed by psychologists Ekman and Friesen, describes all the possible facial muscle (de)activations that cause a visible change in the appearance of the face. Every muscle activation that causes visible appearance changes is called an Action Unit (AU). The FACS consists of 44 AUs (see Fig. 1 for examples).


### Action Units and emotions
The  same  psychologists  w ho  proposed  the  FACS  also  claimed  that  there  existsix 'basic' emotions (anger, disgust, fear, happiness, sadness and surprise) that are universally displayed and  recognized  in  the  same  w ay.  As  w e  already  mentioned,  many  research  groups  have proposed  systems that are able to recognize these six basicemotions. Almost all proposed emotion  detectors  recognize  emotions  directly  from  raw   data.  In  this CBCw e w ill use a different  approach  to  emotion  detection.  Instead of  directly  classifying  a  set  of  features extracted from the images intoemotioncategories, we w ill use AUs as an intermediate layer  of abstraction. The rules that map AUs present in a facial expression into one of the six basic  emotions are givenin Table 1. In this CBCw e w ill not use these rules directly but instead w e w ill try to learn emotional classification of AUsusing different machine learning techniques.  Also, in this CBCw e consider the step of AU detection to be solved. Students are provided w ith a dataset that consistsof a list of AUs and the corresponding emotion label.


<a id='data'></a>
### DATA
The  data  for  this  CBC  will  be  provided  to  the students in the form of matfiles.Each file contains the follow ing two variables:
* Amatrix x, w hich is an N×45matrix, where Nis the total number of examples and 45 is the total number of AUsthat can be activated or not. In case an AU is activated,the value of the corresponding column will be 1. Otherwise,it will be 0. For instance, the following row
``` [1 1 0 0 1 0 ...0] ```
would mean that AU1, AU2 and AU5 are activated.

* Avectory of dimensions N×1, containing the emotion labels of the corresponding examples. These labels are numbered from 1 to 6, and correspond to the emotions anger, disgust, fear, happiness, sadness and surprise respectively.

In addition,the students will be provided with functions that map emotion labels (numbers 1 to 6) to actual emotions (anger, disgust, fear, happiness, sadness, surprise) and back. These files are called emolab2str.mand str2emolab.m respectively.

During this CBC, the students will work with two types of data: cleanand noisydata, each given as a separate mat file. Clean data was obtained by human experts. The AU and emotion information in this type of data is considered correct for every example. On the other hand, the AUs in the noisy data were obtained by an automated system for AU recognition3. Since thesystem is not 100% accurate, the output of the system can contain wrongly detected AUsand some AUs can be missing


<a id='evaluation'></a>
## System Evaluation
The basic system evaluation concepts that will be used include:
* K-fold Cross Validation
* The Confusion Matrix
* Recall and Precision Rates
* The Fα-measure


<a id='algorithm'></a>
## Decision Trees Algorithm
A Decision Tree algortihm is implemented. The results of the experiments are discussed in the report.

* **Loading  Data**
  Make sure the cleandata (x, y) is loaded in the w orkspacewhere xis an N×45array,Nis the total number of examples and 45 is the number of action units(or features/attributes) and y is anN×1vector,  containing  the  labels  of  the  corresponding  examples.  These  labels  are numbered  from  1  to  6,  the  same  as the total number of emotions. In order to construct a decision  tree  for  a  specific  emotion,  the  labels  in yshould be remapped according to that particular emotion. For example, if you train for happiness, w ith label 4, then the labels w ith that value should be set to 1 (positive examples) and all the others to 0 (negative examples).
  
* **Creating  Decision  Tree**
  You need to w rite a function that takes as arguments a matrix of examples, w here each row is  one example and each column is one attribute, a row  vector of attributes, and the target vector w hich contains the binary targets.The target vector will split the training data (examples) into positive  examples  for a given target and negative examples (all the other labels). The table below  provides a pseudo code for the function.

* **Evaluation**
  Using the clean dataset to train 6 trees, one for each emotion, and visualize them using the Draw DecisionTree function. Then, evaluate your decision trees using 10-fold cross validationon both the clean and noisy datasets. 6 trees should be createdin each fold, and each example needs to be classified as one of the 6 emotions. You should expect that slightly different trees  w ill be created per each fold, since the training data that you use each time w ill be slightly different.  Use  your  resulting  decision  trees  to  classify  your  data  in  your  test set. Write a function:
  ``` predictions= testTrees(T, x2) ```
  which takes your trained trees (all six) T and the features x2and produces a vector of label predictions.Both x2and predictionsshould be in the sameformat as x, yprovided to you.Think how  you w ill combine the six trees to get a single output for a given input sample. Try at least 2 different w ays of combining the six trees.

* **Pruning Function**
  Run the pruning_examplefunction, which is provided, using the clean and noisy datasets.


<a id='nn'></a>
## Artificial Neural Network
The goal of this assignment is to learn how  to use the MATLAB Neural Netw ork toolbox to train anetw ork to classify emotions. The results of your experiments should be discussed in the  report.  You  w ill  also  have  to  deliver  the  code  you  have  w ritten. You  should  use  theMATLABversioninstalled on the LAB machines.

* **Loading  Data**
You need to load the clean data (x, y) and runthefunction ANNdata that hasbeen provided toyou. The outcome of the first function is the dataset [ x y ], w here x is a matrix w ith row s representing  examples  and  columns representing  attributes  and y  isa  vector  w ith  a  label (assigned emotion) for each example. The second function transforms the matrix x and vector y into a transposed matrix x2 of order 45 xm (m –the number of examples) and a matrix y2 6  xm,  w here  each  column  is a vector of zeros except of the row  that corresponds to the emotion label  that is one. For instance, example i has a corresponding label vector
``` [ 0 0 0 1 0 0 ]T ``` if the label had a numerical value 4 in the original vector of labels y. ``` [x2, y2] = ANNdata(x, y). ```

* **Creating a Neural  Network**
You w ill need to w rite code to create a six-output neuralnetw ork. Similarly to decision trees, each example must be classified so think how  to combine the 6 outputs in order to get a single classification.

* **Testing the Network**
Write a function: ``` predictions = testANN(net, x2) ```
which takes as inputanetw ork netand the examplesx2(same format as x) and produces a vector of label predictions in the format ofthey vector in the dataprovided to you. You may need to use thefunction provided „NNout2labels’to transform the neural netw ork output into the format used throughout this CBC.
``` predictions = NNout2labels(t) ```
where t is the output of a feed-forwarded Neural Network and predictionsis the corresponding output in the format used throughout this CBC (i.e., 1 = anger, 2 = disgust etc.).


* **Train a Network–Parameter Estimation**
An  important  issue in neural  networks  is  parameter  optimisation.  Perform  10-fold  cross validation for parameter estimation as explained in the lecture slides. Divide the clean dataset into 9 folds for training and 1 fold for validation and run the 10-fold cross-validation for each parameter configuration. Select a performance measure w hich w ill be used to compare the performance of the different parameters on the validation folds. In other w ords you select the set of parameters that maximise the chosen performance measure over all 10 validation folds. You need to optimise the following:
1. topology of the netw ork, i.e. the number of hidden layers and the number of neurons in each hidden layer, the number of neurons in the input layer is 45 (the number of attributes), and the number of neurons in the output layer is six neurons,
2. the  parameters  of  training  functions.  The  training  function  you  should  try  and  the corresponding parameters to optimise are the follow ing:
  * Gradient descent backpropagation (traingd) - Parameter: learning rate (lr)
  * Gradient  descent  w ith  adaptive  learning  rate  backpropagation  (traingda) - Parameters: learning rate (lr), ratio increase/decrease learning rate (lr_inc, lr_dec)
  * Gradient descent w ith momentum backpropagation (traingdm) - Parameters: learning rate (lr), momentum constant (mc).
  * Resilient backpropagation (trainrp) - Parameters: Increment/Decrement to w eight change (delt_inc/delt_dec)
The  set  of  parameters  that  led  to the best performance over all 10 folds is selected as the optimal set of parameters(you should include them in your report). Train a netw orkw ith 6 outputson the clean dataset using the optimal set of parameters. For each of the four training algorithms show  how  the performance varies as a function of the topology of the network.


* **Performing  10 Fold  Cross-Validation – Performance Estimation**
Perform 10-fold cross-validationfor performance estimation as explained in the lecture slidesusing the  clean  dataset.  In  each  iteration  of  the  cross-validation  split the 9-folds used for training into a training and validation set. Select a performance measure which w ill be used to compare the performance of the different parameters on the validation set and optimise the parameters in each fold.Once you optimise the parameters then evaluate the performance on the test fold.Experiment w ith the same training functions and parameters as in section VI. The focus of this section is to estimate the test set performance so there is no need to report the optimal parameters in each fold.You shouldproduce a confusion matrix, and average values of precision, recall andF1rates per classcomputed over the 10 test folds.Report also the average classification rate (NOTE: classification rate  = 1 –classification error).Perform 10-fold cross validation again using the noisy dataset this time. In order to save time, do not optimise the parameters, simplyuse the optimal parameters for each fold found above and report the same performance measures.


* **Clean-noisy Datasets Performance**
Exploring the difference in the performance when using the clean and noisy datasets. Discussing the differences in the overall performance and per emotion, and the impact of not optimising the parameters on the noisy dataset.


<a id='test'></a>
## T-test
* **T-test and Paired T-test**
The t-test assesses w hether the means of tw o distributions are statisticallydifferent from each other. Consider the three situations shown in Fig. 10. The first thing to notice about the three situations is that the difference betw een the means is the same in all three. But, you should also notice that the three situations don't look the same. The left-most example show s a case w ith low  variability. The centre situation show s a case w ith moderate variability w ithin each group,  w hile  the  right-most  example show s  the  high  variability  case.  Clearly,  w e  w ould conclude that the tw o groups appear most different or distinct in the low-variability case. This is  because  there is relatively little overlap betw een the tw o bell-shaped curves. In the high variability  case,  the  group  difference  appears  least  striking  because  the  tw o  bell-shaped distributions  overlap  so  much. This leads us to a very important conclusion: w hen w e are looking at the differences betw een scores for tw o groups, w e have to judge the difference betw een their means relative to the spread or variability of their scores. The t-test does just this.

  The null hypothesis in the t-test is that the tw o sets of observations w e have areindependent  random  samples  from  normal  distributions  w ith  equal  means  and  equal  but  unknow n variances.

* **Multiple Comparisons**
When we wish to compare the means of multiple groups of data then w e need to perform multiple comparisons. An obvious (but naive) solution to this problem w ould be to apply a series of t-tests between every possible pair of the available  groups. Formally, given Kgroups, one should perform K(K-1)/2 different t-tests. Follow ing this approach, however, poses a significant problem. When you perform a simple t-test of onegroup mean against another, you specify a significance level that determines the cutoff value of the t statistic. For example, you can specify the value alpha = 0.05 to ensure that w hen there is no real difference, you w ill incorrectly find a significant difference no more than 5% of the time. When there are many group means, there are also many pairs to compare. If you applied an ordinary t-test in this situation, the alpha value w ould apply to each comparison, so the chance of incorrectly finding a significant difference w ould increase w ith the number of comparisons.

  Multiple comparison procedures are designed to address this problem, by providing an upper bound  on  the  probability  that  any  comparison  w ill  be  incorrectly  found  significant.  In essence,  multiple  comparison  procedures  compensate  for  the  number  of  comparisons  by modifying  the  specified  significance  level. A typical example is the Bonferroni correction, w hich states that if the desired significance level for the w hole family of tests is (at most) α, then one should test each of the individual tests at a significance level of α/k w here k is the number of comparisons.

* **T-test on the Clean Data**
For  this  part  of  the  assignment  you  do  not  have  to implement an algorithm for the t-test. MATLAB  provides  one  function  for  a  tw o  sample  t-test  (ttest2) and one function for the paired t-test (t-test). Read the Matlab documentation to understand how  these functions w ork. Think w hich test is the appropriate one to use in this case.

  Perform 10-fold cross validation on the cleandata using your algorithms, decision trees, and neural netw orks(you do not need to retrain your algorithms, simply use your saved results). For  each  algorithm  calculate  the  classification  errorper  fold.  So  you  w ill  end  up  w ith  a sample of 10 values per algorithm.For each algorithm calculate the classification errorper fold. So you w ill end up w ith a sample of 10 values per algorithm.Test w hether there is a significant difference betw een the tw o algorithms.

* **T-test on the Noisy Data**
Similarly, perform 10-fold cross validation on the noisydata using your algorithms, decision trees, and neural netw orks(you do not need to retrain your algorithms, simply use your saved results). For each algorithm calculate the classification errorper fold. So you w ill end up w ith a sample of 10 values per algorithm.Test w hether there is a significant difference betw een the tw o algorithms.
