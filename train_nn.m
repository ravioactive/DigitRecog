%HOW TO RUN
%Please load the following 2 matlab datasets provided with the submission
%       1. phi.mat
%       2. t.mat

limit=500;
INIT_EPSILON = 0.07;

noOfActiUnits2 = 50;

wh=rand(noOfActiUnits2 ,513) * ( 2 * INIT_EPSILON ) - INIT_EPSILON ;
wo=rand(10,noOfActiUnits2 + 1) * ( 2 * INIT_EPSILON ) - INIT_EPSILON ;

lambda = 0.001;
for m=1:limit
    Error =0;
    deltaH = zeros(size(wh));
    deltaO = zeros(size(wo));
    
    for i=1:19978
        rownumber = randi([1,19978]);
        sample = phi(rownumber,:)';
        sampleT = t(rownumber,:)';

        zh= wh * sample;
        ah= sigmf(zh, [1 0]);
        %adding bias to ah
        ah = vertcat(1, ah);

        zo = wo * ah;
        ao = sigmf(zo,[1 0]);
        
        delo = ao-sampleT;
        
        deri_o = ah .* (1 - ah);
        delh = (wo' * delo) .* deri_o ;
        delh([1], :) = [];
        
        deltaH = deltaH + delh * sample';
        deltaO = deltaO + delo * ah';
        
        cost = sampleT .* log(ao)+(1-sampleT) .* log(1-ao); 
        Error = Error + sum(cost); 
        
    end
    
    Error = Error - (lambda/2) * (sum(sum( wh .* wh )) + sum(sum( wo .* wo )) );
    Error = -1 * ( Error / 19978);
    
    Errors(1,m) = Error;
    D1 = ( deltaH ./ 19978  ) + lambda .* wh;
    D2 = ( deltaO ./ 19978 ) + lambda .* wo;
    
    wh = wh - D1;
    wo = wo - D2;
    
end

plot(1:limit, Errors, '-b.');