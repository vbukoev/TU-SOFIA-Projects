clear all
close all
clc
%������������� ���������� �� �������� �� ��������
Fn=192;%������� �� ��������
Fs=384;%������� �� ������������� � �����
Rp=3;%������������������ �������������� � dB(����� ��������)
Rs=30;%A�� � dB(������ ��������)
%�������� �� ������� ��
Wp=112/Fn;%������� �� ����������           %���
Ws=108/Fn;%������� �� ���������
%������������
[N,Wn]=cheb2ord(Wp,Ws,Rp,Rs);%����-������ ����������� ������������        
[Nz,Dz]=cheby2(N,Rs,Wn,'high')%high-�������� ��� �� ��� N �������� �� �������
[z,p,k]=cheby2(N,Rs,Wn,'high')%�������� ������ � ����
Wp1=30/Fn;%������� �� ����������           %���
Ws1=60/Fn;%������� �� ��������� 
[N1,Wn1]=cheb2ord(Wp1,Ws1,Rp,Rs);%����-������ ����������� ������������    
[Nz1,Dz1]=cheby2(N1,Rs,Wn1)%�������� �� �������
[z1,p1,k1]=cheby2(N1,Rs,Wn1)%�������� �� �������
Hhp=tf(Nz,Dz,1/Fs)%������������ ������� �� ���
Hlp=tf(Nz1,Dz1,1/Fs)%��� �� [��� ��������� ��������� �� �� �� ��� � ��� �� �������� ��(���+���=��)]
Nzz=conv(Nz,Dz1)+conv(Nz1,Dz);%�������� �� ����� ������������ �-���(����������
%��� ��� ����������, ���� ����� ���� ���������� �������� �� �� 2-�� �������
%�� ���������� �� �� �� ��)
Dzz=conv(Dz,Dz1);%�������� �� �������������
Hbs=tf(Nzz,Dzz,1/Fs)%������������ ������� �� ��
z2=roots(Nzz)%���� �� ���������� ������
p2=roots(Dzz)%������ �� ���������� ������
figure(1);%����������� �� ������� ��-�������
grid;
hold on;
x=linspace(0,0);   %1.����� ����. �����                       
y=linspace(-35,-35);
line(x,y,'Color','white','LineWidth',3);
x=linspace(0,30);   %1.����� ���. �����                       
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',1);
x=linspace(30,30);   %1.����� ����. �����                       
y=linspace(-30,0);
line(x,y,'Color','black','LineWidth',1);
x=linspace(60,60);%2.����� ����. �����
y=linspace(-3,-5);
line(x,y,'Color','black','LineWidth',3);
x=linspace(60,108);%2.������ ������������ �����
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',3);
x=linspace(108,108);%2.�������� ����. �����
y=linspace(-5,-3);
line(x,y,'Color','black','LineWidth',3);
x=linspace(112,112);   %3.����. �����                       
y=linspace(-30,0);
line(x,y,'Color','black','LineWidth',1);
x=linspace(112,192);%3.�������� ���. �����
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',1);
title('Gabarit na utejnen LF');
figure(2);%����������� �� �������� �� ���������� ������-�������
grid;
hold on;
x=linspace(0,0);                         
y=linspace(-35,-35);
line(x,y,'Color','white','LineWidth',3);
x=linspace(0,30);   %1.����� ���. �����                       
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',1);
x=linspace(30,30);   %1.����� ����. �����                       
y=linspace(-3,-5);
line(x,y,'Color','black','LineWidth',1);
x=linspace(60,60);   %2.����. �����                       
y=linspace(-3,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(60,108);%2.������ ������������ �����
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(108,108);   %2.����. �����                       
y=linspace(-3,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(112,112);   %3.����. �����                       
y=linspace(-5,-3);
line(x,y,'Color','black','LineWidth',1);
x=linspace(112,192);%3.�������� ���. �����
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',1);
title('Gabarit na RF');

figure(3);%����������� �� �������� �� ���������� ������-������� � ��� 
grid;
hold on;
x=linspace(0,0);                         
y=linspace(-35,-35);
line(x,y,'Color','white','LineWidth',3);
x=linspace(0,108);%2.������ ������������ �����
y=linspace(-30,-30);
line(x,y,'Color','red','LineWidth',2);
x=linspace(108,108);   %2.����. �����                       
y=linspace(-3,-30);
line(x,y,'Color','red','LineWidth',2);
x=linspace(112,112);   %3.����. �����                       
y=linspace(-5,-3);
line(x,y,'Color','black','LineWidth',1);
x=linspace(112,192);%3.�������� ���. �����
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',1);
title('Gabarit na RF');
title('Gabarit na RF s VChF');

figure(4);
grid;
hold on;%����������� �� �������� �� ���������� ������-������� � ���
x=linspace(0,0);                         
y=linspace(-35,-35);
line(x,y,'Color','white','LineWidth',3);
x=linspace(0,30);   %1.����� ���. �����                       
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',1);
x=linspace(30,30);   %1.����� ����. �����                       
y=linspace(-3,-5);
line(x,y,'Color','black','LineWidth',1);
x=linspace(60,60);   %2.����. �����                       
y=linspace(-3,-30);
line(x,y,'Color','blue','LineWidth',2);
x=linspace(60,192);%2.������ ������������ �����
y=linspace(-30,-30);
line(x,y,'Color','blue','LineWidth',2);
title('Gabarit na RF s NChF');

figure(5);%��� �� ��� ������ � �������� � ������
zplane(Nz1,Dz1);
title('PND NA NCHF');
figure(6);%��� �� ��� ������ � �������� � ������
zplane(Nz,Dz);
title('PND na VCHF');    
figure(7);%��� �� �� ������ � �������� � ������
zplane(Nzz,Dzz);
title('PND na RF'); 

figure(8);%��� �� ���/��� � ������� �� �� 
[H,w]=freqz(Nz,Dz);%����������� ������������ �-� �� ��� 
m=abs(H);%��� �� ��� �������(��������� ���������)
md=20*log10(m);%��� �� ��� �������(� ������� �������)
plot(w*Fs/(2*pi),md,'r');%����������� �� ��� � ������ ���� �� ���
hold on;
[H1,w1]=freqz(Nz1,Dz1);%����������� ������������ �-� �� ���
m1=abs(H1);%��� �� ��� �������(��������� ���������)
md1=20*log10(H1);%��� �� ��� �������(� ������� �������)
plot(w1*Fs/(2*pi),md1);%����������� �� ��� � ��� ���� �� ���
xlabel('Chestota');
ylabel('ACH v dB');
title('ACH na VCHF/NCHF po inv Cheb s gabarit na RF');
legend('VCHF','NCHF','--');%�������
grid;

hold on;%����������� �� ������� �� ��-�������, ������ � ��� �� ��� � ���
x=linspace(0,0);                         
y=linspace(-35,-35);
line(x,y,'Color','white','LineWidth',3);
x=linspace(0,30);   %1.����� ���. �����                       
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',2);
x=linspace(30,30);   %1.����� ����. �����                       
y=linspace(-3,-5);
line(x,y,'Color','black','LineWidth',2);
x=linspace(60,60);   %2.����. �����                       
y=linspace(-3,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(60,108);%2.������ ������������ �����
y=linspace(-30,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(108,108);   %2.����. �����                       
y=linspace(-3,-30);
line(x,y,'Color','black','LineWidth',3);
x=linspace(112,112);   %3.����. �����                       
y=linspace(-5,-3);
line(x,y,'Color','black','LineWidth',2);
x=linspace(112,192);%3.�������� ���. �����
y=linspace(-3,-3);
line(x,y,'Color','black','LineWidth',2);
title('ACH na VCH/NCH filter s gabarit na RF');
%�������� ������ ����������
[b0,B,A]=dir2cas(Nz,Dz)%�������� ���������� ���(���������� �� ��������-B � ����������-�)
[b01,B1,A1]=dir2cas(Nz1,Dz1)%�������� ���������� ���(���������� �� ��������-B1 � ����������-�1)
%��������� z-�������������
figure(9);%��������� �� �������� �� � ������ ��
axis([0 Fn 0 60])%�������� �� ������� ��������� �� ��������
subplot(211);
Wp=[30 112];%������� �� ����������  
Ws=[60 108];%������� �� ���������
Wpa=(Fs*tan((pi*Wp)/Fs))/pi;%������� � ��������� ������� ����������(Hz) �� ��� � ���
Wsa=(Fs*tan((pi*Ws)/Fs))/pi;%������� � ��������� ������� ���������(Hz) �� ��� � ���
[N2,Wn2]=cheb2ord(Wpa,Wsa,Rp,Rs,'s');%����-������ ����������� ������������       
[Ns,Ds]=cheby2(N2,Rs,Wn2,'stop','s');%stop-�������� ���������� ������ �� ��� N2 �������� �� �������
[H2,w2]=freqs(Ns,Ds,20000);%����������� ������������ �-� �� �������� ��
m2=abs(H2);%��������� ��������� �� ��������� 
md2=-20*log10(m2);%��������� � ������� �������
plot(w2,md2,'g');%����������� �� ��������� �� �������� ���������� ������
axis([0 200 0 60])
xlabel('Chestota');
ylabel('Zatihvane v dB');
title('Zatihvane na analog. Rf');
%����������� ������������ �-� �� ������ ��
subplot(212)
[N2,Wn2]=cheb2ord(Wp/Fn,Ws/Fn,Rp,Rs);%������������ �� ������ ���������� ������        
[Nz,Dz]=cheby2(N2,Rs,Wn2,'stop');%stop ������ ���������� ������ �� ��� N �������� �� �������
[H3,w3]=freqz(Nz,Dz);%����������� �� ������� ������������ �������
m3=abs(H3);%��������� � ��������� ���������
md3=-20*log10(m3);%��������� � ������� �������
plot(w3*Fs/(2*pi),md3,'c');%����������� �� ��������� �� ������ ��
xlabel('Chestota');
ylabel('Zatihvane v dB');
title('Zatihvane na cifrov Rf');
axis([0 Fn 0 60])
printsys(Ns,Ds)%��������� ������������ �-��� Tbs(s)
Hbs=tf(Nz,Dz,1/Fs)%������� ������������ �-��� Hbs(z)