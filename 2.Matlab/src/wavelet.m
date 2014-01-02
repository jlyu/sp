clc; 
clear all; 
close all;
d=csvread('CO2.csv');

% format long;

%t=linspace(0,2*pi,300); % 变量t范围
t=d(:,1);
s1=d(:,2); %3*sin(2*t+10)+randn(1,length(t)); % 信号量s1, 附带噪声

subplot(2,1,1); % 两行一列，上图
plot(t, s1); % 显示s1
xlabel('时间t');
ylabel('信号量s1');
title('图1：带噪声信号量s1的原图');
grid on;


% 小波变换
x=d(:,1);
y=d(:,2);
truesignal = y;
sn = 20;
truesignalN = awgn(truesignal,sn,'measured');

level = 3;
wt = 'db13'; % 'db13' |'db40'|'sym13' |'sym21'
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wt);
[C,L] = wavedec(truesignalN,level,Lo_D,Hi_D);
cA3 = appcoef(C,L,wt,level); 
[cD1,cD2,cD3] = detcoef(C,L,[1,2,3]);
A3 = wrcoef('a',C,L,Lo_R,Hi_R,level);
D1 = wrcoef('d',C,L,Lo_R,Hi_R,1);
D2 = wrcoef('d',C,L,Lo_R,Hi_R,2);
D3 = wrcoef('d',C,L,Lo_R,Hi_R,3);

tptr = 'sqtwolog'; % 'heursure' | 'rigrsure' | 'minimaxi' | 'sqtwolog' 
thr_D1 = thselect(D1,tptr);
thr_D2 = thselect(D2,tptr);
thr_D3 = thselect(D3,tptr);
sorh = 's'; % 's' | 'h'
tD1 = wthresh(D1,sorh,thr_D1);
tD2 = wthresh(D2,sorh,thr_D2);
tD3 = wthresh(D3,sorh,thr_D3);
denoised = A3 + tD1 + tD2 + tD3;
err = max(abs(truesignalN-denoised));

%SNR = snr(truesignal,truesignalN);
%NoisySNR = 20*log10(norm(truesignal(:)) / norm (truesignal(:)-truesignalN(:)) );
%SNR = snr(truesignal,denoised);
%DenoisedSNR = 20*log10(norm(truesignal(:)) / norm (truesignal(:)-denoised(:)) );
% print
hold on;
subplot(2,1,2);
plot(x, denoised);
xlabel('时间t');
ylabel('信号量s2');
title('图2：小波变换');
grid on;

res(:,1) = t;
res(:,2) = denoised;
dlmwrite('wavlet-result.csv', res, 'precision', '%.5f', 'delimiter', ',')
% csvwrite('wavlet-result.csv', res);