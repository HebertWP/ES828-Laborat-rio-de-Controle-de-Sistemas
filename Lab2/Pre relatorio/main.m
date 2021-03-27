clc; close all; clear all;

R1 = 100e3
R2 = 10e3
R3 = 100e3
R4 = 220e3
R5 = 100e3
R6 = 470e3
R7 = 1e6
C1 = 0.1e-6
C2 = 0.1e-6
C3 = 0.1e-6

k1 = -R2/R1
t1 = 0
G1 = tf(k1,[t1,1])

k2 = -R4/R3
t2 = R4*C1
G2 = tf(k2,[t2,1])

k3 = -R6/R5
t3 = R6*C2
G3 = tf(k3,[t3,1])

k4 = -1/(R7*C3)
G4 = tf(k4,[1,0])

G=G1*G2*G3*G4

opts = bodeoptions('cstprefs');
opts.Grid = 'on';
opts.MagScale = 'linear';
margin(G);
h=legend('G');
saveas(h,'./data/bode.png');

figure
dt = 1e-3;
t0 = 0;
t1 = 4;
t = t0:dt:t1;
u = (t >= 0) - (t >= 1) + (t >= 2) - (t >= 3) + (t >= 4);
p=plot(t,u);
xlabel('t[s]');
ylabel('u(t)');
ylim([-0.2,1.2]);
p(1).LineWidth = 2.5;
saveas(p,'./data/input.png');

y1=lsim(G1,u,t);
plot(t,y1,t,u,'--')
xlabel('t[s]');
p=legend('y1','u');
ylim([-0.2,1.2]);
saveas(p,'./data/y1.png');

y2=lsim(G2,y1,t);
plot(t,y2,t,y1,'--')
xlabel('t[s]');
p=legend('y2','y1');
ylim([-0.1,0.3]);
saveas(p,'./data/y2.png');

y3=lsim(G3,y2,t);
plot(t,y3,t,y2,'--')
xlabel('t[s]');
p=legend('y3','y2');
ylim([-0.2,1.2]);
saveas(p,'./data/y3.png');


y4=lsim(G4,y3,t);
plot(t,y4,t,y3,'--')
xlabel('t[s]');
p=legend('y4','y3');
%ylim([-0.2,2.2]);
saveas(p,'./data/y4.png');

close all;
exit()