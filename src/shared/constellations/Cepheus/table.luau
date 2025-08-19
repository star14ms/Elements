local M = {}
M.csv = [[
Name,B,F,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
α Cep,α,5,,203280.0,105199.0,21h 18m 34.58s,+62° 35′ 07.6″,2.45,1.58,49,A7IV-V,Alderamin; suspected variable,A8Vnor A7IV-V,7600.0 (equator)K,2.0 M☉,2.823 (equator)R☉,17.0 L☉,3.99 cgs,12.11 h,820.0 Myr,True
γ Cep,γ,35,,222404.0,116727.0,23h 39m 20.98s,+77° 37′ 55.1″,3.21,2.51,45,K1IV,Errai; binary star; has a planet (b); suspected variable,K1III-IV CN1,4806.0 K,1.27 M☉,4.74 R☉,11.6 L☉,3.18 cgs,1.63 km/s,5.7 Gyr,True
β Cep,β,8,,205021.0,106032.0,21h 28m 39.58s,+70° 33′ 38.5″,3.23,−3.08,595,B2IIIv SB,"Alfirk; prototype β Cep variable, Vmax = 3.16m, Vmin = 3.27m, P = 0.19 d",B1 IV,23600.0 K,7.4 M☉,7.22 R☉,20000.0 L☉,4.12 cgs,28.0 km/s,8.7 Myr,True
ζ Cep,ζ,21,,210745.0,109492.0,22h 10m 51.26s,+58° 12′ 04.5″,3.39,−3.35,726,K1Ibv SB,eclipsing binary,K1.5 Ib,4393.0 K,10.1 M☉,172.7 R☉,10024.0 L☉,0.75 cgs,10.64 km/s,,True
η Cep,η,3,,198149.0,102422.0,20h 45m 17.27s,+61° 50′ 12.5″,3.41,2.63,47,K0IV,Al Kidr,K0 IV,5000.0 K,1.4 M☉,3.86 R☉,8.4 L☉,3.3 cgs,6.79 km/s,2.5 Gyr,True
ι Cep,ι,32,,216228.0,112724.0,22h 49m 40.91s,+66° 12′ 02.6″,3.5,0.76,115,K0III,,K0 III,4768.0 K,2.15 M☉,11.08 R☉,57.0 L☉,2.69 cgs,10.0 km/s,1.2 Gyr,True
δ Cep A,δ,27,,213306.0,110991.0,22h 29m 10.25s,+58° 24′ 54.7″,4.07,−3.47,887,F5Iab + B7-8,"prototype Cepheid variable, Vmax = 3.49m, Vmin = 4.36m, P = 5.37 d; binary star",F5Ib-G1Ib+ B7-8,5905.0 K,5.26 M☉,46.1 R☉,1949.0 L☉,1.65 cgs,9.0 km/s,,True
ε Cep,ε,23,,211336.0,109857.0,22h 15m 01.68s,+57° 02′ 36.5″,4.18,2.13,84,F0IV,"δ Sct variable, Vmax = 4.15m, Vmin = 4.21m, P = 0.04 d",F0 V (Sr II)or F0 IV,7514.0 K,1.64 M☉,1.86 R☉,11.65 L☉,4.11 cgs,91.0 km/s,1.097 Gyr,False
θ Cep,θ,2,,195725.0,101093.0,20h 29m 34.83s,+62° 59′ 38.9″,4.21,1.11,136,A7III,Al Kidr,A7 IIIor kA7hF1mF2,7375.0 K,2.75 M☉,3.09 R☉,46.5 L☉,3.74 cgs,52.0 km/s,55.0 Myr,False
μ Cep,μ,,,206936.0,107259.0,21h 43m 30.45s,+58° 46′ 48.2″,4.23,−6.81,5258,M2Ia,"Garnet Star; in Trumpler 37; semiregular variable, Vmax = 3.43m, Vmin = 5.1m, P = 835 d",M2-Ia(M2e Iaor M2 Ia+),3750.0 K,25.0 M☉,1420.0 R☉,340000.0 )L☉,0.36 cgs,,10.0 Myr,False
2 UMi,,(2),,5848.0,5372.0,01h 08m 44.16s,+86° 15′ 25.6″,4.24,−0.67,313,K2II-III,,K2 II-III,4512.5 K,2.27 M☉,24.0 R☉,215.097 L☉,2.48 cgs,1.0 km/s,,False
ν Cep,ν,10,,207260.0,107418.0,21h 45m 26.93s,+61° 07′ 14.9″,4.25,−6.72,5094,A2Ia,"α Cyg variable, Vmax = 4.25m, Vmin = 4.35m",A2Iab,8800.0 K,15.4 M☉,137.0 R☉,102000.0 L☉,1.35 cgs,15.0 km/s,8.0 Myr,False
κ Cep,κ,1,,192907.0,99255.0,20h 08m 53.32s,+77° 42′ 40.9″,4.38,−0.63,327,B9III,triple star,B9III + A7V,10174.0 K,3.02 M☉,4.45 R☉,191.0 L☉,3.66 cgs,,302.0 Myr,False
π Cep,π,33,,218658.0,114222.0,23h 07m 53.84s,+75° 23′ 15.3″,4.41,0.27,220,G2III,triple star,G7III/ F5V/ A7V-A9V,5226.0 K,3.63 M☉,,,3.05 cgs,,100.0 Myr,False
ξ Cep A,ξ,17,,209790.0,108917.0,22h 03m 47.45s,+64° 37′ 40.7″,4.45,,96,Am,"Kurhah, component of the ξ Cep system; spectroscopic binary",kA2.5hF2mF2(IV)(A3Vm + F2III)‍,7943.0 K,1.721 M☉,1.28 R☉,6.6 L☉,4.26 cgs,,200.0 Myr,False
11 Cep,,11,,206952.0,107119.0,21h 41m 55.08s,+71° 18′ 40.3″,4.55,0.89,176,K0III,,K0.5 III,5446.0 K,2.38 M☉,10.93 R☉,94.9 L☉,2.41 cgs,1.0 km/s,670.0 Myr,False
ο Cep,ο,34,,219916.0,115088.0,23h 18m 37.41s,+68° 06′ 41.1″,4.75,0.70,211,K0III,multiple star; suspected variable,G8III,,2.35 M☉,,51.0 L☉,,,,False
9 Cep,,9,V337,206165.0,106801.0,21h 37m 55.23s,+62° 04′ 55.0″,4.76,−5.95,4528,B2Ib,"α Cyg variable, Vmax = 4.69m, Vmin = 4.78m",B2 Ib,18000.0 K,21.0 M☉,39.8 R☉,151000.0 L☉,2.5 cgs,73.0 km/s,,False
24 Cep,,24,,210807.0,109400.0,22h 09m 48.37s,+72° 20′ 28.3″,4.79,−0.53,377,G8III,,G7 II-III,5023.0 K,3.5 M☉,13.0 R☉,209.0 L☉,2.31 cgs,6.5 km/s,234.0 Myr,False
16 Cep,,16,,209369.0,108535.0,21h 59m 15.10s,+73° 10′ 49.0″,5.04,2.17,122,F5V,double star,F5V,6754.0 K,1.563 M☉,2.452 R☉,11.264 L☉,3.84 cgs,26.4 km/s,2.0 Gyr,False
OV Cep,,51,OV,51802.0,37391.0,07h 40m 31.09s,+87° 01′ 12.6″,5.05,−0.88,499,M2III,"semiregular variable, Vmax = 5.00m, Vmin = 5.07m",,,,,,,,,False
λ Cep,λ,22,,210839.0,109556.0,22h 11m 30.58s,+59° 24′ 52.3″,5.05,−3.47,1646,O6If(n),emission-line star; suspected variable,O6.5If(n)p,36000.0 K,51.4 M☉,21.0 R☉,630000.0 L☉,3.54 cgs,210,4.0 Myr,False
19 Cep,,19,,209975.0,109017.0,22h 05m 08.79s,+62° 16′ 47.4″,5.07,−6.04,5433,O9.5Ib,triple star,O9Ib,32983.0 K,47.0 M☉,17.0 R☉,224000.0 L☉,3.4 cgs,48.0 km/s,,False
31 Cep,,31,,214470.0,111532.0,22h 35m 45.78s,+73° 38′ 35.3″,5.08,1.32,184,F3III-IV,,,,,,,,,,False
VV Cep,,,VV,208816.0,108317.0,21h 56m 39.14s,+63° 37′ 32.0″,5.11,−6.93,8359,M2 + B0,"Algol and semiregular variable, Vmax = 4.80m, Vmin = 5.36m, P = 7430 d; one of the largest stars known",M2 Iab(M1p 0),3826.0 K,18.2 M☉,6601050.0 R☉,72880.0 L☉,0.26 cgs,,25.0 Myr,False
78 Dra,,(78),,207130.0,107230.0,21h 43m 04.13s,+72° 19′ 12.7″,5.18,0.78,247,K0III,,,,,,,,,,False
6 Cep,,6,V382,203467.0,105268.0,21h 19m 22.21s,+64° 52′ 18.6″,5.19,−2.41,1079,B3IVe,"Be star, Vmax = 5.08m, Vmin = 5.23m",,,,,,,,,False
30 Cep,,30,,214734.0,111797.0,22h 38m 39.05s,+63° 35′ 04.3″,5.19,0.23,320,A3IV,,,,,,,,,,False
18 Cep,,18,MO,209772.0,108924.0,22h 03m 52.93s,+63° 07′ 11.2″,5.26,−0.43,448,M5III,"slow irregular variable, Vmax = 5.13m, Vmin = 5.33m",,,,,,,,,False
20 Cep,,20,,209960.0,109005.0,22h 05m 00.48s,+62° 47′ 07.9″,5.27,0.32,318,K4III,suspected variable,,,,,,,,,False
7 Cep,,7,,204770.0,105972.0,21h 27m 46.16s,+66° 48′ 32.9″,5.42,−1.45,771,B7V,,B7 V,12560.0 K,4.47 M☉,3.0 R☉,769.0 L☉,3.56 cgs,236.0 km/s,38.0 Myr,False
ρ2 Cep,ρ2,29,,213798.0,111056.0,22h 29m 52.97s,+78° 49′ 27.6″,5.45,1.14,237,A3V,Al Kalb al Rai,A3 V,8511.0 K,2.23 M☉,,32.0 L☉,4.2 cgs,133.0 km/s,85.0 Myr,False
V408 Cep,,,V408,26356.0,20860.0,04h 28m 13.30s,+83° 48′ 27.9″,5.51,−1.10,685,B5V,γ Cas variable,,,,,,,,,False
V381 Cep,,,V381,203338.0,105259.0,21h 19m 15.69s,+58° 37′ 24.6″,5.51,−4.74,3663,M1Ibep,"slow irregular variable, Vmax = 5.51m, Vmin = 5.71m",M1epIb + B,3745.0 K,16.0 M☉,977.0 R☉,178000.0 L☉,4.18 cgs,42.8 km/s,49.1 Myr,False
26 Cep,,26,,213087.0,110817.0,22h 27m 05.31s,+65° 07′ 56.2″,5.52,−3.93,2527,B0.5Ib,suspected variable,,,,,,,,,False
12 Cep,,12,,207528.0,107586.0,21h 47m 25.31s,+60° 41′ 33.7″,5.53,−0.25,467,M1III,,,,,,,,,,False
14 Cep,,14,LZ,209481.0,108772.0,22h 02m 04.58s,+58° 00′ 01.3″,5.55,−5.22,4657,O9V,rotating ellipsoidal variable,O 9III (primary) + ON 9.7V (secondary),32000.0 K,16.0 M☉,11.7 R☉,79000.0 L☉,3.71 cgs,,,False
V388 Cep,,,V388,219586.0,114831.0,23h 15m 37.71s,+70° 53′ 17.1″,5.56,0.36,356,F0IV,"δ Sct variable, ΔV = 0.07m, P = 0.28 d",,,,,,,,,False
4 Cep,,4,,197950.0,102253.0,20h 43m 10.98s,+66° 39′ 26.5″,5.59,2.44,139,A8V,,,,,,,,,,False
13 Cep,,13,,208501.0,108165.0,21h 54m 53.16s,+56° 36′ 40.4″,5.74,−3.71,2527,B8Ibvar,suspected variable,,,,,,,,,False
25 Cep,,25,,211833.0,110103.0,22h 18m 12.59s,+62° 48′ 15.7″,5.75,−0.88,689,K3III,,,,,,,,,,False
ρ1 Cep,ρ1,28,,213403.0,110787.0,22h 26m 42.45s,+78° 47′ 09.4″,5.83,1.85,204,A2m,,A2m,,2.0 M☉,,,,81.0 km/s,320.0 Myr,False
V414 Cep,,,V414,197939.0,102358.0,20h 44m 22.04s,+56° 29′ 18.3″,5.91,−1.45,964,M3III,semiregular variable,,,,,,,,,False
77 Dra,,(77),,201908.0,104105.0,21h 05m 29.21s,+78° 07′ 34.8″,5.91,0.40,412,B8Vn,,,,,,,,,,False
V426 Cep,,,V426,204599.0,105949.0,21h 27m 25.30s,+59° 45′ 00.4″,6.11,−1.28,982,M3II-III...,slow irregular variable,,,,,,,,,False
V398 Cep,,,V398,225136.0,302.0,00h 03m 51.63s,+66° 42′ 43.9″,6.31,−1.09,985,M4,semiregular variable,,,,,,,,,False
δ Cep C,δ,27,,213307.0,110988.0,22h 29m 09.23s,+58° 24′ 14.7″,6.3,,887,B7IV,Component of the δ Cep system; spectroscopic binary; suspected variable,F5Ib-G1Ib+ B7-8,5905.0 K,5.26 M☉,46.1 R☉,1949.0 L☉,1.65 cgs,9.0 km/s,,False
V379 Cep,,,V379,197770.0,102258.0,20h 43m 13.69s,+57° 06′ 50.4″,6.32,−5.10,6269,B2III,"Algol variable, ΔV = 0.047m, P = 99.76 d",,,,,,,,,False
ξ Cep B,ξ,17,,209791.0,,22h 03m 46.22s,+64° 37′ 41.5″,6.34,,96,F8V,component of the ξ Cep system; spectroscopic binary,kA2.5hF2mF2(IV)(A3Vm + F2III)‍,7943.0 K,1.721 M☉,1.28 R☉,6.6 L☉,4.26 cgs,,200.0 Myr,False
80 Dra,,(80),,210873.0,109434.0,22h 10m 15.32s,+72° 06′ 40.7″,6.36,0.38,511,B9MNp...,,,,,,,,,,False
V444 Cep,,,V444,210071.0,109124.0,22h 06m 13.55s,+56° 20′ 36.2″,6.38,0.14,576,A0III,rotating ellipsoidal variable,,,,,,,,,False
V421 Cep,,,V421,203025.0,105091.0,21h 17m 18.79s,+58° 36′ 41.4″,6.42,−3.03,2527,B2III,Be star,,,,,,,,,False
V422 Cep,,,V422,203265.0,105193.0,21h 18m 32.43s,+61° 11′ 03.8″,6.43,−2.03,1606,M3,slow irregular variable,,,,,,,,,False
V438 Cep,,,V438,209111.0,108133.0,21h 54m 26.54s,+80° 18′ 30.9″,6.43,−0.59,825,M3,semiregular variable,,,,,,,,,False
RW Cep,,,RW,212466.0,110504.0,22h 23m 07.02s,+55° 57′ 47.6″,6.44,−3.18,2739,G8Ia,"semiregular variable, Vmax = 6.0m, Vmin = 7.3m, P = 346 d; one of the largest stars known",K2 0-Ia(G8 - M2Ia-0),44003900.0 (during the dimming)K,40.0 (initial mass)M☉,1100.0 R☉,540000.0 L☉,0.2 cgs,,,False
V431 Cep,,,V431,205938.0,106604.0,21h 35m 25.91s,+68° 13′ 09.3″,6.47,0.08,617,Ap Si,α² CVn variable,,,,,,,,,False
V Cep,,,V,224309.0,118027.0,23h 56m 27.56s,+83° 11′ 28.0″,6.57,1.75,301,A3V,not variable,A1V,9004.0 K,2.27 M☉,1.7 R☉,17.4 L☉,4.33 cgs,147.0 km/s,373.0 Myr,False
V419 Cep,,,V419,202380.0,104719.0,21h 12m 47.25s,+60° 05′ 52.8″,6.62,,5200,M2Ib,slow irregular variable,M2 Ib,3660.0 K,4.8 M☉,586.0 R☉,58300.0 L☉,,,10.0 Myr,False
79 Dra,,(79),,208509.0,107995.0,21h 52m 46.94s,+73° 42′ 08.2″,6.65,2.21,276,A2V,,,,,,,,,,False
15 Cep,,15,,209744.0,108925.0,22h 03m 53.86s,+59° 48′ 52.5″,6.69,−1.43,1370,B1V,multiple star,,,,,,,,,False
AH Cep,,,AH,216014.0,112562.0,22h 47m 52.94s,+65° 03′ 43.8″,6.88,,3330,B0.5V+...,"β Lyr variable, Vmax = 6.78m, Vmin = 7.07m, P = 1.77 d",,,,,,,,,False
U Cep,,,U,5679.0,4843.0,01h 02m 18.34s,+81° 52′ 32.1″,6.9,0.32,674,G8III,"Algol variable, Vmax = 6.75m, Vmin = 9.24m, P = 2.49 d",B7/8V + G5/8III-IV,13600.0 K,4.2 M☉,2.9 R☉,,,,,False
EM Cep,,,EM,208392.0,108073.0,21h 53m 48.10s,+62° 36′ 51.9″,7.03,,1610,B1Vn,"W UMa variable, Vmax = 7.02m, Vmin = 7.17m, P = 0.81 d",,,,,,,,,False
SS Cep,,,SS,22689.0,17881.0,03h 49m 30.01s,+80° 19′ 20.9″,7.16,,847,M5III,"semiregular variable, Vmax = 6.5m, Vmin = 7.7m, P = 90 d",,,,,,,,,False
DQ Cep,,,DQ,199908.0,103471.0,20h 57m 48.61s,+55° 29′ 15.6″,7.26,,579,F1IV,"δ Sct variable, Vmax = 7.22m, Vmin = 7.32m, P = 0.079 d",,,,,,,,,False
T Cep,,,T,202012.0,104451.0,21h 09m 32.00s,+68° 29′ 25.0″,7.33,,612,M6-9e,"Mira variable, Vmax = 5.2m, Vmin = 11.3m, P = 388.14 d",M6-9e,3347.0 K,0.55 M☉,329.0 R☉,5700.0 L☉,,,,False
V380 Cep,,,V380,200775.0,103763.0,21h 01m 36.92s,+68° 09′ 47.8″,7.36,,1720,B2Ve,"in NGC 7023; Orion variable, Vmax = 7.24m, Vmin = 7.42m",,,,,,,,,False
VW Cep,,,VW,197433.0,101750.0,20h 37m 21.54s,+75° 36′ 01.5″,7.38,,90,G8V+K0V,"W UMa variable, Vmax = 7.23m, Vmin = 7.68m, P = 0.28 d",G8V,5050.0 K,1.13 M☉,0.99 R☉,,,,9.029 Gyr,False
S Cep,,,S,206362.0,106583.0,21h 25m 12.83s,+78° 37′ 28.2″,7.4,,1330,"C7,4e","Mira variable, Vmax = 7.4m, Vmin = 12.9m, P = 486.84 d","C7,3e",4032.0 K,5.4 M☉,254.0 R☉,5417.0 L☉,3.61 cgs,,,False
NY Cep,,,NY,217312.0,113461.0,22h 58m 39.80s,+63° 04′ 37.7″,7.44,,,B0IV,"Algol variable, Vmax = 7.4m, Vmin = 7.55m, P = 15.28 d",,,,,,,,,False
V368 Cep,,,V368,220140.0,115147.0,23h 19m 26.63s,+79° 00′ 12.7″,7.54,,63,G9V,RS CVn variable,,,,,,,,,False
W Cep,,,W,214369.0,111592.0,22h 36m 27.56s,+58° 25′ 33.9″,7.59,,,K0Iapev...,"semiregular variable, Vmax = 7.02m, Vmin = 8.5m, P = 350 d",K0ep-M2ep Ia + B0/B1,4400.0 K,,670.0 R☉,292000.0 L☉,0.18 cgs,,,False
EI Cep,,,EI,205234.0,106024.0,21h 28m 28.21s,+76° 24′ 12.6″,7.61,,657,F3V+F1m,"Algol variable, Vmax = 7.54m, Vmin = 8.06m, P = 8.44 d",,,,,,,,,False
CW Cep,,,CW,218066.0,113907.0,23h 04m 02.22s,+63° 23′ 48.8″,7.67,,2080,B0.5V+B1V,"in Cepheus OB3; Algol variable, Vmax = 7.6m, Vmin = 8.04m, P = 2.73 d",,,,,,,,,False
IR Cep,,,IR,208960.0,108426.0,21h 57m 51.93s,+61° 01′ 07.9″,7.86,,2200,G0,"classical Cepheid, Vmax = 7.58m, Vmin = 7.98m, P = 2.11 d",,,,,,,,,False
EK Cep,,,EK,206821.0,107083.0,21h 41m 21.50s,+69° 41′ 34.1″,7.89,,528,A0V,Algol variable,,,,,,,,,False
XZ Cep,,,XZ,,111257.0,22h 32m 25.08s,+67° 09′ 02.5″,8.51,,1730,O9.5V,"β Lyr variable, Vmax = 8m, Vmin = 8.83m, P = 5.10 d",,,,,,,,,False
ZZ Cep,,,ZZ,215661.0,112317.0,22h 45m 02.61s,+68° 07′ 58.4″,8.6,,430,B7v+...,"Algol variable, Vmax = 8.6m, Vmin = 9.55m, P = 2.14 d",,,,,,,,,False
DH Cep,,,DH,215835.0,112470.0,22h 46m 54.11s,+58° 05′ 03.5″,8.61,,5000,O5.5V+O6V,"in NGC 7380; rotating ellipsoidal variable, Vmax = 8.58m, Vmin = 8.62m, P = 2.11 d",O5.5 V + O6 V,44000.0 K,38.4 M☉,8.31 R☉,105.0 L☉,4.3 cgs,175.0 km/s,,False
CQ Cep,,,CQ,214419.0,111633.0,22h 36m 53.95s,+56° 54′ 21.0″,8.8,,,WN6+O9II-Ib,"β Lyr variable, Vmax = 8.63m, Vmin = 9.12m, P = 1.64 d",,,,,,,,,False
WX Cep,,,WX,213631.0,111166.0,22h 31m 15.79s,+63° 31′ 23.6″,9.0,,1520,A5V+A2V,"Algol variable, Vmax = 8.7m, Vmin = 9.29m, P = 3.38 d",,,,,,,,,False
HD 211853,,,GP,211853.0,100154.0,22h 18m 45.61s,+56° 07′ 33.9″,9.0,,1450,WN6o+O6I,"eclipsing binary, Vmax = 8.96m, Vmin = 9.07m, P = 6.69 d",,,,,,,,,False
XX Cep,,,XX,222217.0,116648.0,23h 38m 20.29s,+64° 20′ 02.7″,9.18,,799,A7V,"Algol variable, Vmax = 9.20m, Vmin = 10.32m, P = 2.34 d",,,,,,,,,False
RZ Cep,,,RZ,,111839.0,22h 39m 13.18s,+64° 51′ 30.6″,9.19,,,A0-F2,"RR Lyr variable, Vmax = 9.15m, Vmin = 9.72m, P = 0.31 d",,,,,,,,,False
IL Cep,,,IL,,113017.0,22h 53m 15.60s,+62° 08′ 45.0″,9.31,,2790,B3IVe+A3,"UX Ori star, Vmax = 9.24m, Vmin = 9.61m",,,,,,,,,False
EG Cep,,,EG,194089.0,,20h 15m 56.83s,+76° 48′ 35.7″,9.49,,,A7V,"β Lyr variable, Vmax = 9.31m, Vmin = 10.21m, P = 0.54 d",,,,,,,,,False
CR Cep,,,CR,240059.0,112430.0,22h 46m 24.77s,+59° 26′ 31.9″,9.64,,1760,G0,"classical Cepheid, Vmax = 9.43m, Vmin = 9.83m, P = 6.23 d",,,,,,,,,False
PQ Cep,,,PQ,,,21h 44m 28.78s,+73° 38′ 04.9″,9.82,,,"C6-,3e",Mira variable,,,,,,,,,False
HD 219460,,,V458,219460.0,114791.0,23h 15m 12.39s,+60° 27′ 01.8″,9.89,,,WN5+B1III,Wolf–Rayet star,,,,,,,,,False
SV Cep,,,SV,,,22h 21m 33.20s,+73° 40′ 27.1″,10.35,,,A2IVe,"UX Ori star, Vmax = 10.35m, Vmin = 12.15m",,,,,,,,,False
V354 Cephei,,,V354,,,22h 33m 35s,+58° 53′ 45″,10.9,,9000,M2.5 Iab,"One of the largest known stars; slow irregular variable, Vmax = 10.82m, Vmin = 11.35m",M2.5 Iab– M3.5 Ib,3615.0 K,,1250.0 R☉,250000.0 L☉,0.5 cgs,,,False
DO Cep,,,DO,239960.0,,22h 27m 59.57s,+57° 41′ 45.3″,10.3,,13.1,M4.0V,"member of the Kruger 60 system; flare star, Vmax = 10.3m, Vmin = 11.4m",M3V/M4V,3342.0 K,0.271 M☉,0.301 R☉,0.00983 L☉,,,,False
CP Cep,,,CP,,108427.0,21h 57m 52.69s,+56° 09′ 50.1″,10.58,,1360,F5Ib,"classical Cepheid, Vmax = 10.06m, Vmin = 10.96m, P = 17.86 d",,,,,,,,,False
AK Cep,,,AK,,110964.0,22h 28m 50.09s,+58° 12′ 39.4″,10.86,,713,F8,"classical Cepheid, Vmax = 10.86m, Vmin = 11.52m, P = 7.23 d",,,,,,,,,False
EE Cep,,,EE,,,22h 09m 22.76s,+55° 45′ 24.2″,10.9,,,B5:nev,"Algol variable, Vmax = 10.72m, Vmin = 12.15m, P = 2049.53 d",,,,,,,,,False
BH Cep,,,BH,,,22h 01m 42.87s,+69° 44′ 36.5″,11.01,,,F5IIIe,"UX Ori star, Vmax = 10.79m, Vmin = 12.7m",,,,,,,,,False
GW Cep,,,GW,,,01h 45m 58.58s,+80° 04′ 55.3″,11.21,,,G3,W UMa variable,,,,,,,,,False
WZ Cep,,,WZ,,,23h 22m 24.22s,+72° 54′ 56.7″,11.23,,,F5,W UMa variable,F5V+F5V,6400.0 K,0.83 M☉,0.82 R☉,1.0 L☉,,,,False
BO Cep,,,BO,,,22h 16m 54.06s,+70° 03′ 45.0″,11.55,,,F5Ve,"UX Ori star, Vmax = 11.5m, Vmin = 12.4m",,,,,,,,,False
DI Cep,,,DI,,113269.0,22h 56m 11.53s,+58° 40′ 01.8″,11.95,,797,G8IVe,T Tauri star,,,,,,,,,False
CX Cep,,,CX,,,22h 09m 33.44s,+57° 44′ 30.5″,12.12,,,WN4+O5V,"β Lyr variable, Vmax = 12.09m, Vmin = 12.24m, P = 2.13 d",,,,,,,,,False
Cepheus X-4,,,V490,,,21h 39m 30.68s,+56° 59′ 10.5″,,,,B1.5Ve,in IC 1396; high-mass X-ray binary,,,,,,,,,False
V350 Cep,,,V350,,,20h 43m 00.01s,+66° 11′ 28.0″,16.2,,M2...,WN4+O5V,in NGC 7129; T Tauri star,,,,,,,,,False
PV Cep,,,PV,,,20h 45m 53.94s,+67° 57′ 38.7″,17.46,,,A5,in nebula GM 1-29; EXor,A5Ve,8150.0 K,2.6 M☉,2.9 R☉,100.0 L☉,,,<1.0 Myr,False
IV Cep,,,IV,,,22h 04m 36.92s,+53° 30′ 23.7″,,,,,nova,,,,,,,,,False
]]

return M
