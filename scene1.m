clear all;clc;
num = 26;
Arsize = 57;
circle_scene1 = ones(num,3);
begin = 1;
for i = 32:Arsize
    str1 = ['circle5_',num2str(i),'.txt'];
    load(str1);
    str2 = ['circle5_',num2str(i)];
    last = begin+7;
    circle_scene1(begin:last,:) = eval(str2);
    begin = last+1;
end
dlmwrite('scene1.txt',circle_scene1,'delimiter',',','precision','%.6f');