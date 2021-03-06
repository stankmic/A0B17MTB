function [ X, Y, Z ] = getEclipticalCoordinates( t, t0, a, L, e, omegaDash, i, Omega, Ldot )
    M0 = L - omegaDash;
    n = Ldot;
    % http://physics.muni.cz/~hroch/kepler.pdf
    % 1
    %M = M0 + n*(t-t0);
    M = M0 + (n*(t-t0)/36525);
    
    R = a * ( 1 + sqrt(1-e^2) ) / 2;
    % 2
    X = R * sind(M);
    % 3
    Y = R * cosd(M);
    
    Z=0;
    
    % 5
    %E(1) = M;
    
    % 6
    %check = true;
    %k = 1;
    %x = 3;
    %while (check)
    %   E(k+1) = M + e * sin(E(k));
    %   % 7
    %   check = abs( E(k) - E(k+1) ) < 10^(-x);
    %   k = k+1;
    %end
    %E = E(k);
    
    % 8
    %r = a * (1 - e*cos(E) );
    
    % 9
    %tanV2 = sqrt((1+e) / (1-e)) * tan (E/2);
    %v2 = atan(tanV2);
    %v = 2*v2;
    
    % 10
    %L = omegaDash + v - Omega;
    %X = R * ( cos(Omega)*cos(L) - sin(Omega)*sin(L)*cos(i) );
    %Y = R * ( sin(Omega)*cos(L) - cos(Omega)*sin(L)*cos(i) );
    %Z = R * sin(L) * sin(i);
end
