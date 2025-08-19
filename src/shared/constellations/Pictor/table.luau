local M = {}
M.csv = [[
Name,B,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
α Pic,α,,50241.0,32607.0,06h 48m 11.54s,−61° 56′ 31.1″,3.3,0.83,99.0,A7IV,,A8 Vn kA6,7550.0 K,1.6 M☉,3.55 R☉,38.7 L☉,3.48 cgs,206.0 km/s,660.0 Myr,True
β Pic,β,,39060.0,27321.0,05h 47m 17.08s,−51° 04′ 00.2″,3.85,2.42,63.0,A5V,"δ Sct variable, Vmax = 3.80m, Vmin = 3.86m, P = 0.026260 d; has a protoplanetary disk and has two planets (b & c)",A6V,8052.0 K,1.75 M☉,1.732 R☉,8.7 L☉,4.15 cgs,130.0 km/s,23.0 Myr,True
γ Pic,γ,,39523.0,27530.0,05h 49m 49.58s,−56° 09′ 59.4″,4.5,0.87,174.0,K1III,,K1 III,4670.0 K,1.47 M☉,11.22 R☉,53.46 L☉,2.56 cgs,6.4 km/s,3.09 Gyr,True
δ Pic,δ,,42933.0,29276.0,06h 10m 17.91s,−54° 58′ 07.2″,4.72,−3.81,1655.0,B0.5IV,"β Lyr variable, Vmax = 4.65m, Vmin = 4.9m, P = 1.672541 d",B1/2(III)n(B0.5:III?np + B0.5/3:),25200.0 K,16.3 M☉,7.62 R☉,20900.0 L☉,,170.0 km/s,,False
η2 Pic,η2,,33042.0,23649.0,05h 04m 57.95s,−49° 34′ 40.2″,5.05,−0.76,474.0,M2IIIvar,"suspected variable, Vmax = 5.00m, Vmin = 5.1m",K5 III,3955.0 K,,40.56 R☉,362.6 L☉,,,,False
λ Pic,λ,,30185.0,21914.0,04h 42m 46.46s,−50° 28′ 53.1″,5.3,0.19,343.0,K0/K1III,,K0/1 III,4851.0 K,2.2 M☉,,112.0 L☉,2.77 cgs,,2.24 Gyr,False
η1 Pic,η1,,32743.0,23482.0,05h 02m 48.73s,−49° 09′ 05.3″,5.37,3.28,85.0,F2V,,F5 V,6631.0 K,1.37 M☉,1.469 R☉,3.74 L☉,4.17 cgs,22.7 km/s,2.15 Gyr,False
ζ Pic,ζ,,35072.0,24829.0,05h 19m 22.11s,−50° 36′ 23.5″,5.44,2.65,118.0,F7III-IV,,F6 IV,6411.0 K,1.49 M☉,2.31 R☉,7.66 L☉,3.89 cgs,5.6 km/s,2.6 Gyr,False
ι Pic A,ι,,31203.0,22531.0,04h 50m 55.39s,−53° 27′ 42.2″,5.58,2.73,121.0,F0IV...,,F0 V,7331.0 K,1.51 M☉,1.8 R☉,7.2 L☉,4.28 cgs,,696.0 Myr,False
ν Pic,ν,,45229.0,30342.0,06h 22m 55.87s,−56° 22′ 11.7″,5.6,2.09,164.0,Am,,A1mA3-A9,7733.0 K,1.7 M☉,2.19 R☉,15.4 L☉,3.97 cgs,2.21 days,1.1 Gyr,False
μ Pic,μ,,46860.0,31137.0,06h 31m 58.31s,−58° 45′ 13.8″,5.69,−1.04,724.0,B9V,suspected variable,B9 Veor B9 IVn + A8 V:p?,10375.0 K,3.32 M☉,4.43 R☉,205.0 L☉,3.612 cgs,228.0 km/s,258.0 Myr,False
κ Pic,κ,,35580.0,25098.0,05h 22m 22.15s,−56° 08′ 04.0″,6.1,−0.71,749.0,B8/B9V,,B8/9 V,11641.0 K,3.42 M☉,,210.0 L☉,,264.0 km/s,256.0 Myr,False
TX Pic,,TX,37434.0,26300.0,05h 36m 02.85s,−47° 18′ 49.4″,6.1,0.08,522.0,K2III,"RS CVn variable, Vmax = 6.08m, Vmin = 6.12m",,,,,,,,,False
AE Pic,,AE,46792.0,31068.0,06h 31m 10.65s,−61° 52′ 46.5″,6.15,−1.58,1148.0,B3V,β Lyr variable,B3V,17873.0 K,7.1 M☉,,2569.0 L☉,,1.490911 d,27.7 Myr,False
AK Pic,,AK,48189.0,31711.0,06h 38m 00.42s,−61° 32′ 00.8″,6.18,4.47,71.0,G1/G2V,"T Tau star, ΔV = 0.05m, P = 2.60 d",G2 + K5:,5860.0 K,1.03 M☉,1.22 R☉,1.45 L☉,,15.1 km/s,,False
θ Pic,θ,,35860.0,25303.0,05h 24m 46.29s,−52° 18′ 58.2″,6.26,0.19,534.0,A0V,,A0V(A1III + Am),,,,68.0 L☉,,,,False
R Pic,,R,30551.0,22170.0,04h 46m 09.55s,−49° 14′ 45.1″,6.35,,6700.0,M2.5:IIe,"semiregular variable, Vmax = 6.35m, Vmin = 10.1m, P = 168 d",M1IIe-M4IIe,,,,,,,,False
ι Pic B,ι,,31204.0,22534.0,04h 50m 56.58s,−53° 27′ 35.7″,6.42,3.89,105.0,F0IV,,F0 V,7331.0 K,1.51 M☉,1.8 R☉,7.2 L☉,4.28 cgs,,696.0 Myr,False
SW Pic,,SW,41586.0,28596.0,06h 02m 09.32s,−60° 05′ 48.7″,6.45,−0.61,825.0,M4III,"semiregular variable, ΔV = 0.12m",,,,,,,,,False
S Pic,,S,33894.0,24126.0,05h 10m 57.25s,−48° 30′ 25.45″,6.5,,1330.0,M7e,"Mira variable, Vmax = 6.5m, Vmin = 14.0m, P = 422 d",M6.5e-M8III-IIe,,,,,,,,False
HD 33331,,TU,33331.0,23833.0,05h 07m 25.93s,−44° 49′ 18.0″,6.93,,964.0,B5III,"slowly pulsating B star, ΔV = 0.03m, P = 1.14686 d",,,,,,,,,False
TV Pic,,TV,30861.0,22370.0,04h 48m 57.47s,−47° 08′ 04.3″,7.44,,634.0,A2V,"rotating ellipsoidal variable, Vmax = 7.37m, Vmin = 7.53m, P = 0.851994 d",A2V,,,,,,,,False
Kapteyn's Star,,VZ,33793.0,24186.0,05h 11m 40.58s,−45° 01′ 26.3″,8.89,10.92,13.0,M1V,nearest halo star; BY Dra variable; has two planets (b and c),sdM1or M1.5V,3570.0 K,0.281 M☉,0.291 R☉,0.012 L☉,4.96 cgs,124.71 d,11.5 Gyr,False
AB Pic,,AB,44627.0,30034.0,06h 19m 12.91s,−58° 03′ 15.5″,9.21,5.87,148.0,K2V,"T Tau star, ΔV = 0.045m, P = 3.853 d has a planet or a brown dwarf (b)",K1V(e),5188.0 K,0.9 M☉,0.92 R☉,0.51 L☉,4.67 cgs,3.9 d,13.0 Myr,False
RR Pic,,RR,,31481.0,06h 35m 36.06s,−62° 38′ 24.3″,12.5,,,,"nova, Vmax = 1.0m, Vmin = 12.65m, P = 0.145025 d",,,,,,,,,False
TW Pic,,TW,,,05h 34m 50.58s,−58° 01′ 40.7″,,,,,nova-like star,,,,,,,,,False
]]

return M
