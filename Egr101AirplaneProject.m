N = 14; %Number of people
Wcargo = 9000; %Cargo weight 
Wpayload = N * 170 + Wcargo; %Weight payload
%Wempty; %Empty weight 
%Wgross; %Gross weight 
%Wfuel;  %Fuel weight 

R= 3447; %Range
p_air = 0.002377; %air density in slugs/ft^3 at Sea Level
%S; %Wing planform Area

%CL; %Coefficient of lift
CL_MAX = 1.8; %type of flap (Plain)

L = 12802; % Runway Length
Vstall = sqrt(L / 0.5664); %Velocity Stall
Vlanding = Vstall * 1.1; %Velocity Landing 

%CDi; %Induced drag coefficient 
%CL_CRUISE; 
p_CRUISE = 0.001066; %air density at cruise altitude (25000 feet)
V_CRUISE = 600; % in feet/second
AR = 8; %aspect ratio
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
b_wing = 132;
%fuse_wid;  %fuselage width 
%Croot; %Chord root 
%Ctip; %Chord tip 
%MAC;
%SVT;
%AVT;
%SHT;
%AHT;
%LT;
Iterations = 1;
x = 1;

WfuelCoefficent = (0.15 + 3.33*10^(-5) * (R - 1000)); % Calculate Fuel Weight
Wgross = (Wpayload) / (0.5- WfuelCoefficent); % Calculate Gross Weight to be used in calculations
Wfuel = (0.15 + (3.33*10^(-5)) * (R-1000)) * Wgross;

while x == 1
    if Iterations > 1
        Wgross = (Wpayload + Wfuel_Real) / 0.5;
    end
    Iterations = Iterations + 1;
    Wempty = 0.5 * Wgross;


    S = (2 * Wgross) / (CL_MAX * p_air * Vstall * Vstall)

    CL_CRUISE = Wgross / (0.5 * p_CRUISE * V_CRUISE * V_CRUISE * S);

    CDi = (CL_CRUISE * CL_CRUISE) / (pi * AR);
    CDo = 0.012 + (0.000667 * 17);
    CD = CDi + CDo;

    D_CRUISE = 0.5 * p_CRUISE * CD * V_CRUISE * V_CRUISE * S; % 4350 lbs drag O_O


    % ENGINE CALCULATIONS (THIS IS WHERE TOTAL FUEL WEIGHT IS CALCULATED)
    % Engine is TAY 651 (15400 lbs thrust @ 0.69 SFC)
    ApproxEngineThrust = D_CRUISE / (0.9 * (p_CRUISE / p_air)); %10778 lbs thrust
    SFC = 0.69;
    EngineThrust = 15400;
    F_flow = SFC * EngineThrust;
    WF_Cruise = SFC * D_CRUISE * (R / V_CRUISE);
    WF_Reserve = (45/60) * SFC * D_CRUISE;
    Wfuel_Real = WF_Cruise + WF_Reserve;
    
    PercentDiff = ((Wgross - Wfuel_Real)/(Wgross)) * 100
    
    x = input('enter 1 if you want another iteration');
end


% WING PLANFORM CALCULATIONS


% ESTIMATE HORIZONTAL AND VERTICAL TAIL SIZE


% COST


%CL = L/(.5)*(p_air)*(Vstall^2); 
%Vlanding = Vstall * 1.1; 
%S= (2*Wgross)/(CL_MAX)*(p_air)*(Vstall^2);
%Length= (.5667)*(Vstall^2);
%CDi = (CL_CRUISE^2)/pi*()
%CL_CRUISE = (Wgross)/(.5)*(P_CRUISE)*(Vcruise^2)*(S)