local M = {}
M.csv = [[
Name,B,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
α Tel,α,,169467.0,90422.0,18h 26m 58.43s,−45° 58′ 06.0″,3.49,−0.93,249,B3IV,,B3 IV,16700.0 K,5.2 M☉,3.3 R☉,794.0 L☉,4.12 cgs,14.0 km/s,24.1 Myr,True
ζ Tel,ζ,,169767.0,90568.0,18h 28m 49.74s,−49° 04′ 12.1″,4.10,1.14,127,G8/K0III,,K1 III-IV,4824.0 K,1.41 M☉,8.27 R☉,33.3 L☉,2.84 cgs,,,True
ε Tel,ε,,166063.0,89112.0,18h 11m 13.78s,−45° 57′ 15.6″,4.52,−0.97,409,G5III,,K0 III,4996.0 K,3.9 M☉,20.0 R☉,256.0 L☉,2.32 cgs,6.1 km/s,,False
λ Tel,λ,,175510.0,93148.0,18h 58m 27.76s,−52° 56′ 19.0″,4.85,−1.21,531,A0V,,B9.5 IV/Vor B9 III,10139.0 K,2.81 M☉,5.53 R☉,260.0 L☉,3.56 cgs,110.0 km/s,268.0 Myr,False
ι Tel,ι,,184127.0,96341.0,19h 35m 12.99s,−48° 05′ 56.8″,4.88,−0.55,398,G9III,,K0 III,4738.0 K,2.53 M☉,19.7 R☉,172.0 L☉,1.88 cgs,1.8 km/s,,False
δ1 Tel,δ1,,170465.0,90830.0,18h 31m 45.44s,−45° 54′ 53.1″,4.92,−2.02,795,B6IV,,B6 IV,12417.0 K,4.52 M☉,4.7 R☉,899.0 L☉,,11.0 km/s,178.0 Myr,False
ξ Tel,ξ,,190421.0,99120.0,20h 07m 23.17s,−52° 52′ 50.9″,4.93,−3.00,1254,M1II,"slow irregular variable, Vmax = 4.89m, Vmin = 4.94m",K5 IIIor M1 IIab,4529.0 K,6.6 M☉,134.0 R☉,3413.0 L☉,0.99 cgs,,,False
η Tel,η,,181296.0,95261.0,19h 22m 51.18s,−54° 25′ 25.4″,5.03,1.64,155,A0Vn,has a debris disk and brown dwarf companion,A0 Vn+ M7V/M8V,11941.0 K,2.09 M☉,1.61 R☉,24.0 L☉,4.6 cgs,330.0 km/s,12.0 Myr,False
δ2 Tel,δ2,,170523.0,90853.0,18h 32m 01.94s,−45° 45′ 26.5″,5.07,−2.60,1116,B3III,,B3 IV/Vor B3 III,17100.0 K,7.6 M☉,72.0 R☉,5129.0 L☉,3.37 cgs,45.0 km/s,39.8 Myr,False
ρ Tel,ρ,,177171.0,93815.0,19h 06m 19.92s,−52° 20′ 26.3″,5.17,1.57,171,F7V,"variable star, ΔV = 0.011m, P = 4.73687 d",F6 V,6303.0 K,1.97 M☉,,25.6 L☉,3.51 cgs,68.5 km/s,1.3 Gyr,False
κ Tel,κ,,174295.0,92646.0,18h 52m 39.61s,−52° 06′ 25.7″,5.18,0.41,293,G8/K0III,,G8/K0 III,4968.0 K,1.92 M☉,10.51 R☉,77.6 L☉,2.79 cgs,2.63 km/s,1.25 Gyr,False
ν Tel,ν,,186543.0,97421.0,19h 48m 01.10s,−56° 21′ 44.2″,5.33,1.75,170,A9Vn,,A7 III/IV,8199.0 K,1.85 M☉,1.94 R☉,15.6 L☉,4.08 cgs,,686.0 Myr,False
QV Tel,,QV,167128.0,89605.0,18h 17m 07.54s,−56° 01′ 24.0″,5.36,−1.43,743,B3IIIpe,,B3IIIpeor B3II/III,16000.0 K,0.27 M☉,4.4 R☉,1122.0 L☉,2.8 cgs,50.0 km/s,50.0 Myr,False
PW Tel,,PW,183806.0,96178.0,19h 33m 21.63s,−45° 16′ 18.1″,5.61,−0.04,436,A0p,"α² CVn variable, ΔV = 0.011m, P = 2.9213 d",A0 Vp (SrCr),10070.0 K,2.79 M☉,3.41 R☉,100.0 L☉,3.68 cgs,55.0 km/s,363.0 Myr,False
HD 170069,τ,,170069.0,90662.0,18h 29m 55.92s,−47° 13′ 13.8″,5.69,−0.61,594,K2III,Labelled τ by Lacaille but designation dropped by Gould,K2 III,4490.0 K,4.08 M☉,23.69 R☉,217.0 L☉,1.46 cgs,<1.0 km/s,,False
QQ Tel,,QQ,185139.0,96721.0,19h 39m 41.80s,−45° 16′ 42.8″,6.24,1.25,324,Am,δ Sct variable,F2 IVor F0 III:,7380.0 K,1.68 M☉,3.19 R☉,26.1 L☉,3.73 cgs,45.0 km/s,995.0 Myr,False
μ Tel,μ,,183028.0,95932.0,19h 30m 34.57s,−55° 06′ 36.1″,6.29,3.47,120,F5V,,F5 V,6570.0 K,1.28 M☉,1.4 R☉,3.22 L☉,4.3 cgs,6.9 km/s,2.12 Gyr,False
RX Tel,,RX,177456.0,,19h 06m 58.21s,−48° 58′ 13.6″,6.45–7.47,,7136+1783 −1245,M3Iab/Ib,"slow irregular variable, Vmax = 6.45m, Vmin = 7.47m, one of the largest known stars",,,,,,,,,False
BL Tel,,BL,177300.0,93844.0,19h 06m 38.11s,−51° 25′ 03.2″,7.10,,,F0Iab/Ib,"Algol and semiregular variable, Vmax = 7.09m, Vmin = 9.08m, P = 778.0 d",F4Ib+M,5438.0 K,,64.0 R☉,3225.0 L☉,,,,False
HO Tel,,HO,187418.0,97756.0,19h 51m 58.93s,−46° 51′ 42.4″,8.31,,1090,A7IIIm...,"Algol variable, Vmax = 8.22m, Vmin = 8.73m, P = 1.613101 d",A7III(m),,1.88 M☉,2.28 R☉,,,,1.1 Gyr,False
PZ Tel,,PZ,174429.0,92680.0,18h 53m 05.88s,−50° 10′ 49.9″,8.34,,167.9,G9IV,"T Tau star, ΔV = 0.032m, P = 0.9457 d",G9 IV+ M7±1,5338.0 K,1.13 M☉,1.23 R☉,0.993 L☉,4.41 cgs,0.943±0.002,24.0 Myr,False
HD 176387,,MT,176387.0,93476.0,19h 02m 12s,−46° 39′ 12.1″,8.94,,2810,A0w,"RR Lyr variable, Vmax = 8.70m, Vmin = 9.25m, P = 0.3169011 d",,,,,,,,,False
HD 168476,,PV,168476.0,90099.0,18h 23m 14.66s,−56° 37′ 44.2″,9.30,-5.47,7600,B5p,"prototype PV Tel variable, Vmax = 9.24m, Vmin = 9.40m",B5p,13750.0 K,0.94 M☉,27.2 R☉,24000.0 L☉,1.6 cgs,,,False
RS Tel,,RS,,89739.0,18h 18m 51.22s,−46° 32′ 53.4″,9.6,,876,Rv...,"R CrB variable, Vmax = 9.6m, Vmin = <16.5m, P = 48.6 d",R0,5800.0 K,,73.0 R☉,288.0 (at max)L☉,1.0 cgs,,,False
RR Tel,,RR,,,20h 04m 18.54s,−55° 43′ 33.2″,10.81,,8500,M5III+WD,symbiotic nova,,2500.0 K,0.9 M☉,518.0 R☉,9450.0 L☉,6.0 cgs,,,False
KK Tel,,KK,,,20h 28m 30.46s,−52° 18′ 45.6″,13.5,,,,"SU UMa variable, Vmax = 13.5m, Vmin = 19.6m, P = 0.0845 d",,,,,,,,,False
EC 20058-5234,,QU,,,20h 09m 40.1s,−52° 25′ 17″,14.93,,,DB,"V777 Her variable, ΔV = 0.05m, P = 0.00297287 d",DB2,24843.0 K,0.569 M☉,,,7.91 cgs,,,False
QS Tel,,QS,,,19h 38m 35.81s,−46° 12′ 57.0″,15.25,,,CV,"AM Her variable, Vmax = 15.25m, Vmin = 17.4m, P = 0.097187 d",M4.5±0.5,17500.0 K,0.71 M☉,,,,,,False
]]

return M
