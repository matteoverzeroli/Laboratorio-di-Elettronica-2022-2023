RA = [ 10.96 23.9 38.65 55.1 66.87 82.26]; % kOhm
RB = [12];

C1 = 330; %nF
C2 = 150; %nF

freq_c1 = [129 94.2 72 57 49.6 42.4];
freq_c2 = [ 263.5 192 147 116 101 86.9];
duty = [65.52 74.86 80.77 84.75 86.63 88.77];

% ricavo il fitlm
fit1 = fitlm(RA, freq_c1);
fit2 = fitlm(RA, freq_c2);
fit3 = fitlm(RA, duty);

% Calcolo la retta del modello lineare
x = linspace(10, 100);
fitted_1 = fit1.Coefficients.Estimate(1) + fit1.Coefficients.Estimate(2) * x;
fitted_2 = fit2.Coefficients.Estimate(1) + fit2.Coefficients.Estimate(2) * x;
fitted_3 = fit3.Coefficients.Estimate(1) + fit3.Coefficients.Estimate(2) * x;

% Plotto il grafico
gcf = figure
hold on
plot(RA, freq_c1, '-or')
plot(RA, freq_c2, '-ob')
%plot(x, fitted_1, 'r')
%plot(x, fitted_2, 'b')

legend('Misure con capacità da 330nF', 'Misure con capacità da 150nF',...
    'Location', 'northeast')

title('Frequenza in funzione di RA e C')
ylabel('Frequenza [Hz]')
xlabel('Resistenza [\Omega]')
ylim([0 300])
xlim([10 100])

set(gcf,'position',[100,100,700,600])
saveas(gcf, 'F vs RA.png')

gcf = figure
hold on
plot(RA, duty, '-or')
%plot(x, fitted_3, 'r')

legend('Misure con capacità da 330nF',...
    'Location', 'southeast')

title('Duty Cicle in funzione di RA')
ylabel('Duty Cicle [%]')
xlabel('Resistenza [\Omega]')
ylim([30 100])
xlim([10 100])

set(gcf,'position',[100,100,700,600])
saveas(gcf, 'Duty vs RA.png')

