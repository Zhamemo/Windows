clear all;clc;

Arsize = 20;

for j = 1:2
for i= 1:Arsize  %导入观测数据个数   
% 导入观测数据
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[filename, pathname] = uigetfile('*.txt', '导入观测数据');
if isequal(filename,0)||isequal(pathname,0)
    return;
end
filePath = [pathname,filename]; % 文件路径

try
    points = load(filePath);
catch
    errordlg('数据格式错误','错误');
    return;
end

Ep(:,:,i,j) = points;

end
end