local M = {}
M.csv = [[
Name,B,F,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
Polaris,α,1.0,,8890.0,11767.0,02h 31m 47.08s,+89° 15′ 50.9″,1.97,−3.64,431.0,F7:Ib-IIv SB,"Pole Star, Lodestar, Alruccabah, Cynosura, Phoenice, Tramontana, Angel Stern, Navigatoria, Star of Arcady, Yilduz, Mismar, Polyarnaya, Dhruva; classical Cepheid, Vmax = 1.97m, Vmin = 2.00m, P = 3.9696 d",F7Ib + F6V,6015.0 K,5.13 M☉,46.27 R☉,1260.0 L☉,2.2 cgs,119.0 days,67.0 Myr,True
β UMi,β,7.0,,131873.0,72607.0,14h 50m 42.40s,+74° 09′ 19.7″,2.07,−0.87,126.0,K4IIIvar,"Kochab, Kokab, Kochah; suspected variable, Vmax = 2.02m, Vmin = 2.08m, has a planet (b)",K4 III,4008.0 K,1.3 M☉,44.13 R☉,454.0 L☉,1.39 cgs,6457.0 days,2.95 Gyr,True
γ UMi,γ,13.0,,137422.0,75097.0,15h 20m 43.75s,+71° 50′ 02.3″,3.04,−2.84,480.0,A3II-III,"Pherkad, Pherkad Major; δ Sct variable, ΔV = 0.05m, P = 0.143009 d",A2 III,8280.0 K,,15.0 R☉,1100.0 L☉,2.53 cgs,180.0 km/s,,True
ε UMi,ε,22.0,,153751.0,82080.0,16h 45m 58.16s,+82° 02′ 14.1″,4.21,−0.92,346.0,G5IIIvar,"RS CVn variable, Vmax = 4.19m, Vmin = 4.23m, P = 39.4809 d",G5 III + A8-F0 V,5215.0 K,,,,3.21 cgs,25.6 km/s,,True
5 UMi,,5.0,,127700.0,70692.0,14h 27m 31.52s,+75° 41′ 45.4″,4.25,−0.87,345.0,K4III,,K4-III,4095.0 K,1.86 M☉,16.0 R☉,447.0 L☉,1.91 cgs,1.9 km/s,2.0 Gyr,True
ζ UMi,ζ,16.0,,142105.0,77055.0,15h 44m 03.46s,+77° 47′ 40.2″,4.29,−1.02,376.0,A3Vn,Ahfa al Farkadain,A3Vn,8720.0 K,3.4 M☉,6.15 R☉,227.0 L☉,,210.0 km/s,180.0 Myr,True
δ UMi,δ,23.0,,166205.0,85822.0,17h 32m 12.90s,+86° 35′ 10.8″,4.35,0.61,183.0,A1Vn,"Yildun, Gildun, Vildiur, Yilduz, Pherkard",A1 Van,9911.0 K,2.35 M☉,2.8 R☉,47.77 L☉,4.04 cgs,19.0 hours,327.0 Myr,True
RR UMi,,,RR,132813.0,73199.0,14h 57m 35.12s,+65° 55′ 56.6″,4.63,−0.80,398.0,M5III,"semiregular variable, Vmax = 4.44m, Vmin = 4.85m, P = 43.3 d",M5 III,3410.0 K,1.15 M☉,113.93 R☉,1583.0 L☉,0.0 cgs,,,False
4 UMi,,4.0,,124547.0,69112.0,14h 08m 51.01s,+77° 32′ 50.8″,4.8,−1.13,500.0,K3III,,K3-IIIb Fe-0.5,4165.0 K,,28.0 R☉,436.72 L☉,1.73 cgs,,,False
η UMi,η,21.0,,148048.0,79822.0,16h 17m 30.50s,+75° 45′ 16.9″,4.95,2.58,97.0,F5V,"Anwar al Farkadain, Alasco",F5 V,6764.0 K,1.539 M☉,2.024 R☉,7.725 L☉,4.15 cgs,84.8 km/s,1.743 Gyr,False
θ UMi,θ,15.0,,139669.0,76008.0,15h 31m 25.05s,+77° 20′ 57.6″,5.0,−2.03,832.0,K5III,suspected variable,K5-III CN0.5,3962.0 K,,96.0 R☉,1618.0 L☉,1.44 cgs,,,False
11 UMi,,11.0,,136726.0,74793.0,15h 17m 05.88s,+71° 49′ 26.0″,5.02,−0.37,389.0,K4III,Pherkad Minor; has a planet (b),K4 III,4253.0 K,2.6 M☉,29.14 R☉,250.0 L☉,1.78 cgs,,639.0 Myr,False
19 UMi,,19.0,,146926.0,79280.0,16h 10m 49.53s,+75° 52′ 39.1″,5.48,−1.07,665.0,B8V,,,,,,,,,,False
24 UMi,,24.0,,166926.0,85699.0,17h 30m 46.97s,+86° 58′ 04.9″,5.78,2.38,156.0,A2m,,,,,,,,,,False
VX UMi,,,VX,155154.0,83317.0,17h 01m 40.08s,+75° 17′ 51.6″,6.17,2.91,146.0,F0IVn,γ Dor variable,,,,,,,,,False
UY UMi,,,UY,107192.0,59767.0,12h 15m 20.67s,+87° 42′ 00.0″,6.27,2.93,152.0,F2V,γ Dor variable,,,,,,,,,False
λ UMi,λ,,,183030.0,84535.0,17h 16m 57.26s,+89° 02′ 15.8″,6.31,−0.84,876.0,M1III,semiregular variable,M3+ IIIa,3772.0 K,,64.0 R☉,741.0 L☉,,,,False
20 UMi,,20.0,,147142.0,79420.0,16h 12m 32.20s,+75° 12′ 38.1″,6.36,−0.49,765.0,K2IV,,,,,,,,,,False
3 UMi,,3.0,,124063.0,68956.0,14h 06m 56.48s,+74° 35′ 37.5″,6.43,0.79,438.0,A7V,,,,,,,,,,False
π1 UMi A,π1,,,139777.0,75809.0,15h 29m 11.97s,+80° 26′ 54.0″,6.57,4.85,72.0,G8IV-V+...,,G1.5 V(n),5771.0 K,1.02 M☉,0.98 R☉,0.929 L☉,4.4 cgs,,9.22 Gyr,False
9 UMi,,9.0,,133621.0,73440.0,15h 00m 27.71s,+71° 45′ 54.9″,6.64,4.00,110.0,G0,,,,,,,,,,False
8 UMi,,8.0,,133086.0,73136.0,14h 56m 48.32s,+74° 54′ 03.3″,6.83,0.95,489.0,K0,Baekdu; has a planet (b),G8III,4847.0 K,1.51 M☉,10.73 R☉,52.9 L☉,2.53 cgs,200.0 d,377.0 Myr,False
π2 UMi,π2,18.0,,141652.0,76695.0,15h 39m 38.72s,+79° 58′ 59.2″,6.89,1.54,384.0,F2,,F1V+ G0,6858.0 K,1.87 M☉,3.82 R☉,16.5 L☉,,,1.2 Gyr,False
U UMi,,,U,125556.0,69816.0,14h 17m 19.90s,+66° 47′ 39.2″,7.1,,858.0,M6-8e,"Mira variable, Vmax = 7.1m, Vmin = 13m, P = 330.92 d",,,,,,,,,False
π1 UMi B,π1,,,139813.0,75829.0,15h 29m 24.36s,+80° 27′ 00.0″,7.3,5.62,71.0,G5,,G1.5 V(n),5771.0 K,1.02 M☉,0.98 R☉,0.929 L☉,4.4 cgs,,9.22 Gyr,False
14 UMi,,14.0,,137686.0,75152.0,15h 21m 30.52s,+73° 28′ 35.1″,7.38,3.51,194.0,F5,,,,,,,,,,False
S UMi,,,S,139492.0,75847.0,15h 29m 34.57s,+78° 38′ 00.3″,7.5,,2450.0,M6.5-7.5e,"Mira variable, Vmax = 7.5m, Vmin = <13.2m, P = 331 d",M6e-M9e,,,,,,,,False
V UMi,,,V,119227.0,66562.0,13h 38m 41.07s,+74° 18′ 36.3″,7.81,,1280.0,M...,"semiregular variable, Vmax = 7.06m, Vmin = 8.7m, P = 73 d",,,,,,,,,False
W UMi,,,W,150265.0,79069.0,16h 08m 27.28s,+86° 11′ 59.6″,8.65,,1600.0,A2V,"Algol variable, Vmax = 8.51m, Vmin = 9.59m, P = 1.7011576 d",A1/2V(A3V + G2IV),9310.0 K,3.22 M☉,9.63 R☉,89.0 L☉,3.83 cgs,,400.0 Myr,False
RU UMi,,,RU,,,13h 38m 56.81s,+69° 48′ 11.2″,10.24,,,A2,"β Lyr variable, Vmax = 10m, Vmin = 10.66m, P = 0.52492618 d",F0 IV/V + K5V,7200.0 K,2.32 M☉,1.78 R☉,7.63 L☉,4.3 cgs,,,False
Z UMi,,,Z,,,15h 02m 01.48s,+83° 03′ 48.7″,11.4,,,C,"R CrB variable, Vmax = 10.8m, Vmin = 19.0m, P = 130 d",C(R),5250.0 K,0.7 M☉,,7900.0 L☉,0.5 cgs,,,False
T UMi,,,T,118556.0,,13h 34m 41.12s,+73° 25′ 53.0″,11.46,,,M6e,"Mira variable, Vmax = 7.8m, Vmin = 15m, P = 301 d",M4e-M6e,3200.0 K,1.66 M☉,290.0 R☉,4080.0 L☉,,,0.17 Gyr,False
SS UMi,,,SS,,,15h 51m 22.34s,+71° 45′ 11.9″,12.6,,,CV,"SU UMa variable, Vmax = 12.6m, Vmin = 17.6m, P = 0.06778 d",,,,,,,,,False
RW UMi,,,RW,,,16h 47m 54.75s,+77° 02′ 12.2″,,,,,DQ Her variable,,,,,,,,,False
]]

return M
