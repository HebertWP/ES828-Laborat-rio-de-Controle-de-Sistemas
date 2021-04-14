begin()

Tal=0.01;
Kp=2.15694;
Ki=34.1581497;
Kd=0.03405;

Tal = 0.0027;
Kp = 3.1814;
Ki = 1.8902;
Kd = 0.0873;

R = [    1,    10,    27,    39,    47,    68,   100,   120,   150,   180, 200,   220,   270,   330,   390,   470,   560,   680,   1e3, 1.2e3, 1.5e3, 1.8e3, 2.2e3, 2.7e3, 3.3e3, 3.9e3, 4.7e3, 6.8e3,  10e3,  12e3, 15e3,  20e3,  22e3,  27e3,  33e3,  39e3,  51e3,  56e3,  58e3,  68e3, 100e3, 150e3, 220e3, 470e3, 510e3, 560e3, 820e3, 200e3, 220e3, 270e3];

R1=R;
R2=R;
R3=R;
C=1e-6;

iI=0;
for i=R1
    iI=iI+1;
    yY=0;    
    for y=R2
        yY=yY+1;
        zZ=0;
        for z=R3
            zZ=zZ+1;
            posibleTal(iI,yY,zZ)=i*y*C/(i+y);
            posibleKi(iI,yY,zZ)=1/((i+y)*C);
            posibleKp(iI,yY,zZ)=((i+z)/(i+y))-posibleKi(iI,yY,zZ)*posibleTal(iI,yY,zZ);
            posibleKd(iI,yY,zZ)=((i*z*C)/(i+y))-posibleKp(iI,yY,zZ)*posibleTal(iI,yY,zZ);
        end
    end
end

erroTal = posibleTal-Tal;
erroKi = posibleKi-Ki;
erroKp = posibleKp-Kp;
erroKd = posibleKd-Kd;


for i=1:50
    for y=1:50
        for z=1:50
            if(erroTal(i,y,z)<0)
                erroTal(i,y,z)=-erroTal(i,y,z);
            end
            if(erroKi(i,y,z)<0)
                erroKi(i,y,z)=-erroKi(i,y,z);
            end
            if(erroKp(i,y,z)<0)
                erroKp(i,y,z)=-erroKp(i,y,z);
            end
            if(erroKd(i,y,z)<0)
                erroKd(i,y,z)=-erroKd(i,y,z);
            end            
        end
    end
end
aux=0;
erro=erroTal+erroKp+erroKi+erroKd;
iI=0;yY=0;zZ=0;
for i=1:50
    for y=1:50
        for z=1:50
            data(i,y,z).erro=erro(i,y,z);
            data(i,y,z).R1=R1(1,i);
            data(i,y,z).R2=R2(1,y);
            data(i,y,z).R3=R3(1,z);
            if(data(i,y,z).erro<1.3744)
                disp(sprintf('Number=%d;i=%d;y=%d,z=%d',aux,i,y,z))
                data(i,y,z)
                aux=aux+1;
                iI=i;
                yY=y;
                zZ=z;
            end
        end
    end
end
R1 = data(iI,yY,zZ).R1;
R2 = data(iI,yY,zZ).R2;
R3 = data(iI,yY,zZ).R3;