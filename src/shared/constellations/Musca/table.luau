local M = {}
M.csv = [[
Name,B,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
α Mus,α,,109668.0,61585.0,12h 37m 11.08s,−69° 08′ 07.9″,2.69,−2.17,306,B2IV-V,"β Cep variable, Vmax = 2.68m, Vmin = 2.73m, P = 0.0903 d; Member of the Lower Centaurus–Crux subgroup of the Scorpius–Centaurus association.",B2 IV–V,20400.0 K,8.8 M☉,5.22 R☉,4270.0 L☉,4.06 cgs,114.0 km/s,18.3 Myr,True
β Mus,β,,110879.0,62322.0,12h 46m 16.87s,−68° 06′ 29.1″,3.04,−1.86,311,B2V + B3V,"Binary star, Member of the Lower Centaurus–Crux subgroup of the Scorpius–Centaurus association.",B2 V + B3 V,22500.0 K,7.35 M☉,3.5 R☉,2750.0 L☉,,,15.1 Myr,True
δ Mus,δ,,112985.0,63613.0,13h 02m 15.78s,−71° 32′ 55.7″,3.61,1.39,90.8,K2III,Binary star,K2III,4500.0 K,1.5 M☉,8.6 R☉,31.0 L☉,2.5 cgs,,,True
λ Mus,λ,,102249.0,57363.0,11h 45m 36.57s,−66° 43′ 43.8″,3.68,0.66,128,A7III,,A7 V,7700.0 K,2.28 M☉,3.7 R☉,40.0 L☉,3.87 cgs,57.7 km/s,700.0 Myr,True
γ Mus,γ,,109026.0,61199.0,12h 32m 28.11s,−72° 07′ 58.7″,3.84,−1.14,324,B5V,"53 Persei variable, Vmax = 3.84m, Vmin = 3.86m, P = 2.72926 d",B5 V,15490.0 K,5.09 M☉,4.17 R☉,790.0 L☉,3.87 cgs,205.0 km/s,67.7 Myr,True
ε Mus,ε,,106849.0,59929.0,12h 17m 34.64s,−67° 57′ 38.4″,4.06,−0.77,302,M5III,"semiregular variable, Vmax = 3.99m, Vmin = 4.31m, P = 40 d",M5 III,3470.0 K,2.0 M☉,116.0 R☉,1738.0 L☉,0.6 cgs,,,True
μ Mus,μ,,102584.0,57581.0,11h 48m 14.49s,−66° 48′ 53.5″,4.75,−0.86,432,K4III,"slow irregular variable, Vmax = 4.71m, Vmin = 4.76m",K4 III,3930.0 K,,52.92 R☉,602.0 L☉,,,,False
η Mus,η,,114911.0,64661.0,13h 15m 15.00s,−67° 53′ 40.4″,4.79,−0.68,405,B8V,"Algol variable, Vmax = 4.76m, Vmin = 4.81m, P = 2.3963 d; probable member of the Lower Centaurus–Crux subgroup of the Scorpius–Centaurus association.",B8V + sim. + K9.4XR? + A0porB7III + B7III,12700.0 K,3.3 M☉,2.14 R☉,223.77 (combined)L☉,4.293 cgs,34.0 km/s,,False
GT Mus,,GT,101379.0,56862.0,11h 39m 29.63s,−65° 23′ 51.9″,5.01,−1.17,561,G2III + A,"Algol and RS CVn variable, Vmax = 4.96m, Vmin = 5.23m, P = 2.75459 d","A: G5/8III+F, B: A0V+A2V",4744.0 K,1.1 M☉,16.6 R☉,126.0 L☉,1.89 cgs,,,False
ι1 Mus,ι1,,116244.0,65468.0,13h 25m 07.36s,−74° 53′ 15.0″,5.04,0.85,225,K0III,,K0 III,4610.0 K,1.5 M☉,11.78 R☉,56.5 L☉,2.64 cgs,4.27 km/s,,False
ζ2 Mus,ζ2,,107566.0,60320.0,12h 22m 07.39s,−67° 31′ 19.5″,5.15,0.09,336,Am,"Double system, Member of the Lower Centaurus–Crux subgroup of the Scorpius–Centaurus association.",A5 V+ G8-K0V,7400.0 K,,,66.7 L☉,,,,False
λ Cha,(λ),,105340.0,59151.0,12h 07m 50.09s,−75° 22′ 01.4″,5.17,−0.47,438,K2II/III,,K2II/III,4544.0 K,1.6 M☉,28.0 R☉,295.0 L☉,1.92 cgs,,,False
θ Mus,θ,,113904.0,64094.0,13h 08m 07.16s,−65° 18′ 21.7″,5.44,−12.17,~7000,WC6 + O9.5I,"Eclipsing triple system, one component is a Wolf–Rayet star, Vmax = 5.5m, Vmin = 5.52m, P = 18.341 d",WC5/6 + O6/7V + O9.5/B0Iab,,<11.5 M☉,,234000.0 L☉,,,,False
ζ1 Mus,ζ1,,107567.0,60329.0,12h 22m 12.03s,−68° 18′ 25.9″,5.73,0.31,396,K0III,Double system,K0III,5000.0 K,2.8 M☉,14.1 R☉,82.0 L☉,2.531 cgs,3.92 km/s,456.0 Myr,False
LS Mus,,LS,113120.0,63688.0,13h 03m 05.36s,−71° 28′ 32.6″,5.93,−2.49,1575,B1.5IIIne,Be star,,,,,,,,,False
S Mus,,S,106111.0,59551.0,12h 12m 47.03s,−70° 09′ 06.4″,6.05,−2.44,1630,F6Ib,"Cepheid variable, Vmax = 5.89m, Vmin = 6.49m, P = 9.66007 d",F6Ib (F6-G0) + B5V,17000.0 K,6.2 M☉,65.1 R☉,3467.0 L☉,,,,False
BO Mus,,BO,109372.0,61404.0,12h 34m 54.46s,−67° 45′ 24.8″,6.11,−1.33,1003,M6II/III,"semiregular variable, Vmax = 5.3m, Vmin = 6.56m, P = 132.4 d",,,,,,,,,False
HD 116890,,EZ,116890.0,65755.0,13h 28m 46.82s,−69° 37′ 37.6″,6.17,−0.48,698,B8V,"α² CVn variable, ΔV = 0.09m, P = 4.3127 d",,,,,,,,,False
KY Mus,,KY,109867.0,61703.0,12h 38m 52.37s,−67° 11′ 35.0″,6.22,,,B1Ia,α Cyg variable,,,,,,,,,False
FH Mus,,FH,110020.0,61796.0,12h 39m 55.90s,−66° 30′ 40.0″,6.26,1.09,353,B8V,"rotating ellipsoidal variable, ΔV = 0.03m, P = 0.58 d; probable (80%) member of the Lower Centaurus–Crux subgroup of the Scorpius–Centaurus association.",,,,,,,,,False
R Mus,,R,110311.0,61981.0,12h 42m 05.03s,−69° 24′ 27.2″,6.31,−2.55,1929,F7Ib,"Cepheid variable, Vmax = 5.93m, Vmin = 6.73m, P = 7.510211 d",F7 Ib- G2,5985.0 K,,65.0 R☉,2541.0 L☉,2.0 cgs,,,False
ι2 Mus,ι2,,116579.0,65628.0,13h 27m 18.58s,−74° 41′ 30.2″,6.62,0.71,495,B9V,,B9V,10641.0 K,2.8 M☉,2.5 R☉,71.0 L☉,4.09 cgs,116.0 km/s,,False
GQ Mus,,GQ,,,11h 52m 02.35s,−67° 12′ 20.2″,7.2,,,,nova and AM Her variable,,,,,,,,,False
HD 105056,,GS,105056.0,58998.0,12h 05m 49.88s,−69° 34′ 23.0″,7.34,,16000,O9.5Ia,"α Cyg variable, Vmax = 7.34m, Vmin = 7.55m, P = 3.85253 d",,,,,,,,,False
TU Mus,,TU,100213.0,56196.0,11h 31m 10.92s,−65° 44′ 32.1″,8.41,,15000,O7.5V + O9.5V,"β Lyr variable, Vmax = 8.17m, Vmin = 8.75m, P = 1.3872833 d",O7V + O8V,35000.0 K,16.8 M☉,7.2 R☉,105000.0 L☉,4.05 cgs,,,False
RT Mus,,RT,310831.0,57260.0,11h 44m 32.88s,−67° 18′ 18.9″,8.57,,3500,F8,"Cepheid variable, Vmax = 8.57m, Vmin = 9.32m, P = 3.086131 d",,,,,,,,,False
T Mus,,T,115673.0,65116.0,13h 21m 13.85s,−74° 26′ 31.0″,8.6,,2040,C+,"seimregular variable, Vmax = 7.6m, Vmin = 8.6m, P = 111.8 d",,,,,,,,,False
KZ Mus,,KZ,109885.0,61751.0,12h 39m 19.16s,−71° 37′ 18.5″,9.09,,11000,B2III,β Cep variable,,,,,,,,,False
UU Mus,,UU,103137.0,57884.0,11h 52m 17.72s,−65° 24′ 15.1″,9.54,,1490,F8:p,"Cepheid variable, Vmax = 9.13m, Vmin = 10.28m, P = 11.63641 d",,,,,,,,,False
SY Mus,,SY,100336.0,,11h 32m 10.01s,−65° 25′ 11.6″,10.2,,2770,Mpe,"Z Andromedae and semiregular variable, Vmax = 10.2m, Vmin = 12.7m, P = 624.5 d",M4.5,3400.0 K,0.5 M☉,138.6 R☉,2305.0 L☉,,>1075.0 days,,False
MP Mus,,MP,,,13h 22m 07.55s,−69° 38′ 12.2″,10.39,,,K1Ve,"T Tauri star, ΔV = 0.127m, P = 3.714 d",K1Ve,4600.0 K,1.3 M☉,1.25 R☉,1.26 L☉,,,10.0 Myr,False
Y Mus,,Y,,63911.0,13h 05m 48.20s,−65° 30′ 46.6″,10.5,,698,Fp,R CrB variable,,,,,,,,,False
TV Mus,,TV,310730.0,,11h 39m 50.76s,−64° 48′ 59.3″,10.75,,755,F2,W UMa variable,,,,,,,,,False
GRS 1124-683,,GU,,,11h 26m 26.60s,−68° 40′ 32.3″,13.3,,,K3V-K7V,X-ray nova,K3V-K7V,,,,,,,,False
2S 1254-690,,GR,,,12h 57m 30.15s,−69° 17′ 19.0″,19.1,,,,"Low-mass X-ray binary, Vmax = 18m, Vmin = 19.1m, P = 0.1636 d",,,,,,,,,False
KN Mus,,KN,117622.0,,13h 33m 32.86s,−65° 58′ 27.1″,,,1780,WC2/WO1,central star of planetary nebula NGC 5189,,,,,,,,,False
]]

return M
