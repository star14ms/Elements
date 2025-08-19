local M = {}
M.csv = [[
Name,B,F,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
β Tri,β,4.0,,13161.0,10064.0,02h 09m 32.52s,+34° 59′ 14.6″,3.0,0.09,124.0,A5III,,A8III / A3III,7683.0 K,3.52 M☉,4.38 R☉,60.3 L☉,3.7 cgs,70.0 km/s,0.4 Gyr,True
α Tri,α,2.0,,11443.0,8796.0,01h 53m 04.90s,+29° 34′ 45.8″,3.42,1.95,64.0,F6IV,"Mothallah, Ras al Mothallah, Caput Trianguli; rotating ellipsoidal variable",F5IIIto F6IV+ M,6288.0 K,1.7 M☉,3.22 R☉,,3.91 cgs,81.6 km/s,1.6 Gyr,True
γ Tri,γ,9.0,,14055.0,10670.0,02h 17m 18.84s,+33° 50′ 50.4″,4.03,1.24,118.0,A1Vnn,,A1Vnn,9440.0 K,2.7 M☉,1.96 R☉,33.0 L☉,,254.0 km/s,300.0 Myr,True
δ Tri,δ,8.0,,13974.0,10644.0,02h 17m 02.42s,+34° 13′ 29.4″,4.84,4.66,35.0,G0V,,G0V + G9V to K4V,6215.0 K,0.884 M☉,0.98 R☉,,4.5 cgs,10.0 km/s,9.0 Gyr,False
ι Tri,ι,6.0,TZ,13480.0,10280.0,02h 12m 22.32s,+30° 18′ 11.6″,4.94,0.08,305.0,F5V comp SB,"RS CVn variable, ΔV = 0.09m, P = 14.732 d",G0 III + G5 III,4932.0 K,2.5 M☉,4.0 R☉,61.7 L☉,,32.9 km/s,,False
14 Tri,,14.0,,15656.0,11784.0,02h 32m 06.14s,+36° 08′ 50.0″,5.15,−0.25,391.0,K5III,"variable star, ΔV = 0.006m, P = 0.08576 d",K5 III,3991.0 K,1.85 M☉,38.66 R☉,325.0 L☉,1.65 cgs,2.1 km/s,,False
7 Tri,,7.0,,13869.0,10559.0,02h 15m 56.30s,+33° 21′ 32.3″,5.25,0.48,293.0,A0V,,A0 Vor B9.5 V,10685.0 K,2.77 M☉,3.24 R☉,89.1 L☉,4.02 cgs,130.0 km/s,283.0 Myr,False
10 Tri,,10.0,,14252.0,10793.0,02h 18m 56.99s,+28° 38′ 33.6″,5.29,0.13,350.0,A2V,,A2 V,9023.0 K,2.83 M☉,3.71 R☉,108.0 L☉,3.73 cgs,22.0 km/s,372.0 Myr,False
12 Tri,,12.0,,15257.0,11486.0,02h 28m 09.99s,+29° 40′ 10.3″,5.29,1.90,155.0,F0III,,F0 III,7199.0 K,1.6 M☉,,14.0 L☉,3.79 cgs,85.0 km/s,2.19 Gyr,False
15 Tri,,15.0,,16058.0,12086.0,02h 35m 46.80s,+34° 41′ 15.7″,5.38,,,M3III,"suspected slow irregular variable, ΔV = 0.14m",M3 III,3572.0 K,1.689 M☉,118.453 R☉,1668.0 L☉,0.489 cgs,,,False
R Tri,,,R,16210.0,12193.0,02h 37m 02.50s,+34° 15′ 50.0″,5.4,,1299.0,M4IIIe,"Mira variable, Vmax = 5.4m, Vmin = 12.6m, P = 266.9 d",M3.5-8IIIe,3184.0 K,1.71 M☉,196.0 R☉,1784.0 L☉,0.09 cgs,,,False
ε Tri,ε,3.0,,12471.0,9570.0,02h 02m 57.97s,+33° 17′ 02.9″,5.5,0.22,370.0,A2V,binary star,A2 V,10000.0 K,2.75 M☉,3.28 R☉,93.0 L☉,3.76 cgs,107.0 km/s,600.0 Myr,False
11 Tri,,11.0,,15176.0,11432.0,02h 27m 27.79s,+31° 48′ 04.9″,5.55,0.83,286.0,K1III:,,K1 III,4572.0 K,2.446 M☉,12.055 R☉,54.6 L☉,2.2 cgs,,6.3 Gyr,False
13 Tri,,13.0,,15335.0,11548.0,02h 28m 48.54s,+29° 55′ 53.7″,5.89,3.45,100.0,G0V,,G0 V,5846.0 K,1.1 M☉,1.86 R☉,3.72 L☉,,3.0 km/s,6.45 Gyr,False
5 Tri,,5.0,,13372.0,10220.0,02h 11m 25.00s,+31° 31′ 35.1″,6.24,0.39,482.0,A1m,,A0 Vm,8836.0 K,2.22 M☉,2.96 R☉,48.2 L☉,3.84 cgs,15.0 km/s,,False
1 Tri,,1.0,,1047.0,7948.0,01h 42m 05.92s,+29° 30′ 21.85″,7.52,0.78,730.0,A2V,,A2 V,9305.0 K,2.36 M☉,2.69 R☉,52.0 L☉,3.9 cgs,,371.0 Myr,False
HD 12545,,,XX,12545.0,9630.0,02h 03m 47.11s,+35° 35′ 28.7″,8.42,,522.0,K0III,"RS CVn variable, Vmax = 8.1m, Vmin = 8.7m, P = 24.26007 d",K0 III,4627.0 K,1.1 M☉,8.95 R☉,337.0 L☉,2.82 cgs,24.716 days,7.4 Gyr,False
X Tri,,,X,12211.0,9383.0,02h 00m 33.72s,+27° 53′ 19.3″,8.86,2.76,541.0,A7V,"Algol variable, Vmax = 8.55m, Vmin = 11.27m, P = 0.9715352 d",,,,,,,,,False
V Tri,,,V,,,01h 31m 47.10s,+30° 22′ 01.6″,10.96,,,A3,"β Lyr variable, Vmax = 10.7m, Vmin = 11.8m, P = 0.5852057 d",,,,,,,,,False
RV Tri,,,RV,,,02h 13m 18.16s,+31° 01′ 01.6″,11.21,,,A2:,Algol variable,,,,,,,,,False
RW Tri,,,RW,,,02h 25m 36.15s,+28° 05′ 50.9″,12.5,,,M0V,"Algol variable and nova-like star, Vmax = 12.5m, Vmin = 15.61m, P = 0.231883392 d",,,,,,,,,False
AI Tri,,,AI,,,02h 03m 48.61s,+29° 59′ 25.8″,15.3,,,M2.5,"AM Her variable, Vmax = 14.7m, Vmin = 18.2m, P = 0.19174566 d",,,,,,,,,False
Var 2,,,Y,,,01h 34m 18.4s,+30° 38′ 27″,,,3000000.0,Ofpe/WN9,in Triangulum Galaxy; luminous blue variable; one of the most luminous stars known,,,,,,,,,False
]]

return M
