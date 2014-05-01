%HOW TO RUN
%Please load the following 2 matlab datasets provided with the submission
%       1. phi.mat
%       2. t.mat

limit=500;
i=1;
w = zeros(513,10);
grad = zeros(513,10);
Errors=zeros([1 limit]);
wopt = zeros(513,10);
iopt = 1;
ErrorPercentage = zeros([1 limit]);

for i=1:limit
    Y = phi*w;
    Error = t.*log(sigmf(Y,[1 0])) + (1-t).*log(1-sigmf(Y,[1 0]));
    Errors(1,i) = -sum(Error(:))/(20000*2);        
    s = sigmf(Y,[1 0])-t;
    grad = phi'*s;
    wn = w - 0.00001*grad;
    w=wn;
end
plot(1:limit, Errors, '-b.');

