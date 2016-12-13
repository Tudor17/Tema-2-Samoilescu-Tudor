function t2_Samoilescu_Tudor()
P = 40; %perioada semnalului 
w = 2*pi/P; D=19; %durata semnalului
N = 25;	%50 de coeficienti(de la -25 la +25)
k=-N:N; %vector cu elemente de la -N la +N cu pasul 1
Xk=(1./(-j*k*2*pi)).*(exp(-j*k*w*D)-1).*exp(j*k*w*D/2);
Xk(find(k==0))=D/P;
subplot(2,1,1)%fereastra va fi impartita in doua grafice
stem(k,abs(Xk)),title('Spectrul lui x(t)')%spectrul de amplitudini
xlabel('k'),ylabel('Amplitudine') %axele x si y
t=-100:.001:100; %rezolutia temporala
xa=Xk*exp(j*w*k'*t);
xb=1-1*(abs(rem(t,P))>=D/2)+1*(abs(rem(t,P))>=P-D/2);
subplot(2,1,2),plot(t,xa,'b' ,t,xb,'r') %graficul ce contine semnalul initial si semnalul reconstruit
title('x(t)(linie rosie) si reconstructia folosind N coeficienti(linie albastra)')
xlabel('timp(s)'),ylabel('Amplitudine')
   