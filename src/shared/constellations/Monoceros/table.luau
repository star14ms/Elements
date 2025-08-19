local M = {}
M.csv = [[
Name,B,F,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
α Mon,α,26,,61935,37447.0,07h 41m 14.88s,−09° 33′ 03.9″,3.94,0.71,144.0,K0III,,G9.5 III-IIIb Fe-0.5,5049.0 K,2.25 M☉,10.42 R☉,63.7 L☉,2.79 cgs,326.0 days,890.0 Myr,True
γ Mon,γ,5,,43232,29651.0,06h 14m 51.34s,−06° 16′ 29.0″,3.99,−2.49,644.0,K3III,,K1.5IIIBa0.3,4810.0 K,4.09 M☉,50.8 R☉,1247.0 L☉,1.61 cgs,4.0 km/s,170.0 Myr,True
δ Mon,δ,22,,55185,34769.0,07h 11m 51.86s,−00° 29′ 34.0″,4.15,−1.15,375.0,A2V,,A2Vor A0IV,9462.0 K,2.4 M☉,,350.0 L☉,3.5 cgs,175.5 km/s,405.0 Myr,True
ζ Mon,ζ,29,,67594,39863.0,08h 08m 35.66s,−02° 59′ 01.6″,4.36,−4.41,1852.0,G2Ib,,G2Ib,5289.0 K,6.2 M☉,,2207.0 L☉,1.75 cgs,17.0 km/s,,True
ε Mon A,ε,8,,44769,30419.0,06h 23m 46.10s,+04° 35′ 34.2″,4.39,1.41,128.0,A5IV,component of the ε Mon system,A5 IV,7923.0 K,2.04 M☉,2.5 R☉,25.0 L☉,3.95 cgs,149.0 km/s,,False
13 Mon,,13,,46300,31216.0,06h 32m 54.23s,+07° 19′ 58.7″,4.47,−3.86,1509.0,A0Ib,suspected variable,A0 Ib,10000.0 K,12.0 M☉,34.0 R☉,,2.15 cgs,0.0 km/s,16.0 Myr,False
18 Mon,,18,,49293,32578.0,06h 47m 51.66s,+02° 24′ 43.9″,4.48,−0.81,373.0,K0III,,K0+IIIaBa0.2,4750.0 K,,26.95 R☉,311.2 L☉,2.59 cgs,<2.0 km/s,,False
β Mon A,β,11,,45725,30867.0,06h 28m 49.07s,−07° 01′ 59.0″,4.6,−2.03,691.0,B3Ve,Herschel's Wonder Star; component of the β Mon system; Be star,B4Veshell,18070.0 K,8.7 M☉,,3200.0 L☉,4.06 cgs,346.0 km/s,27.5 Myr,False
S Mon,,15,S,47839,31978.0,06h 40m 58.66s,+09° 53′ 44.7″,4.66,−2.82,1022.0,O7V + O9.5V,"in NGC 2264; irregular variable, Vmax = 4.62m, Vmin = 4.68m",O7V((f))zvar+ O9.5Vn+ B2V,38500.0 K,29.1 M☉,9.9 R☉,214000.0 L☉,4.5 cgs,120.0 km/s,3.1 Myr,False
28 Mon,,28,V645,65953,39211.0,08h 01m 13.30s,−01° 23′ 32.7″,4.68,−1.12,472.0,K4III,"FK Com variable, ΔV = 0.02m, P = 0.21 d",K4III,3999.0 K,2.193 M☉,47.69 R☉,524.0 L☉,1.68 cgs,2.2 km/s,,False
17 Mon,,17,,49161,32533.0,06h 47m 19.84s,+08° 02′ 14.2″,4.77,−1.09,484.0,K4III,,K4 III,4345.0 K,,25.0 R☉,538.2 L☉,1.86 cgs,2.5 km/s,,False
20 Mon,,20,,54810,34622.0,07h 10m 13.68s,−04° 14′ 15.5″,4.91,0.85,211.0,K0III,,K0III,4714.0 K,1.07 M☉,10.25 R☉,46.36 L☉,2.53 cgs,2.33 km/s,5.75 Gyr,False
3 Mon,,3,,40967,28574.0,06h 01m 50.43s,−10° 35′ 52.6″,4.92,−2.47,979.0,B5III,suspected variable,B5 III,15000.0 K,5.85 M☉,4.5 R☉,1105.0 L☉,,45.0 km/s,,False
27 Mon,,27,,65695,39079.0,07h 59m 44.18s,−03° 40′ 46.5″,4.93,0.51,250.0,K2III,,K2III,4568.0 K,1.28 M☉,13.41 R☉,148.283 L☉,2.4 cgs,1.76 km/s,3.87 Gyr,False
19 Mon,,19,V637,52918,33971.0,07h 02m 54.78s,−04° 14′ 21.3″,4.99,−2.68,1116.0,B1V,"β Cep variable, Vmax = 4.96m, Vmin = 5.01m, P = 0.19 d",B2Vn(e)or B1V,25400.0 K,12.3 M☉,9.0 R☉,4817.0 L☉,3.662 cgs,274.0 km/s,,False
2 Mon,,2,,40536,28325.0,05h 59m 04.31s,−09° 33′ 29.3″,5.04,0.02,328.0,A6m,,,,,,,,,,False
10 Mon,,10,,45546,30772.0,06h 27m 57.57s,−04° 45′ 43.7″,5.06,−3.03,1353.0,B2V,,,,,,,,,,False
25 Mon,,25,,61064,37088.0,07h 37m 16.73s,−04° 06′ 39.7″,5.13,1.18,202.0,F6III,"suspected δ Sct variable, ΔV = 0.01m",,,,,,,,,False
HR 2142,,,V696,41335,28744.0,06h 04m 13.50s,−06° 42′ 32.2″,5.19,−2.06,918.0,B2Vne+,unique variable,,,,,,,,,False
77 Ori,,(77),,45416,30717.0,06h 27m 13.76s,+00° 17′ 57.4″,5.19,−2.13,950.0,K1II,,,,,,,,,,False
7 Mon,,7,,44112,30073.0,06h 19m 42.80s,−07° 49′ 22.5″,5.27,−1.74,823.0,B2.5V,,,,,,,,,,False
β Mon B,β,11,,45726,,06h 28m 49.50s,−07° 02′ 04.0″,5.4,,,,Herschel's Wonder Star; component of the β Mon system,B4Veshell,18070.0 K,8.7 M☉,,3200.0 L☉,4.06 cgs,346.0 km/s,27.5 Myr,False
21 Mon,,21,V571,55057,34724.0,07h 11m 23.63s,−00° 18′ 06.9″,5.44,0.92,261.0,F2V,"δ Sct variable, Vmax = 5.43m, Vmin = 5.5m, P = 0.089 d",,,,,,,,,False
78 Ori,,(78),,45433,30720.0,06h 27m 15.59s,−00° 16′ 33.6″,5.55,−1.26,749.0,K5III,,,,,,,,,,False
β Mon C,β,,,45727,,06h 28m 49.50s,−07° 02′ 04.0″,5.6,,,,Herschel's Wonder Star; component of the β Mon system,B4Veshell,18070.0 K,8.7 M☉,,3200.0 L☉,4.06 cgs,346.0 km/s,27.5 Myr,False
U Mon,,,U,59693,36521.0,07h 30m 47.47s,−09° 46′ 36.8″,5.82,,2248.0,K0Ibpvar,"RV Tau variable, Vmax = 5.45m, Vmin = 7.67m, P = 91.32 d",F8eIb - K0pIb,5830.0 )K,2.0 M☉,100.3 R☉,5480.0 L☉,0.0 cgs,,,False
12 Mon,,12,,46241,31159.0,06h 32m 19.23s,+04° 51′ 21.6″,5.87,−0.12,517.0,K0V,"suspected variable, Vmax = 5.83m, Vmin = 5.87m",,,,,,,,,False
16 Mon,,16,,48977,32463.0,06h 46m 32.42s,+08° 35′ 13.8″,5.92,−1.75,1116.0,B2.5V,"53 Per variable, ΔV = 0.01m, P = 1.94 d",,,,,,,,,False
T Mon,,,T,44990,30541.0,06h 25m 13.00s,+07° 05′ 08.6″,5.98,,7762.0,K1Iabv SB,"classical Cepheid, Vmax = 5.58m, Vmin = 6.62m, P = 27.02 d",,,,,,,,,False
Plaskett's star,,,V640,47129,31646.0,06h 37m 24.04s,+06° 08′ 07.4″,6.05,−5.49,6618.0,O8I + O7.5III,"one of the most massive spectroscopic binaries known; unique variable, Vmax = 6.04m, Vmin = 6.08m",O8I + O7.5III,33500.0 K,54.0 M☉,14.2 R☉,224000.0 L☉,3.5 cgs,75.0 km/s,,False
V721 Mon,,,V721,44816,30407.0,06h 23m 35.92s,−09° 52′ 29.1″,6.11,−2.88,2050.0,K5,slow irregular variable,,,,,,,,,False
1 Mon,,1,V474,40535,28321.0,05h 59m 01.07s,−09° 22′ 56.1″,6.15,1.22,316.0,F2IV,δ Sct variable,,,,,,,,,False
HD 42536,,,V653,42536,29323.0,06h 11m 01.22s,−06° 45′ 15.1″,6.15,0.01,552.0,A0sp...,α2 CVn variable,,,,,,,,,False
HR 2517,,,V715,49567,32682.0,06h 49m 03.66s,+01° 00′ 07.5″,6.16,−2.75,1976.0,B3II-III,53 Per variable,,,,,,,,,False
V638 Mon,,,V638,42657,29401.0,06h 11m 43.72s,−04° 39′ 55.6″,6.18,−0.11,591.0,B9MNp...,"α2 CVn variable, Vmax = 6.16m, Vmin = 6.18m, P = 0.72 d",,,,,,,,,False
V731 Mon,,,V731,47240,31697.0,06h 37m 52.70s,+04° 57′ 24.0″,6.2,,4803.0,B1Ib,α Cyg variable,,,,,,,,,False
V689 Mon,,,V689,47432,31766.0,06h 38m 38.19s,+01° 36′ 48.7″,6.23,−3.86,3396.0,O9.5II,"α Cyg variable, Vmax = 6.19m, Vmin = 6.26m, P = 3.55 d",,,,,,,,,False
HD 49976,,,V592,49976,32838.0,06h 50m 42.31s,−08° 02′ 27.6″,6.31,1.29,330.0,A2p SrCrEu,"α2 CVn variable, Vmax = 6.16m, Vmin = 6.32m, P = 2.98 d",A2p Sr Cr Euor B9V,9016.0 K,2.21 M☉,2.3 R☉,32.0 L☉,4.04 cgs,2.976 days,209.0 Myr,False
V695 Mon,,,V695,65875,39172.0,08h 00m 44.14s,−02° 52′ 54.9″,6.42,−3.48,3105.0,B2.5Ve,"γ Cas variable, Vmax = 6.42m, Vmin = 6.53m",,,,,,,,,False
24 Mon,,24,,56003,35080.0,07h 15m 19.41s,−00° 09′ 40.7″,6.42,0.36,530.0,G5III,,,,,,,,,,False
14 Mon,,14,,46642,31385.0,06h 34m 46.33s,+07° 34′ 21.0″,6.44,1.21,362.0,A0Vs,suspected variable,,,,,,,,,False
9 Mon,,9,,45418,30700.0,06h 27m 00.88s,−04° 21′ 20.3″,6.5,−1.10,1079.0,B4V,,,,,,,,,,False
V569 Mon,,,V569,53755,34234.0,07h 05m 49.64s,−10° 39′ 36.3″,6.5,−3.68,3543.0,B0.5IVn,"β Cep variable, Vmax = 6.42m, Vmin = 6.53m, P = 0.27 d",,,,,,,,,False
IM Mon,,,IM,44701,30351.0,06h 23m 01.47s,−03° 16′ 37.1″,6.54,,991.0,B5V,β Lyr variable,,,,,,,,,False
V926 Mon,,,V926,52690,33891.0,07h 02m 06.73s,−03° 45′ 17.4″,6.62,,1920.0,M1Ib,"semiregular variable, Vmax = 6.50m, Vmin = 6.70m, P = 39 d",,,,,,,,,False
HD 50138,,,V743,50138,32923.0,06h 51m 33.40s,−06° 57′ 59.5″,6.67,,1280.0,B9e,"FS CMa variable, Vmax = 6.53m, Vmin = 6.87m",B6-7III-V[e],6391.0 K,6.0 M☉,7.0 R☉,103.0 L☉,4.63 cgs,1.81389 km/s,,False
ε Mon B,ε,,,44770,30422.0,06h 23m 46.50s,+04° 35′ 45.1″,6.72,4.79,79.0,F5V,component of the ε Mon system,A5 IV,7923.0 K,2.04 M☉,2.5 R☉,25.0 L☉,3.95 cgs,149.0 km/s,,False
6 Mon,,6,,43760,29885.0,06h 17m 35.13s,−10° 43′ 30.0″,6.76,−0.87,1094.0,F0e...,,,,,,,,,,False
AX Mon,,,AX,45910,31019.0,06h 30m 32.94s,+05° 52′ 01.2″,6.85,,12000.0,B2IIIe,"unique variable, Vmax = 6.59m, Vmin = 6.94m, P = 232.5 d",,,,,,,,,False
V Mon,,,V,44639,30326.0,06h 22m 43.50s,−02° 11′ 42.0″,6.87,,2194.0,M6e,"Mira variable, Vmax = 6m, Vmin = 13.9m, P = 340.5 d",,,,,,,,,False
V644 Mon,,,V644,51480,33436.0,06h 57m 09.38s,−10° 49′ 28.1″,6.93,,4900.0,Ape,"γ Cas variable, Vmax = 6.88m, Vmin = 6.98m",,,,,,,,,False
HD 53367,,,V750,53367,34116.0,07h 04m 25.53s,−10° 27′ 15.7″,6.96,,932.0,B0IV:e,"γ Cas variable, Vmax = 6.92m, Vmin = 7.22m",B0IV/Ve,28600.0 K,12.19 M☉,4.3 R☉,11000.0 L☉,4.27 cgs,,0.7 Myr,False
Gliese 282 A,,,V869,61606,37349.0,07h 39m 59.33s,−03° 35′ 51.0″,7.18,,46.33,K2V,"component of the Gliese 282 system; BY Dra variable, ΔV = 0.02m",K2V+ K7V+ M1.5Ve,4956.0 K,0.64 M☉,0.78 R☉,0.29 L☉,4.4 cgs,1.77 km/s,350.0 Myr,False
V505 Mon,,,V505,48914,32397.0,06h 45m 49.98s,+02° 29′ 57.4″,7.22,,2170.0,B5Ib,"β Lyr variable, Vmax = 7.15m, Vmin = 7.65m, P = 53.78 d",,,,,,,,,False
V614 Mon,,,V614,52432,33794.0,07h 01m 01.95s,−03° 15′ 09.1″,7.27,,1550.0,C...,"semiregular variable, Vmax = 7.01m, Vmin = 7.36m, P = 60 d",,,,,,,,,False
HD 59435,,,V827,59435,36419.0,07h 29m 35.45s,−09° 15′ 33.3″,7.97,,1210.0,A5p,"α2 CVn variable, Vmax = 7.97m, Vmin = 7.99m, P = 3.59 d",,,,,,,,,False
HD 45583,,,V682,45583,30789.0,06h 28m 10.76s,−04° 53′ 56.5″,7.97,,962.0,B9,α2 CVn variable,,,,,,,,,False
HD 46380,,,V728,46380,31199.0,06h 32m 43.23s,−07° 30′ 32.3″,8.0,,1480.0,B2Vne,Be star,,,,,,,,,False
V753 Mon,,,V753,54975,34684.0,07h 10m 57.85s,−03° 52′ 43.2″,8.27,,605.0,A8V,"Algol variable, Vmax = 8.30m, Vmin = 8.81m, P = 0.68 d",,,,,,,,,False
V723 Mon,,,V723,45762,30891.0,06h 29m 04.66s,−05° 34′ 20.2″,8.28,,1700.0,G0II,"Long period variable, potential black hole binary",G0II,3800.0 K,0.44 M☉,22.5 R☉,105.0 L☉,1.3 cgs,15.0 km/s,5.4 Gyr,False
SV Mon,,,SV,44320,30219.0,06h 21m 26.30s,+06° 28′ 12.6″,8.28,,,G7II...,"classical Cepheid, Vmax = 7.61m, Vmin = 8.88m, P = 15.23 d",,,,,,,,,False
HD 47755,,,V684,47755,,06h 40m 38.30s,+09° 47′ 15.8″,8.41,,,B4,"Algol variable, Vmax = 8.32m, Vmin = 8.41m, P = 1.85 d",,,,,,,,,False
UX Mon,,,UX,65607,39042.0,07h 59m 16.38s,−07° 30′ 17.9″,8.42,,5500.0,A3,"Algol and δ Sct variable, Vmax = 8.22m, Vmin = 9.16m, P = 5.90 d",,,,,,,,,False
AU Mon,,,AU,50846,33237.0,06h 54m 54.71s,−01° 22′ 32.8″,8.43,,,B5IV + F8-G0III-II,"double periodic or Algol variable, Vmax = 8.20m, Vmin = 9.16m, P = 11.11 d",,,,,,,,,False
HD 47732,,,V641,47732,31939.0,06h 40m 28.59s,+09° 49′ 04.3″,8.46,,2190.0,B3Vnn...,"rotating ellipsoidal variable, ΔV = 0.07m, P = 1.32 d",,,,,,,,,False
V578 Mon,,,V578,259135,,06h 32m 00.61s,+04° 52′ 40.9″,8.55,,,B1:V:n,"Algol variable, Vmax = 8.54m, Vmin = 8.57m, P = 2.41 d",,,,,,,,,False
HD 259431,,,V700,259431,31235.0,06h 33m 05.19s,+10° 19′ 20.0″,8.72,,564.0,B6ep,"Orion variable, Vmax = 8.62m, Vmin = 8.91m",B6e,14125.0 K,6.6 M☉,6.63 R☉,1550.0 L☉,,90.0 km/s,0.32 Myr,False
AR Mon,,,AR,57364,35600.0,07h 20m 48.45s,−05° 15′ 35.8″,8.79,,962.0,K0II,"RS CVn variable, Vmax = 8.62m, Vmin = 9.47m, P = 21.21 d",,,,,,,,,False
HD 44179,,,V777,44179,30089.0,06h 19m 58.22s,−10° 38′ 14.7″,8.94,,1245.0,B8V,"central star of Red Rectangle Nebula; re-radiating binary system, Vmax = 8.78m, Vmin = 8.94m, P = 320 d",,,,0.14 ly,,,,,False
HD 49330,,,V739,49330,32586.0,06h 47m 57.27s,+00° 46′ 34.0″,8.95,,1460.0,B0.5IVe,"γ Cas variable, Vmax = 8.72m, Vmin = 9.02m",,,,,,,,,False
FU Mon,,,FU,44544,30301.0,06h 22m 23.85s,+03° 25′ 27.9″,9.06,,2490.0,S6.5/7.5,semiregular variable,,,,,,,,,False
TU Mon,,,TU,,38523.0,07h 53m 19.75s,−03° 02′ 31.1″,9.24,,1960.0,B5V + F3,Algol variable,,,,,,,,,False
RW Mon,,,RW,259986,31383.0,06h 34m 45.89s,+08° 49′ 32.18″,9.32,,738.0,B8V + G5IV,"Algol variable, Vmax = 9.26m, Vmin = 11.51m, P = 1.91 d",,,,,,,,,False
VV Mon,,,VV,,34003.0,07h 03m 18.29s,−05° 44′ 15.5″,9.4,,434.0,G0,"RS CVn variable, Vmax = 9.4m, Vmin = 9.95m, P = 6.05 d",,,,,,,,,False
BX Mon,,,BX,,,07h 25m 22.78s,−03° 35′ 15.8″,9.5,,,M5IIIpe,"Z And variable, Vmax = 9.5m, Vmin = 12.5m, P = 1259 d",,,,,,,,,False
PZ Mon,,,PZ,289114,32621.0,06h 48m 21.07s,+01° 13′ 08.3″,9.6,,2080.0,K2Ve,irregular variable,,,,,,,,,False
V694 Mon,,,V694,,,07h 25m 51.29s,−07° 44′ 08.1″,9.7,,1550.0,C...,"Z And variable, Vmax = 9.2m, Vmin = 11.4m, P = 1931 d",M4ep + Beq,13000.0 K,1.0 M☉,6221.0 km,3000.0 L☉,,,,False
AO Mon,,,AO,53883,34299.0,07h 06m 36.30s,−04° 37′ 24.5″,9.72,,,B3 + B5,"Algol and δ Sct variable, Vmax = 9.6m, Vmin = 10.23m, P = 1.88 d",,,,,,,,,False
V588 Mon,,,V588,261331,,06h 39m 05.90s,+09° 41′ 03.4″,9.75,,,A7III/IV,"δ Sct variable, Vmax = 9.66m, Vmin = 9.72m, P = 0.11 d",,,,,,,,,False
V372 Mon,,,V372,,,06h 41m 26.13s,−04° 35′ 45.8″,9.81,,,SC7/7.5,semiregular variable,,,,,,,,,False
CV Mon,,,CV,,31624.0,06h 37m 04.84s,+03° 03′ 50.2″,9.9,,,,"in C0634+031; classical Cepheid, Vmax = 9.9m, Vmin = 10.7m, P = 5.38 d",,,,,,,,,False
V589 Mon,,,V589,261446,,06h 39m 28.46s,+09° 42′ 04.1″,10.27,,,F2III,"δ Sct variable, ΔV = 0.05m, P = 0.12 d",,,,,,,,,False
BE Mon,,,BE,,31905.0,06h 40m 05.58s,+07° 36′ 21.0″,10.5,,,G5,"classical Cepheid, Vmax = 10.19m, Vmin = 10.88m, P = 2.71 d",,,,,,,,,False
RU Mon,,,RU,,33163.0,06h 54m 12.31s,−07° 35′ 45.0″,10.51,,,B9pv + B7V + B7.2V,"Algol variable, Vmax = 10.33m, Vmin = 11.18m, P = 3.58 d",,,,,,,,,False
CL Mon,,,CL,,,06h 55m 36.70s,+06° 22′ 43.3″,11.0,,,C...,"Mira variable, Vmax = 8.1m, Vmin = 13.0m, P = 493 d",,,,,,,,,False
Ross 614,,,V577,,30920.0,06h 29m 23.40s,−02° 48′ 50.3″,11.08,13.01,13.4,M4.5V + M8V,binary star; one component is a flare star,M4.5V,3193.0 K,0.2228 M☉,0.238 R☉,0.007 L☉,,2.72 days,,False
DD Mon,,,DD,292319,,06h 45m 57.83s,−00° 07′ 31.9″,,,,G0,Algol variable,,,,,,,,,False
A0620-00,,,V616,,,06h 22m 44.50s,−00° 20′ 44.7″,11.2,,,K3V-K7V,"X-ray nova and rotating ellipsoidal variable, Vmax = 11.0m, Vmin = 18.3m, P = 0.32 d",K2 V,5000.0 K,5.86 M☉,1.057 R☉,0.44 L☉,5.0 cgs,83.8 km/s,,False
CS Mon,,,CS,,,06h 32m 10.94s,+06° 39′ 11.0″,11.25,,,,"classical Cepheid, Vmax = 10.71m, Vmin = 11.3m, P = 6.73 d",,,,,,,,,False
R Mon,,,R,,,06h 39m 09.95s,+08° 44′ 10.8″,11.85,,,B0,in NGC 2261; Orion variable,B8IIIev,,10.0 M☉,,,,,105.0 yryears,False
BN Mon,,,BN,,,06h 21m 58.00s,+07° 20′ 57.7″,12.7,,,Nv...,semiregular variable,,,,,,,,,False
V396 Mon,,,V396,,,06h 38m 36.48s,+03° 36′ 17.1″,,,,,W UMa variable,,,,,,,,,False
V590 Mon,,,V590,,,06h 40m 44.64s,+09° 48′ 02.1″,12.88,,,B7,Orion variable,,,,,,,,,False
VY Mon,,,VY,,,06h 31m 06.92s,+10° 26′ 05.0″,13.7,,,B8,UX Ori star,,,,,,,,,False
BT Mon,,,BT,,,06h 43m 47.24s,−02° 01′ 13.9″,15.4,,,G5V,"nova and Algol variable, Vmax = 4.5m, Vmin = 16.4m, P = 0.33 d",D/G8V,,0.87 M☉,,,,138.0 km/s,,False
V838 Mon,,,V838,,,07h 04m 04.85s,−03° 50′ 51.1″,15.74,,20000.0,M6I/III + B3V,"luminous red nova, Vmax = 6.7m, Vmin = 16.05m",M7.5I -> M5.5I + B3V,3300.0 K,10.0 M☉,464.0 R☉,23000.0 L☉,,,4.0 Myr,False
CW Mon,,,CW,,,06h 36m 54.58s,+00° 02′ 17.3″,17.2,,5500.0,A3,"SS Cyg variable, Vmax = 11.9m, Vmin = 17.2m, P = 0.18 d",,,,,,,,,False
]]

return M
