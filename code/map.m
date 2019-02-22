function [n] = map(i,j)
%MAP maps between rectangular and linear cordinates
    n = j + (i - 1)*C.ny;
end

