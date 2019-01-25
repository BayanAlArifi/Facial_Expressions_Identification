function [confusionMatrix] = buildConfusionMatrix(actualOutput,predictedOutput)

%actualOutput: Nx1 vector; predictedOutput: Nx1 vector;

%each contains the value of the predicted class, in the row of the
%respective example

%confusionMatrix: 6x6 vector;
actualLabel = 0;
predictedLabel = 0;
confusionMatrix = zeros(6);
N = size(actualOutput,1);

    for index = 1:N

        actualLabel = actualOutput(index,1);
        predictedLabel = predictedOutput(index,1);

        confusionMatrix(actualLabel,predictedLabel) = confusionMatrix(actualLabel,predictedLabel) + 1;
    end

end

