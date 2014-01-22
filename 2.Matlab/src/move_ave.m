clc; 
clear all; 
close all;
d=csvread('raw.csv');

t=d(:,1);
s1=d(:,2); %3*sin(2*t+10)+randn(1,length(t)); % 信号量s1, 附带噪声

subplot(4,1,1); % 两行一列，上图
plot(t, s1); % 显示s1
%xlabel('时间t');
%ylabel('信号量s1');
%title('图1：带噪声信号量s1的原图');
grid on;

% -------------------------------------平均5点
len = 10; %input('输入子向量长度len：');
for idx=1:length(t)-len+1
    index=idx:idx+len-1;
    average=sum(s1(index))/len;
    s2(idx)=average;
end
subplot(4,1,2);
plot(t(1:length(t)-len+1),s2);
%xlabel('时间t');
%ylabel('信号量s2');
%title('图2：移动平均处理后的信号量s2（平均点数=5）');
grid on;

% -------------------------------------平均10点
len = 50; %input('输入子向量长度len：');
for idx=1:length(t)-len+1
    index=idx:idx+len-1;
    average=sum(s1(index))/len;
    s3(idx)=average;
end
subplot(4,1,3);
plot(t(1:length(t)-len+1),s3);
%xlabel('时间t');
%ylabel('信号量s3');
%title('图3：移动平均处理后的信号量s3（平均点数=10）');
grid on;

% -------------------------------------平均50点
len = round(length(t)/10)-1; %input('输入子向量长度len：');
for idx=1:length(t)-len+1
    index=idx:idx+len-1;
    average=sum(s1(index))/len;
    s4(idx)=average;
end
subplot(4,1,4);
plot(t(1:length(t)-len+1),s4);
%xlabel('时间t');
%ylabel('信号量s4');
%title('图4：移动平均处理后的信号量s4（平均点数=50）');
grid on;