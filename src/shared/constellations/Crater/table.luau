local M = {}
M.csv = [[
Name,B,F,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
δ Crt,δ,12.0,,98430.0,55282.0,11h 19m 20.52s,−14° 46′ 44.6″,3.56,−0.32,195.0,K0III,,K0 III,4540.0 K,1.47 M☉,20.14 R☉,154.8 L☉,2.0 cgs,,2.89 Gyr,True
γ Crt,γ,15.0,,99211.0,55705.0,11h 24m 52.98s,−17° 41′ 02.5″,4.06,2.01,84.0,A9V,double star,A9 V,8020.0 K,1.81 M☉,1.3 R☉,18.8 L☉,4.21 cgs,144.0 km/s,757.0 Myr,True
α Crt,α,7.0,,95272.0,53740.0,10h 59m 46.75s,−18° 17′ 56.8″,4.08,0.44,174.0,K1III,"Alkes, Aoul al Batjna, Prima Crateris",K1 III,4.691 K,1.81 M☉,12.32 R☉,66.0 L☉,2.53 cgs,,2.06 Gyr,True
β Crt,β,11.0,,97277.0,54682.0,11h 11m 39.49s,−22° 49′ 32.2″,4.46,−0.10,266.0,A1V,Al Sharāsīf II,A2 III+ DA1.4,8830.0 K,0.43 M☉,0.027 R☉,147.0 L☉,3.5 cgs,49.0 km/s,,True
θ Crt,θ,21.0,,100889.0,56633.0,11h 36m 40.95s,−09° 48′ 08.1″,4.7,−0.15,305.0,B9.5Vn,,B9.5 Vn,11524.0 K,2.79 M☉,3.1 R☉,107.0 L☉,3.96 cgs,212.0 km/s,117.0 Myr,False
ζ Crt,ζ,27.0,,102070.0,57283.0,11h 44m 45.76s,−18° 21′ 02.2″,4.71,−0.45,350.0,G8III,,G8 III,4992.0 K,,13.0 R☉,157.0 L☉,2.6 cgs,,251.0 Myr,False
ε Crt,ε,14.0,,99167.0,55687.0,11h 24m 36.61s,−10° 51′ 33.8″,4.81,−0.43,364.0,K5III,,K5 III,3930.0 K,0.99 M☉,44.7 R☉,391.0 L☉,1.61 cgs,10.0 km/s,,False
λ Crt,λ,13.0,,98991.0,55598.0,11h 23m 22.07s,−18° 46′ 47.6″,5.08,1.87,143.0,F3IV,spectroscopic binary,F5 III,6582.0 K,1.45 M☉,2.8 R☉,14.4 L☉,4.06 cgs,17.0 km/s,,False
η Crt,η,30.0,,103632.0,58188.0,11h 56m 00.98s,−17° 09′ 02.9″,5.17,0.46,285.0,A0V,,A0 V,9930.0 K,2.55 M☉,2.47 R☉,57.0 L☉,,65.0 km/s,350.0 Myr,False
ι Crt,ι,24.0,,101198.0,56802.0,11h 38m 39.96s,−13° 12′ 08.1″,5.48,3.32,88.0,F7V,double star,F6.5 V,6230.0 K,1.19 M☉,,,4.27 cgs,,4.45 Gyr,False
κ Crt,κ,16.0,,99564.0,55874.0,11h 27m 09.58s,−12° 21′ 24.5″,5.93,1.80,219.0,F4III-IV,Al Sharāsīf I; double star,F5/6 III,6545.0 K,1.74 M☉,3.4 R☉,17.0 L☉,3.69 cgs,20.96 days,1.5 Gyr,False
ψ Crt,ψ,,,97411.0,54742.0,11h 12m 30.38s,−18° 29′ 59.3″,6.11,0.28,479.0,A0V,double star,A0 V(A0 + A3),9199.0 K,,,75.0 L☉,3.8 cgs,33.0 km/s,,False
HD 98088,,,SV,98088.0,55106.0,11h 16m 58.18s,−07° 08′ 04.9″,6.11,0.56,421.0,A2p...,Abt's Star; spectroscopic binary; α2 CVn variable,,,,,,,,,False
VX Crt,,,VX,101370.0,56899.0,11h 39m 50.35s,−16° 37′ 12.8″,6.17,−1.29,1012.0,M3II/III,semiregular variable,,,,,,,,,False
SY Crt,,,SY,97918.0,54999.0,11h 15m 39.77s,−12° 35′ 33.3″,6.58,,797.0,M3III,"semiregular variable, Vmax = 6.34m, Vmin = 6.62m",,,,,,,,,False
HD 99563,,,XY,99563.0,55890.0,11h 27m 16.64s,−08° 52′ 08.2″,8.67,,832.0,F0,rapidly oscillating Ap star,,,,,,,,,False
HD 98800,,,TV,98800.0,55505.0,11h 22m 05.29s,−24° 46′ 39.8″,8.94,,146.4,K4V+...,"T Tauri star, ΔV = 0.09m, P = 2.52 d",K5V / ?,4500.0 K,0.93 M☉,1.75 R☉,0.33 L☉,4.25 cgs,5.0 km/s,7.0 Myr,False
S Crt,,,S,103154.0,57917.0,11h 52m 45.10s,−07° 35′ 48.1″,9.14,,2590.0,M...,semiregular variable,,,,,,,,,False
R Crt,,,R,95384.0,53809.0,11h 00m 33.85s,−18° 19′ 29.6″,9.8,,851.0,M7III...,semiregular variable,M7/8III,3295.0 K,1.91 M☉,633.0 R☉,8151.0 L☉,0.86 cgs,,,False
V Crt,,,V,,,11h 21m 13.43s,−16° 40′ 23.1″,10.26,,,A6,Algol variable,,,,,,,,,False
W Crt,,,W,,55825.0,11h 26m 29.64s,−17° 54′ 51.7″,11.7,,,F4,"RR Lyr variable, Vmax = 10.769m, Vmin = 12.182m, P = 0.4120134 d",,,,,,,,,False
TT Crt,,,TT,,,11h 34m 47.18s,−11° 45′ 30.4″,15.3,,,F4,"dwarf nova, Vmax = 12.5m, Vmin = 15.3m, P = 0.26842 d",,,,,,,,,False
]]

return M
