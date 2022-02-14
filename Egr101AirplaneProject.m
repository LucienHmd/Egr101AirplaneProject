N = 14; %Number of people
Wcargo = 9000; %Cargo weight 
Wpayload = N * 170 + Wcargo; %Weight payload
%Wempty; %Empty weight 
%Wgross; %Gross weight 
%Wfuel;  %Fuel weight 
R= 3447; %Range
%L; %Lift
%p_air; %air density 
%CL; %Coefficient of lift
%Vstall; %Velocity Stall
%Vlanding; %Velocity Landing 
%CL_MAX; %type of flap
%CDi; %Induced drag coefficient 
%CL_CRUISE; %
%p_CRUISE; %air density at cruise altitude 
%V_CRUISE;
%AR; %aspect ratio
%CDo;
%fuse_diameter;
%T_CRUISE;
%D_CRUISE;
%T_RATED;
%T_SLS;
%sigma; %variable no one knows but is in one of the formulas
%SFC;
%WF_CRUISE;
%hr_CRUISE;
%WrF;
%Tupar_ratio;
%Sweep_angle;
%b_wing;
%fuse_wid;  %fuselage width 
%Croot; %Chord root 
%Ctip; %Chord tip 
%MAC;
%SVT;
%AVT;
%SHT;
%AHT;
%LT;

Wfuel = (0.15 + 3.33*10^(-5) * (R - 1000)); % Calculate Fuel Weight
Wgross = (Wpayload) / (1-0.5-Wfuel); % Calculate Gross Weight to be used in calculations



%CL = L/(.5)*(p_air)*(Vstall^2); 
%Vlanding = Vstall * 1.1; 
%S= (2*Wgross)/(CL_MAX)*(p_air)*(Vstall^2);
%Length= (.5667)*(Vstall^2);
%CDi = (CL_CRUISE^2)/pi*()
%CL_CRUISE = (Wgross)/(.5)*(P_CRUISE)*(Vcruise^2)*(S)