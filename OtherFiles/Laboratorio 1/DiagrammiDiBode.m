ingresso = [0.492 0.492 ];
uscita = [5.62 5.6 5.565 5.46 5.33 5.175 5.00 4.815 4.62 4.42 4.22 4.12 4.03 ...
    3.94 3.85 3.76 3.68 3.6 3.51 3.36 3.22 3.08 2.96 2.84 2.73 2.63 1.89 ...
    1.47 1.19 1.01 0.875 0.764 0.682 0.618 0.258 0.137 0.078 0.072 0.071 0.068];
fase = [-179 -177 -174 -169 -164 -159 -155 -151 -147 -143 -140 -139 -137 ...
    -136 -133 -133 -132 -131 -130 -128 -126 -124 -122 -121 -120 -118 ...
    -110 -106 -101 -102 -98 -96 -95 -95  -89 -85 -72 -20 4 39];

w = [100 500 1000 2000 3000 4000 5000 6000 7000 8000 9000 9500 10000 10500 ...
    11000 11500 12000 12500 13000 14000 15000 16000 17000 18000 19000 20000 ...
    30000 40000 50000 60000 70000 80000 90000 100000 250000 500000 1000000 ... 
    5000000 7000000 10000000];

w0 = 10711;

db = 20. * log10(uscita./ 0.492);

% Grafici con scala logaritmica e valori sulle x pari a log(w/w0)
figure
subplot(2,1,1)
title('Guadagno')
plot(log10(w./w0), db);
ylabel('Guadagno')
xlim([-2.03 3])

subplot(2,1,2)
title('Fase')
plot(log10(w./w0), fase);
ylabel('Fase')
xlim([-2.03 3])
ylim([-180 50])

% Grafici con scala logaritmica e valori sulle x pari alla frequenza
figure
subplot(2,1,1)
semilogx(w, db, '-ob')
ylim([-20 25])
hold on
plot([w0; w0], [ylim],'--r')
grid on
ylabel('Guadagno (dB)')
hold off
text([w0], 0.9*[1], {'   f=10711Hz'}, 'Color','red')

subplot(2,1,2)
semilogx(w, fase, '-ob')
grid on
ylim([-200 45])
hold on
plot([w0; w0], [ylim],'--r')
ylabel('Fase (gradi)')
xlabel('Frequenza (Hz)')
hold off
text([w0], 0.9*[1], {'   f=10711Hz'}, 'Color','red')

set(gcf,'position',[100,100,800,600])
saveas(gcf, 'Diagrammi di Bode.png')


