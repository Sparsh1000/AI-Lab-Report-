clc;
clear all;
close all;
y=csvread("2023_ten_bent_coins 2.csv");

theta=[0.6,0.5];
h = sum(y,2); %returns column vector with sum of rows of y
t = 10-h;

th(1,:) = theta; 

for a=1:10  %no. of iterations
p = zeros(5,2);
for i=1:5
    for j=1:2
        p(i,j)=(th(a,j).^h(i,1)).*((1-th(a,j)).^t(i,1)); 
    end
end
np = p;
s= sum(p,2); 
for i=1:5
    for j=1:2
        np(i,j)=p(i,j)/s(i,1);
    end
end

heads = zeros(5,2);

for i=1:5
    for j=1:2
        heads(i,j)=np(i,j)*h(i,1);
    end
end
tails = zeros(5,2);
for i=1:5
    for j=1:2
        tails(i,j)=np(i,j)*t(i,1);
    end
end
sumheads=sum(heads,1); %row vector with sum of columns of heads
sumtails=sum(tails,1);
for i=1:2
    th(a+1,i) = sumheads(1,i)/(sumheads(1,i)+sumtails(1,i));
end

end
disp(th)