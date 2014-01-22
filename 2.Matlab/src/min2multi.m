clc; 
clear all; 
close all;
% cd('data');
d=csvread('raw.csv');

t=d(:,1);
s1=d(:,2); %3*sin(2*t+10)+randn(1,length(t)); % 信号量s1, 附带噪声

subplot(4,1,1); % 两行一列，上图
plot(t, s1); % 显示s1
%xlabel('时间t');
%ylabel('信号量s1');
%title('图1：带噪声信号量s1的原图');
grid on;

% ========最小二乘法线性拟合
x = d(:,1);
y = d(:,2);
p2 = polyfit(x, y, 2);
y2 = polyval(p2, x, 2);
r2 = sum((y-y2).^2); % 误差平方和

hold on;
subplot(4,1,2);
plot(x, y2);
%xlabel('时间t');
%ylabel('信号量s2');
%title('图2：最小二乘法线性拟合');
grid on;


% ========最小二乘法线性拟合
x = d(:,1);
y = d(:,2);
p20 = polyfit(x, y, 20);
y3 = polyval(p20, x, 2);
r3 = sum((y-y3).^2); % 误差平方和

hold on;
subplot(4,1,3);
plot(x, y3);
%xlabel('时间t');
%ylabel('信号量s2');
%title('图2：最小二乘法线性拟合');
grid on;


% ========最小二乘法线性拟合
x = d(:,1);
y = d(:,2);
p70 = polyfit(x, y, 70);
y4 = polyval(p70, x, 2);
r4 = sum((y-y4).^2); % 误差平方和

hold on;
subplot(4,1,4);
plot(x, y4);
%xlabel('时间t');
%ylabel('信号量s2');
%title('图2：最小二乘法线性拟合');
grid on;