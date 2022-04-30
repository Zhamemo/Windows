function [X, Y] = virtual_construction(xs,xo,Z)
    a = (Z - xo(3)) / (0 - xo(3));
    X = a * (xs(1) - xo(1)) + xo(1);
    Y = a * (xs(2) - xo(2)) + xo(2);
end