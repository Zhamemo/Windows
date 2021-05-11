%µ¥Î»»¯
function y = Sdt_th(x)

num = size(x,1);
y = zeros(num,1);
for i=1:num
    y(i,:) = x(i) / norm(x);
end

end