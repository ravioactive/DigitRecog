%HOW TO RUN
%Please load the following 2 matlab datasets provided with the submission
%       1. phiTest.mat
%       2. W_LR.mat


%load('phiTest.mat')
%load('W_LR.mat')
Y_test = phiTest*w;
ErrorPerClass = zeros([1 10]);
for i=1:10
    for j=(i-1)*150+1:i*150
        if(Y_test(j,i)<0.5)
            ErrorPerClass(1,i) = ErrorPerClass(1,i) + 1;
        end
    end
end
TotalErrors = sum(ErrorPerClass(:));
PercentageError = TotalErrors*100/length(Y_test(:,1))