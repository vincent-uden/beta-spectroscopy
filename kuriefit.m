function [slope,offset]=kuriefit(Te,kuriedata,range)  
  % INPUT:
  % Te = electron kinetic energy vector (in keV) from calibration.
  % kuriedata = from kurieplot function
  % range = energy range for fit
  
  % OUTPUT:
  % slope = slope of linear fit to Kurie plot
  % offset = offset of linear fit to Kurie plot

  kr=interp1(Te,kuriedata,range);
  figure
  plot(range,kr)
  
  % Linear fit of kurie data and extract the zero crossing
  lr = polyfit(range,kr,1);
  %disp(['slope = ', num2str(lr(1))])
  %disp(['offset = ', num2str(lr(2))]) 

  slope=lr(1);
  offset=lr(2);

  Q=-lr(2)/lr(1);
  
  % plot
  hold on;
  plot(range,lr(1)*range+lr(2),'--k')
  
  %--% Extract Fermi integral
  %--mc2=511;
  %--alpha=1/137;
  %--
  %--e0=Q/mc2+1;
  %--% Dimensionless (scaled by electron rest mass energy) electron
  %--% total energy.
  %--delta=0.000001;
  %--epsi = 1+delta:0.01:e0;
  %--% Dimensionless (scaled by m*c) electron momentum
  %--p = sqrt(epsi.^2-1);
  %--
  %--% Fermi function (Primakoff-Rosen approx)
  %--FPR = 2*pi*alpha*Z/(1-exp(-2*pi*alpha*Z));
  %--F0=FPR*epsi./p;
  %--
  %--% Fermi integrand
  %--Fint = F0.*epsi.*p.*(e0-epsi).^2;
  %--% fermi integral evaluated with trapetzoid rule
  %--f = trapz(epsi,Fint);
  %--
  %--lf = log10(f);
  
