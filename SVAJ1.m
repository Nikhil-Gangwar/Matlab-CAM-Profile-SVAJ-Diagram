clc;
clear all;

p1=0:1:60;
p2=60:1:120;
p3=120:1:240;
p4=240:1:300;
p5=300:1:360;

r=10;
h=8;
theta=0:1:360;
beta=60;

d1=0*p1;
rise=h*(35*(p1/beta).^4 - 84*(p1/beta).^5 + 70*(p1/beta).^6 -20*(p1/beta).^7) ;
d2=0*p3;
fall=h*(35*(p1/beta).^4 - 84*(p1/beta).^5 + 70*(p1/beta).^6 -20*(p1/beta).^7) ;
d3=0*p5;

r1 = r + d1;
r2 = r1(length(r1)) + rise;
r3 = r2(length(r2)) + d2;
r4 = r3(length(r3)) - fall;
r5 = r + d3;

rnet = [r1 r2 r3 r4 r5];
pnet = [p1*pi/180 p2*pi/180 p3*pi/180 p4*pi/180 p5*pi/180];
figure
polarplot(pnet,rnet);
title('Dwell-Rise-Dwell-Fall-Dwell');

figure
subplot(4,1,1);
plot(pnet,rnet)
title('s plot');

vel=diff(rnet);
subplot(4,1,2);
plot(pnet, [vel 0 ]);
title('v plot');

acc=diff(vel);
subplot(4,1,3);
plot(pnet, [acc 0 0]);
title('a plot');

jerk=diff(acc);
subplot(4,1,4);
plot(pnet, [jerk 0 0 0]);
title('j plot');

