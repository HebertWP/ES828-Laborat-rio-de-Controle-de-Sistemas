function [t,input,output] = getData(file,dt)
    data = dlmread(file);
    n=size(data);
    n=n(1,1);
    t=dt:dt:dt*n;
    data = transpose(data);
    input = data(2,:);
    output= data(1,:);
end 