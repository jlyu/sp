%-------------------------------------------------------- 
%函数说明： 
%输入： 
%           image: 读入图片的路径 
%           D0:      参数D0 
%           n:        巴特沃思与指数滤波器的阶数 
%输出： 
%           经过各种滤波后的图片 
%-------------------------------------------------------- 
function HPFilter (image , D0 , n); 
%image = 'lena_noise.bmp'; 
f = imread(image); 
[u,v] = size(f); 
mid_x = u/2; 
mid_y = v/2; 
%D0 = 50; 
%---------------------------------------------------------- 
%高通滤波器的设计 
%---------------------------------------------------------- 
figure; 
subplot(2,2,1); 
imshow(f); 
title('原图'); 
%------------------------------- 
%理想高通滤波器（ILPF） 
%------------------------------- 
H = zeros(u,v); 
for i = 1:u 
    for j = 1:v 
        if(sqrt((i-mid_x)^2+(j-mid_y)^2) > D0) 
            H(i,j) = 1; 
        end 
    end 
end 
g = myfilter (f, H, D0); 
subplot(2,2,2); 
imshow(g); 
title('理想高通滤波'); 
%------------------------------- 
%巴特沃思高通滤波器（BLPF） 
%------------------------------- 
for i = 1:u 
    for j = 1:v 
        H(i,j) = (1+(D0^2/(i^2+j^2))^n)^-1; 
    end 
end 
g = myfilter (f, H, D0); 
subplot(2,2,3); 
imshow(g); 
title('巴特沃思高通滤波'); 
%------------------------------- 
%指数高通滤波器（elpf） 
%------------------------------- 
for i = 1:u 
    for j = 1:v 
        H(i,j) = exp(-(D0^2/(i^2+j^2))^n); 
    end 
end 
g = myfilter (f, H, D0); 
subplot(2,2,4); 
imshow(g); 
title('指数高通滤波');

%以下是实验 

j=imread('checkerboard.bmp');

j=double(j);

f=fft2(j); 
g=fftshift(f); 
figure,subplot(2,2,1);imshow(log(1+abs(g)),[]); 
[m,n]=size(f)

for i=1:m

   for j=1:n

h(i,j)=(1+(d0^2/(i^2+j^2))^n)^-1

g(i,j)=h(i,j)*g(i,j);

end

end
