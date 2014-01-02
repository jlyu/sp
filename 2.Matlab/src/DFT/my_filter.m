%图像高斯平滑滤波处理
%filename:文件名
%d0:截止频率
%t:参数取值
%low_or_high:高通/低通
%filtertype:滤波因子

function my_filter(filename,d0,t,low_or_high,filtertype)
img=imread(filename);
info = imfinfo(filename);
% 如果是彩色图，转化成灰度图处理
if(strcmp( 'grayscale', info.ColorType)~=1)
    f = rgb2gray(img);
else f = img;
end
subplot(1,2,1);imshow(f);
f=double(f);
%做傅里叶变换
f=fft2(f);
f=fftshift(f);
[m,n]=size(f); 
%调用函数求滤波因子
h=H_type(d0,t,low_or_high,filtertype,m,n);
%进行滤波 处理
g=f.*h;
g=ifftshift(g);
%重构图像
g=ifft2(g);
g=mat2gray(real(g)); 
subplot(1,2,2);imshow(g);
imwrite(g,'gauss_result.jpg');
