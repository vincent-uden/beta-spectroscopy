data = load("k5_Bi.txt");


x = data(:,1); y = data(:,2);
E1 = 482;
E2 = 976;
E3 = 1048; % keV

[peak1, fit1, fitrange1] = fitpeak(2705, 2793, x, y);
[peak2, fit2, fitrange2] = fitpeak(5539, 5654, x, y);
[peak3, fit3, fitrange3] = fitpeak(5972, 6083, x, y);

subplot(2, 1, 1);
hold off
plot(x, y);
grid on

hold on
plot(fitrange1, fit1, "r");
plot(fitrange2, fit2, "r");
plot(fitrange3, fit3, "r");

[lin_fit, err] = polyfit([peak1 peak2 peak3], [E1 E2 E3], 1);
k = lin_fit(1);
m = lin_fit(2);
E = k*x + m;

subplot(2, 1, 2);
hold off
semilogy(E, y);
grid on
xlabel("Energi [keV]");
