local M = {}
M.csv = [[
Name,B,F,G.,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
Aldebaran,α,87,,,29139.0,21421.0,04h 35m 55.20s,+16° 30′ 35.1″,0.87,−0.63,65,K5III,"Cor Tauri, Parilicium; 13th-brightest star, variable",K5+ III,3900.0 K,1.16 M☉,45.1 R☉,439.0 L☉,1.45 cgs,520.0 days,6.4 Gyr,True
β Tau,β,112,,,35497.0,25428.0,05h 26m 17.50s,+28° 36′ 28.3″,1.65,−1.37,131,B7III,"El Nath, Alnath, Nath",B7III,13600.0 K,5.0 M☉,4.79 R☉,564.0 L☉,3.63 cgs,59.0 km/s,100.0 Myr,True
Alcyone A,η,25,,,23630.0,17702.0,03h 47m 29.06s,+24° 06′ 18.9″,2.85,−2.41,368,B7III,"member of the Pleiades star cluster, binary star",B7IIIe,12258.0 K,6.1 M☉,8.0 (polar)R☉,1750.0 L☉,3.047 cgs,149.0 km/s,70.0 Myr,True
ζ Tau,ζ,123,,,37202.0,26451.0,05h 37m 38.68s,+21° 08′ 33.3″,2.97,−2.56,417,B4IIIp,Tianguan; γ Cas variable,B2 IIIpe,15500.0 K,11.2 M☉,5.5 R☉,4169.0 L☉,,125.0 km/s,22.5 Myr,True
θ2 Tau,θ2,78,,,28319.0,20894.0,04h 28m 39.67s,+15° 52′ 15.4″,3.4,0.10,149,A7III,"Chamukuy, member of the Hyades star cluster; δ Sct variable",G9 III Fe-0.5,7800.0 K,2.86 M☉,4.4 R☉,59.0 L☉,3.6 cgs,68.4 km/s,650.0 Myr,True
λ Tau,λ,35,,,25204.0,18724.0,04h 00m 40.82s,+12° 29′ 25.4″,3.41,−1.87,370,B3V + A,"Sadr al Tauri, Pectus Tauri; eclipsing binary; Algol variable",B3 V + A4 IV,18700.0 K,7.18 M☉,6.4 R☉,5801.0 L☉,3.38 cgs,85.0 km/s,33.2 Myr,True
ε Tau,ε,74,,,28305.0,20889.0,04h 28m 36.93s,+19° 10′ 49.9″,3.53,0.15,155,K0III,"Ain, Oculus Borealis; member of the Hyades star cluster; has a planet (b)",K0III,4880.0 K,2.458 M☉,12.46 R☉,79.4 L☉,2.66 cgs,141.1 days,600.0 Myr,True
ο Tau,ο,1,3.0,,21120.0,15900.0,03h 24m 48.84s,+09° 01′ 44.6″,3.61,−0.45,211,G8III,,G6 III,5094.0 K,3.21 M☉,20.28 R☉,302.0 L☉,2.43 cgs,3.29 km/s,324.0 Myr,True
Atlas A,,27,,,23850.0,17847.0,03h 49m 09.73s,+24° 03′ 12.7″,3.62,−1.72,380,B8III,member of the Pleiades star cluster; triple star,B8III,12525.0 K,5.04 M☉,6.48 (polar)R☉,1260.0 L☉,3.38 cgs,217.0 km/s,,True
γ Tau,γ,54,,,27371.0,20205.0,04h 19m 47.53s,+15° 37′ 39.7″,3.65,0.28,154,G8III,"Hyadum I, Prima Hyadum, Primus Hyadum; member of the Hyades star cluster",G8III,4844.0 K,2.7 M☉,13.4 R☉,85.0 L☉,2.61 cgs,253.0 days,530.0 Myr,True
Electra,,17,,,23302.0,17499.0,03h 44m 52.52s,+24° 06′ 48.4″,3.72,−1.56,370,B6III,member of the Pleiades star cluster,B6 IIIe,13484.0 K,4.7 M☉,6.06 R☉,940.0 L☉,3.412 cgs,181.0 km/s,115.0 Myr,True
ξ Tau,ξ,2,4.0,,21364.0,16083.0,03h 27m 10.12s,+09° 43′ 58.0″,3.73,−0.44,222,B9Vn,Ushakaron; eclipsing binary,B9Vn + B9V + B5V + F5V,9400.0 K,2.29 M☉,2.0 R☉,,4.2 cgs,33.0 km/s,,True
δ1 Tau,δ1,61,,,27697.0,20455.0,04h 22m 56.03s,+17° 32′ 33.3″,3.77,0.41,153,G8III,"Hyadum II, Secunda Hyadum, Secundus Hyadum; member of the Hyades star cluster",G9.5 III CN0.5,4819.0 K,2.75 M☉,14.9 R☉,107.0 L☉,2.72 cgs,148.2 d,588.0 Myr,True
θ1 Tau,θ1,77,,,28307.0,20885.0,04h 28m 34.43s,+15° 57′ 44.0″,3.84,0.42,158,G7III,member of the Hyades star cluster,G9 III Fe-0.5,7800.0 K,2.86 M☉,4.4 R☉,59.0 L☉,3.6 cgs,68.4 km/s,650.0 Myr,True
Maia,,20,,,23408.0,17573.0,03h 45m 49.59s,+24° 22′ 04.3″,3.87,−1.34,360,B8III,member of the Pleiades star cluster,B8III,12550.0 K,4.74 M☉,6.61 R☉,501.0 L☉,3.89 cgs,33.0 km/s,126.0 Myr,True
ν Tau,ν,38,30.0,,25490.0,18907.0,04h 03m 09.38s,+05° 59′ 21.5″,3.91,0.92,129,A1V,,A0.5Va,7836.0 K,2.25 M☉,2.87 R☉,28.1 L☉,4.02 cgs,83.0 km/s,206.0 Myr,True
5 Tau,f,5,,,21754.0,16369.0,03h 30m 52.37s,+12° 56′ 12.1″,4.14,−1.08,360,K0II-III...,,K0-III,4644.0 K,4.0 M☉,8.5 R☉,329.38 L☉,1.97 cgs,10.0 km/s,,True
Merope,,23,,V971,23480.0,17608.0,03h 46m 19.56s,+23° 56′ 54.5″,4.14,−1.07,359,B6IV,V971 Tau; member of the Pleiades star cluster; β Cep variable,B6IV(e),14550.0 K,4.25 M☉,4.79 R☉,927.0 L☉,3.48 cgs,240.0 km/s,212.0 Myr,True
κ1 Tau,κ1,65,,,27934.0,20635.0,04h 25m 22.10s,+22° 17′ 38.3″,4.21,0.85,153,A7IV-V,member of the Hyades star cluster; sextuple star,A7IV-V,9000.0 K,,2.6 R☉,33.6 L☉,,94.0 km/s,,True
88 Tau,d,88,61.0,,29140.0,21402.0,04h 35m 39.23s,+10° 09′ 39.3″,4.25,0.93,150,A5m,,A6m / F5 / G2-3: / G2-3:,,2.06 M☉,,,,37.0 km/s,,False
μ Tau,μ,49,44.0,,26912.0,19860.0,04h 15m 32.05s,+08° 53′ 32.7″,4.27,−1.35,435,B3IV,,B3IV,16980.0 K,6.7 M☉,,462.0 L☉,3.75 cgs,89.0 km/s,252.0 Myr,False
90 Tau,c,90,,,29388.0,21589.0,04h 38m 09.40s,+12° 30′ 39.1″,4.27,0.96,150,A6V,member of the Hyades star cluster,A6 V,8130.0 K,2.09 M☉,2.8 R☉,,3.88 cgs,89.0 km/s,,False
τ Tau,τ,94,,,29763.0,21881.0,04h 42m 14.70s,+22° 57′ 25.1″,4.27,−1.18,400,B3V,,B3V+ ? + A0V–A2V+ A1V,18700.0 K,6.4 M☉,,1472.0 L☉,2.6 cgs,115.0 km/s,,False
υ Tau,υ,69,,,28024.0,20711.0,04h 26m 18.39s,+22° 48′ 49.3″,4.28,0.90,155,A8Vn,member of the Hyades star cluster; δ Sct variable,A8 Vn,7398.0 K,1.55 M☉,1.803 R☉,32.5 L☉,3.5 cgs,0.415 d,827.0 Myr,False
10 Tau,,10,11.0,,22484.0,16852.0,03h 36m 52.52s,+00° 24′ 10.2″,4.29,3.60,45,F9V,,F8 V,6000.0 K,1.139 M☉,1.622 R☉,3.042 L☉,4.06 cgs,17.6 days,5.7 Gyr,False
Taygeta,q,19,,,23338.0,17531.0,03h 45m 12.48s,+24° 28′ 02.6″,4.3,−0.99,373,B6V,Taÿgete; member of the Pleiades star cluster,B6IV+ ?,13696.0 K,4.41 M☉,4.36 R☉,600.0 L☉,3.772 cgs,105.0 km/s,,False
68 Tau,δ3,68,,V776,27962.0,20648.0,04h 25m 29.32s,+17° 55′ 40.8″,4.3,1.02,148,A2IV,V776 Tau; member of the Hyades star cluster; α2 CVn variable,A2IV-Vs,9025.0 K,2.27 M☉,2.4 R☉,29.5 L☉,3.95 cgs,2.13 days,630.0 Myr,False
119 Tau,,119,,CE,36389.0,25945.0,05h 32m 12.75s,+18° 35′ 39.3″,4.32,−4.53,1918,M2Ib,"Ruby Star, CE Tau; semiregular variable",M2Iab-Ib,3820.0 K,14.37 M☉,593.0 R☉,66000.0 L☉,0.05 cgs,,13.9 Myr,False
37 Tau,A1,37,,,25604.0,19038.0,04h 04m 41.66s,+22° 04′ 55.4″,4.36,0.64,181,K0III,Yuè (月),K0 III-IIIb,4732.0 K,1.99 M☉,10.15 R☉,60.0 L☉,2.77 cgs,2.8 km/s,1.39 Gyr,False
71 Tau,,71,,V777,28052.0,20713.0,04h 26m 20.67s,+15° 37′ 06.0″,4.48,1.08,156,F0V...,V777 Tau; member of the Hyades star cluster; spectroscopic binary; δ Sct variable,F0 V,7543.0 K,1.94 M☉,3.34 R☉,,3.73 cgs,14.2 d,966.0 Myr,False
136 Tau,,136,,,39357.0,27830.0,05h 53m 19.64s,+27° 36′ 44.2″,4.56,−1.08,438,A0V,,A0 V(A0 V + A0 V),8732.0 K,,2.1 R☉,197.19 L☉,,10.0 km/s,,False
ι Tau,ι,102,,,32301.0,23497.0,05h 03m 05.70s,+21° 35′ 24.2″,4.62,1.13,163,A7V,member of the Hyades star cluster,A7 V,8054.0 K,2.22 M☉,2.6 R☉,36.0 L☉,3.97 cgs,131.0 km/s,717.0 Myr,False
ρ Tau,ρ,86,,,28910.0,21273.0,04h 33m 50.86s,+14° 50′ 40.2″,4.65,1.30,152,A8V,member of the Hyades star cluster; δ Sct variable,A8V,7640.0 K,2.09 M☉,2.9 R☉,1.39 L☉,4.02 cgs,0.833 days,1.0 Gyr,False
σ2 Tau,σ2,92,,,29488.0,21683.0,04h 39m 16.45s,+15° 55′ 04.9″,4.67,1.23,159,A5Vn,"Fùěr (附耳), member of the Hyades star cluster",A5 Vn,8165.0 K,1.71 M☉,1.9 R☉,22.5 L☉,3.96 cgs,128.0 km/s,258.0 Myr,False
π Tau,π,73,,,28100.0,20732.0,04h 26m 36.38s,+14° 42′ 49.9″,4.69,−1.03,455,G8III,,G7 IIIa Fe-1,5086.0 K,3.94 M☉,21.0 R☉,229.0 L☉,2.54 cgs,,17.0 Myr,False
64 Tau,δ2,64,,,27819.0,20542.0,04h 24m 05.69s,+17° 26′ 39.2″,4.8,1.55,146,A7V,member of the Hyades star cluster,A2 Vs,7997.0 K,1.79 M☉,1.8 R☉,27.0 L☉,4.15 cgs,42.0 km/s,449.0 Myr,False
139 Tau,,139,,,40111.0,28237.0,05h 57m 59.66s,+25° 57′ 14.1″,4.81,−4.24,2103,B1Ib,,B1 Ibor B0.5 II,24660.0 K,10.1 M☉,20.7 R☉,81000.0 L☉,3.559 cgs,140.0 km/s,22.5 Myr,False
47 Tau,,47,42.0,,26722.0,19740.0,04h 13m 56.39s,+09° 15′ 50.0″,4.84,−0.44,371,G5III,,G5III + A7V:,5117.0 K,,12.9 R☉,,2.67 cgs,,,False
126 Tau,,126,,,37711.0,26777.0,05h 41m 17.72s,+16° 32′ 03.1″,4.84,−1.96,748,B3IV...,,B3 IV,17900.0 K,6.14 M☉,,2061.0 L☉,,,,False
114 Tau,o,114,,,35708.0,25539.0,05h 27m 38.08s,+21° 56′ 13.1″,4.88,−1.76,695,B2.5IV,,B2.5 IVor  B2.5 V,20700.0 K,7.3 M☉,3.9 R☉,2454.0 L☉,4.15 cgs,10.0 km/s,22.0 Myr,False
132 Tau,,132,,,38751.0,27468.0,05h 49m 00.96s,+24° 34′ 03.2″,4.88,−1.14,522,G8IIIvar,,G9 III,4853.0 K,,,,2.74 cgs,,,False
134 Tau,,134,,,38899.0,27511.0,05h 49m 32.94s,+12° 39′ 04.9″,4.89,0.29,272,B9IV,,B9 IV,11150.0 K,2.99 M☉,3.3 R☉,78.3 L☉,4.02 cgs,26.0 km/s,248.0 Myr,False
104 Tau,m,104,,,32923.0,23835.0,05h 07m 26.68s,+18° 38′ 42.0″,4.91,3.91,52,G4V,,G4V,5717.0 K,1.0 M☉,1.63 R☉,2.41 L☉,4.06 cgs,10.0 km/s,10.15 Gyr,False
ω2 Tau,ω2,50,,,27045.0,19990.0,04h 17m 15.69s,+20° 34′ 43.5″,4.93,2.64,93,A3m,,A3m,7541.0 K,1.9 M☉,1.514 R☉,6.6 L☉,,70.1 km/s,100.0 Myr,False
75 Tau,,75,,,28292.0,20877.0,04h 28m 26.37s,+16° 21′ 34.7″,4.96,1.08,194,K2IIIvar,,K1 IIIb,4697.0 K,1.53 M☉,11.0 R☉,40.74 L☉,2.81 cgs,2.5 km/s,2.7 Gyr,False
109 Tau,n,109,,,34559.0,24822.0,05h 19m 16.59s,+22° 05′ 48.1″,4.96,0.96,206,G8III,,G8 III,5035.0 K,2.47 M☉,8.14 R☉,60.0 L☉,2.96 cgs,1.15 km/s,600.0 Myr,False
φ Tau,φ,52,,,27382.0,20250.0,04h 20m 21.23s,+27° 21′ 03.4″,4.97,−0.13,342,K1III,,K1 III,4479.0 K,1.36 M☉,19.04 R☉,131.0 L☉,2.02 cgs,1.0 km/s,4.74 Gyr,False
111 Tau,,111,,V1119,35296.0,25278.0,05h 24m 25.31s,+17° 23′ 00.8″,5.0,4.17,48,F8V SB,V1119 Tau; BY Draconis variable,F8 V,6015.0 K,1.08 M☉,1.67 R☉,1.845 L☉,4.24 cgs,3.503 d,50.0 Myr,False
79 Tau,b,79,,,28355.0,20901.0,04h 28m 50.10s,+13° 02′ 51.5″,5.02,1.56,160,A7V,member of the Hyades star cluster,kA5hF0VmF0,7681.0 K,1.9 M☉,2.4 R☉,18.0 L☉,3.88 cgs,0.925 d,971.0 Myr,False
Pleione,,28,,BU,23862.0,17851.0,03h 49m 11.20s,+24° 08′ 12.6″,5.05,−0.32,387,B7p,BU Tau; member of the Pleiades star cluster; γ Cas variable,B8Vne,11058.0 K,2.888 M☉,4.17 R☉,184.0 L☉,3.087 cgs,290.0 km/s,125.0 Myr,False
30 Tau,e,30,,,23793.0,17771.0,03h 48m 16.25s,+11° 08′ 36.1″,5.08,−1.11,565,B3V,,,,,,,,,,False
σ1 Tau,σ1,91,,,29479.0,21673.0,04h 39m 09.20s,+15° 48′ 00.1″,5.08,1.74,152,A4m,member of the Hyades star cluster,A4m,8470.0 K,1.94 M☉,,14.7 L☉,4.08 cgs,56.5 km/s,,False
97 Tau,i,97,,V480,30780.0,22565.0,04h 51m 22.41s,+18° 50′ 23.8″,5.08,1.27,189,A7IV-V,V480 Tau; member of the Hyades star cluster; δ Sct variable,,,,,,,,,False
66 Tau,r,66,50.0,,27820.0,20522.0,04h 23m 51.84s,+09° 27′ 39.5″,5.1,−0.32,396,A3V,,A3V + A4V,,2.89 M☉,,,,81.0 km/s,,False
4 Tau,s,4,,,21686.0,16322.0,03h 30m 24.48s,+11° 20′ 11.3″,5.14,−0.39,417,A0Vn,,,,,,,,,,False
41 Tau,,41,,GS,25823.0,19171.0,04h 06m 36.40s,+27° 36′ 00.1″,5.18,−0.72,494,B9p Si,GS Tau; α² CVn variable,B9 p Si,12600.0 K,2.9 M☉,3.54 R☉,190.0 L☉,3.87 cgs,23.0 km/s,146.0 Myr,False
125 Tau,,125,,,37438.0,26640.0,05h 39m 44.19s,+25° 53′ 49.7″,5.18,−0.73,495,B3IV,,,,,,,,,,False
ψ Tau,ψ,42,,,25867.0,19205.0,04h 07m 00.52s,+29° 00′ 04.6″,5.21,3.01,90,F1V,,F1 V,6856.0 K,1.59 M☉,1.4 R☉,5.2 L☉,4.36 cgs,45.4 km/s,1.435 Gyr,False
58 Tau,,58,,V696,27459.0,20261.0,04h 20m 36.24s,+15° 05′ 43.8″,5.26,1.89,154,F0V,V696 Tau; member of the Hyades star cluster; δ Sct variable,,,,,,,,,False
κ2 Tau,κ2,67,,,27946.0,20641.0,04h 25m 24.94s,+22° 12′ 00.4″,5.27,2.05,144,A7V,member of the Hyades star cluster,A7IV-V,9000.0 K,,2.6 R☉,33.6 L☉,,94.0 km/s,,False
l Tau,l,106,,,32977.0,23871.0,05h 07m 48.43s,+20° 25′ 06.4″,5.28,1.65,173,A5V,,,,,,,,,,False
133 Tau,,133,,,38622.0,27364.0,05h 47m 42.90s,+13° 53′ 58.7″,5.28,−1.67,799,B2IV-V,,,,,,,,,,False
46 Tau,,46,41.0,,26690.0,19719.0,04h 13m 33.11s,+07° 42′ 57.7″,5.29,2.45,121,F3V...,Solar sibling candidate,,,,,,,,,False
40 Tau,,40,32.0,V1133,25558.0,18957.0,04h 03m 44.60s,+05° 26′ 08.3″,5.32,−2.21,1045,B3V,V1133 Tau,B3V,16850.0 K,4.6 M☉,2.4 R☉,560.0 L☉,4.2 cgs,5.9 d,55.0 Myr,False
49 Eri,,(49),62.0,,29335.0,21515.0,04h 37m 13.68s,+00° 59′ 54.0″,5.32,−1.75,847,B7V,,,,,,,,,,False
29 Tau,u,29,17.0,,23466.0,17563.0,03h 45m 40.43s,+06° 03′ 00.1″,5.34,−0.94,588,B3V,,,,,,,,,,False
56 Tau,,56,,V724,27309.0,20186.0,04h 19m 36.69s,+21° 46′ 24.9″,5.34,0.41,316,A0p Si,V724 Tau; α² CVn variable,,,,,,,,,False
121 Tau,,121,,,36819.0,26248.0,05h 35m 27.12s,+24° 02′ 22.7″,5.37,−0.95,599,B2.5IV,,,,,,,,,,False
χ Tau,χ,59,,,27638.0,20430.0,04h 22m 34.93s,+25° 37′ 45.7″,5.38,0.81,267,B9V,,B9V,10300.0 K,2.6 M☉,2.15 R☉,,4.15 cgs,263.0 km/s,200.0 Myr,False
44 Tau,p,44,,IM,26322.0,19513.0,04h 10m 49.88s,+26° 28′ 51.7″,5.39,1.51,195,F2IV-V,IM Tau; δ Sct variable,F2 IV,7000.0 K,1.89 M☉,,,3.6 cgs,2.0 km/s,,False
83 Tau,,83,,,28556.0,21036.0,04h 30m 37.30s,+13° 43′ 28.0″,5.4,2.10,149,F0V,member of the Hyades star cluster,,,,,,,,,False
115 Tau,,115,,,35671.0,25499.0,05h 27m 10.09s,+17° 57′ 44.2″,5.4,−1.16,668,B5V,,,,,,,,,,False
Celaeno,,16,,,23288.0,17489.0,03h 44m 48.20s,+24° 17′ 22.5″,5.45,0.40,334,B7IV,member of the Pleiades star cluster,B7IV,12800.0 K,4.0 M☉,4.4 R☉,344.0 L☉,3.9 cgs,185.0 km/s,,False
93 Tau,,93,,,29589.0,21735.0,04h 40m 03.42s,+12° 11′ 51.5″,5.45,0.33,345,B8IV,,,,,,,,,,False
36 Tau,,36,,,25555.0,19009.0,04h 04m 21.67s,+24° 06′ 21.7″,5.46,−1.87,953,G0III...,,K0II + B7V,,,,,,,,False
81 Tau,,81,,,28546.0,21039.0,04h 30m 38.83s,+15° 41′ 31.0″,5.47,2.24,145,Am,member of the Pleiades star cluster,,,,,,,,,False
118 Tau,,118,,,35943.0,25695.0,05h 29m 16.49s,+25° 09′ 01.1″,5.47,−0.15,434,B9Vn,,,,,,,,,,False
130 Tau,,130,,,38558.0,27338.0,05h 47m 26.20s,+17° 43′ 44.9″,5.47,−2.48,1268,F0III,,,,,,,,,,False
53 Tau,,53,,V1024,27295.0,20171.0,04h 19m 26.08s,+21° 08′ 32.7″,5.5,0.93,267,B9IV,"V1024 Tau; α² CVn variable; on 29 May 2032, it will be occulted by Venus but in daylight and with Venus too close to the Sun",,,,,,,,,False
103 Tau,,103,,,32990.0,23900.0,05h 08m 06.62s,+24° 15′ 54.7″,5.5,−4.48,3228,B2V...,,,,,,,,,,False
ω1 Tau,ω1,43,,,26162.0,19388.0,04h 09m 09.90s,+19° 36′ 33.5″,5.51,0.76,291,K2III,,K2 III,4737.0 K,1.53 M☉,12.0 R☉,57.5 L☉,2.5 cgs,4.6 km/s,4.21 Gyr,False
116 Tau,,116,,,35770.0,25555.0,05h 27m 45.61s,+15° 52′ 26.8″,5.52,−0.67,565,B9.5Vn,,,,,,,,,,False
72 Tau,,72,,,28149.0,20789.0,04h 27m 17.45s,+22° 59′ 46.9″,5.53,0.01,415,B7V,,B7V,12689.0 K,3.47 M☉,2.8 R☉,185.0 L☉,3.97 cgs,115.0 km/s,38.0 Myr,False
44 Eri,,(44),54.0,,28375.0,20884.0,04h 28m 32.11s,+01° 22′ 51.1″,5.53,0.17,385,B3V,,B5V,13267.0 K,3.9 M☉,3.0 R☉,311.0 L☉,3.92 cgs,13.0 km/s,3.1 Myr,False
122 Tau,,122,,,37147.0,26382.0,05h 37m 03.71s,+17° 02′ 25.5″,5.53,1.87,176,F0V,member of the Hyades star cluster,,,,,,,,,False
135 Tau,,135,,,39019.0,27581.0,05h 50m 28.90s,+14° 18′ 20.5″,5.54,0.63,312,G9III:,,,,,,,,,,False
12 Tau,,12,13.0,,22796.0,17103.0,03h 39m 51.14s,+03° 03′ 24.6″,5.55,0.10,400,G6III:,,,,,,,,,,False
57 Tau,h,57,,V483,27397.0,20219.0,04h 19m 57.63s,+14° 02′ 06.9″,5.58,2.32,146,F3V...,V483 Tau; member of the Hyades star cluster; δ Sct variable,F0 IV,7258.0 K,1.6 M☉,2.0 R☉,9.8 L☉,4.0 cgs,0.905 d,1.2 Gyr,False
80 Tau,,80,,,28485.0,20995.0,04h 30m 08.53s,+15° 38′ 16.4″,5.58,2.38,142,F0V...,member of the Hyades star cluster,,,,,,,,,False
137 Tau,,137,,V809,39317.0,27743.0,05h 52m 22.30s,+14° 10′ 18.5″,5.6,−0.39,515,B9p...,V809 Tau; α² CVn variable,,,,,,,,,False
32 Tau,,32,,,24740.0,18471.0,03h 56m 52.03s,+22° 28′ 41.7″,5.62,2.36,146,F2IV,,F2IVs,6.901 K,2.04 M☉,2.75 R☉,15.4 L☉,3.87 cgs,19.7 km/s,2.1 Gyr,False
51 Tau,,51,,,27176.0,20087.0,04h 18m 23.14s,+21° 34′ 45.8″,5.64,1.95,179,F0V,member of the Hyades star cluster,,,,,,,,,False
63 Tau,,63,,,27749.0,20484.0,04h 23m 25.00s,+16° 46′ 38.4″,5.64,2.27,154,A1m,member of the Hyades star cluster,,,,,,,,,False
18 Tau,,18,,,23324.0,17527.0,03h 45m 09.73s,+24° 50′ 21.7″,5.66,0.40,368,B8V,,B8 V,13748.0 K,3.34 M☉,2.89 R☉,160.0 L☉,4.126 cgs,212.0 km/s,204.0 Myr,False
31 Tau,,31,21.0,,24263.0,18089.0,03h 52m 00.22s,+06° 32′ 05.7″,5.66,−1.01,704,B5V,,,,,,,,,,False
120 Tau,,120,,V960,36576.0,26064.0,05h 33m 31.63s,+18° 32′ 24.8″,5.67,−3.13,1874,B2IV-Ve,V960 Tau; Be star,,,,,,,,,False
13 Tau,,13,,,23016.0,17309.0,03h 42m 18.94s,+19° 42′ 01.0″,5.68,0.19,409,B9Vn,,,,,,,,,,False
45 Tau,,45,38.0,,26462.0,19554.0,04h 11m 20.20s,+05° 31′ 22.9″,5.71,2.78,126,F4V,member of the Hyades star cluster,,,,,,,,,False
60 Tau,,60,,V775,27628.0,20400.0,04h 22m 03.45s,+14° 04′ 38.1″,5.72,2.42,149,A3m,V775 Tau; member of the Hyades star cluster; spectroscopic binary; δ Sct variable,,,,,,,,,False
131 Tau,,131,,,38545.0,27316.0,05h 47m 13.15s,+14° 29′ 18.3″,5.72,0.16,422,A3Vn,,,,,,,,,,False
6 Tau,t,6,8.0,,21933.0,16511.0,03h 32m 35.93s,+09° 22′ 24.8″,5.76,0.57,355,B9IV,,B9III(kB8HeB9.5V(HgMn)),10963.0 K,2.8 M☉,2.5 R☉,79.0 L☉,4.13 cgs,87.6 km/s,224.0 Myr,False
Sterope I,,21,,,23432.0,17579.0,03h 45m 54.46s,+24° 33′ 16.6″,5.76,0.39,387,B8V,Asterope; member of the Pleiades star cluster,B8 V,11041.0 K,2.93 M☉,,100.0 L☉,4.25 cgs,159.0 km/s,100.0 Myr,False
117 Tau,,117,,,35802.0,25583.0,05h 28m 01.60s,+17° 14′ 21.3″,5.77,−0.90,704,M1III,,,,,,,,,,False
89 Tau,,89,,,29375.0,21588.0,04h 38m 09.38s,+16° 02′ 00.2″,5.78,2.49,148,F0V,member of the Hyades star cluster,,,,,,,,,False
99 Tau,,99,,,31553.0,23068.0,04h 57m 48.65s,+23° 56′ 54.9″,5.79,−0.01,471,G8III:,,,,,,,,,,False
98 Tau,k,98,,,31592.0,23088.0,04h 58m 09.38s,+25° 03′ 01.9″,5.79,1.00,296,A0V,,,,,,,,,,False
V711 Tau,,,10.0,V711,22468.0,16846.0,03h 36m 47.31s,+00° 35′ 17.4″,5.82,3.51,94,G5IV/V +K1IV,RS CVn variable,K2:Vnk(K1 IV + G5 V + K3 V),4750.0 K,1.0 M☉,3.7 R☉,0.3 L☉,3.3 cgs,39.0 km/s,2.2 Gyr,False
105 Tau,,105,,V1155,32991.0,23883.0,05h 07m 55.43s,+21° 42′ 17.4″,5.84,−1.66,1032,B2Ve,"V1155 Tau; Be star; on 7 April 2032, it will be occulted by Saturn over New Zealand, the Pacific Ocean, the NW half of North America, Greenland",,,,,,,,,False
HU Tau,,,,HU,29365.0,21604.0,04h 38m 15.84s,+20° 41′ 05.1″,5.85,0.63,361,B8V,Algol variable,B8V + G2IV,12000.0 K,4.43 M☉,2.57 R☉,123.0 L☉,4.26 cgs,80.0 km/s,,False
39 Tau,A2,39,,,25680.0,19076.0,04h 05m 20.15s,+22° 00′ 33.2″,5.9,4.78,55,G5V,,G5 V,5903.0 K,1.1 M☉,0.96 R☉,1.01 L☉,4.52 cgs,9.12 d,1.0 Gyr,False
76 Tau,,76,,,28294.0,20873.0,04h 28m 23.34s,+14° 44′ 27.7″,5.9,2.23,177,F0IV,member of the Hyades star cluster,,,,,,,,,False
V1156 Tau,,,,V1156,33204.0,24019.0,05h 09m 45.06s,+28° 01′ 50.2″,5.93,2.24,178,A5m,member of the Hyades star cluster,,,,,,,,,False
7 Tau,,7,,,22091.0,16664.0,03h 34m 26.62s,+24° 27′ 52.1″,5.95,−0.06,519,A3V,,A3V,8551.0 K,2.5 M☉,9.0 R☉,52.0 L☉,,,,False
V1141 Tau,,,,V1141,27742.0,20493.0,04h 23m 32.36s,+20° 58′ 55.7″,6.0,0.15,482,B8IV-V,,,,,,,,,,False
129 Tau,,129,,,38478.0,27265.0,05h 46m 45.49s,+15° 49′ 21.0″,6.0,−1.15,879,B8IIIMNp...,,,,,,,,,,False
85 Tau,,85,,,28677.0,21137.0,04h 31m 51.69s,+15° 51′ 05.9″,6.01,2.75,147,F4V...,member of the Hyades star cluster,,,,,,,,,False
V1116 Tau,,,,V1116,29169.0,21459.0,04h 36m 29.07s,+23° 20′ 27.5″,6.01,2.78,144,F5IV,δ Sct variable; member of the Hyades star cluster,,,,,,,,,False
33 Tau,,33,,V817,24769.0,18485.0,03h 57m 03.80s,+23° 10′ 32.1″,6.05,−0.01,531,B9.5IV,V817 Tau,,,,,,,,,False
V1143 Tau,,,51.0,V1143,28114.0,20715.0,04h 26m 21.10s,+08° 35′ 25.0″,6.06,−0.25,597,B6IV,β Cep variable,,,,,,,,,False
96 Tau,,96,,,30605.0,22441.0,04h 49m 44.08s,+15° 54′ 15.3″,6.09,−2.09,1411,K3III,,,,,,,,,,False
110 Tau,,110,,,35189.0,25216.0,05h 23m 37.72s,+16° 41′ 57.7″,6.09,0.41,445,A2IV,,,,,,,,,,False
11 Tau,,11,,,22805.0,17181.0,03h 40m 46.30s,+25° 19′ 46.3″,6.11,0.09,522,A2IV,,,,,,,,,,False
14 Tau,,14,,,23183.0,17408.0,03h 43m 47.14s,+19° 39′ 54.6″,6.13,0.99,347,G8III,,,,,,,,,,False
V1137 Tau,,,,V1137,26571.0,19672.0,04h 12m 51.25s,+22° 24′ 48.5″,6.14,−1.36,1032,B9IIIsp...,α² CVn variable,,,,,,,,,False
95 Tau,,95,,,29859.0,21961.0,04h 43m 13.75s,+24° 05′ 20.3″,6.18,2.69,163,F7IV-V,,,,,,,,,,False
113 Tau,,113,,,35532.0,25410.0,05h 26m 05.72s,+16° 42′ 00.6″,6.23,−0.28,655,B2Vn,,,,,,,,,,False
V731 Tau,,,,V731,37967.0,26964.0,05h 43m 19.50s,+23° 12′ 15.9″,6.23,−1.41,1098,B2.5Ve,γ Cas variable; Be star,,,,,,,,,False
108 Tau,,108,,,34053.0,24512.0,05h 15m 27.66s,+22° 17′ 05.5″,6.26,−0.26,657,A2V,,,,,,,,,,False
24 Tau,,24,,,23629.0,,03h 47m 20.90s,+24° 06′ 58.0″,6.28,,,A0V,,,,,,,,,,False
84 Tau,,84,,V1146,28595.0,21082.0,04h 31m 07.16s,+15° 06′ 18.6″,6.28,0.55,455,M3III,V1146 Tau,,,,,,,,,False
V766 Tau,,,,V766,24155.0,18033.0,03h 51m 15.86s,+13° 02′ 46.1″,6.3,0.63,443,B9p Si,α² CVn variable,,,,,,,,,False
48 Tau,,48,,V1099,26911.0,19877.0,04h 15m 46.21s,+15° 24′ 02.7″,6.31,3.07,145,F5Vvar,V1099 Tau; member of the Hyades star cluster,,,,,,,,,False
V774 Tau,,,45.0,V774,26923.0,19859.0,04h 15m 28.86s,+06° 11′ 13.6″,6.32,4.69,69,G0IV...,BY Draconis variable,,,,,,,,,False
62 Tau,,62,,,27778.0,20533.0,04h 23m 59.76s,+24° 18′ 03.7″,6.34,−0.40,726,B3V,,,,,,,,,,False
Sterope II,,22,,,23441.0,17588.0,03h 46m 02.89s,+24° 31′ 40.8″,6.43,1.25,354,A0Vn,Asterope; member of the Pleiades star cluster,A0 Vn,11817.0 K,,3.1 R☉,63.6 L☉,4.209 cgs,232.0 km/s,,False
70 Tau,,70,,,27991.0,20661.0,04h 25m 37.25s,+15° 56′ 27.9″,6.44,3.10,152,F7V,member of the Hyades star cluster,,,,,,,,,False
26 Tau,,26,,,23822.0,17832.0,03h 48m 56.91s,+23° 51′ 26.2″,6.47,2.11,243,F0,,,,,,,,,,False
SZ Tau,,,,SZ,29260.0,21517.0,04h 37m 14.78s,+18° 32′ 35.0″,6.49,−1.04,1045,F5Ib,δ Cep variable,F5Ib-F9.5Ib,6420.0 K,6.1 M☉,42.2 R☉,1905.0 L☉,2.2 cgs,,80.0 Myr,False
9 Tau,,9,,,22374.0,16859.0,03h 36m 58.03s,+23° 12′ 40.0″,6.72,1.08,437,A2p,,,,,,,,,,False
101 Tau,,101,,,31845.0,23214.0,04h 59m 44.27s,+15° 55′ 00.5″,6.75,3.57,141,F5V,member of the Hyades star cluster,,,,,,,,,False
55 Tau,,55,,,27383.0,20215.0,04h 19m 54.78s,+16° 31′ 21.6″,6.85,3.68,140,F7V+...,member of the Hyades star cluster,,,,,,,,,False
Alcyone B,η,,,,23607.0,,03h 47m 19.20s,+24° 08′ 22.0″,8.3,,,,component of the Alcyone system,B7IIIe,12258.0 K,6.1 M☉,8.0 (polar)R☉,1750.0 L☉,3.047 cgs,149.0 km/s,70.0 Myr,False
RV Tauri,,,,RV,283868.0,,04h 47m 06.73s,+26° 10′ 45.6″,9.41,,~20000,K3pv,"prototype of the RV Tauri-type variables; Vmax = 9.8m, Vmin = 13.3m",G2eIa-M2Ia,5080.0 )K,0.53 M☉,83.4 R☉,2800.0 L☉,0.6 cgs,,,False
T Tauri,,,,T,284419.0,20390.0,04h 21m 59.43s,+19° 32′ 06.4″,9.6,3.36,576,G5Ve,prototype of the T Tauri-type variables,K0IV/Ve,,2.12 M☉,,,,,0.4 Myr,False
CL Tau,,,,CL,,,04h 38m 45.0s,+08° 05′ 46″,13.0,,,T Tau,has a planet (b),,,,,,,,,False
CI Tau,,,,CI,,,04h 33m 52.0s,+22° 50′ 30″,13.0,,,K4IV,has a planet (b),K4IVe,,0.9 M☉,1.679 R☉,,,9.0 d,3.0 Myr,False
FW Tau,,,,FW,,,04h 29m 30.0s,+26° 16′ 53″,15.5,,473,M4,has a planet (b),,,,,,,,,False
]]

return M
