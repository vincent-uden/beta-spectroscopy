function [mid,fit,xi]=fitpeak(minpoint,maxpoint,X,Y)
Range=[];
for i =1:length(X),
   
    if X(i)>minpoint & X(i)<maxpoint
            
            Range=[Range i];
    end
end

l=polyfit(X(Range),log(Y(Range)),2);

la=l(3);
lb=l(2);
lc=l(1);

lx0=-lb/(2*lc);
lo=la-lc*lx0.^2;

mid = lx0;

fit=exp(l(1).*X(Range).^2+l(2).*X(Range)+l(3));
xi=X(Range);

