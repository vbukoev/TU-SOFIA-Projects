clear all
close all
clc
Fn=192;
Fs=384;%честота на дискретизация в херци
Rp=3;Rs=30; % честоти в dB
K=1024;
K1=384;
%утежняване на габарита
Wp=60/Fn;                           %ВЧФ
Ws=30/Fn;
[N,Wn]=ellipord(Wp,Ws,Rp,Rs);        
[Nz,Dz]=ellip(N,Rp,Rs,Wn,'high')%high-аналогов ВЧФ от ред N 
[z,p,k]=ellip(N,Rp,Rs,Wn,'high')
Wp1=108/Fn;                         %НЧФ
Ws1=112/Fn;
[N1,Wn1]=ellipord(Wp1,Ws1,Rp,Rs);    
[Nz1,Dz1]=ellip(N1,Rp,Rs,Wn1)
[z,p,k]=ellip(N1,Rp,Rs,Wn1)

Wp2=[60 108];                         %РФ
Ws2=[30 112];
[N2,Wn2]=ellipord(Wp2,Ws2,Rp,Rs,'s');%изчислява мин. ред N и честотите Wn    
[Ns,Ds]=ellip(N2,Rp,Rs,Wn2,'s')

figure(1);
grid;
hold on;%изчертаване на филтъра РФ
x=linspace(-30,30);   %първа хор. линия                       
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(60,60);%първа верт. линия
y=linspace(-3,-5);
line(x,y,'Color','black','LineWidth',3);
x=linspace(60,108);%средна хоризонтална линия
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',3);
x=linspace(108,108);%последна верт. линия
y=linspace(-5,-3);
line(x,y,'Color','black','LineWidth',3);
x=linspace(112,192);%последна хор. линия
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',3);

figure(2);
zplane(Nz1,Dz1);
title('PND NA NCHF');
figure(3);
zplane(Nz,Dz);
title('PND na VCHF');   
figure(4);
zplane(Ns,Ds);
title('PND NA RF'); 

figure(5); 
[H,w]=freqz(Nz,Dz);%изчисляване предавателна ф-я на ВЧФ 
m=abs(H);
md=20*log10(m);%ачх на вчф формула
fi=unwrap(angle(H));
plot(w*Fs/(2*pi),md,'r');
hold on;
[H1,w1]=freqz(Nz1,Dz1);%изчисляване предавателна ф-я на НЧФ
m1=abs(H1);
md1=20*log10(H1);%ачх на нчф формула
fi1=unwrap(angle(H1));
plot(w1*Fs/(2*pi),md1);
xlabel('Chestota');
ylabel('ACH v dB');
title('ACH na VCHF/NCHF po Kauer');
legend('VCHF','NCHF','--');%легенда
grid;
 
hold on;%изчертаване на филтъра РФ
x=linspace(0,30);   %първа хор. линия                       
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',3);
x=linspace(60,60);%първа верт. линия
y=linspace(-3,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(60,108);%средна верт. линия
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(108,108);%последна верт. линия
y=linspace(-30,-3);
line(x,y,'Color','black','LineWidth',3);
x=linspace(112,192);%последна хор. линия
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',3);

figure(6)          %АЧХ-ВЧФ и НЧФ на една фиг 
plot(w*Fs/(2*pi),fi*180/pi);
plot(w1*Fs/(2*pi),fi1*180/pi);
grid;
title('ACHH v gradusi na VCHF I NCHF');
xlabel('Chestota Hz'); 
ylabel('Amplituda');

b=[0.3014   -0.7864    0.7864   -0.3014];%числител ВЧФ
a=[1.0000   -0.7231    0.6175    0.1652];%знаменател ВЧФ
[b0,B,A]=dir2cas(b,a)%каскадна реализация ВЧФ
 
b1=[0.1518    0.3656    0.5870    0.5870   0.3656    0.1518];%числител НЧФ
a1=[1.0000   -0.0877    1.5493   -0.5138   0.5976   -0.3367];%знаменател НЧФ
[b01,B1,A1]=dir2cas(b1,a1)%каскадна реализация НЧФ

n=0:1/384:1;%задаване на n
x=sin(2*pi*150*n); 
y=filter(Nz,Dz,x);

figure(7);
subplot(211); %това не се изчертава
plot(n,x);
grid;
xlabel('Otcheti na vremeto n');
ylabel('Amplituda v dB');
title('Vhoden signal vuv vremeto');


subplot(212)
plot(n,y); 
grid;
xlabel('Otcheti na vremeto n');
ylabel('Amplituda dB');
title('Izhoden vuv vremeto signal');

x1=sin(2*pi*90*n);
y1=filter(Nz,Dz,x1);

subplot(221)
plot(n,x1)
grid;
xlabel('Otcheti na vremeto n');
ylabel('Amplituda v dB');
title('Vhoden vuv vremeto signal');

subplot(222)
plot(n,y1)
grid;
xlabel('Otcheti na vremeto n');
ylabel('Amplituda v dB');
title('Izhoden vuv vremeto signal');
%bilineino z-preobrazuvane
n1=0:192;


% 
% n=0:1/384:1
% x=sin(2*pi*150*n) 
% y=filter(Nz,Dz,x) 
% 
% figure(5);
%plot(n,x); 
% grid;
% xlabel('Otcheti na vremeto n');
% ylabel('Amplituda v dB');
% title('Vhoden signal vuv vremeto');
%  
% figure(6);
% plot(n,y); 
% grid;
% xlabel('Otcheti na vremeto n');
% ylabel('Amplituda dB');
% title('Izhoden vuv vremeto signal');
%  
%  
% x1=sin(2*pi*90*n)
%  y1=filter(Nz,Dz,x1)
% 
% figure(7);
% plot(n,x1)
% grid;
% xlabel('Otcheti na vremeto n');
% ylabel('Amplituda v dB');
% title('Vhoden vuv vremeto signal');
% 
% 
% 
% figure(8);
% plot(n,y1)
% grid;
% xlabel('Otcheti na vremeto n');
% ylabel('Amplituda v dB');
% title('Izhoden vuv vremeto signal');
%  
% K=590 
%  
% [H,w]=freqz(Nz,Dz,K/2) 
% [H1,w1]=freqz(Nz1,Dz1,K/2)  
% Px=fft(x,K) 
% px=abs(Px(1:(K/2)))
% Py=fft(y,K)
% py=abs(Py(1:(K/2)))
%  
%  
%  
% figure(9)
% plot(w*Fs/(2*pi),px)
% xlabel('Otcheti na chestotata v Hz');
% ylabel('Amplituda (dB)');
% title('Amplituden spektur na vhoden signal');
% grid; 
%  
% figure(10)
% plot(w*Fs/(2*pi),py)
% xlabel('Otcheti na chestotata v Hz');
% ylabel('Amplituda v dB');
% title('Amplituden spektur na izhoden signal');
% grid;
%  
% Px1=fft(x1,K);
% px1=abs(Px1(1:(K/2)))
%  
% 
% figure(11)
% Px1=fft(x1,K)
% px1=abs(Px1(1:(K/2)))
% plot(w*Fs/(2*pi),px1)
% xlabel('Othceti na chestota HZ');
% ylabel('Amplituda v dB');
% title('Amplituden spektur na vhoden signal');
% grid;
%  
% figure(12)
% Py1=fft(y1,K)
% py1=abs(Py1(1:(K/2)))
% plot(w*Fs/(2*pi),py1)
% xlabel('Otcheti na chestotata v HZ');
% ylabel('Amplituda v dB');
% title('Amplituden spektur na izhoden signal');
% grid;