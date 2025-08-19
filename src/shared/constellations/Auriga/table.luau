local M = {}
M.csv = [[
Name,B,F,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
Capella,α,13,,34029,24608,05h 16m 41.30s,+45° 59′ 56.5″,0.08,−0.48,42.0,G8III / G0III,"Alhajoth, Alhaior, Althaiot, Alhaiset, Alhatod, Alhojet, Alanac, Alanat, Alioc; quadruple star, spectroscopic binary; 11th and 14th brightest stars",G3III:,4970.0 K,2.5687 M☉,11.98 R☉,78.7 L☉,2.691 cgs,104.0 days,650.0 Myr,True
β Aur,β,34,,40183,28360,05h 59m 31.77s,+44° 56′ 50.8″,1.9,−0.10,82.0,A2V,"Menkalinan, Menkalina; eclipsing spectroscopic binary; Algol variable, Vmax = 1.89m, Vmin = 1.98m, P = 3.96004 d",A1m IV + A1m IV,8985.0 K,2.3885 M☉,2.762 R☉,46.7 L☉,3.93 cgs,33.0 km/s,500.0 Myr,True
θ Aur,θ,37,,40312,28380,05h 59m 43.24s,+37° 12′ 46.0″,2.62,−0.98,173.0,A0p Si,"Mahasim, Maha-Sim, Manus; α² CVn variable, Vmax = 2.62m, Vmin = 2.70m, P = 3.6186 d",A0pSi + F2-5V,10220.0 K,3.24 M☉,4.68 R☉,214.0 L☉,3.61 cgs,3.6187 days,288.0 Myr,True
ι Aur,ι,3,,31398,23015,04h 56m 59.62s,+33° 09′ 58.1″,2.69,−3.29,512.0,K3IIvar,"Kabdhilinan, Hassaleh",K3 II–III,4059.0 K,7.1 M☉,126.0 R☉,3897.0 L☉,,8.0 km/s,39.8 Myr,True
ε Aur,ε,7,,31964,23416,05h 01m 58.13s,+43° 49′ 23.9″,3.03,−5.95,2037.0,F0Ia,"Almaaz, Maaz, Al Maz, Al Anz; long period eclipsing binary; Algol variable, Vmax = 2.92m, Vmin = 3.88m, P = 9884 d",F0 Iab (or II-III) + ~B5V,7750.0 K,15.0 M☉,358.0 R☉,37875.0 L☉,1.0 cgs,54.0 km/s,,True
η Aur,η,10,,32630,23767,05h 06m 30.87s,+41° 14′ 04.7″,3.18,−0.96,219.0,B3V,"Haedus II, Hoedus II, Haedus, Maha-Sim",B3 V,18660.0 K,5.6 M☉,3.64 R☉,1450.0 L☉,4.13 cgs,95.0 km/s,41.0 Myr,False
ζ Aur,ζ,8,,32068,23453,05h 02m 28.68s,+41° 04′ 33.2″,3.69,−3.22,787.0,K4II comp,"Sadatoni, Saclateni, Haedus I, Hoedus I; eclipsing binary; Algol variable, ΔV = 0.27m, P = 972.151 d",K5II (or K5Ib) + B7 V,3960.0 K,5.8 M☉,148.0 R☉,4786.0 L☉,1.33 cgs,5.7 km/s,,False
δ Aur,δ,33,,40035,28358,05h 59m 31.55s,+54° 17′ 05.9″,3.72,0.55,140.0,K0III,"Prajapati, Praja",K0 IIIb,4786.0 K,1.63 M☉,11.0 R☉,62.0 L☉,2.7 cgs,3.9 km/s,3.26 Gyr,False
ν Aur,ν,32,,39003,27673,05h 51m 29.39s,+39° 08′ 54.5″,3.97,−0.13,215.0,K0III,,G9.5 III Fe1 Ba0.2 + wd,4576.0 K,2.12 M☉,17.85 R☉,126.0 L☉,2.4 cgs,5.0 km/s,1.11 Gyr,False
π Aur,π,35,,40239,28404,05h 59m 56.10s,+45° 56′ 12.3″,4.3,−2.76,840.0,M3IIvar,,M3 IIb,3525.0 K,2.98 M☉,218.6 R☉,6630.0 L☉,0.55 cgs,,,False
κ Aur,κ,44,,43039,29696,06h 15m 22.74s,+29° 29′ 55.4″,4.32,0.75,169.0,G8IIIvar,,G8.5 IIIb,4732.0 K,1.25 M☉,11.0 R☉,54.0 L☉,2.7 cgs,2.5 km/s,5.59 Gyr,False
τ Aur,τ,29,,38656,27483,05h 49m 10.46s,+39° 10′ 52.1″,4.51,0.44,213.0,G8III,,G8IIIb Fe-1,4887.0 K,2.55 M☉,11.0 R☉,63.0 L☉,2.7 cgs,3.8 km/s,890.0 Myr,False
16 Aur,,16,,34334,24727,05h 18m 10.55s,+33° 22′ 19.2″,4.54,0.26,234.0,K3III...,,K2.5 IIIb CN-0.5,4264.0 K,1.3 M☉,19.86 R☉,127.0 L☉,1.87 cgs,0.0 km/s,5.07 Gyr,False
λ Aur,λ,15,,34411,24813,05h 19m 08.08s,+40° 06′ 02.4″,4.69,4.18,41.0,G0V,"Al Hurr, Al Hiba I",G1 VorG1.5 IV-V Fe-1,5890.0 K,1.081 M☉,1.331 R☉,1.732 L☉,4.02 cgs,2.0 km/s,7.9 Gyr,False
χ Aur,χ,25,,36371,25984,05h 32m 43.67s,+32° 11′ 31.3″,4.71,−5.77,4075.0,B5Iab,,B5 Iab,14600.0 K,21.1 M☉,68.0 R☉,190500.0 L☉,2.11 cgs,40.0 km/s,8.7 Myr,False
υ Aur,υ,31,,38944,27639,05h 51m 02.41s,+37° 18′ 20.5″,4.72,−1.10,475.0,M1III,,M0 III,3912.0 K,1.64 M☉,74.2 R☉,1165.0 L☉,1.16 cgs,,1.98 Gyr,False
2 Aur,,2,,30834,22678,04h 52m 38.00s,+36° 42′ 11.5″,4.79,−1.39,561.0,K3III,,K3- III Ba0.4,4115.0 K,2.86 M☉,48.14 R☉,599.0 L☉,1.79 cgs,2.3 km/s,1.8 Gyr,False
ψ2 Aur,ψ2,50,,47174,31832,06h 39m 19.83s,+42° 29′ 20.4″,4.8,−0.81,432.0,K3III,part of Dolones (ψ Aur),K2- III,4410.0 K,4.1 M☉,31.0 R☉,304.0 L☉,2.3 cgs,1.0 km/s,372.0 Myr,False
μ Aur,μ,11,,33641,24340,05h 13m 25.73s,+38° 29′ 04.8″,4.82,1.33,162.0,A4m,Al Hiba II,A4 Vm(kA3hA8VmA8),7931.0 K,1.9 M☉,2.53 R☉,22.8 L☉,3.91 cgs,80.0 km/s,560.0 Myr,False
63 Aur,,63,,54716,34752,07h 11m 39.29s,+39° 19′ 14.0″,4.91,−0.86,464.0,K4II-III,,K4 III,4067.5 K,,36.88 R☉,335.37 L☉,1.88 cgs,,,False
ψ1 Aur,ψ1,46,,44537,30520,06h 24m 53.90s,+49° 17′ 16.4″,4.92,−5.43,3835.0,K5Iabvar,part of Dolones (ψ Aur),K5-M1Iab-Ib,3790.0 K,14.4 M☉,1004.0 R☉,170400.0 L☉,,,12.3 Myr,False
ω Aur,ω,4,,31647,23179,04h 59m 15.38s,+37° 53′ 25.7″,4.93,1.49,159.0,A1V,"Binary, associated to EUVE J0459+37.8 is UV-emission source",A1 V,9230.0 K,2.29 M☉,2.0 R☉,27.0 L☉,4.33 cgs,107.0 km/s,317.0 Myr,False
ξ Aur,ξ,30,,39283,27949,05h 54m 50.79s,+55° 42′ 24.9″,4.96,0.62,241.0,A2V,,A2 Va,9152.0 K,1.96 M☉,1.1 R☉,49.5 L☉,3.88 cgs,62.0 km/s,174.0 Myr,False
9 Aur,,9,V398,32537,23783,05h 06m 40.66s,+51° 35′ 53.3″,4.98,2.89,85.0,F0V,"V398 Aurigae, Gamma Doradus variable, Vmax = 4.93m, Vmin = 5.03m, P = 1.25804 d",F2V,7023.0 K,1.97 M☉,1.56 R☉,6.042 L☉,4.07 cgs,21.0 km/s,,False
ψ7 Aur,ψ7,58,,49520,32844,06h 50m 45.96s,+41° 46′ 53.6″,4.99,−0.25,364.0,K3III,part of Dolones (ψ Aur),K3 III,4340.0 K,1.72 M☉,19.68 R☉,162.0 L☉,2.35 cgs,10.0 km/s,700.0 Myr,False
KW Aur,,14,,33959,24504,05h 15m 24.41s,+32° 41′ 15.3″,5.01,0.43,269.0,A9IV,"δ Sct variable, Vmax = 4.95m, Vmin = 5.08m, P = 0.088088 d; multiple star system",A9IV + ? + F5V + M3V: + WDA,7498.0 K,1.64 M☉,,62.07 L☉,3.46 cgs,2.11 h,609.0 Myr,False
σ Aur,σ,21,,35186,25292,05h 24m 39.14s,+37° 23′ 07.4″,5.02,−0.97,513.0,K4III,Al Hiba III,K3III CN+2,4120.0 K,,43.72 R☉,496.0 L☉,1.75 cgs,10.0 km/s,,False
ψ4 Aur,ψ4,55,,47914,32173,06h 43m 05.01s,+44° 31′ 28.3″,5.04,0.18,306.0,K5III,part of Dolones (ψ Aur),K5 III,4020.0 K,1.03 M☉,24.9 R☉,182.0 L☉,2.04 cgs,4.8 km/s,,False
19 Aur,,19,,34578,24879,05h 20m 00.92s,+33° 57′ 29.0″,5.05,−4.82,3075.0,A5IIvar,,A5 II+,8300.0 K,7.8 M☉,15.0 R☉,7057.0 L☉,2.1 cgs,8.0 km/s,36.0 Myr,False
φ Aur,φ,24,,35620,25541,05h 27m 38.89s,+34° 28′ 33.6″,5.08,−0.37,400.0,K4IIIp,,K3 IIIp,4222.0 K,,33.97 R☉,307.0 L☉,1.75 cgs,1.6 km/s,,False
65 Aur,,65,,57264,35710,07h 22m 02.69s,+36° 45′ 38.3″,5.12,0.84,235.0,K0III,,K0 III,4575.0 K,1.34 M☉,13.02 R☉,69.6 L☉,2.72 cgs,0.0 km/s,3.31 Gyr,False
ρ Aur,ρ,20,,34759,25048,05h 21m 48.41s,+41° 48′ 16.8″,5.22,−1.25,642.0,B5V,,B5 V,,7.0 M☉,3.4 R☉,,,55.0 km/s,,False
ψ6 Aur,ψ6,57,,48781,32562,06h 47m 39.58s,+48° 47′ 22.1″,5.22,−0.35,424.0,K1III,part of Dolones (ψ Aur),K0.5 III,4574.0 K,2.02 M☉,17.72 R☉,123.4 L☉,2.25 cgs,10.0 km/s,1.55 Gyr,False
66 Aur,,66,,57669,35907,07h 24m 08.47s,+40° 40′ 20.8″,5.23,−1.51,728.0,K0III,,K0.5 IIIa,4475.0 K,5.05 M☉,48.05 R☉,834.3 L☉,,4.5 km/s,107.0 Myr,False
ψ5 Aur,ψ5,56,,48682,32480,06h 46m 44.34s,+43° 34′ 37.3″,5.24,4.15,54.0,G0V,part of Dolones (ψ Aur),G0 V,6086.0 K,1.17 M☉,1.18 R☉,1.752 L☉,4.35 cgs,5.03 km/s,3.2 Gyr,False
49 Aur,,49,,46553,31434,06h 35m 12.06s,+28° 01′ 20.4″,5.26,−0.42,447.0,A0Vnn,,A0 Vnn,8794.0 K,,2.3 R☉,3.28 L☉,,149.0 km/s,,False
45 Aur,,45,,43905,30247,06h 21m 46.11s,+53° 27′ 08.6″,5.34,1.56,186.0,F5III...,,F5 V,6489.0 K,1.2 M☉,,21.72 L☉,3.57 cgs,14.0 km/s,1.561 Gyr,False
ψ3 Aur,ψ3,52,,47100,31789,06h 38m 49.19s,+39° 54′ 09.3″,5.34,−1.49,758.0,B8III,part of Dolones (ψ Aur),B8 III,13361.0 K,,4.2 R☉,1624.0 L☉,,118.0 km/s,,False
40 Aur,,40,,41357,28946,06h 06m 35.09s,+38° 28′ 58.0″,5.36,0.01,380.0,A4m,,A4m,7838.0 K,,,,3.88 cgs,,,False
IQ Aur,,,IQ,34452,24799,05h 19m 00.02s,+33° 44′ 54.5″,5.38,−0.31,448.0,A0p...,"α² CVn variable, Vmax = 5.35m, Vmin = 5.43m, P = 2.466 d",A0pSi,14454.0 K,3.95 M☉,2.6 R☉,263.0 L☉,4.34 cgs,2.466 days,6.3 Myr,False
26 Aur,,26,,37269,26536,05h 38m 38.10s,+30° 29′ 32.8″,5.4,−0.29,447.0,A2V + GIII,,G8III + A1IV or B9.5V,,2.1 M☉,,,,,,False
UU Aur,,,UU,46687,31579,06h 36m 32.84s,+38° 26′ 44.0″,5.4,−3.32,1811.0,C5II,"semiregular variable, Vmax = 4.9m, Vmin = 7.0m, P = 441 d","C5,3-C7,4(N3)",2760.0 K,,370.0 R☉,16443.0 L☉,,,,False
ο Aur,ο,27,,38104,27196,05h 45m 54.05s,+49° 49′ 34.6″,5.46,−0.39,482.0,A0p...,,A1 Cr Eu,8300.0 K,1.9 M☉,3.2 R☉,50.0 L☉,3.7 cgs,35.2 km/s,,False
PU Aur,,,PU,34269,24738,05h 18m 15.68s,+42° 47′ 31.9″,5.55,−1.09,694.0,M4III,"irregular variable, Vmax = 5.55m, Vmin = 5.78m",M4 III,3482.0 K,,107.0 R☉,1523.0 L☉,,,,False
51 Aur,,51,,47070,31771,06h 38m 39.55s,+39° 23′ 28.0″,5.7,0.76,317.0,K5III,,K5III,4277.0 K,1.58 M☉,24.5 R☉,178.0 L☉,1.84 cgs,,2.2 Gyr,False
36 Aur,,36,V444,40394,28499,06h 00m 58.56s,+47° 54′ 07.1″,5.71,−1.77,1022.0,B9.5p SiFe,"V444 Aur; α² CVn variable, Vmax = 5.70m, Vmin = 5.74m, P = 14.368 d","A1 Vp SiorB9.5p Si,Fe",10046.0 K,4.42 M☉,,724.0 L☉,,20.0 km/s,,False
RT Aur,,48,RT,45412,30827,06h 28m 34.09s,+30° 29′ 35.1″,5.75,−2.65,1560.0,F5.5Ibv,"Cepheid variable, Vmax = 5.00m, Vmin = 5.82m, P = 3.72849 d",F8Ib(F4Ib - G4Ib),6034.0 K,4.4 M☉,35.0 R☉,1451.0 L☉,1.42 cgs,8.8 km/s,85.0 Myr,False
53 Aur,,53,,47152,31737,06h 38m 23.02s,+28° 59′ 03.8″,5.76,0.20,421.0,B9npe...,,B9 Mn + F0m,10750.0 K,2.49 M☉,,,4.0 cgs,25.0 km/s,,False
41 Aur A,,41,,42126,29388,06h 11m 36.58s,+48° 42′ 40.0″,5.78,0.88,311.0,A3V+...,binary star,A2Va+,9000.0 K,1.99 M☉,1.78 R☉,11.2 L☉,,138.0 km/s,,False
WW Aur,,,WW,46052,31173,06h 32m 27.20s,+32° 27′ 17.8″,5.82,1.19,275.0,A3m + A3m,"Algol variable, ΔV = 0.68m, P = 2.52502 d",A4m + A5m,8350.0 K,1.964 M☉,1.98 R☉,13.5 L☉,4.16 cgs,35.0 km/s,565.0 Myr,False
ψ9 Aur,ψ9,,,50658,33377,06h 56m 32.06s,+46° 16′ 26.4″,5.85,−1.17,825.0,B8III,part of Dolones (ψ Aur),B8 IIIe,9573.0 K,2.4 M☉,3.7 R☉,868.0 L☉,2.71 cgs,235.0 km/s,,False
64 Aur,,64,,56221,35341,07h 18m 02.22s,+40° 53′ 00.1″,5.87,1.30,268.0,A5Vn,,A5 Vn,8014.0 K,1.67 M☉,,27.03 L☉,3.88 cgs,212.0 km/s,291.0 Myr,False
47 Aur,,47,,45466,30972,06h 30m 02.98s,+46° 41′ 07.9″,5.88,−0.18,530.0,K4III,,K4 III,4157.0 K,1.4 M☉,35.9 R☉,357.7 L☉,1.57 cgs,,2.14 Gyr,False
39 Aur,,39,,41074,28823,06h 05m 03.42s,+42° 58′ 55.1″,5.9,2.34,168.0,F3V,,F1 V,7161.0 K,1.45 M☉,,9.36 L☉,4.14 cgs,87.8 km/s,603.0 Myr,False
5 Aur,,5,,31761,23261,05h 00m 18.35s,+39° 23′ 40.9″,5.95,2.33,173.0,F5V,,F5 V,6603.0 K,1.7 M☉,,12.46 L☉,4.14 cgs,,2.205 Gyr,False
V433 Aur,,,V433,37367,26606,05h 39m 18.31s,+29° 12′ 54.8″,5.98,−1.81,1177.0,B2IV-V,"long-period pulsating variable, ΔV = 0.04m, P = 4.6382 d",B2IV-V,7400.0 K,,,322.0 L☉,,,,False
AE Aur,,,AE,34078,24575,05h 16m 18.15s,+34° 18′ 44.0″,5.99,−2.26,1455.0,O9.5Vvar,"Schaeberle's Flaming Star; runaway star; Orion variable, Vmax = 5.78m, Vmin = 6.08m",O9.5V,33200.0 K,19.2 M☉,6.8 R☉,50100.0 L☉,4.06 cgs,9.0 km/s,3.98 Myr,False
V394 Aur,,,V394,41429,28930,06h 06m 22.44s,+29° 30′ 44.7″,6.01,−1.18,893.0,M3II comp,"semiregular variable, Vmax = 6.01m, Vmin = 6.11m, P = 32.896 d",M3II,3639.0 K,,85.0 R☉,985.0 L☉,0.78 cgs,,,False
54 Aur,,54,,47395,31852,06h 39m 33.12s,+28° 15′ 47.4″,6.02,−0.67,709.0,B7III,,B7 III,11083.0 K,,,315.49 L☉,,65.0 km/s,,False
62 Aur,,62,,51440,33614,06h 59m 02.88s,+38° 03′ 09.4″,6.02,−0.31,603.0,K2III,,K2 III,4389.0 K,,22.33 R☉,166.82 L☉,,1.0 km/s,,False
38 Aur,,38,,40801,28677,06h 03m 17.87s,+42° 54′ 42.8″,6.08,1.56,261.0,K0III,,K0 III,4834.0 K,1.59 M☉,7.0 R☉,18.47 L☉,2.95 cgs,,3.6 Gyr,False
41 Aur B,,41,,42127,,06h 11m 36.60s,+48° 42′ 40.0″,6.09,,,,component of the 41 Aur system,A2Va+,9000.0 K,1.99 M☉,1.78 R☉,11.2 L☉,,138.0 km/s,,False
59 Aur,,59,OX,50018,33041,06h 53m 01.41s,+38° 52′ 08.9″,6.1,0.04,530.0,F2V,"OX Aur; δ Sct variable, Vmax = 5.94m, Vmin = 6.14m, P = 0.154412 d",F2V,6808.0 K,2.49 M☉,5.73 R☉,63.87 L☉,,165.0 km/s,700.0 Myr,False
AR Aur,,17,AR,34364,24740,05h 18m 18.89s,+33° 46′ 02.7″,6.15,0.72,398.0,B9.5V,"Algol variable, Vmax = 6.15m, Vmin = 6.82m, P = 4.13465 d",B9V + B9.5V+ M,10950.0 K,2.5444 M☉,1.8433 R☉,44.1 L☉,4.3125 cgs,22.555 km/s,33.0 Myr,False
V352 Aur,,,V352,50420,33269,06h 55m 14.66s,+43° 54′ 36.2″,6.16,−0.97,869.0,A9III,"δ Sct variable, Vmax = 6.13m, Vmin = 6.18m, P = 0.17 d",A9III,6350.0 K,1.57 M☉,12.86 R☉,242.2 L☉,3.79 cgs,36.0 km/s,998.0 Myr,False
V538 Aur,,,V538,37394,26779,05h 41m 20.33s,+53° 28′ 56.4″,6.21,5.77,40.0,K1V,"BY Draconis variable, ΔV = 0.04m, P = 10.86 d",K1 V,5303.0 K,0.871 M☉,0.82 R☉,0.478 L☉,4.55 cgs,11.0 days,3.76 Gyr,False
NO Aur,,,NO,37536,26718,05h 40m 42.05s,+31° 55′ 14.2″,6.23,−1.89,1370.0,M2SIab,"S star type; irregular variable, Vmax = 6.06m, Vmin = 6.44m",M2S Iab,3651.0 K,4.93 M☉,439.0 R☉,30900.0 L☉,0.037 cgs,,,False
V440 Aur,,,V440,39045,27661,05h 51m 25.74s,+32° 07′ 28.9″,6.28,0.03,580.0,M3III,"irregular variable, Vmax = 6.24m, Vmin = 6.37m",,,,,,,,,False
60 Aur,,60,,50037,33064,06h 53m 13.37s,+38° 26′ 18.4″,6.32,2.23,214.0,F5V:,,F5 V(A8/G0),6223.0 K,,,,,,1.7 Gyr,False
43 Aur,,43,,43380,29949,06h 18m 16.86s,+46° 21′ 38.7″,6.33,1.20,346.0,K2III,,K2 III,4552.0 K,1.43 M☉,10.8 R☉,49.2 L☉,,,2.7 Gyr,False
35 Cam,,(35),,40873,28765,06h 04m 29.11s,+51° 34′ 24.6″,6.39,0.98,394.0,A7III,,A7 Vor A7 III,7753.0 K,,,38.0 L☉,,134.0 km/s,,False
34 Cam,,(34),,40062,28385,05h 59m 45.83s,+55° 19′ 15.9″,6.42,1.32,342.0,A5m,,,,,,,,,,False
22 Aur,,22,,35076,25192,05h 23m 22.86s,+28° 56′ 12.6″,6.45,0.15,593.0,B9Vs,,B9 Vs,10764.0 K,2.85 M☉,3.1 R☉,89.7 L☉,,66.0 km/s,,False
6 Aur,,6,,31780,23268,05h 00m 23.21s,+39° 39′ 16.8″,6.46,−1.45,1244.0,K5III,,"K5III, K4I",3928.0 K,1.17 M☉,77.0 R☉,1300.0 L☉,0.78 cgs,,,False
ψ8 Aur,ψ8,61,,50204,33133,06h 53m 57.07s,+38° 30′ 18.3″,6.46,−0.56,825.0,B9.5sp...,part of Dolones (ψ Aur),B9.5p,10200.0 K,2.0 M☉,3.1 R☉,100.0 L☉,3.68 cgs,40.0 km/s,234.0 Myr,False
V403 Aur,,,V403,39743,28162,05h 57m 04.90s,+49° 01′ 46″,6.47,0.21,583.0,G8III,"RS CVn variable, ΔV = 0.19m, P = 73.1 d",,,,,,,,,False
18 Aur,,18,,34499,24832,05h 19m 23.72s,+33° 59′ 07.6″,6.49,2.20,235.0,A7V,,A7 V,7432.0 K,1.69 M☉,1.92 R☉,10.091 L☉,4.26 cgs,124.0 km/s,950.0 Myr,False
42 Aur,,42,,43244,29884,06h 17m 34.68s,+46° 25′ 26.1″,6.53,2.24,235.0,F0V,,F0 Vor A6 Vp(4481 wk)n,7660.0 K,1.7 M☉,,10.29 L☉,4.18 cgs,228.0 km/s,1.042 Gyr,False
LY Aur,,,LY,35921,25733,05h 29m 42.6511s,+35° 22′ 30.089″,6.85,-2.09,2000.0,O9.5+O9.5eaII-III,"Beta Lyrae variable, Vmax = 6.66m, Vmin = 7.35m, P = 4.00249 d",O9II + O9III + B0.5III,31000.0 K,25.5 M☉,16.1 R☉,214000.0 L☉,3.425 cgs,194.0 km/s,5.0 Myr,False
12 Aur,,12,,33988,,05h 16m 27.10s,+46° 24′ 56.0″,6.9,,,B5,,B2 Ve,8688.0 K,3.0 M☉,18.0 R☉,635.0 L☉,2.47 cgs,100.0 km/s,,False
25 Cam,,(25),,37735,27027,05h 43m 58.59s,+54° 51′ 53.4″,6.94,0.25,709.0,A0,,,,,,,,,,False
AB Aur,,,AB,31293,22910,04h 55m 45.84s,+30° 33′ 04.29″,7.06,1.27,469.0,A0Vpe,"Orion variable, Vmax = 6.3m, Vmin = 8.4m; has a dust disk in which planets or brown dwarves may be forming",A0Ve,9772.0 K,2.4 M☉,2.5 R☉,38.0 L☉,,,4.0 Myr,False
33 Cam,,(33),,39724,28214,05h 57m 40.57s,+55° 39′ 24.1″,7.15,0.39,734.0,A0,,,,,,,,,,False
V420 Aur,,,V420,34921,25114,05h 22m 35.2305s,+37° 40′ 33.629″,7.45,-4.5,8000.0,B0IVpe,"high mass X-ray Binary; Be star; variable, Vmax = 7.42m, Vmin = 7.53m",B0IVpe,30000.0 K,17.5 M☉,10.8 R☉,1673.0 L☉,3.5 cgs,240.0 km/s,,False
EO Aur,,,EO,34333,24744,05h 18m 21.0655s,+36° 37′ 55.336″,7.83,0.001,1200.0,B5,"Algol variable, Vmax = 7.56m, Vmin = 8.13m, P = 4.06565 d",B3V + B3V,13360.0 K,6.22 M☉,,2784.0 L☉,,,23.6 Myr,False
MZ Aur,,,MZ,34626,24938,05h 20m 33.0354s,+36° 37′ 56.031″,8.16,-2.28,4000.0,B1.5IVnp,"Be star; variable, Vmax = 8.14m, Vmin = 8.30m",B1.5 IVnp,22675.0 K,4.4 M☉,21.0 R☉,556.0 L☉,,310.0 km/s,200.0 Myr,False
IU Aur,,,IU,35652,25565,05h 27m 52.4005s,+34° 46′ 58.25″,8.39,1.73,700.0,B3Vnne,"spectroscopic binary; Beta Lyrae variable, Vmax = 8.19m, Vmin = 8.89m, P = 1.81147 d",B0p + B1Vp+ ?,32000.0 K,21.4 M☉,7.8 R☉,57500.0 L☉,3.99 cgs,,,False
V423 Aur,,,V423,34986,25178,05h 23m 10.0664s,+35° 42′ 32.272″,8.68,-3.85,9000.0,B8,"semi-regular pulsating star, Vmax = 8.63m, Vmin = 8.79m",,,,,,,,,False
NX Aur,,,NX,,,05h 23m 04.262s,+33° 28′ 46.43″,14.1,1.1,13000.0,B4Ve,PMS star in NGC 1893,,,,,,,,,False
]]

return M
