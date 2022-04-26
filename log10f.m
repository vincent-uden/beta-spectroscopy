function log10f=log10f(Z,Q) 
  % INPUT: 
  % Z = daughter-nucleus proton-number (minus daughter-nucleus proton-number 
  %                                     for beta-plus decay)
  % Q = beta-decay Q-value (in keV)
    
  % OUTPUT:
  % log10f = Approximate value for log_10 (f) (non-relativistic expression)

  % Physical constants
%   Z=-Z;
  Q=Q*1e-3;
  mc2=0.511;
  alpha=1/137;
  
  % Dimensionless (scaled by electron rest mass energy) maximum electron
  % total energy.
  epsQ = 1 + Q/mc2;
  
  % Fermi function (Primakoff-Rosen approx)
  FPR = 2*pi*alpha*Z / (1-exp(-2*pi*alpha*Z));
  
  % Analytical expression for f, i.e., Fermi's integral with a 
  % non-relativistic approximation for the Fermi function
  f = (epsQ^5 - 10*epsQ^2 + 15*epsQ - 6) * FPR / 30;
  
  log10f=log10(f);
  
