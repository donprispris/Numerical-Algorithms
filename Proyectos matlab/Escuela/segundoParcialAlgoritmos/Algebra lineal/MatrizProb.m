P=[[0.35,0.15,0.20,0.15,0.15],
[0.00,0.15,0.20,0.30,0.35],
[0.20,0.30,0.25,0.25,0.00],
[0.15,0.25,0.00,0.35,0.25],
[0.15,0.00,0.30,0.15,0.40]];

ptmi = P'- eye(5);

ptmim = ptmi;
ptmim(5,:) = [1,1,1,1,1];
probtran = ptmim \ [0,0,0,0,1]'