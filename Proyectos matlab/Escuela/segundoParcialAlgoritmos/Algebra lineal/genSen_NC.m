function [s] = genSen_NC(N,C)
  dn = 2^N;
  s  = ones(1,dn);
  t = fix(dn/C);
  m   = fix((t+2)/2):t;
  for k = 1:C
      mk = (k-1)*t + m;
      s(mk) = -s(mk);
  end    
  plot(s)
end

