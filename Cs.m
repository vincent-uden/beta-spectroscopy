data = load("k5_Cs.txt");
x = data(:,1); y = data(:,2);

k = 0.173747971069414;
m = 4.047480354269673;
E = k*x+m;

hold off
semilogy(E,y);
grid on

% Lång kont. beta sönderfall spektrum
% Spikarna är K och L elektroner som agerar konversionselektroner för 
% den exciterade Ba-kärnan som är en av två grenar.
% Q < 700 keV

kuriedata = kurieplot(E, data, 56);
%plot(E, kuriedata);

[slope1, offset1] = kuriefit(E, kuriedata, 200:500);
zero_point1 = slope1\(-offset1);

[slope2, offset2] = kuriefit(E, kuriedata, 700:1000);
zero_point2 = slope2\(-offset2);

sec_in_year = 365*24*60*60;
lambda = log(2)/(30)
lambda1 = 0.9 * lambda;
lambda2 = 0.1 * lambda;
t1 = log(2)/lambda1;
t2 = log(2)/lambda2;

t1log = log10(t1*sec_in_year);
t2log = log10(t2*sec_in_year);

f1 = log10f(56, zero_point1);
f2 = log10f(56, zero_point2);

t1log + f1
t2log + f2


