clear all;clc

data = xmlread('Homography.xml','r');

 for i = 1:21
    str = "n_img" + num2str(i-1);
    point_array = data.getElementsByTagName(str);
    Matri = char(point_array.item(0).getTextContent());

    % point = strsplit(point,' ');
    homography(:,:,i) = str2num(char(Matri));
 end
 
fid = fopen('imgPoints.txt');

flag = 0;
r = 1;
i = 1;
j = 0;
while 1
    tline = fgetl(fid);
    if ~ischar(tline)   
        break
    end
    
%     disp(tline)
    t = str2num(tline);
    
    if isempty(t)
        flag = flag + 1;
        continue;
    end
    
    if flag == 0
        r = r + 1;
        imgPoints(r,:,i,j) = t;
    elseif flag == 1
        r = 1;
        i = i + 1;
        imgPoints(r,:,i,j) = t;
        flag = flag - 1;
    else
        r = 1;
        i = 1;
        j = j + 1;
        imgPoints(r,:,i,j) = t; 
        flag = flag - 2;
    end
        
    
    
end
fclose(fid);
 