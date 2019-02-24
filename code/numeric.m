function V = numeric(nx, ny, cMap, bc_left, bc_right, bc_top, bc_bottom)
%NUMERIC Calculates the numeric solution using the finite difference method
    global C;
    G = sparse(nx*ny, ny*nx);
    B = zeros(1, nx*ny);
    for i=1:nx
        for j=1:ny
            n = map(i,j, nx, ny);
            nxm = map(i-1,j, nx, ny);
            nxp = map(i+1,j, nx, ny);
            nym = map(i,j-1, nx, ny);
            nyp = map(i,j+1, nx, ny);

            if (i == 1) % Left Side
                G(n,n) = 1;
                B(n) = bc_left;
            elseif i == nx % Right side
                G(n,n) = 1;
                B(n) = bc_right;
            elseif j == 1 % Top Side
                G(n,n) = 1;
                B(n) = bc_top;
            elseif j == ny % Bottom Side
                G(n,n) = 1;
                B(n) = bc_bottom;
            else % Bulk Area
                rxm = (cMap(i,j) + cMap(i-1,j))/2;
                rxp = (cMap(i,j) + cMap(i+1,j))/2;
                rym = (cMap(i,j) + cMap(i,j-1))/2;
                ryp = (cMap(i,j) + cMap(i,j+1))/2;
                
                G(n,n)   = -(rxm+rxp+rym+ryp);
                G(n,nxm) =  rxm;
                G(n,nxp) =  rxp;
                G(n,nym) =  rym;
                G(n,nyp) =  ryp;
            end
        end
    end
    
    V_temp = G\B';
    
    V = zeros(nx,ny,1);
    for i=1:nx
        for j=1:ny
            V(i,j) = V_temp(map(i,j, nx, ny));
        end
    end
end

