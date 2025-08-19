local M = {}
M.csv = [[
Name,B,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
Canopus,α,,45348,30438.0,06h 23m 57.09s,−52° 41′ 44.6″,−0.72,−5.53,313.0,A9 II,Suhel; 2nd brightest star,A9 II,7400.0 K,9.81 M☉,73.3 R☉,16600.0 L☉,1.7 cgs,298.0 d,34.0 Myr,True
β Car,β,,80007,45238.0,09h 13m 12.24s,−69° 43′ 02.9″,1.67,−0.99,111.0,A1 III,Miaplacidus,A1III,9150.0 K,3.88 M☉,5.82 R☉,223.0 L☉,3.5 cgs,145.7 km/s,260.0 Myr,True
ε Car,ε,,71129,41037.0,08h 22m 30.86s,−59° 30′ 34.3″,1.86,−4.58,632.0,K3III+B2V,"Avior; suspected eclipsing binary, Vmax = 1.82m, Vmin = 1.94m",K3 III+ B2 Vp,4460.0 K,10.5 M☉,151.0 R☉,8128.0 L☉,,,31.2 Myr,True
ι Car,ι,,80404,45556.0,09h 17m 05.43s,−59° 16′ 30.9″,2.23,−4.43,692.0,A8Ib,"Aspidiske, Turais, Scutulum; suspected variable, Vmax = 2.23m, Vmin = 2.28m",A7 Ib,7700.0 K,6.9 M☉,50.1 R☉,4900.0 L☉,1.85 cgs,10.0 km/s,56.0 Myr,True
θ Car,θ,,93030,52419.0,10h 42m 57.43s,−64° 23′ 40.1″,2.74,−2.91,439.0,B0Vp,in IC 2602,B0.5 Vp,31000.0 K,14.9 M☉,5.1 R☉,14500.0 L☉,4.2 cgs,108.0 km/s,46.0 Myr,True
υ Car,υ,,85123,48002.0,09h 47m 06.14s,−65° 04′ 19.3″,2.92,−5.56,1622.0,A9,binary star,A8 Ib + B7 III,7500.0 K,10.88 M☉,100.0 R☉,,1.4 cgs,,23.4 Myr,True
ω Car,ω,,89080,50099.0,10h 13m 44.28s,−70° 02′ 16.5″,3.29,−1.99,370.0,B8III,,B8 IIIe,11630.0 K,4.9 M☉,7.2 R☉,918.0 L☉,3.51 cgs,240.0 km/s,,True
p Car,p,PP,91465,51576.0,10h 32m 01.48s,−61° 41′ 07.3″,3.30,−2.62,497.0,B4Vne,"γ Cas variable, Vmax = 3.22m, Vmin = 3.55m",B4 Vne,17410.0 K,7.6 M☉,7.95 R☉,5212.0 L☉,2.96 cgs,280.0 km/s,39.8 Myr,True
V337 Car,q,V337,89388,50371.0,10h 17m 05.01s,−61° 19′ 56.4″,3.39,−3.38,736.0,K3II,"irregular variable, Vmax = 3.36m, Vmin = 3.44m",K2.5II,4118.0 K,9.0 M☉,128.0 R☉,3236.0 L☉,1.36 cgs,,45.5 Myr,True
a Car,a,V357,79351,45080.0,09h 10m 58.11s,−58° 58′ 00.9″,3.43,−2.11,418.0,B2IV,"eclipsing binary, Vmax = 3.41m, Vmin = 3.44m",B2IV-V,19150.0 K,8.18 M☉,5.8 R☉,4000.0 L☉,4.0 cgs,,18.7 Myr,False
χ Car,χ,,65575,38827.0,07h 56m 46.74s,−52° 58′ 56.6″,3.46,−1.91,387.0,B3IVp,"β Cep variable, ΔV = 0.015m, P = 0.10 d",B3IVp,17200.0 K,7.0 M☉,5.5 R☉,2266.0 L☉,3.5 cgs,110.0 km/s,39.8 Myr,False
l Car,l,,84810,47854.0,09h 45m 14.83s,−62° 30′ 28.5″,3.69,−4.64,1509.0,G5Iab/Ib,"classical Cepheid, Vmax = 3.28m, Vmin = 4.18m, P = 35.54 d",G5 Iab/Ib;F6Ib-K0Ib,5000.0 K,8.66 M☉,169.0 R☉,11482.0 L☉,1.5 cgs,,31.25 Myr,False
HD 94510,u,,94510,53253.0,10h 53m 29.57s,−58° 51′ 11.8″,3.78,1.42,97.0,K0III-IV...,"suspected variable, Vmax = 3.75m, Vmin = 3.80m",K0IVor K1III,5006.0 K,1.9 M☉,6.9 R☉,26.85 L☉,3.02 cgs,,,False
HD 90853,s,,90853,51232.0,10h 27m 52.75s,−58° 44′ 21.9″,3.81,−3.71,1042.0,F2II,suspected variable,F2IIor F0Ib,6598.0 K,7.0 M☉,45.05 R☉,3466.0 L☉,1.5 cgs,22.0 km/s,100.0 Myr,False
HD 76728,c,,76728,43783.0,08h 55m 02.86s,−60° 38′ 41.0″,3.84,−1.06,312.0,B8III,double star,B8/9II,13180.0 K,,4.057 R☉,446.0 L☉,,,,False
V382 Car,x,V382,96918,54463.0,11h 08m 35.40s,−58° 58′ 30.2″,3.93,−7.37,5927.0,G0Ia0,"hypergiant; slow irregular variable, Vmax = 3.77m, Vmin = 4.05m",G0-4-Ia+,5625.0 K,24.0 M☉,485.0 R☉,212000.0 L☉,0.5 cgs,,6.8 Myr,False
HD 79447,i,,79447,45101.0,09h 11m 16.77s,−62° 19′ 01.3″,3.96,−1.97,499.0,B3IV,"variable star, ΔV = 0.008m, P = 22.26 d",B3V,18900.0 K,7.0 M☉,5.6 R☉,2054.17 L☉,3.5 cgs,0.0 km/s,39.2 Myr,False
HD 90589,I,,90589,50954.0,10h 24m 23.74s,−74° 01′ 53.6″,3.99,2.94,53.0,F2IV,"suspected variable, Vmax = 3.96m, Vmin = 4.00m",F3 V,6889.0 K,1.46 M☉,1.61 R☉,5.24 L☉,4.34 cgs,51.6 km/s,1.34 Gyr,False
HD 83183,h,,83183,46974.0,09h 34m 26.66s,−59° 13′ 47.2″,4.08,−4.83,1976.0,B5II,,B5 II,14300.0 K,9.4 M☉,18.0 R☉,11634.0 L☉,2.5 cgs,19.0 km/s,24.5 Myr,False
V343 Car,d,V343,74375,42568.0,08h 40m 37.04s,−59° 45′ 39.7″,4.31,−3.87,1411.0,B1.5III,β Cep variable,B1.5III,27600.0 K,12.5 M☉,,6322.92 L☉,,,15.7 Myr,False
HD 80230,g,,80230,45496.0,09h 16m 12.10s,−57° 32′ 29.2″,4.34,−1.74,536.0,M1III,"suspected variable, Vmax = 4.31m, Vmin = 4.35m",M0.5IIIa,3904.0 K,2.2 M☉,74.86 R☉,1172.0 L☉,0.95 cgs,,,False
HD 47306,N,,47306,31407.0,06h 34m 58.59s,−52° 58′ 32.3″,4.35,−4.31,1762.0,B9III,,A0IIor B9III,9738.0 K,5.1 M☉,20.0 R☉,3249.0 L☉,2.5 cgs,47.0 km/s,87.0 Myr,False
HR 2554,A,V415,50337,32761.0,06h 49m 51.32s,−53° 37′ 21.0″,4.39,−1.74,553.0,G6II,"Algol variable, ΔV = 0.06m",G6II + A1V,4981.0 K,3.14 M☉,31.3 R☉,537.0 L☉,1.94 cgs,,,False
HD 91942,r,,91942,51849.0,10h 35m 35.31s,−57° 33′ 27.5″,4.45,−3.68,1376.0,K3/K4II,suspected variable,K3II-IIb,3983.0 K,8.1 M☉,155.5 R☉,5485.0 L☉,2.0 cgs,5.8 km/s,35.7 Myr,False
η Car,η,,93308,,10h 45m 03.60s,−59° 41′ 03.0″,4.47,,7500.0,LBV,"Foramen, Tseen She; in Trumpler 16; binary star; luminous blue variable, Vmax = −0.8m, Vmin = 7.9m; surrounded by the Homunculus Nebula; one of the most luminous and most massive stars known.",variable(LBV) +O (WR?),35200.0 K,100.0 M☉,742.0 )R☉,4.1 million)L☉,,,<3.0 Myr,False
HR 3643,G,,78791,44599.0,09h 05m 08.83s,−72° 36′ 09.7″,4.47,−1.25,454.0,F6II-III,,F8II+ DA1.6,6030.0 K,0.74 M☉,13.15 R☉,206.2 L☉,7.47 cgs,53.0 km/s,25.0 Myr,False
V344 Car,f,V344,75311,43105.0,08h 46m 42.56s,−56° 46′ 11.3″,4.50,−1.62,546.0,B3Vne,"γ Cas variable, Vmax = 4.40m, Vmin = 4.51m",B3V(n),17660.0 K,7.1 M☉,3.0 R☉,2328.0 L☉,3.79 cgs,268.0 km/s,31.6 Myr,False
HD 83944,m,,83944,47391.0,09h 39m 21.04s,−61° 19′ 41.2″,4.51,0.33,224.0,B9V,suspected variable,B9IV/V,11561.0 K,2.75 M☉,,,4.33 cgs,51.0 km/s,15.0 Myr,False
V520 Car,w,V520,93070,52468.0,10h 43m 32.31s,−60° 33′ 59.9″,4.58,−2.99,1065.0,K3Ib,"irregular variable, Vmax = 4.50m, Vmin = 4.59m",K4III,12758.0 K,7.9 M☉,217.0 R☉,3745.0 L☉,,,33.3 Myr,False
V533 Car,y,V533,97534,54751.0,11h 12m 36.02s,−60° 19′ 03.5″,4.59,−8.34,12538.0,A6Ia,α Cyg variable,A5Iae:,8330.0 K,17.0 M☉,245.0 R☉,96000.0 L☉,,34.0 km/s,,False
HD 96566,z1,,96566,54301.0,11h 06m 32.47s,−62° 25′ 26.9″,4.62,−0.65,370.0,G8III,,G7.5III,4913.0 K,3.6 M☉,20.21 R☉,214.4 L☉,2.59 cgs,,,False
V399 Car,P,V399,90772,51192.0,10h 27m 24.48s,−57° 38′ 19.7″,4.65,,,A6Ia,"semiregular variable, Vmax = 4.63m, Vmin = 4.72m, P = 88.3 d",A5Iaeor F0Ia,8000.0 K,22.6 M☉,206.0 R☉,73000.0 L☉,1.0 cgs,,12.0 Myr,False
V345 Car,E,V345,78764,44626.0,09h 05m 38.38s,−70° 32′ 18.7″,4.67,−2.94,1079.0,B2IVe,"γ Cas variable, Vmax = 4.67m, Vmin = 4.78m, P = 137.7 d",B2(IV)n,19000.0 K,9.6 M☉,8.7 R☉,2539.73 L☉,3.8 cgs,140.0 km/s,20.4 Myr,False
HD 92397,t2,,92397,52102.0,10h 38m 45.01s,−59° 10′ 58.8″,4.69,−4.08,1852.0,K4/K5III:,suspected variable,K4.5Ib-II,3900.0 K,11.9 M☉,202.0 R☉,8478.0 L☉,,,16.4 Myr,False
HD 91375,K,,91375,51438.0,10h 30m 20.08s,−71° 59′ 33.8″,4.72,0.22,259.0,A2III,,A1V,9161.0 K,2.3 M☉,3.43 R☉,75.0 L☉,3.73 cgs,3.2 days,403.0 Myr,False
HR 3220,B,,68456,39903.0,08h 09m 00.86s,−61° 18′ 06.1″,4.74,3.09,70.0,F5V,,F6 V Fe-0.8 CH-0.4,6491.0 K,1.35 M☉,1.5 R☉,3.6 L☉,4.12 cgs,8.8 km/s,10.0 Gyr,False
V518 Car,,V518,92938,52370.0,10h 42m 14.14s,−64° 27′ 59.2″,4.76,−0.97,456.0,B3V,in IC 2602; γ Cas variable,B3/5V,15397.0 K,6.2 M☉,3.3 R☉,753.0 L☉,4.015 cgs,120.0 km/s,17.2 Myr,False
HD 81101,k,,81101,45856.0,09h 20m 56.83s,−62° 24′ 16.7″,4.79,0.62,223.0,G6III,,G6III,4908.0 K,1.95 M☉,11.19 R☉,65.4 L☉,2.72 cgs,,2.04 Gyr,False
HD 66591,D,,66591,39138.0,08h 00m 19.97s,−63° 34′ 03.0″,4.81,−1.29,542.0,B3V,suspected variable,B4V,16983.0 K,6.3 M☉,3.77 R☉,912.0 L☉,4.03 cgs,43.0 km/s,176.0 Myr,False
HD 73389,e2,,73389,42134.0,08h 35m 19.65s,−58° 00′ 33.5″,4.84,0.60,229.0,K0III,,K0III,4903.0 K,,11.13 R☉,64.4 L☉,,,,False
HD 61248,Q,,61248,36942.0,07h 35m 39.70s,−52° 32′ 01.7″,4.93,−0.48,394.0,K3III,suspected variable,K3 III,4289.0 K,1.1 M☉,30.27 R☉,279.3 L☉,1.51 cgs,,860.0 Myr,False
V376 Car,b1,V376,77002,43937.0,08h 56m 58.43s,−59° 13′ 45.7″,4.93,−1.47,621.0,B2IV-V,"β Cep variable, Vmax = 4.91m, Vmin = 4.96m, P = 0.021 d",B2V+ B9.5V,21150.0 K,7.8 M☉,,2998.0 L☉,,,12.5 Myr,False
HD 90264,L,,90264,50847.0,10h 22m 58.18s,−66° 54′ 05.5″,4.97,−0.63,430.0,B8V,,B8V,,4.3 M☉,,288.39 L☉,,7.0 km/s,18.0 Myr,False
HD 92063,t1,,92063,51912.0,10h 36m 20.56s,−59° 33′ 51.5″,5.08,0.50,269.0,K1III,,K1III,4520.0 K,1.2 M☉,13.85 R☉,72.1 L☉,2.25 cgs,<1.2 km/s,,False
HD 96919,z2,V371,96919,54461.0,11h 08m 34.01s,−61° 56′ 49.8″,5.12,−6.03,5525.0,B9Ia,"α Cyg variable, Vmax = 5.12m, Vmin = 5.19m",B9 Iae,12500.0 K,23.0 M☉,141.0 R☉,105000.0 L☉,1.5 cgs,60.0 km/s,,False
V386 Car,,V386,54118,34105.0,07h 04m 18.32s,−56° 44′ 59.0″,5.14,0.45,282.0,A0p:,"α2 CVn variable, ΔV = 0.026m, P = 3.28 d",,,,,,,,,False
HD 88981,M,,88981,50083.0,10h 13m 30.68s,−66° 22′ 22.2″,5.15,0.31,304.0,Am,,kA8 mF4 III,7706.0 K,2.14 M☉,4.45 R☉,62.9 L☉,3.52 cgs,60.0 km/s,,False
HD 69863,C,,69863,40429.0,08h 15m 15.95s,−62° 54′ 56.2″,5.16,0.81,242.0,A+...,binary star,A2V+ F2V,8774.0 K,2.1 M☉,1.43 R☉,42.0 L☉,3.9 cgs,191.0 km/s,635.0 Myr,False
HD 77370,b2,,77370,44143.0,08h 59m 24.38s,−59° 05′ 03.8″,5.17,3.08,85.0,F3V,,F4V,6699.0 K,1.45 M☉,1.67 R☉,4.834 L☉,4.18 cgs,60.4 km/s,1.3 Gyr,False
HR 3153,,V460,66342,39070.0,07h 59m 37.55s,−60° 35′ 13.5″,5.19,−2.34,1045.0,M0II,"in NGC 2516; semiregular variable, Vmax = 5.15m, Vmin = 5.3m",,,,,,,,,False
V524 Car,,V524,94367,53154.0,10h 52m 30.85s,−57° 14′ 25.5″,5.26,−6.08,6037.0,B9Ia,α Cyg variable,,,,,,,,,False
HD 73390,e1,,73390,42129.0,08h 35m 15.58s,−58° 13′ 29.1″,5.27,−2.08,962.0,B3V+...,,B4V,16571.0 K,7.0 M☉,3.9 R☉,1159.86 L☉,4.5 cgs,155.0 km/s,36.1 Myr,False
HD 92964,,V519,92964,52405.0,10h 42m 40.57s,−59° 12′ 56.8″,5.36,−6.23,6792.0,B2.5Ia,"α Cyg variable, Vmax = 5.32m, Vmin = 5.43m, P = 14.68 d",,,,,,,,,False
HD 83095,H,,83095,46741.0,09h 31m 36.32s,−73° 04′ 51.3″,5.46,−1.47,791.0,K4III,,K4III,4038.0 K,1.3 M☉,59.0 R☉,826.0 L☉,1.52 cgs,,,False
HD 92207,,V370,92207,52004.0,10h 37m 27.08s,−58° 44′ 00.0″,5.47,−6.52,8150.0,A0Ia,"α Cyg variable, Vmax = 5.45m, Vmin = 5.52m, P = 1.33 d",,,,,,,,,False
V450 Car,,V450,53921,34000.0,07h 03m 15.11s,−59° 10′ 41.3″,5.50,−0.35,482.0,B9IV,"53 Per variable, ΔV = 0.02m",,,,,,,,,False
HD 92664,,V364,92664,52221.0,10h 40m 11.46s,−65° 06′ 00.9″,5.51,−0.26,466.0,B9p Si,"α2 CVn variable, Vmax = 5.48m, Vmin = 5.52m, P = 1.67 d",,,,,,,,,False
V448 Car,O,V448,49877,32531.0,06h 47m 18.71s,−55° 32′ 24.2″,5.60,−0.72,598.0,K5III,semiregular variable,K5III,3974.0 K,1.73 M☉,50.9 R☉,582.2 L☉,,,2.85 Gyr,False
V372 Car,,V372,64722,38438.0,07h 52m 29.75s,−54° 22′ 01.9″,5.69,−2.56,1462.0,B1.5IV,"β Cep variable, ΔV = 0.027m, P = 0.12 d",B1.5IV,21429.0 K,8.3 M☉,6.97 R☉,4236.0 L☉,3.65 cgs,155.0 km/s,15.8 Myr,False
HD 88661,,QY,88661,49934.0,10h 11m 46.47s,−58° 03′ 38.0″,5.70,−2.29,1294.0,B2IVnpe,"γ Cas variable, Vmax = 5.63m, Vmin = 5.83m",,,,,,,,,False
S Car,,S,88366,49751.0,10h 09m 22.01s,−61° 32′ 57.1″,5.71,,1780.0,K5-M6e,"Mira variable, Vmax = 4.5m, Vmin = 9.9m, P = 149.49 d",K5e - M6e,3590.0 K,0.6 M☉,120.0 R☉,2200.0 L☉,1.0 cgs,,,False
HD 66194,,V374,66194,38994.0,07h 58m 50.56s,−60° 49′ 28.2″,5.77,−1.72,1028.0,B2IVnpe,"in NGC 2516; γ Cas variable, Vmax = 5.72m, Vmin = 5.84m",,,,,,,,,False
V482 Car,,V482,82536,46620.0,09h 30m 23.45s,−58° 21′ 42.9″,5.88,−1.68,1058.0,M2III,semiregular variable,,,,,,,,,False
V514 Car,,V514,92287,52043.0,10h 38m 02.66s,−57° 15′ 22.7″,5.89,−2.08,1278.0,B3IV,"rotating ellipsoidal variable, Vmax = 5.88m, Vmin = 5.92m, P = 2.90 d",,,,,,,,,False
T Car,,T,94776,53394.0,10h 55m 17.26s,−60° 31′ 01.9″,5.93,1.07,306.0,K0III,not variable,K0III,4976.0 K,2.7 M☉,9.0 R☉,44.0 L☉,2.85 cgs,2.2 km/s,502.0 Myr,False
V522 Car,,V522,93737,52827.0,10h 48m 05.42s,−59° 55′ 09.0″,5.98,,,A0Ia,α Cyg variable,,,,,,,,,False
V390 Car,,V390,61966,37248.0,07h 39m 00.34s,−53° 16′ 24.2″,6.06,−0.05,544.0,B9IV-Vp...,"α2 CVn variable, ΔV = 0.004m",,,,,,,,,False
V535 Car,,V535,98292,55140.0,11h 17m 19.02s,−67° 49′ 24.6″,6.06,−2.52,1698.0,M2III,slow irregular variable,,,,,,,,,False
R Car,,R,82901,46806.0,09h 32m 14.60s,−62° 47′ 20.0″,6.10,,416.0,M6.5 IIIpev,"Mira variable, Vmax = 3.9m, Vmin = 10.5m, P = 308.71 d",M6/7pe,2800.0 K,0.87 M☉,2020.0 )R☉,4571.0 L☉,,,,False
HD 91619,,V369,91619,51676.0,10h 33m 25.40s,−58° 11′ 24.6″,6.11,−6.99,13583.0,B7Ia,"α Cyg variable, ΔV = 0.1m, P = 1.12 d",,,,,,,,,False
U Car,,U,95109,53589.0,10h 57m 48.19s,−59° 43′ 55.9″,6.11,,,G3Ia,"classical Cepheid, Vmax = 5.74m, Vmin = 6.96m, P = 38.83 d",F6-G7 Iab,5980.0 K,11.7 M☉,187.0 R☉,26642.0 L☉,1.2 cgs,,29.0 Myr,False
V461 Car,,V461,66546,39225.0,08h 01m 23.05s,−54° 30′ 56.0″,6.12,−1.92,1320.0,B2IV-V,Algol variable,,,,,,,,,False
V478 Car,,V478,80710,45615.0,09h 17m 51.67s,−67° 03′ 03.2″,6.14,−1.96,1358.0,K2III,semiregular variable,,,,,,,,,False
V492 Car,,V492,86659,48782.0,09h 56m 59.84s,−69° 06′ 06.6″,6.18,−1.43,1087.0,B3V,53 Per variable,,,,,,,,,False
V655 Car,,V655,91272,51425.0,10h 30m 08.81s,−66° 59′ 04.8″,6.19,−1.70,1235.0,B4IV,"Algol variable, Vmax = 6.19m, Vmin = 6.36m, P = 16.93 d",,,,,,,,,False
V532 Car,,V532,97451,54708.0,11h 12m 03.60s,−58° 25′ 24.1″,6.24,−0.53,736.0,M4III,semiregular variable,,,,,,,,,False
HD 65750,,V341,65750,38834.0,07h 56m 50.70s,−59° 07′ 35.0″,6.25,,967.0,M0III,"semiregular variable, Vmax = 6.2m, Vmin = 7.1m",M1 II,3640.0 K,3.6 M☉,121.0 R☉,2297.0 L☉,0.6 cgs,,,False
υ Car B,υ,,85124,,09h 47m 06.70s,−65° 04′ 21.0″,6.26,,1623.0,A8 Ib,component of the υ Car system,A8 Ib + B7 III,7500.0 K,10.88 M☉,100.0 R☉,,1.4 cgs,,23.4 Myr,False
V375 Car,,V375,67536,39530.0,08h 04m 42.94s,−62° 50′ 10.9″,6.29,,1249.0,B2.5Vn,"β Cep variable, ΔV = 0.04m, P = 1.02 d",,,,,,,,,False
QZ Car,,QZ,93206,52526.0,10h 44m 22.92s,−59° 59′ 36.0″,6.32,−3.23,2650.0,B0Ib:,"in Collinder 228; β Lyr variable, Vmax = 6.16m, Vmin = 6.49m, P = 6.00 d",A1: O9.7IA2: B2VB1: O8IIIB2: O9VAd: A3V,30463.0 K,69.8 M☉,22.1 R☉,400000.0 L☉,3.2 cgs,,9.7 Myr,False
V486 Car,,V486,84416,47591.0,09h 42m 12.99s,−66° 54′ 53.4″,6.33,0.04,592.0,A0V,β Lyr variable,,,,,,,,,False
WR 22,,V429,92740,52308.0,10h 41m 17.52s,−59° 40′ 36.9″,6.35,−4.72,5344.0,WN7 + A(SB1),"Wolf–Rayet star and Algol variable, Vmax = 6.33m, Vmin = 6.52m, P = 80.34 d; one of the most luminous stars known",WN7h + O9III-V,44700.0 K,75.0 M☉,22.65 R☉,1905000.0 L☉,,,2.2 Myr,False
V473 Car,,V473,76640,43763.0,08h 54m 54.05s,−58° 14′ 22.9″,6.36,−0.77,869.0,B5V,53 Per variable,,,,,,,,,False
V368 Car,,V368,88647,49926.0,10h 11m 35.49s,−58° 49′ 40.2″,6.40,,801.0,M3III,"semiregular variable, Vmax = 6.1m, Vmin = 6.4m",,,,,,,,,False
V507 Car,,V507,90966,51265.0,10h 28m 18.28s,−63° 09′ 52.5″,6.42,−2.56,2037.0,B2/B3III:ne,Be star,,,,,,,,,False
V469 Car,,V469,72303,41644.0,08h 29m 29.82s,−54° 12′ 42.5″,6.44,−0.28,720.0,Ap Si,α2 CVn variable,,,,,,,,,False
V495 Car,,V495,88158,49642.0,10h 07m 56.64s,−62° 13′ 17.2″,6.45,−0.55,817.0,Ap Si,α2 CVn variable,,,,,,,,,False
V487 Car,,V487,84809,47893.0,09h 45m 40.64s,−57° 11′ 09.8″,6.47,−0.66,869.0,B8III/IV,α2 CVn variable,,,,,,,,,False
HD 96248,,V414,96248,54179.0,11h 04m 57.57s,−59° 51′ 32.0″,6.58,,3700.0,B1Iab,"α Cyg variable, Vmax = 6.53m, Vmin = 6.62m, P = 8.52 d",,,,,,,,,False
QX Car,,QX,86118,48589.0,09h 54m 33.88s,−58° 25′ 16.6″,6.64,,1610.0,B2V,"Algol variable, Vmax = 6.6m, Vmin = 7.21m, P = 4.48 d",,,,,,,,,False
HD 96446,,V430,96446,54266.0,11h 06m 05.82s,−59° 56′ 59.6″,6.68,,1540.0,B2k,"β Cep variable, ΔV = 0.03m",,,,,,,,,False
VY Car,,VY,93203,52538.0,10h 44m 32.69s,−57° 33′ 55.3″,6.91,,9100.0,F7Iab/Ib,"classical Cepheid, Vmax = 6.91m, Vmin = 8.00m, P = 18.89 d",,,,,,,,,False
AG Car,,AG,94910,53461.0,10h 56m 11.58s,−60° 27′ 12.8″,6.96,,17000.0,B2-3Ib/WN11,"luminous blue variable, Vmax = 5.7m, Vmin = 8.3m, P = 371.4 d",LBV,26000.0 K,55.0 M☉,552.0 R☉,900000.0 L☉,,13.0 days,,False
BO Car,,BO,93420,,10h 45m 50.63s,−59° 29′ 19.5″,7.18,,,M4Iab:,"semiregular variable, Vmax = 7.15m, Vmin = 7.95m, P = 130.7 d",M4 Ib,3525.0 K,,790.0 R☉,78000.0 L☉,,,,False
V Car,,V,72275,41588.0,08h 28m 43.70s,−60° 07′ 21.3″,7.31,,5600.0,G2Iab:,"classical Cepheid, Vmax = 7.08m, Vmin = 7.82m, P = 6.70 d",,,,,,,,,False
HR Car,,HR,90177,50843.0,10h 22m 53.84s,−59° 37′ 28.4″,7.57,,17700.0,B3Iaep,"luminous blue variable, Vmax = 6.8m, Vmin = 8.80m",LBV+RSG,21900.0 K,40.0 M☉,350.0 )R☉,790000.0 L☉,,150.0 km/s,,False
WR 40,,V385,96548,54283.0,11h 06m 17.20s,−65° 30′ 35.2″,7.70,,5900.0,WN8h,"Wolf–Rayet star and rotating ellipsoidal variable, ΔV = 0.04m, P = 4.76 d; one of the most luminous stars known",,,,,,,,,False
HD 93205,,V560,93205,,10h 44m 33.74s,−59° 44′ 15.5″,7.75,,7500.0,O3.5V((f+)),"in Trumpler 16; rotating ellipsoidal variable, Vmax = 7.74m, Vmin = 7.76m, P = 6.08 d",O3.5Vf + O8V,51300.0 K,60.0 M☉,9.2 R☉,1160000.0 L☉,,,<2.0 Myr,False
IW Car,,IW,82084 82085,,09h 26m 53.30s,−63° 37′ 48.9″,7.90,,,A4Iab/II:,"RV Tau variable, Vmax = 7.77m, Vmin = 9.10m, P = 143.6 d",,,,,,,,,False
HD 97152,,V431,97152,54574.0,11h 10m 04.08s,−60° 58′ 45.0″,8.07,,4000.0,WC7+O7V,"Wolf–Rayet star; eclipsing binary, Vmax = 7.97m, Vmin = 8.08m, P = 1.62 d",,,,,,,,,False
Y Car,,Y,91565,51653.0,10h 33m 10.85s,−58° 29′ 55.1″,8.16,,3050.0,F2,"double-mode Cepheid, Vmax = 7.53m, Vmin = 8.48m, P = 3.64 d",F0/3+ B9V,5800.0 K,4.9 M☉,,1250.0 L☉,1.8 cgs,,,False
YZ Car,,YZ,90912,51262.0,10h 28m 16.85s,−59° 21′ 00.7″,8.24,,5900.0,G5,"classical Cepheid, Vmax = 8.24m, Vmin = 9.08m, P = 18.17 d",,,,,,,,,False
WR 16,,V396,86161,48617.0,09h 54m 52.90s,−57° 43′ 38.3″,8.32,,,WN8h,"rotating ellipsoidal variable, ΔV = 0.06m; one of the most luminous stars known",WN8h,44700.0 K,19.0 M☉,11.56 R☉,525000.0 L☉,,,,False
EM Car,,EM,97484,,11h 12m 04.51s,−61° 05′ 42.9″,8.52,,,O8V,Algol variable,,,,,,,,,False
RT Car,,RT,303310,52562.0,10h 44m 47.15s,−59° 24′ 48.1″,8.55,,1430.0,M2Iab:,"possibly in Trumpler 15; irregular variable, Vmax = 8.2m, Vmin = 9.9m, one of the largest stars known",M2+ Iab,3625.0 K,,1090.0 R☉,129000.0 L☉,0.3 cgs,,,False
HD 85567,,V596,85567,48269.0,09h 50m 28.54s,−60° 58′ 03.0″,8.57,,6900.0,B2,"FS CMa variable, Vmax = 8.44m, Vmin = 8.75m",,,,,,,,,False
UX Car,,UX,91039,51338.0,10h 29m 11.24s,−57° 36′ 48.3″,8.62,,2530.0,F2II,"classical Cepheid, Vmax = 7.81m, Vmin = 8.67m, P = 3.68 d",,,,,,,,,False
XZ Car,,XZ,305996,54101.0,11h 04m 13.47s,−60° 58′ 47.7″,8.67,,,B2:pe,"classical Cepheid, Vmax = 8.05m, Vmin = 9.12m, P = 16.65 d",,,,,,,,,False
GG Car,,GG,94878,53444.0,10h 55m 58.92s,−60° 23′ 33.4″,8.70,,,B0/2eq,"Be star and re-radiating binary system, Vmax = 8.44m, Vmin = 9.08m, P = 31.03 d",B0/2eq,23000.0 K,24.0 M☉,27.0 R☉,105.0 L☉,,,,False
V403 Car,,V403,,,10h 35m 40.67s,−58° 12′ 44.6″,8.74,,8400.0,B1III,"in NGC 3293; β Cep variable, ΔV = 0.033m, P = 0.25 d",,,,,,,,,False
Tr 16-104,,V572,,,10h 44m 47.31s,−59° 43′ 53.2″,8.75,,7500.0,O7V((f))+ O9.5V+ B0.2IV,"in Trumpler 16; Algol variable, Vmax = 8.66m, Vmin = 9.07m, P = 2.15 d",,,,,,,,,False
V348 Car,,V348,90707,,10h 29m 59.00s,−57° 40′ 32.8″,8.78,,,B1III,"β Lyr variable, Vmax = 8.55m, Vmin = 8.93m, P = 5.56 d",,,,,,,,,False
HD 60435,,V409,60435,36537.0,07h 30m 56.99s,−57° 59′ 28.2″,8.89,,739.0,Ap...,rapidly oscillating Ap star,,,,,,,,,False
HD 92024,,V381,92024,,10h 36m 08.31s,−58° 13′ 04.77″,9.04,,8400.0,B1III,"in NGC 3293; β Cep variable, Vmax = 9.04m, Vmin = 9.06m, P = 0.17 d",,,,,,,,,False
GH Car,,GH,306077,54621.0,11h 10m 44.59s,−60° 45′ 01.0″,9.20,,,G0,"classical Cepheid, Vmax = 9m, Vmin = 9.35m, P = 5.73 d",,,,,,,,,False
WZ Car,,WZ,94777,53397.0,10h 55m 18.73s,−60° 56′ 24.0″,9.37,,4700.0,F8,"classical Cepheid, Vmax = 8.63m, Vmin = 9.88m, P = 23.02 d",,,,,,,,,False
CPD -59° 2635,,V731,,,10h 45m 12.72s,−59° 44′ 46.2″,9.43,,7500.0,O8V+O9.5V,"in Trumpler 16; Algol variable, Vmax = 9.27m, Vmin = 9.78m, P = 2.30 d",,,,,,,,,False
V392 Car,,V392,,,07h 58m 10.47s,−60° 51′ 57.5″,9.49,,,A2Vp...,"in NGC 2516; Algol and α2 CVn variable, Vmax = 9.49m, Vmin = 9.67m",,,,,,,,,False
XY Car,,XY,308149,53945.0,11h 02m 16.07s,−64° 15′ 46.5″,9.49,,,G5,"classical Cepheid, Vmax = 8.82m, Vmin = 9.77m, P = 12.43 d",,,,,,,,,False
HD 87643,,V640,87643,,10h 04m 30.29s,−58° 39′ 52.1″,9.50,,,B2e,"Orion variable, Vmax = 7.4m, Vmin = 9.8m",B3 I[e],17000.0 K,25.0 M☉,,41000.0 L☉,,,,False
CPD -59 2628,,V573,,,10h 45m 08.23s,−59° 40′ 49.5″,9.52,,7500.0,O9.5V+B0.3V,in Trumpler 16; Algol variable,,,,,,,,,False
HD 90657,,V398,90657,51109.0,10h 26m 31.41s,−58° 38′ 26.2″,9.69,,3500.0,WN5+O4-6,"Wolf–Rayet star; eclipsing binary, ΔV = 0.035m",,,,,,,,,False
GL Car,,GL,306168,,11h 14m 39.84s,−60° 39′ 36.3″,9.70,,,B3:V,Algol variable,,,,,,,,,False
DW Car,,DW,305543,,10h 43m 10.07s,−60° 02′ 11.7″,9.85,,,B2:pe,in Collinder 228; Algol variable,,,,,,,,,False
SS73 17,,V648,,,10h 11m 02.95s,−57° 48′ 13.9″,9.99,,,M3pe+OB,"Z And variable, Vmax = 9.6m, Vmin = 10.0m, P = 520 d",,,,,,,,,False
GZ Car,,GZ,302719,50615.0,10h 20m 20.37s,−59° 22′ 35.8″,10.20,,2400.0,G5,"double-mode Cepheid, Vmax = 9.98m, Vmin = 10.47m, P = 4.16 d",,,,,,,,,False
HH Car,,HH,303503,,10h 53m 36.47s,−59° 27′ 18.2″,10.31,,,B,"Algol variable, Vmax = 10.3m, Vmin = 10.82m, P = 3.23 d",,,,,,,,,False
EY Car,,EY,,52380.0,10h 42m 23.03s,−61° 09′ 57.3″,10.35,,,B2:pe,"double-mode Cepheid, Vmax = 10.01m, Vmin = 10.56m, P = 2.88 d",,,,,,,,,False
HD 307938,,V557,307938,,10h 42m 41.52s,−64° 21′ 04.4″,10.57,,,G2V,"BY Dra variable, ΔV = 0.21m",,,,,,,,,False
WR 18,,V500,89358,50368.0,10h 17m 02.27s,−57° 54′ 47.9″,10.6,,6300.0,WN4-s,Wolf–Rayet star,,,,,,,,,False
HD 94546,,V428,94546,53274.0,10h 53m 44.82s,−59° 30′ 46.7″,10.7,,,WN4+O8V,"Wolf–Rayet star; eclipsing binary, ΔV = 0.05m",,,,,,,,,False
CR Car,,CR,,,10h 32m 54.07s,−58° 31′ 15.5″,11.30,,,B2:pe,"classical Cepheid, Vmax = 11.3m, Vmin = 11.89m, P = 9.76 d",,,,,,,,,False
QU Car,,QU,310376,54226.0,11h 05m 42.49s,−68° 37′ 58.2″,11.54,,1290.0,B+...,"V Sge variable, Vmax = 10.9m, Vmin = 11.7m, P = 0.45 d",,,,,,,,,False
WR 30,,V541,94305,,10h 51m 06.01s,−62° 17′ 01.7″,11.73,,,WC6+O7.5V,"Algol variable, ΔV = 0.09m",,,,,,,,,False
Wray 15-751,,V432,,,11h 08m 40.06s,−60° 42′ 51.7″,11.79,,,WR:,"luminous blue variable, Vmax = 10.7m, Vmin = 12.43m",,,,,,,,,False
FO 15,,V662,,,10h 45m 36.32s,−59° 48′ 23.2″,12.09,,7500.0,O5.5V+O9.5V,"in Trumpler 16; Algol variable, Vmax = 12.09m, Vmin = 12.7m, P = 1.41 d",,,,,,,,,False
WR 30a,,V574,,,10h 51m 38.93s,−60° 56′ 35.2″,12.73,,,WR+...,"Algol variable, ΔV = 0.05m",WO4 + O5((f)),129500.0 K,9.7 M☉,0.88 R☉,195000.0 L☉,,,,False
He 2-38,,V366,,,09h 54m 43.29s,−57° 18′ 52.4″,12.92,,,M5-7.5,"Mira and Z And variable, Vmax = 12.1m, Vmin = 14.4m, P = 433 d",,,,,,,,,False
BPM 6502,,V727,,,10h 44m 10.23s,−69° 18′ 18.0″,13.09,,,DA2.2+M,re-radiating binary system,,,,,,,,,False
WR 20a,,V712,,,10h 23m 58.00s,−57° 45′ 49.0″,13.5,,,O3If*/WN6+ O3If*/WN6,in Westerlund 2; Algol variable,O3If*/WN6 + O3If*/WN6,43000.0 K,82.7 M☉,19.3 R☉,1150000.0 L☉,3.8 cgs,,,False
OGLE-TR-113,,V752,,,10h 52m 24.4s,−61° 26′ 48.5″,14.42,,1800.0,K,has a transiting planet (b),K,,0.02 )M☉,0.02 )R☉,,,,>0.7 billion years,False
2S 0921-630,,V395,,,09h 22m 35.20s,−63° 17′ 38.5″,15.3,,,K0IIIe,low-mass X-ray binary,,,,,,,,,False
OGLE-TR-123,,V816,,,11h 06m 51.1s,−61° 11′ 10.5″,15.47,,,FV+MV,possibly has a transiting planet,F (primary)/M (b),6700.0 K,1.3 M☉,1.55 R☉,,,,,False
OGLE-TR-111,,V759,,,10h 53m 17.9s,−61° 24′ 20.3″,15.55,,5000.0,G,has a transiting planet (b) and a possible second planet,K,4856.0 K,0.82 M☉,0.831 R☉,0.4 L☉,4.12 cgs,5.0 km/s,6.6 Gyr,False
OGLE-TR-132,,V742,,,10h 50m 34.7s,−61° 57′ 25.9″,15.72,,7110.0,F,has a transiting planet (b),F,,,,,,,,False
OY Car,,OY,,,10h 06m 22.07s,−70° 14′ 04.6″,16.2,,277.0,M5/M6:...,"SU UMa variable and eclipsing binary, Vmax = 11.2m, Vmin = 16.2m, P = 0.063 d",DA + M8–9V,15000.0 K,0.7 M☉,0.011 R☉,0.0055 L☉,,108.0 km/s,,False
OGLE-TR-122,,V817,,,11h 06m 52.0s,−60° 51′ 45.7″,,,,,has a transiting brown dwarf,? (primary)/M (b),5700.0 K,0.98 M☉,1.05 R☉,,3.9 cgs,5.7 km/s,,False
]]

return M
