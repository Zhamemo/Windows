Arsize = 31; 
feature_point = zeros(Arsize,2);
for i=1:Arsize
    feature_point(i,:) = imagePoints( 1 ,: ,i ,2 );
end
% dlmwrite('myFile.txt',M,'delimiter','\t','precision',3)

dlmwrite('1.txt',feature_point,'delimiter','\t','precision','%.6f');