function cMap = conductionMap(nx, ny, sigma_conduct, sigma_insulate, Wb, Lb)
%CONDUCTIONMAP Generates the map of conductivity of the area for given area
    cMap = sigma_conduct*ones(nx, ny);
end

