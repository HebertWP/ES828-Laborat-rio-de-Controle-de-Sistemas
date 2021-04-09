begin();

dt=2e-3;

[t3,input3,output3] = getData('./Dados para identificacao/est_03.txt',dt);

k=-0.982092;
tal2=0.0087;
output3=output3/k;
figure
plot(t3,output3)
a=0;
for i=0:3
    a= a + output3(1,int16(tal2/dt)+i*int16(2/dt));
end
a=a/4
b=0;
for i=0:3
    b= b + output3(1,int16(2*tal2/dt)+i*int16(2/dt));
end
b=b/4
r=roots([1, -(1-b-exp(-2))/(1-a-exp(-1)),((1-b)*exp(-1)-(1-a)*exp(-2))/(1-a-exp(-1))])

X=r(1)
tal3=-tal2/log(X)