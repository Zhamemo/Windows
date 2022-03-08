clear all;clc

data = xmlread('point.xml','r');
 
point_array = data.getElementsByTagName('point');
point = char(point_array.item(0).getTextContent());

point = strsplit(point,' ');
Point = str2num(char(point));

sta = 1;
for i = 1:88
    Point3D(i,1:3) = Point(sta:sta+2,:);
    sta = sta + 3;
end
Point3D(:,4) = 1;

data1 = xmlread('Transform.xml','r');

Rvec_array = data1.getElementsByTagName('Rvec');
Rvec = char(Rvec_array.item(0).getTextContent());

Rvec = strsplit(Rvec,' ');
rvec = str2num(char(Rvec));

sta = 1;
for i = 1:3
    ro(i,1:3) = rvec(sta:sta+2,:);
    sta = sta + 3;
end

tvec_array = data1.getElementsByTagName('tvec');
tvec = char(tvec_array.item(0).getTextContent());

tvec = strsplit(tvec,' ');
t = str2num(char(tvec));

tr = zeros(4,4);
tr(1:3,1:3) = ro;
tr(1:3,4) = t;
tr(4,4) = 1;

for j = 1:88
    pt(j,:) = tr \ Point3D(j,:)';
end

point3d(:,1) = pt(:,3);
point3d(:,2) = pt(:,1);
point3d(:,3) = pt(:,2);

n = 1;
st = 1;
for h = 1:11
    for j = 1:8
        P3D(n,:) = point3d(st,:);
        st = st+11;
        n = n + 1;
    end
    st = h + 1;
end

data = P3D(9:80,:);


