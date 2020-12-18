 clear; clc;close all;

[y,Fs] = audioread('Sun Goes Down.mp3');
sound(y,Fs);

x = linspace(-2,2,100);
[X,Y,Z] = meshgrid(x,x,x);
I1 = (X.^2+9/4*Y.^2+Z.^2-1).^3-X.^2.*Z.^3-9/80*Y.^2.*Z.^3;
p = patch(isosurface(X,Y,Z,I1,0));
set(p, 'FaceColor', 'red', 'EdgeColor', 'none');
set(gcf,'Position',get(0,'ScreenSize'))
view(3);
axis equal ;
axis off;
light('Posi',[0 -2 3]);
lighting phong
set(gca,'nextplot','replacechildren');
XX = get(p,'XData');
YY = get(p,'YData');
ZZ = get(p,'ZData');
for j = 1:20
    bili = sin(pi*j/20);
        set(p,'XData',bili*XX,'YData',bili*YY,'ZData',bili*ZZ)   
    F(j) = getframe;
end
% movie(F,5);


f=@(x,y,z)(x.^2+ (9./4).*y.^2 + z.^2 - 1).^3 - x.^2.*z.^3 - (9./80).*y.^2.*z.^3;
[x,y,z]=meshgrid(linspace(-2,2));
val=f(x,y,z);
[p,v]=isosurface(x,y,z,val,0);
patch('faces',p,'vertices',v,'facevertexcdata',jet(size(v,1)),'facecolor','r','edgecolor','none');
light('Posi',[0 -2 3]);
lighting phong
set(figure(1),'Position',get(0,'ScreenSize'))
view(3);grid off;axis equal;axis off;

pause(2);

set(figure(2),'outerposition',[-2 188 576 514])
t = 0:0.01*pi:2*pi;
for i=1:5
    r(i,:)=i-0.9:0.1:i+0.1;
end
for i=1:5
    a=r(i,:);
    b=t;
    [a,b] = meshgrid(a,b);
    z=(log(a)+5).*hb(5*b+pi*i).*abs(sin(pi*a));
    [x,y,z]=pol2cart(b,a,z);
    surf(x,y,z,(40+i)*ones(size(z)));
    hold on
end

[xx,yy] = meshgrid(-5:0.1:5);
h=2*cos((xx.^2+yy.^2).^0.5)-0.64;
surf(xx,yy,h,27*ones(size(h)));
hold on

xxx=[-0.1 0.1];
yyy=xxx;
[xxx,yyy]=meshgrid(xxx,yyy);
c=zeros(size(xxx));
for i=1:50
    surf(xxx,yyy,c,i*ones(size(c)));
    hold on
end
light('Posi',[0 -2 3]);
lighting phong
shading interp
grid off
axis off

% pause(1);
% 
% set(figure(2),'Position',get(0,'ScreenSize'));

pause(2)

figure(3)  
IMG = imread('PPY&PPQ.jpg');
imshow(IMG);
pause(2);
set(figure(3),'Position',get(0,'ScreenSize'));
pause(2)

IMG2 = imread('QRJKL.jpg');
figure(4)
set(figure(4),'Position',get(0,'ScreenSize'));
imshow(IMG2);
clc





