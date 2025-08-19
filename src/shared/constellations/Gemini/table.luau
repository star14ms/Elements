local M = {}
M.csv = [[
Name,B,F,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
Pollux,β,78,,62509,37826.0,07h 45m 19.36s,+28° 01′ 34.7″,1.16,1.09,34.0,K0III,"Al-Ras al-Taum al-Mu'ahar, Muekher al Dzira, Posterior Brachii; suspected variable, Vmax = 1.10m, Vmin = 1.17m; has a planet (b)",K0 III,4810.0 K,1.91 M☉,8.97 R☉,38.4 L☉,2.55 cgs,660.0 d,1.7 )Gyr,True
Castor A,α,66,,60179A,36850.0,07h 34m 36.00s,+31° 53′ 19.1″,1.9,1.05,52.0,A2Vm,"Al-Ras al-Taum al-Muqadim, Aoul al Dzira, Prima Brachii",A1V + dM1e,10286.0 K,2.371 M☉,2.089 R☉,0.0733 L☉,4.2 cgs,18.0 km/s,290.0 Myr,True
γ Gem,γ,24,,47105,31681.0,06h 37m 42.70s,+16° 23′ 57.9″,1.93,−0.60,105.0,A0IV,"Alhena, Almeisan, Nir al Henat, Prima του al Henat",A1IV + G,9190.0 K,2.81 M☉,5.16 R☉,207.3 L☉,3.56 cgs,10.7 km/s,,True
μ Gem,μ,13,,44478,30343.0,06h 22m 57.59s,+22° 30′ 49.9″,2.87,−1.39,232.0,M3.0III,"Tejat Posterior, Tejat, Calx, Pish Pai; semiregular variable, Vmax = 2.75m, Vmin = 3.02m",M3 III,3643.0 K,1.9 M☉,107.7 R☉,1692.0 L☉,0.82 cgs,8.4 km/s,,True
Castor B,α,66,,60178,,07h 34m 36.00s,+31° 53′ 19.0″,2.88,,,Am,,A1V + dM1e,10286.0 K,2.371 M☉,2.089 R☉,0.0733 L☉,4.2 cgs,18.0 km/s,290.0 Myr,True
ε Gem,ε,27,,48329,32246.0,06h 43m 55.93s,+25° 07′ 52.2″,3.06,−4.15,903.0,G8Ib,"Mebsuta; variable star, Vmax = 2.97m, Vmin = 3.09m",G8 Ib,4591.0 K,8.2 M☉,130.2 R☉,6980.0 L☉,1.38 cgs,9.08 km/s,100.0 Myr,True
η Gem,η,7,,42995,29655.0,06h 14m 52.70s,+22° 30′ 24.6″,3.31,−1.84,349.0,M3III,"Propus, Praepes, Tejat Prior; semiregular and Algol variable, Vmax = 3.15m, Vmin = 3.9m, P = 232.9 d",M2 IIIa(Aa)A(Ab)G0 III(B),3502.0 K,5.1 M☉,153.0 R☉,3162.0 L☉,,,0.81 Gyr,True
ξ Gem,ξ,31,,48737,32362.0,06h 45m 17.43s,+12° 53′ 45.8″,3.35,2.13,57.0,F5IV,"Alzir; suspected variable, Vmax = 3.33m, Vmin = 3.42m",F5 IV-V,6480.0 K,1.706 M☉,2.71 R☉,11.574 L☉,3.81 cgs,66.1 km/s,1.5 Gyr,True
δ Gem,δ,55,,56986,35550.0,07h 20m 07.39s,+21° 58′ 56.4″,3.5,2.22,59.0,F0IV...,Wasat,F0 IV,6900.0 K,1.57 M☉,2.31 R☉,9.88 L☉,,129.7 km/s,1.6 Gyr,False
κ Gem,κ,77,,62345,37740.0,07h 44m 26.87s,+24° 23′ 53.3″,3.57,0.35,143.0,G8III,"Jīxīn (積薪), 隆博星 (Takahiro-boshi)",G9 III,5020.0 K,2.07 M☉,11.0 R☉,69.3 L☉,2.8 cgs,3.3 km/s,2.07 Gyr,False
λ Gem,λ,54,,56537,35350.0,07h 18m 05.61s,+16° 32′ 25.7″,3.58,1.27,94.0,A3V...,"suspected variable, Vmax = 3.52m, Vmin = 3.62m",A3V,7932.0 K,2.098 M☉,2.7773 R☉,27.3901 L☉,,154.0 km/s,0.5 Gyr,False
θ Gem,θ,34,,50019,33018.0,06h 52m 47.34s,+33° 57′ 40.9″,3.6,−0.30,197.0,A3III,,A2 IV,8502.0 K,1.8 M☉,5.1 R☉,93.0 L☉,3.4 cgs,133.0 km/s,252.0 Myr,False
ι Gem,ι,60,,58207,36046.0,07h 25m 43.68s,+27° 47′ 53.8″,3.78,0.85,126.0,G9III+...,Propus,G9 III,5072.0 K,1.89 M☉,9.48 R☉,53.7 L☉,2.8 cgs,0.0 km/s,4.16 Gyr,False
ζ Gem,ζ,43,,52973,34088.0,07h 04m 06.54s,+20° 34′ 13.1″,4.01,−3.76,1168.0,G1Ib,"Mekbuda; classical Cepheid, Vmax = 3.62m, Vmin = 4.18m, P = 10.15 d",F7Ib to G3Ib,5780.0 K,7.7 M☉,72.0 R☉,4413.0 L☉,1.9 cgs,19.0 km/s,70.0 Myr,False
υ Gem,υ,69,,60522,36962.0,07h 35m 55.37s,+26° 53′ 45.6″,4.06,−0.28,240.0,K5III,"suspected variable, Vmax = 4.04m, Vmin = 4.08m",M0 III,4019.0 K,1.52 M☉,39.62 R☉,369.6 L☉,1.0 cgs,5.9 km/s,3.53 Gyr,False
ν Gem A,ν,18,,45542,30883.0,06h 28m 57.79s,+20° 12′ 43.8″,4.13,−1.81,502.0,B6III,Nucatai,B6 III + B8 III,14100.0 K,3.34 M☉,,1380.0 L☉,,160.0 km/s,,False
1 Gem,,1,,41116,28734.0,06h 04m 07.22s,+23° 15′ 49.1″,4.16,0.84,151.0,G7III,Propus,K0III + (F6IV + G2V),,1.94 M☉,,,3.1 cgs,,,False
ρ Gem,ρ,62,,58946,36366.0,07h 29m 06.61s,+31° 47′ 02.7″,4.16,2.82,60.0,F0V...,suspected variable,F1V,6899.0 K,1.355 M☉,1.655 R☉,5.542 L☉,4.11 cgs,59.0 km/s,2.1 Gyr,False
σ Gem,σ,75,,62044,37629.0,07h 43m 18.69s,+28° 53′ 02.7″,4.23,1.36,122.0,K1III SB,"RS CVn variable, Vmax = 4.13m, Vmin = 4.29m, P = 19.42 d",K1 III+ dG/K,4571.0 K,1.28 M☉,10.1 R☉,39.0 L☉,2.54 cgs,19.47 days,5.0 Gyr,False
τ Gem,τ,46,,54719,34693.0,07h 11m 08.39s,+30° 14′ 43.0″,4.41,−0.42,302.0,K2III,"suspected variable, Vmax = 4.37m, Vmin = 4.42m; has a brown dwarf companion",K2 III,4583.0 K,2.3 M☉,30.27 R☉,364.0 L☉,1.96 cgs,5.8 km/s,1.22 Gyr,False
30 Gem,,30,,48433,32249.0,06h 43m 59.29s,+13° 13′ 41.3″,4.49,−0.15,276.0,K1III,,K0+ III Ca1,4518.0 K,2.29 M☉,22.4 R☉,188.9 L☉,2.18 cgs,2.7 km/s,1.2 Gyr,False
38 Gem,e,38,,50635,33202.0,06h 54m 38.59s,+13° 10′ 40.9″,4.71,2.48,91.0,F0Vp,,A8V+ G6V,7410.0 K,1.55 M☉,0.89 R☉,0.694 L☉,4.23 cgs,147.5 km/s,1.179 Gyr,False
ο Gem,ο,71,,61110,37265.0,07h 39m 09.96s,+34° 35′ 04.7″,4.89,1.46,158.0,F3III,Jishui,F5-6 IV,6470.0 K,2.0 M☉,4.0 R☉,24.0 L☉,3.48 cgs,91.1 km/s,1.2 Gyr,False
81 Gem,g,81,,62721,37908.0,07h 46m 07.49s,+18° 30′ 36.6″,4.89,−0.21,341.0,K5III,,K4 III,4095.0 K,1.22 M☉,33.7 R☉,287.3 L☉,1.94 cgs,,6.32 Gyr,False
χ Gem,χ,,,66216,39424.0,08h 03m 31.10s,+27° 47′ 39.9″,4.94,0.45,258.0,K2III,,K2 III,4560.0 K,1.83 M☉,14.0 R☉,79.0 L☉,2.5 cgs,3.8 km/s,1.92 Gyr,False
φ Gem,φ,83,,64145,38538.0,07h 53m 29.84s,+26° 45′ 57.1″,4.97,0.51,254.0,A3V,,A3 V,8551.0 K,1.9 M☉,,36.5 L☉,4.0 cgs,165.0 km/s,637.0 Myr,False
65 Gem,b,65,,59148,36429.0,07h 29m 48.78s,+27° 54′ 58.3″,5.01,−0.34,383.0,K2III,,,,,,,,,,False
57 Gem,A,57,,57727,35846.0,07h 23m 28.55s,+25° 03′ 02.2″,5.04,1.67,154.0,G8III,,G8III,4902.0 K,2.2 M☉,7.1 R☉,29.0 L☉,2.84 cgs,1.3 km/s,1.2 Gyr,False
74 Gem,f,74,,61338,37300.0,07h 39m 28.59s,+17° 40′ 28.3″,5.04,−1.02,532.0,M0III,"suspected variable, ΔV = 0.08m",K5.5III,3933.0 K,,89.6 R☉,666.0 L☉,,,,False
51 Gem,,51,BQ,55383,34909.0,07h 13m 22.27s,+16° 09′ 32.6″,5.07,−1.59,700.0,K3V,semiregular variable,,,,,,,,,False
64 Gem,,64,,59037,36393.0,07h 29m 20.46s,+28° 07′ 06.3″,5.07,1.58,163.0,A4V,,,,,,,,,,False
56 Gem,,56,,57423,35699.0,07h 21m 56.90s,+20° 26′ 37.4″,5.09,−0.50,428.0,M0III,"suspected variable, ΔV = 0.06m",,,,,,,,,False
π Gem,π,80,,62898,38016.0,07h 47m 30.34s,+33° 24′ 56.8″,5.14,−1.04,562.0,M0III,"suspected variable, ΔV = 0.08m",M1 IIIa,3915.0 K,1.1 M☉,57.0 R☉,676.0 L☉,0.9 cgs,,,False
26 Gem,,26,,48097,32104.0,06h 42m 24.32s,+17° 38′ 43.9″,5.2,2.05,139.0,A2V,,,,,,,,,,False
ω Gem,ω,42,,52497,33927.0,07h 02m 24.78s,+24° 12′ 55.6″,5.2,−3.33,1655.0,G5II,"slow irregular variable, Vmax = 5.18m, Vmin = 5.20m",G5 II,5090.0 K,6.3 M☉,72.0 R☉,1813.0 L☉,2.45 cgs,10.0 km/s,14.8 Myr,False
63 Gem,,63,,58728,36238.0,07h 27m 44.39s,+21° 26′ 44.0″,5.2,2.54,111.0,F5IV-V...,Triple star system,,,,,,,,,False
68 Gem,,68,,60107,36760.0,07h 33m 36.50s,+15° 49′ 36.1″,5.27,−0.03,375.0,A1Vn,suspected variable,,,,,,,,,False
36 Gem,d,36,,49908,32921.0,06h 51m 33.05s,+21° 45′ 40.4″,5.28,−0.77,529.0,A2V,,,,,,,,,,False
76 Gem,c,76,,62285,37704.0,07h 44m 06.92s,+25° 47′ 03.2″,5.3,−1.01,595.0,K5III,"suspected variable, Vmax = 5.28m, Vmin = 5.32m",,,,,,,,,False
85 Gem,,85,,64648,38722.0,07h 55m 39.90s,+19° 53′ 02.6″,5.38,0.29,339.0,A0Vs,,,,,,,,,,False
28 Gem,,28,,48450,32311.0,06h 44m 45.46s,+28° 58′ 15.6″,5.42,−0.79,570.0,K4III,,,,,,,,,,False
45 Gem,,45,,54131,34440.0,07h 08m 22.04s,+15° 55′ 51.3″,5.47,0.61,305.0,G8III,,,,,,,,,,False
NZ Gem,,,NZ,61913,37521.0,07h 42m 03.22s,+14° 12′ 30.7″,5.55,−1.93,1022.0,M3S,"semiregular variable, Vmax = 5.52m, Vmin = 5.72m",,,,,,,,,False
70 Gem,,70,,60986,37204.0,07h 38m 32.84s,+35° 02′ 54.5″,5.58,0.72,306.0,K0III,,,,,,,,,,False
35 Gem,,35,,49738,32814.0,06h 50m 25.50s,+13° 24′ 47.5″,5.68,−2.64,1502.0,K3III,,,,,,,,,,False
IS Gem,,,IS,49380,32740.0,06h 49m 41.34s,+32° 36′ 24.8″,5.72,0.85,307.0,K3II,semiregular variable,,,,,,,,,False
41 Gem,,41,,52005,33715.0,07h 00m 15.82s,+16° 04′ 44.4″,5.73,−5.53,5821.0,K3Ib,suspected variable,,,,,,,,,False
37 Gem,,37,,50692,33277.0,06h 55m 18.69s,+25° 22′ 32.3″,5.73,4.56,56.0,G0V,"suspected variable, ΔV = 0.02m",G0 V,6060.0 K,1.146 M☉,1.04 R☉,1.31 L☉,4.29 cgs,25.0 d,5.49 Gyr,False
3 Gem,,3,PU,42087,29225.0,06h 09m 43.99s,+23° 06′ 48.5″,5.75,,,B2.5Ib,"α Cyg variable, Vmax = 5.71m, Vmin = 5.77m, P = 6.81 d",B3Ia,16500.0 K,21.0 M☉,55.0 R☉,204000.0 L☉,2.45 cgs,80.0 km/s,,False
47 Gem,,47,,54801,34722.0,07h 11m 23.08s,+26° 51′ 24.0″,5.75,0.36,390.0,A4IV,suspected δ Sct variable,,,,,,,,,False
53 Gem,,53,,55870,35152.0,07h 15m 57.18s,+27° 53′ 50.7″,5.75,−1.85,1079.0,M1III,"variable star, ΔV = 0.012m, P = 6.22 d",,,,,,,,,False
59 Gem,,59,,57927,35941.0,07h 24m 33.44s,+27° 38′ 16.1″,5.77,1.73,209.0,F0:III:,δ Sct variable,,,,,,,,,False
5 Gem,,5,,42398,29379.0,06h 11m 32.31s,+24° 25′ 13.4″,5.83,−0.99,753.0,K0III,"On 5 June 2013, it was occulted by Venus as viewed from Australia, New Guinea, the West Pacific, Alaska.",,,,,,,,,False
52 Gem,,52,,55621,35025.0,07h 14m 41.94s,+24° 53′ 06.7″,5.84,0.77,337.0,M1III,suspected variable,,,,,,,,,False
48 Gem,,48,,55052,34819.0,07h 12m 26.39s,+24° 07′ 43.3″,5.85,0.70,349.0,F5IV,,,,,,,,,,False
33 Gem,,33,OV,49606,32753.0,06h 49m 49.85s,+16° 12′ 10.5″,5.85,−1.38,926.0,B7III,"α2 CVn variable, ΔV = 0.1m, P = 2.27 d",,,,,,,,,False
61 Gem,,61,,58579,36156.0,07h 26m 56.33s,+20° 15′ 27.3″,5.94,0.47,405.0,F2Vn,suspected δ Sct variable,,,,,,,,,False
NP Gem,,,NP,52554,33929.0,07h 02m 25.52s,+17° 45′ 19.6″,5.96,−2.13,1353.0,M1.5,"slow irregular variable, Vmax = 5.89m, Vmin = 6.04m",,,,,,,,,False
44 Gem,,44,,53257,34182.0,07h 05m 18.37s,+22° 38′ 14.9″,6.0,0.17,478.0,B8Vn,,,,,,,,,,False
8 Gem,,8,,43261,29789.0,06h 16m 19.05s,+23° 58′ 12.2″,6.09,0.46,436.0,G8III,,,,,,,,,,False
58 Gem,,58,,57744,35842.0,07h 23m 28.15s,+22° 56′ 43.6″,6.17,1.27,312.0,A1V,,,,,,,,,,False
82 Gem,,82,,63208,38106.0,07h 48m 33.65s,+23° 08′ 27.5″,6.18,−1.36,1052.0,G2III+...,suspected variable,,,,,,,,,False
39 Gem,,39,,51530,33595.0,06h 58m 47.52s,+26° 04′ 51.1″,6.2,2.82,155.0,F7V,suspected variable,,,,,,,,,False
16 Gem,,16,,45394,30769.0,06h 27m 56.69s,+20° 29′ 46.6″,6.22,0.13,538.0,A2Vs,,,,,,,,,,False
9 Gem,,9,PX,43384,29840.0,06h 16m 58.71s,+23° 44′ 27.3″,6.24,−2.79,2090.0,B3Ia,"α Cyg variable, Vmax = 6.23m, Vmin = 6.30m, P = 13.70 d",,,,,,,,,False
20 Gem,,20,,46136,31158.0,06h 32m 18.52s,+17° 47′ 03.4″,6.26,1.08,354.0,F6V...,,,,,,,,,,False
141 Tau,,(141),,40724,28561.0,06h 01m 41.63s,+22° 24′ 03.8″,6.36,0.09,584.0,B8V,,,,,,,,,,False
19 Gem,,19,,46031,31105.0,06h 31m 37.44s,+15° 54′ 12.7″,6.38,1.33,334.0,A8V,,,,,,,,,,False
40 Gem,,40,,51688,33650.0,06h 59m 27.94s,+25° 54′ 51.1″,6.4,−1.43,1199.0,B8III,,,,,,,,,,False
OT Gem,,,OT,58050,35933.0,07h 24m 27.65s,+15° 31′ 01.9″,6.41,−3.53,3170.0,B2Ve,"γ Cas variable, Vmax = 6m, Vmin = 6.44m",,,,,,,,,False
25 Gem,,25,,47731,32019.0,06h 41m 20.90s,+28° 11′ 47.9″,6.45,−1.73,1411.0,G5Ib,,,,,,,,,,False
50 Gem,,50,,55130,34860.0,07h 12m 49.08s,+27° 13′ 30.2″,6.46,3.24,144.0,F8V,"spectroscopic binary; suspected variable, Vmax = 6.43m, Vmin = 6.46m",,,,,,,,,False
32 Gem,,32,,48843,32404.0,06h 45m 54.20s,+12° 41′ 36.8″,6.47,−1.25,1140.0,A9III,,,,,,,,,,False
6 Gem,,6,BU,42543,29450.0,06h 12m 19.10s,+22° 54′ 30.7″,6.51,−4.09,4289.0,M1Ia-ab,"semiregular variable, Vmax = 5.74m, Vmin = 7.4m, P = 325 d",M1-2 Ia-Iab,3789.0 K,20.0 M☉,821.0 R☉,86000.0 L☉,0.0 cgs,,,False
79 Gem,,79,,62510,37811.0,07h 45m 09.34s,+20° 18′ 57.8″,6.53,0.78,460.0,A1V,,,,,,,,,,False
15 Gem A,,15,,45352,30757.0,06h 27m 46.58s,+20° 47′ 22.6″,6.54,0.31,575.0,K0,,,,,,,,,,False
W Gem,,,W,46595,31404.0,06h 34m 57.45s,+15° 19′ 49.7″,6.54,,,F5-G1,"classical Cepheid, Vmax = 6.54m, Vmin = 7.38m, P = 7.91 d",,,,,,,,,False
TV Gem,,,TV,42475,29416.0,06h 11m 51.41s,+21° 52′ 05.6″,6.56,,3100.0,M1Iab,"semiregular variable, Vmax = 6.27m, Vmin = 7.5m, P = 229 d",K5.5 - M1.3 Iab+ B4 III:,3850.0 K,14.0 M☉,710.0 (pulsation)R☉,89000.0 L☉,,,,False
10 Gem,,10,,43740,30003.0,06h 18m 54.43s,+23° 36′ 11.9″,6.58,−0.34,789.0,G5,,,,,,,,,,False
HD 45314,,,PZ,45314,30722.0,06h 27m 15.78s,+14° 53′ 21.22″,6.64,,,O9:pe,Be star,,,,,,,,,False
2 Gem,,2,,41543,28969.0,06h 06m 48.66s,+23° 38′ 19.0″,6.67,−0.45,867.0,K0,,,,,,,,,,False
23 Gem,,23,,46781,31525.0,06h 36m 02.12s,+16° 47′ 49.5″,6.73,2.25,257.0,F5,,,,,,,,,,False
OU Gem,,,OU,45088,30630.0,06h 26m 10.25s,+18° 45′ 24.9″,6.76,,48.02,K3Vk,"BY Dra variable, ΔV = 0.05m",K3Vk,4960.0 K,0.85 M☉,0.81 R☉,,4.55 cgs,,,False
HD 60848,,,BN,60848,37074.0,07h 37m 05.73s,+16° 54′ 15.3″,6.85,,1960.0,O8V:pev,"γ Cas variable, Vmax = 6.75m, Vmin = 6.85m",,,,,,,,,False
4 Gem,,4,,42216,29288.0,06h 10m 29.94s,+22° 59′ 52.4″,6.88,−0.21,853.0,B9,,,,,,,,,,False
11 Gem,,11,LU,43818,30046.0,06h 19m 19.30s,+23° 28′ 09.9″,6.91,−2.28,2248.0,B0II,β Cep variable,,,,,,,,,False
12 Gem,,12,,43836,30049.0,06h 19m 22.52s,+23° 16′ 28.2″,6.95,,2530.0,A0II,,,,,,,,,,False
49 Gem,,49,,55156,34861.0,07h 12m 49.38s,+25° 44′ 55.3″,7.05,−0.01,842.0,A0,,,,,,,,,,False
HD 52961,,,PS,52961,34038.0,07h 03m 39.63s,+10° 46′ 13.1″,7.37,,,A0,"RV Tau variable, Vmax = 7.24m, Vmin = 7.58m, P = 72 d",,,,,,,,,False
WY Gem,,,WY,42474,29425.0,06h 11m 56.25s,+23° 12′ 25.4″,7.38,,,M2Iabep+B,"slow irregular variable and eclipsing binary, Vmax = 7.10m, Vmin = 7.56m, P = 23550 d",M2Ia-b + B2V,3789.0 K,,522.0 R☉,,0.7 cgs,,,False
R Gem,,,R,53791,34356.0,07h 07m 21.40s,+22° 42′ 13.0″,7.68,1.65,525.0,S3.5-6.5/6e,"technetium star; Mira variable, Vmax = 6.0m, Vmin = 14.0m, P = 369.91 d","S2,9e-S8,9e(Tc)",2400.0 K,,431.0 R☉,5500.0 L☉,,,,False
ν Gem B,ν,18,,257937,,06h 28m 53.70s,+20° 14′ 20.0″,8.0,,,,,B6 III + B8 III,14100.0 K,3.34 M☉,,1380.0 L☉,,160.0 km/s,,False
HD 59643,,,NQ,59643,36623.0,07h 31m 54.52s,+24° 30′ 12.6″,8.01,,2860.0,"C6,2eV","Z And and semiregular variable, Vmax = 7.4m, Vmin = 8.18m, P = 58.2 d",,,,,,,,,False
V345 Gem,,,V345,60987,37197.0,07h 38m 30.23s,+33° 42′ 41.5″,8.2,,528.0,F0,W UMa variable,,,,,,,,,False
15 Gem B,,15,,257498,30756.0,06h 27m 45.94s,+20° 46′ 59.6″,8.59,7.31,59.0,G0,,,,,,,,,,False
SS Gem,,,SS,41870,,06h 08m 35.11s,+22° 37′ 01.9″,8.67,,,G2/5I,"RV Tau variable, Vmax = 8.48m, Vmin = 9.70m, P = 89.44 d",,,,,,,,,False
CR Gem,,,CR,,31349.0,06h 34m 23.92s,+16° 04′ 30.3″,8.67,,1140.0,Cv+...,semiregular variable,,,,,,,,,False
RY Gem,,,RY,58713,36209.0,07h 27m 24.17s,+15° 39′ 34.7″,8.68,,1330.0,A2V+ K-03IV-V,"Algol variable, Vmax = 8.69m, Vmin = 11.04m, P = 9.30 d",,,,,,,,,False
RX Gem,,,RX,49521,32791.0,06h 50m 11.54s,+33° 14′ 20.7″,9.24,,1520.0,A2,"Algol variable, Vmax = 9.2m, Vmin = 10.81m, P = 12.21 d",,,,,,,,,False
TU Gem,,,TU,42272,,06h 10m 53.10s,+26° 00′ 53.4″,9.4,,,"C6,4","semiregular variable, Vmax = 6.88m, Vmin = 8.0m, P = 217 d",,,,,,,,,False
Castor C,α,66,YY,60179C,,07h 34m 37.58s,+31° 52′ 11.1″,9.64,8.79,52.0,dM1e+dM1e,"Algol variable and flare star; Vmax = 8.91m, Vmin = 9.6m, P = 0.81 d",A1V + dM1e,10286.0 K,2.371 M☉,2.089 R☉,0.0733 L☉,4.2 cgs,18.0 km/s,290.0 Myr,False
RW Gem,,,RW,250371,28537.0,06h 01m 28.06s,+23° 08′ 27.5″,9.79,,438.0,B6V,"Algol variable, Vmax = 9.53m, Vmin = 11.76m, P = 2.87 d",,,,,,,,,False
AD Gem,,,AD,262433,32180.0,06h 43m 07.51s,+20° 56′ 20.8″,9.8,,,F5,"classical Cepheid, Vmax = 9.45m, Vmin = 10.23m, P = 3.79 d",,,,,,,,,False
AL Gem,,,AL,266913,,06h 57m 38.55s,+20° 53′ 32.5″,9.89,,,F6V,"Algol variable, Vmax = 9.8m, Vmin = 10.39m, P = 1.39 d",,,,,,,,,False
BD+20°1790,,,V429,,,07h 23m 43.59s,+20° 24′ 58.7″,10.0,,85.0,K5Ve,"BY Dra variable, Vmax = 9.86m, Vmin = 10.08m, P = 2.80 d",K5Ve,4410.0 K,0.63 M☉,0.71 R☉,0.17 L☉,4.53 cgs,2.76 d,80.0 Myr,False
AF Gem,,,AF,264750,,06h 50m 39.64s,+21° 21′ 55.9″,10.58,,,A0,"Algol variable, Vmax = 10.54m, Vmin = 11.83m, P = 1.24 d",,,,,,,,,False
DX Gem,,,DX,,31306.0,06h 33m 54.61s,+14° 28′ 17.0″,10.73,,,,"classical Cepheid, Vmax = 10.53m, Vmin = 10.92m, P = 3.14 d",,,,,,,,,False
HD 51585,,,OY,51585,,06h 58m 30.41s,+16° 19′ 26.2″,11.2,,,Bpe,"Be star, Vmax = 11.07m, Vmin = 11.37m",,,,,,,,,False
ZZ Gem,,,ZZ,44653,,06h 24m 01.24s,+25° 01′ 52.9″,11.2,,,Ce,"Mira variable, Vmax = 8.3m, Vmin = 11.2m, P = 314.5 d",,,,,,,,,False
BM Gem,,,BM,57160,35617.0,07h 20m 59.01s,+24° 59′ 58.1″,11.5,,2590.0,N,semiregular variable,,,,,,,,,False
RR Gem,,,RR,,35667.0,07h 21m 33.53s,+30° 52′ 59.5″,11.92,,,A8,"RR Lyr variable, Vmax = 10.62m, Vmin = 11.99m, P = 0.40 d",,,,,,,,,False
BG Gem,,,BG,,,06h 03m 30.81s,+27° 51′ 50.7″,,,,,β Lyr variable,K0I,4500.0 K,>0.7 M☉,,,,,,False
PQ Gem,,,PQ,,,07h 51m 17.32s,+14° 44′ 23.9″,13.7,,,CV,"intermediate polar, Vmax = 13.7m, Vmin = 14.5m, P = 0.22 d",,,,,,,,,False
U Gem,,,U,64511,,07h 55m 05.24s,+22° 00′ 05.1″,14.9,,413.0,sd:Be+...,"prototype dwarf nova (SS Cyg) and eclipsing binary, Vmax = 8.2m, Vmin = 14.9m, P = 0.18 d",DA+ M4.5Ve,29200.0 K,1.2 M☉,0.008 R☉,,7.9 cgs,,,False
DN Gem,,,DN,50480,,06h 54m 54.35s,+32° 08′ 28.0″,15.0,,,,nova,,,0.93 M☉,,,,,,False
DM Gem,,,DM,48328,,06h 44m 12.05s,+29° 56′ 41.9″,17.4,,,,"nova, Vmax = 4.8m, Vmin = 17.4m, P = 0.12 d",,,,,,,,,False
IR Gem,,,IR,,,06h 47m 34.68s,+28° 06′ 22.3″,18.7,,,,"SU UMa variable, Vmax = 11.2m, Vmin = 18.7m, P = 0.068 d",,,,,,,,,False
AW Gem,,,AW,,,07h 22m 41.0s,+28° 30′ 17″,19.4,,,,"SU UMa variable, Vmax = 12.9m, Vmin = 19.4m, P = 0.076 d",,,,,,,,,False
]]

return M
