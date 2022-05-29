clear all
close all
clc
%предварително подготвяне на даденото от габарита
Fn=192;%честота на Найкуист
Fs=384;%честота на дискретизация в херци
Rp=3;%амплитудночестотна характеристика в dB(горна стойност)
Rs=30;%AЧХ в dB(крайна стойност)
%задаване на честоти РФ
Wp=112/Fn;%честота на пропускане           %ВЧФ
Ws=108/Fn;%честота на задържане
%АПРОКСИМАЦИИ
[N,Wn]=cheb2ord(Wp,Ws,Rp,Rs);%макс-плоска неполиномна апроксимация        
[Nz,Dz]=cheby2(N,Rs,Wn,'high')%high-аналогов ВЧФ от ред N инверсна по Чебишев
[z,p,k]=cheby2(N,Rs,Wn,'high')%стойност полюси и нули
Wp1=30/Fn;%честота на пропускане           %НЧФ
Ws1=60/Fn;%честота на задържане 
[N1,Wn1]=cheb2ord(Wp1,Ws1,Rp,Rs);%макс-плоска неполиномна апроксимация    
[Nz1,Dz1]=cheby2(N1,Rs,Wn1)%инверсна по Чебишев
[z1,p1,k1]=cheby2(N1,Rs,Wn1)%инверсна по Чебишев
Hhp=tf(Nz,Dz,1/Fs)%предавателна функция на ВЧФ
Hlp=tf(Nz1,Dz1,1/Fs)%нчф ПФ [при паралелно свързване на Пф на вчф и нчф се получава РФ(ВЧФ+НЧФ=РФ)]
Nzz=conv(Nz,Dz1)+conv(Nz1,Dz);%събиране на двете предавателни ф-ции(привеждане
%под общ знаменател, след което чрез конволюция събираме ПФ на 2-та филтъра
%до получаване на ПФ на РФ)
Dzz=conv(Dz,Dz1);%събиране на знаменателите
Hbs=tf(Nzz,Dzz,1/Fs)%предавателна функция на РФ
z2=roots(Nzz)%нули на режекторен филтър
p2=roots(Dzz)%полюси на режекторен филтър
figure(1);%изчертаване на филтъра ЛФ-утежнен
grid;
hold on;
x=linspace(0,0);   %1.първа верт. линия                       
y=linspace(-35,-35);
line(x,y,'Color','white','LineWidth',3);
x=linspace(0,30);   %1.първа хор. линия                       
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',1);
x=linspace(30,30);   %1.първа верт. линия                       
y=linspace(-30,0);
line(x,y,'Color','black','LineWidth',1);
x=linspace(60,60);%2.първа верт. линия
y=linspace(-3,-5);
line(x,y,'Color','black','LineWidth',3);
x=linspace(60,108);%2.средна хоризонтална линия
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',3);
x=linspace(108,108);%2.последна верт. линия
y=linspace(-5,-3);
line(x,y,'Color','black','LineWidth',3);
x=linspace(112,112);   %3.верт. линия                       
y=linspace(-30,0);
line(x,y,'Color','black','LineWidth',1);
x=linspace(112,192);%3.последна хор. линия
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',1);
title('Gabarit na utejnen LF');
figure(2);%изчертаване на габарита на режекторен филтър-утежнен
grid;
hold on;
x=linspace(0,0);                         
y=linspace(-35,-35);
line(x,y,'Color','white','LineWidth',3);
x=linspace(0,30);   %1.първа хор. линия                       
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',1);
x=linspace(30,30);   %1.първа верт. линия                       
y=linspace(-3,-5);
line(x,y,'Color','black','LineWidth',1);
x=linspace(60,60);   %2.верт. линия                       
y=linspace(-3,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(60,108);%2.средна хоризонтална линия
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(108,108);   %2.верт. линия                       
y=linspace(-3,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(112,112);   %3.верт. линия                       
y=linspace(-5,-3);
line(x,y,'Color','black','LineWidth',1);
x=linspace(112,192);%3.последна хор. линия
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',1);
title('Gabarit na RF');

figure(3);%изчертаване на габарита на режекторен филтър-утежнен с ВЧФ 
grid;
hold on;
x=linspace(0,0);                         
y=linspace(-35,-35);
line(x,y,'Color','white','LineWidth',3);
x=linspace(0,108);%2.средна хоризонтална линия
y=linspace(-30,-30);
line(x,y,'Color','red','LineWidth',2);
x=linspace(108,108);   %2.верт. линия                       
y=linspace(-3,-30);
line(x,y,'Color','red','LineWidth',2);
x=linspace(112,112);   %3.верт. линия                       
y=linspace(-5,-3);
line(x,y,'Color','black','LineWidth',1);
x=linspace(112,192);%3.последна хор. линия
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',1);
title('Gabarit na RF');
title('Gabarit na RF s VChF');

figure(4);
grid;
hold on;%изчертаване на габарита на режекторен филтър-утежнен с НЧФ
x=linspace(0,0);                         
y=linspace(-35,-35);
line(x,y,'Color','white','LineWidth',3);
x=linspace(0,30);   %1.първа хор. линия                       
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',1);
x=linspace(30,30);   %1.първа верт. линия                       
y=linspace(-3,-5);
line(x,y,'Color','black','LineWidth',1);
x=linspace(60,60);   %2.верт. линия                       
y=linspace(-3,-30);
line(x,y,'Color','blue','LineWidth',2);
x=linspace(60,192);%2.средна хоризонтална линия
y=linspace(-30,-30);
line(x,y,'Color','blue','LineWidth',2);
title('Gabarit na RF s NChF');

figure(5);%ПНД на НЧФ заедно с полюсите и нулите
zplane(Nz1,Dz1);
title('PND NA NCHF');
figure(6);%ПНД на ВЧФ заедно с полюсите и нулите
zplane(Nz,Dz);
title('PND na VCHF');    
figure(7);%ПНД на РФ заедно с полюсите и нулите
zplane(Nzz,Dzz);
title('PND na RF'); 

figure(8);%АЧХ на ВЧФ/НЧФ с габарит на РФ 
[H,w]=freqz(Nz,Dz);%изчисляване предавателна ф-я на ВЧФ 
m=abs(H);%ачх на вчф формула(абсолютни стойности)
md=20*log10(m);%ачх на вчф формула(в линейни единици)
plot(w*Fs/(2*pi),md,'r');%изчертаване на АЧХ в червен цвят за ВЧФ
hold on;
[H1,w1]=freqz(Nz1,Dz1);%изчисляване предавателна ф-я на НЧФ
m1=abs(H1);%ачх на нчф формула(абсолютни стойности)
md1=20*log10(H1);%ачх на нчф формула(в линейни единици)
plot(w1*Fs/(2*pi),md1);%изчертаване на АЧХ в син цвят за НЧФ
xlabel('Chestota');
ylabel('ACH v dB');
title('ACH na VCHF/NCHF po inv Cheb s gabarit na RF');
legend('VCHF','NCHF','--');%легенда
grid;

hold on;%изчертаване на габарит на РФ-утежнен, заедно с АЧХ на НЧФ и ВЧФ
x=linspace(0,0);                         
y=linspace(-35,-35);
line(x,y,'Color','white','LineWidth',3);
x=linspace(0,30);   %1.първа хор. линия                       
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',2);
x=linspace(30,30);   %1.първа верт. линия                       
y=linspace(-3,-5);
line(x,y,'Color','black','LineWidth',2);
x=linspace(60,60);   %2.верт. линия                       
y=linspace(-3,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(60,108);%2.средна хоризонтална линия
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(108,108);   %2.верт. линия                       
y=linspace(-3,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(112,112);   %3.верт. линия                       
y=linspace(-5,-3);
line(x,y,'Color','black','LineWidth',2);
x=linspace(112,192);%3.последна хор. линия
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',2);
title('ACH na VCH/NCH filter s gabarit na RF');
%каскадна схемна реализация
[b0,B,A]=dir2cas(Nz,Dz)%каскадна реализация ВЧФ(получаване на числител-B и знаменател-А)
[b01,B1,A1]=dir2cas(Nz1,Dz1)%каскадна реализация НЧФ(получаване на числител-B1 и знаменател-А1)
%билинейно z-преобразуване
figure(9);%затихване на аналогов РФ и цифров РФ
axis([0 Fn 0 60])%задаване на граници стойности на фигурата
subplot(211);
Wp=[30 112];%честоти на пропускане  
Ws=[60 108];%честоти на задържане
Wpa=(Fs*tan((pi*Wp)/Fs))/pi;%цифрови в аналогови честоти пропускане(Hz) на ВЧФ и НЧФ
Wsa=(Fs*tan((pi*Ws)/Fs))/pi;%цифрови в аналогови честоти задържане(Hz) на ВЧФ и НЧФ
[N2,Wn2]=cheb2ord(Wpa,Wsa,Rp,Rs,'s');%макс-плоска неполиномна апроксимация       
[Ns,Ds]=cheby2(N2,Rs,Wn2,'stop','s');%stop-аналогов режекторен филтър от ред N2 инверсна по Чебишев
[H2,w2]=freqs(Ns,Ds,20000);%изчисляване предавателна ф-я на аналогов РФ
m2=abs(H2);%абсолютни стойности на затихване 
md2=-20*log10(m2);%затихване в линейни единици
plot(w2,md2,'g');%изчертаване на затихване на аналогов режекторен филтър
axis([0 200 0 60])
xlabel('Chestota');
ylabel('Zatihvane v dB');
title('Zatihvane na analog. Rf');
%изчисляване предавателна ф-я на цифров РФ
subplot(212)
[N2,Wn2]=cheb2ord(Wp/Fn,Ws/Fn,Rp,Rs);%апроксимация на цифров режекторен филтър        
[Nz,Dz]=cheby2(N2,Rs,Wn2,'stop');%stop цифров режекторен филтър от ред N инверсна по Чебишев
[H3,w3]=freqz(Nz,Dz);%изчисляване на цифрова предавателна функция
m3=abs(H3);%затихване в абсолютни стойности
md3=-20*log10(m3);%затихване в линейни единици
plot(w3*Fs/(2*pi),md3,'c');%изчертаване на затихване на цифров РФ
xlabel('Chestota');
ylabel('Zatihvane v dB');
title('Zatihvane na cifrov Rf');
axis([0 Fn 0 60])
printsys(Ns,Ds)%аналогова предавателна ф-ция Tbs(s)
Hbs=tf(Nz,Dz,1/Fs)%цифрова предавателна ф-ция Hbs(z)