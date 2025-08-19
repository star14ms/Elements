local M = {}
M.csv = [[
Name,B,G.,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
γ2 Vol,γ2,9.0,,55865.0,34481.0,07h 08m 44.82s,−70° 29′ 57.1″,3.62,0.59,142.0,G8IIIvar,"double star with γ1 Vol; suspected variable, Vmax = 3.56m, Vmin = 3.62m",F2V + K0III,6541.0 K,1.69 M☉,10.2 R☉,53.7 L☉,2.71 cgs,4.4 km/s,1.4 Gyr,True
β Vol,β,29.0,,71878.0,41312.0,08h 25m 44.25s,−66° 08′ 11.5″,3.77,1.17,108.0,K2IIIvar,"suspected variable, Vmax = 3.76m, Vmin = 3.79m",K2 III,4546.0 K,1.62 M☉,10.32 R☉,41.0 L☉,,,,True
ζ Vol,ζ,16.0,,63295.0,37504.0,07h 41m 49.20s,−72° 36′ 22.1″,3.93,0.86,134.0,K0III,,K0 III,4788.0 K,1.224 M☉,10.677 R☉,60.0 L☉,2.82 cgs,,5.1 Gyr,True
δ Vol,δ,10.0,,57623.0,35228.0,07h 16m 49.83s,−67° 57′ 25.8″,3.97,−2.56,660.0,F6II,,F6 II,5637.0 K,5.0 M☉,36.1 R☉,1095.0 L☉,1.77 cgs,5.6 km/s,,True
α Vol,α,46.0,,78045.0,44382.0,09h 02m 26.80s,−66° 23′ 45.0″,4.0,1.09,124.0,A5Vm,,kA3hA5mA5 V,8198.0 K,1.87 M☉,1.9 R☉,,4.09 cgs,30.6 km/s,427.0 Myr,True
ε Vol,ε,22.0,,68520.0,39794.0,08h 07m 55.84s,−68° 37′ 01.7″,4.35,−2.12,560.0,B6IV,,B5 III(B6 IV + B8 + A2 V + A2 V),14348.0 K,,,,3.62 cgs,1.0 km/s,,True
θ Vol,θ,35.0,,74405.0,42425.0,08h 39m 05.13s,−70° 23′ 11.9″,5.19,0.86,239.0,A0V,,A0 V,8753.0 K,2.3 M☉,,37.0 L☉,4.08 cgs,98.0 km/s,364.0 Myr,False
η Vol,η,27.0,,71576.0,41003.0,08h 22m 04.52s,−73° 24′ 00.2″,5.28,0.09,356.0,A0/A1IV/V,,A0/1 IV/V,9789.0 K,2.73 M☉,3.78 R☉,84.0 L☉,3.81 cgs,214.0 km/s,347.0 Myr,False
κ1 Vol,κ1,25.0,,71046.0,40817.0,08h 19m 49.00s,−71° 30′ 54.0″,5.33,−0.06,390.0,B9III/IV,part of the κ Vol triple star system,B9III/IV,9884.0 K,2.7 M☉,3.83 R☉,129.0 L☉,3.77 cgs,80.0 km/s,120.0 Myr,False
ι Vol,ι,5.0,,51557.0,32912.0,06h 51m 26.98s,−70° 57′ 48.5″,5.41,−0.76,558.0,B7IV,,B7 III,11803.0 K,3.72 M☉,4.7 R☉,313.0 L☉,,129.0 km/s,236.0 Myr,False
κ2 Vol,κ2,26.0,,71066.0,40834.0,08h 20m 00.56s,−71° 30′ 19.7″,5.63,0.21,395.0,A0p,"part of the κ Vol triple star system; suspected variable, ΔV = 0.03m",B9III/IV,9884.0 K,2.7 M☉,3.83 R☉,129.0 L☉,3.77 cgs,80.0 km/s,120.0 Myr,False
γ1 Vol,γ1,8.0,,55864.0,34473.0,07h 08m 42.34s,−70° 29′ 50.4″,5.68,2.41,147.0,F2,double star with γ2 Vol,F2V + K0III,6541.0 K,1.69 M☉,10.2 R☉,53.7 L☉,2.71 cgs,4.4 km/s,1.4 Gyr,False
R Vol,,,R,,,07h 05m 36.21s,−73° 00′ 52.02″,8.7,-0.91,2728.0,CVIIe+,"Carbon star and Mira variable, Vmax = 8.78m, Vmin = 11.50m, P = 445.46 d",Ce,3140.0 K,0.75 M☉,360.0 R☉,11438.0 L☉,,,,False
S Vol,,,S,,,07h 29m 45.57s,−73° 22′ 43.97″,12.97,3.06,3130.7,M4IIIe,"Mira variable, Vmax = 8.96m, Vmin = 13.80m, P = 395.84 d",,,,,,,,,False
RR Vol,,,RR,,,08h 27m 28.73s,−69° 53′ 55.42″,15.93,2.78,12102.28,A9V,Algol variable,,,,,,,,,False
UY Vol,,,UY,,,07h 48m 33.30s,−67° 45′ 00.0″,16.9,2.39,26000.0,M,"X-ray burster and eclipsing binary, Vmax = 16.9m, Vmin = <23.0m, P = 0.159 d",,,,,,,,,False
]]

return M
