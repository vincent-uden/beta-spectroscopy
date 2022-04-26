E1 = 1.7238; % MeV
E3 = 3.7010; % MeV
E4 = 3.8405; % MeV

data = readmatrix("k5example.txt", "NumHeaderLines", 9, "FileType", "text");

x = data(:,1);
y = data(:,2);

% plot(x,y);

[peak1, fit1, fitrange1] = fitpeak(2033, 2279, x, y);
[peak2, fit2, fitrange2] = fitpeak(4678, 4766, x, y);
[peak3, fit3, fitrange3] = fitpeak(4861, 4936, x, y);

% plot(fitrange1, fit1);
% plot(fitrange2, fit2);
% plot(fitrange3, fit3);

[lin_fit, err] = polyfit([peak1 peak2 peak3], [E1 E3 E3], 1);
k = lin_fit(1);
m = lin_fit(2);
hold off
E = k*x + m;

semilogy(E, y);
xlabel("Energi [MeV]");
ylabel("Amplitud");

[peak_unk, fit_unk, fitrange_unk] = fitpeak(1.8524, 1.89, E, y);

% Continous end point at 3.05 MeV

% E = T_e + m_e + T_n + m_n