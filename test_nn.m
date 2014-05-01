%HOW TO RUN
%Please load the following 3 matlab datasets provided with the submission
%       1. phiTest.mat
%       2. W_Hidden.mat
%       3. W_Output.mat


%load('phiTest.mat')
%load('W_Hidden.mat')
%load('W_Output.mat')

Y_test_NN = zeros(1500,10);
numTestSamples = 1500;
i=0;
wo=wo(:,2:51);
for i=1:numTestSamples
    X = phiTest(i,:);
    aH = X*wh';
    zH = sigmf(aH, [1 0]);
    
    aO = wo*zH';
    zO = sigmf(aO, [1 0]);
    
    Y_test_NN(i,:) = zO(:);
end

ErrorPerClass = zeros([1 10]);
for i=1:10
    for j=(i-1)*150+1:i*150
        if(Y_test_NN(j,i)<0.5)
            ErrorPerClass(1,i) = ErrorPerClass(1,i) + 1;
        end
    end
end
TotalErrors = sum(ErrorPerClass(:));
PercentageError = TotalErrors*100/length(Y_test_NN(:,1))