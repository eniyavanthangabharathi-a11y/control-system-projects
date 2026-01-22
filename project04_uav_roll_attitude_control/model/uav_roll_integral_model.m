% UAV Roll Dynamics with Integral Action

% Parameters
Ixx = 0.02;
L   = 0.1;

% Original model
A = [0 1;
     0 0];

B = [0;
     L/Ixx];

C = [1 0];
D = 0;

% Augmented system (integral of roll error)
A_aug = [ A      zeros(2,1);
         -C       0         ];

B_aug = [ B;
           0 ];

C_aug = [C 0];
D_aug = 0;
