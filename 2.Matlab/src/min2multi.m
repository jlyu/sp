clc; 
clear all; 
close all;
d=csvread('CO2.csv');
%t=linspace(0,2*pi,300); % 变量t范围
t=d(:,1);
s1=d(:,2); %3*sin(2*t+10)+randn(1,length(t)); % 信号量s1, 附带噪声

subplot(2,1,1); % 两行一列，上图
plot(t, s1); % 显示s1
xlabel('时间t');
ylabel('信号量s1');
title('图1：带噪声信号量s1的原图');
grid on;

% 最小二乘法线性拟合
x = d(:,1);
y = d(:,2);
p85 = polyfit(x, y, 85);
y2 = polyval(p85, x);
r = sum((y-y2).^2) % 误差平方和

hold on;
subplot(2,1,2);
plot(x, y2);
xlabel('时间t');
ylabel('信号量s2');
title('图2：最小二乘法线性拟合');
grid on;