clear all;clc;
n = 8;
str1 = ['circle1_',num2str(n),'.txt'];
load(str1);

Arsize = 26;
first = 1;

for j = 1:52:209
    first = j;
    last = first + 25;
for i = first:last
    tmp = i + 26;
    circle1(i,:) = (circle1_8(i,:) + circle1_8(tmp,:))/2;
end
end

str2 = ['circle',num2str(n),'.txt'];
dlmwrite(str2,circle1,'delimiter',',','precision','%.6f');