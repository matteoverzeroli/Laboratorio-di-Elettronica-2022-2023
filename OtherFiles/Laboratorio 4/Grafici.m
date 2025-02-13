T = [ 0.00202 0.0021 0.00230 0.00302 0.00410]; % 150nF
T2 = [ 0.00390 0.00426 0.00486 0.00630 0.00846]; % 330nF
R = [10960 11950 15815 18017 23900];

% Ricavo il modello lineare
fit1 = fitlm(R, T);
fit2 = fitlm(R, T2);

% Calcolo la retta del modello lineare
x = linspace(10000, 25000);
fitted_1 = fit1.Coefficients.Estimate(1) + fit1.Coefficients.Estimate(2) * x;
fitted_2 = fit2.Coefficients.Estimate(1) + fit2.Coefficients.Estimate(2) * x;

% Plotto il grafico
gcf = figure
hold on
plot(R, T, 'or')
plot(R, T2, 'ob')
plot(x, fitted_1, 'r')
plot(x, fitted_2, 'b')

legend('Misure con capacità da 150nF', 'Misure con capacità da 330nF',...
    'Retta interpolata ',...
    'Retta interpolata ',...
    'Location', 'southeast')

%162.3 10^-9 e 352.6 10^-9 coefficienti della retta

title('Misure tempo T_1')
ylabel('Tempo T_1 [s]')
xlabel('Resistenza [\Omega]')
ylim([0 0.009])
xlim([10000 25000])

set(gcf,'position',[100,100,700,600])
saveas(gcf, 'T vs R.png')



