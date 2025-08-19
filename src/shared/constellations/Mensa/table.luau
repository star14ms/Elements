local M = {}
M.csv = [[
Name,B,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
α Men,α,,43834.0,29271.0,06h 10m 14.20s,−74° 45′ 09.1″,5.08,5.05,33.0,G5V,,G7 V+ M3.5-6.5 V,5569.0 K,0.964 M☉,0.96 R☉,0.81 L☉,4.459 cgs,0.6 km/s,6.2 Gyr,True
γ Men,γ,,37763.0,25918.0,05h 31m 52.66s,−76° 20′ 30.0″,5.18,2.73,101.0,K4III,double star,K2 III,4491.0 K,1.04 M☉,4.99 R☉,21.0 L☉,2.76 cgs,,10.6 Gyr,True
β Men,β,,33285.0,23467.0,05h 02m 43.00s,−71° 18′ 51.6″,5.3,−1.17,642.0,G8III,,G8 III,5088.0 K,3.58 M☉,25.85 R☉,345.0 L☉,2.54 cgs,,270.0 Myr,True
θ Men,θ,,54239.0,33384.0,06h 56m 34.48s,−79° 25′ 12.7″,5.45,0.26,356.0,B9.5/A0III/IV,,B9.5 V,9938.0 K,2.87 M☉,4.37 R☉,124.0 L☉,3.64 cgs,1.266 d,266.0 Myr,True
κ Men,κ,,40953.0,27566.0,05h 50m 16.80s,−79° 21′ 41.5″,5.46,0.87,270.0,B9V,,B9 V,10965.0 K,3.44 M☉,1.95 R☉,66.4 L☉,4.21 cgs,290.0 km/s,115.0 Myr,False
η Men,η,,32440.0,22871.0,04h 55m 11.14s,−74° 56′ 13.2″,5.47,−1.23,712.0,K6III,suspected variable,K4 III,4055.0 K,,,616.0 L☉,1.15 cgs,,,False
μ Men,μ,,30612.0,21949.0,04h 43m 03.95s,−70° 55′ 52.0″,5.53,−0.32,483.0,B9IV,,B8 II-III(p Si),12550.0 K,,3.3 R☉,216.0 L☉,,5.1918 d,226.0 Myr,False
ε Men,ε,,60816.0,36039.0,07h 25m 38.19s,−79° 05′ 39.1″,5.54,−0.24,466.0,K2/K3III,,K2/3 III,4657.0 K,1.15 M☉,21.94 R☉,170.0 L☉,1.74 cgs,1.8 km/s,233.0 Myr,False
ζ Men,ζ,,50506.0,31897.0,06h 40m 02.91s,−80° 48′ 49.4″,5.61,0.14,404.0,A5III,,A5 III,7555.0 K,,4.65 R☉,66.39 L☉,,200.0 km/s,,False
π Men,π,,39091.0,26394.0,05h 37m 08.79s,−80° 28′ 18.0″,5.65,4.35,59.0,G3IV,has two planet (b & c),G0 V,6013.0 K,1.091 M☉,1.136 R☉,1.532 L☉,4.365 cgs,2.96 km/s,3.8 Gyr,False
δ Men,δ,,28525.0,20049.0,04h 17m 59.18s,−80° 12′ 51.1″,5.67,0.19,408.0,K2/K3III+..,double star,K2/3 III + A9,5180.0 K,,13.12 R☉,111.7 L☉,,<4.7 km/s,,False
ν Men,ν,,29116.0,20297.0,04h 20m 58.03s,−81° 34′ 48.8″,5.78,2.13,175.0,F0/F2III,,F0/2 III,6921.0 K,1.69 M☉,2.3 R☉,11.5 L☉,3.94 cgs,108.0 km/s,1.7 Gyr,False
WX Men,,WX,37993.0,26169.0,05h 34m 44.78s,−73° 44′ 28.9″,5.79,−1.74,1045.0,M2/M3III,"semiregular variable, ΔV = 0.15m",,,,,,,,,False
ξ Men,ξ,,34172.0,23148.0,04h 58m 50.99s,−82° 28′ 13.9″,5.84,0.69,349.0,G8III,"variable star, ΔV = 0.005m, P = 148.14815 d",G8/K0III,5131.0 K,1.91 M☉,8.97 R☉,50.3 L☉,3.02 cgs,,281.0 Myr,False
ι Men,ι,,38602.0,26264.0,05h 35m 36.13s,−78° 49′ 15.2″,6.04,−0.90,795.0,B8III,"rotating ellipsoidal variable, Vmax = 6.00m, Vmin = 6.05m, P = 5.288 d",B8 III,11272.0 K,3.6 M☉,9.5 R☉,301.0 L☉,3.4 cgs,,203.0 Myr,False
TZ Men,,TZ,39780.0,25776.0,05h 30m 13.93s,−84° 47′ 06.8″,6.18,1.03,349.0,A1III + B9V:,"Algol variable, Vmax = 6.19m, Vmin = 6.87m, P = 8.56898 d",A0 V,10543.0 K,2.49 M☉,1.9 R☉,39.8 L☉,4.22 cgs,16.0 km/s,141.0 Myr,False
λ Men,λ,,39810.0,27369.0,05h 47m 48.15s,−72° 42′ 08.3″,6.54,1.17,386.0,K0III,,K0 III,4713.0 K,,10.0 R☉,54.0 L☉,2.43 cgs,,,False
YY Men,,YY,32918.0,23106.0,04h 58m 17.94s,−75° 16′ 38.0″,8.05,,942.0,K2III,"FK Com Variable, Vmax = 7.91m, Vmin = 8.40m, P = 9.603 d",K1 III/IVe,4691.0 K,0.983 M☉,12.3 R☉,68.5 L☉,1.63 cgs,45.0 km/s,,False
UX Men,,UX,37513.0,25760.0,05h 30m 03.18s,−76° 14′ 55.4″,8.24,,332.0,F8V,"Algol variable, ΔV = 0.380m, P = 8.287 d",,,,,,,,,False
TY Men,,TY,37909.0,25472.0,05h 26m 49.73s,−81° 35′ 07.2″,8.26,,569.0,A3/A4V,"W UMa Variable, Vmax = 8.08m, Vmin = 8.56m, P = 0.46166701 d",,,,,,,,,False
AO Men,,AO,45081.0,29964.0,06h 18m 28.22s,−72° 02′ 42.1″,9.95,7.02,126.0,K3:V:,"BY Draconis variable Vmax = 9.96m, Vmin = 10.18m",K4Ve,4384.0 K,0.69 M☉,0.91 R☉,0.26 L☉,4.38 cgs,2.673 d,23.0 Myr,False
TU Men,,TU,,,04h 41m 40.70s,−76° 36′ 45.8″,11.6,,,,"SU UMa Variable, Vmax = 11.6m, Vmin = 18.5m, P = 0.1172 d",,,,,,,,,False
AH Men,,AH,,,06h 11m 43.95s,−81° 49′ 22.7″,13.15,,,,"Nova-like star, Vmax = 13.15m, Vmin = 13.9m, P = 0.12721 d",,,,,,,,,False
W Men,,W,,,05h 26m 24.52s,−71° 11′ 11.8″,13.8,,160000.0,F8:Iab:p,in LMC; R CrB variable,F5Ipec,6700.0 K,,61.0 R☉,7700.0 L☉,0.5 cgs,,,False
]]

return M
