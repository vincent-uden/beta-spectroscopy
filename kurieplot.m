function [kuriedata]=kurieplot(Te,data,Z) 
  % INPUT: 
  % Te = Electron kinetic energy vector (in keV) from calibration.
  % data = Raw data in 2-column matrix form [ch,counts]
  % Z = daughter nucleus proton number (positive for beta-minus decay)
    
  % OUTPUT:
  % kuriedata = data for Kurie plot (vector, same length as Te)
  % Physical constants
  mc2=511;
  alpha=1/137;
  
  % Number of counts
  Ne=data(:,2)';
  Te=reshape(Te,size(Ne));
  
  % Dimensionless (scaled by electron rest mass energy) electron
  % total energy.
  epsi = 1 + Te/mc2;
  % Dimensionless (scaled by m*c) electron momentum
  p = sqrt(epsi.^2-1);
  
  % Fermi function (Primakoff-Rosen approx)
  FPR = 2*pi*alpha*Z / (1-exp(-2*pi*alpha*Z));
  F0=FPR*epsi./p;
  
  % Output
  kuriedata=sqrt(Ne./(F0.*p.*epsi));
  
  % Plot
  figure
  plot(Te,kuriedata)
