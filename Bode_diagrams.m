fig=figure("Name",'Bode diagrams','NumberTitle','off');
R=106.1;
C=15e-6;
frecventa=logspace(0, 3, 1000);
w=2 * pi * frecventa;
h=(1j * w * R * C)./(1+1j * w * R * C);
w0=1/(R * C);
hj=20*log10(abs(h));
raport_w=w/w0;
% magnitudine
frecventa_db = [1, 10, 100,200,300,500,1000];
w_db = 2 * pi * frecventa_db;  
h_db = (1j * w_db * R * C) ./ (1 + 1j * w_db * R * C);
hj_db = 20 * log10(abs(h_db));
test_db=w_db/w0;
subplot(2,1,1);
plot(raport_w, hj);
xlabel('w/wo');
ylabel('decibeli');
title('Atenuare in decibeli')
hold on;
plot(test_db, hj_db, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
subplot(2,1,2)
faza= angle(h) * (180/pi);
plot(raport_w,faza);
xlabel('w/w0');
ylabel('grade');
title('atenuare faza');
hold on;
frecventa_faza = [1,100,300,500,1000];
w_faza = 2 * pi * frecventa_faza;  
h_faza = (1j * w_faza * R * C) ./ (1 + 1j * w_faza * R * C);
hj_faza = 20 * log10(abs(h_faza));
test_faza=w_faza/w0;
faza_f= angle(h_faza) * (180/pi);
plot(test_faza, faza_f, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
clear;
