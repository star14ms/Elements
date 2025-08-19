local M = {}
M.csv = [[
Name,B,F,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
Antares A,α,21.0,,148478,80763.0,16h 29m 24.47s,−26° 25′ 55.0″,0.91,−5.24,553.0,M1.5Iab-b,"Cor Scorpii, Qalb al-Aqrab, Vespertilo; 16th brightest star; binary; semiregular variable, Vmax = 0.75m, Vmin = 1.21m, P = 2180 d",M1.5Iab-Ib+ B2.5V,3660.0 K,16.0 M☉,19.0 %)R☉,75900.0 L☉,0.2 cgs,20.0 km/s,15.0 Myr,True
λ Sco,λ,35.0,,158926,85927.0,17h 33m 36.53s,−37° 06′ 13.5″,1.62,−5.05,703.0,B2IV+DA7.9,"Shaula; β Cep and Algol variable, Vmax = 1.59m, Vmin = 1.65m, P = 0.21 d",B1.5IV + B2IV,25000.0 K,10.4 M☉,8.8 R☉,36300.0 L☉,3.8 cgs,3.4 days,,True
θ Sco,θ,,,159532,86228.0,17h 37m 19.13s,−42° 59′ 52.2″,1.86,−2.75,272.0,F1II,"Sargas; suspected variable, Vmax = 1.84m, Vmin = 1.88m",F1III,6294.0 K,3.1 M☉,26.3 (polar)R☉,1400.0 L☉,2.4 cgs,16.6 days,,True
δ Sco,δ,7.0,,143275,78401.0,16h 00m 20.01s,−22° 37′ 17.8″,2.29,−3.16,401.0,B0.2IVe,"Dschubba, Al Jabba, Iclarkrau; γ Cas variable, Vmax = 1.59m, Vmin = 2.32m",B0.3 IV+ B1-3V,27400.0 K,13.0 M☉,8.5 R☉,38000.0 L☉,3.92 cgs,180.0 km/s,10.0 Myr,True
ε Sco,ε,26.0,,151680,82396.0,16h 50m 10.24s,−34° 17′ 33.4″,2.29,0.78,65.0,K2IIIb,"Wei, Larawag; suspected variable, Vmax = 2.24m, Vmin = 2.35m",K1 III,4522.0 K,1.31 M☉,12.65 R☉,60.0 L☉,2.34 cgs,2.6 km/s,3.92 Gyr,True
κ Sco,κ,,,160578,86670.0,17h 42m 29.28s,−39° 01′ 47.7″,2.39,−3.38,464.0,B1.5III,"Girtab; β Cep variable, Vmax = 2.41m, Vmin = 2.42m, P = 0.20 d",B1.5 III,23400.0 K,11.1 M☉,6.8 R☉,6911.0 L☉,4.01 cgs,1.9 days,25.1 Myr,True
β1 Sco,β1,8.0,,144217,78820.0,16h 05m 26.23s,−19° 48′ 19.4″,2.62,−3.44,530.0,B0.5V,"Acrab, Elacrab, Graffias, Grafias, Grassias; suspected variable, Vmax = 2.61m, Vmin = 2.67m",B1V(B0.5IV-V + B1.5V),28000.0 K,15.0 M☉,6.3 R☉,31600.0 L☉,3.8 cgs,55.0 km/s,6.3 Myr,True
υ Sco,υ,34.0,,158408,85696.0,17h 30m 45.84s,−37° 17′ 44.7″,2.7,−3.31,518.0,B2IV,"Lesath, Lesuth",B2 IV,22831.0 K,11.4 M☉,6.1 R☉,7381.0 L☉,,,20.0 Myr,True
τ Sco,τ,23.0,,149438,81266.0,16h 35m 52.96s,−28° 12′ 57.5″,2.82,−2.78,430.0,B0V,"Paikauhale, Alniyat, Al Niyat",B0.2 V,28862.0 K,14.7 M☉,6.42 R☉,25000.0 L☉,4.24 cgs,41.0 days,5.22 Myr,True
π Sco,π,6.0,,143018,78265.0,15h 58m 51.12s,−26° 06′ 50.6″,2.89,−2.85,459.0,B1V + B2V,"Fang; Nur; Vrischika, Iclil rotating ellipsoidal variable, Vmax = 2.88m, Vmin = 2.91m, P = 1.57 d",B1 V + B2 V,25230.0 K,12.5 M☉,5.0 R☉,21900.0 L☉,,100,14.0 Myr,True
σ Sco,σ,20.0,,147165,80112.0,16h 21m 11.32s,−25° 35′ 33.9″,2.9,−3.86,734.0,B1III,"Alniyat, Al Niyat, β Cep variable, Vmax = 2.86m, Vmin = 2.94m, P = 0.25 d",B1 III+ B1 V,26150.0 K,18.0 M☉,12.7 R☉,29000.0 L☉,3.85 cgs,25.0 km/s,10.0 Myr,True
ι1 Sco,ι1,,,161471,87073.0,17h 47m 35.08s,−40° 07′ 37.1″,2.99,−5.71,1791.0,F3Ia,Apollyon,F2 Ia,7103.0 K,12.11 M☉,120.3 R☉,35070.0 L☉,1.0 cgs,,17.0 Myr,True
μ1 Sco,μ1,,,151890,82514.0,16h 51m 52.24s,−38° 02′ 50.4″,3.0,−4.01,821.0,B1.5IV + B,"Xamidimura, Denebakrab; β Lyr variable, Vmax = 2.94m, Vmin = 3.22m, P = 1.45 d",B1.5 V + B6.5 V,24000.0 K,8.3 M☉,3.9 R☉,,4.17 cgs,191.5 km/s,,True
G Sco,G,,,161892,87261.0,17h 49m 51.45s,−37° 02′ 36.1″,3.19,0.24,127.0,K0/K1III,"γ Tel, Fuyue",K2 III,4535.0 K,1.2 M☉,16.4 R☉,93.0 L☉,2.2 cgs,<1.0 km/s,,True
η Sco,η,,,155203,84143.0,17h 12m 09.18s,−43° 14′ 18.6″,3.32,1.61,72.0,F3p,suspected variable,F5 IV,6533.0 K,1.6 M☉,3.307 R☉,17.94 L☉,3.65 cgs,150.0 km/s,1.1 Gyr,True
μ2 Sco,μ2,,,151985,82545.0,16h 52m 20.15s,−38° 01′ 02.9″,3.56,−2.44,517.0,B2IV,"Pipirima, Shéngōng (神宮),",B2 IV,21700.0 K,9.1 M☉,5.6 R☉,2385.0 L☉,3.8 cgs,58.0 km/s,20.0 Myr,True
ζ2 Sco,ζ2,,,152334,82729.0,16h 54m 35.11s,−42° 21′ 38.7″,3.62,0.30,150.0,K4III,"suspected variable, Vmax = 3.59m, Vmin = 3.65m",K4 III,4286.0 K,1.18 M☉,18.7 R☉,130.0 L☉,2.1 cgs,2.3 km/s,6.0 Gyr,True
ρ Sco,ρ,5.0,,142669,78104.0,15h 56m 53.09s,−29° 12′ 50.4″,3.87,−1.62,409.0,B2IV/V,"Iklil, suspected variable",B2 IV,21150.0 K,7.94 M☉,4.36 R☉,3432.0 L☉,,113.0 km/s,13.7 Myr,True
ω1 Sco,ω1,9.0,,144470,78933.0,16h 06m 48.43s,−20° 40′ 08.9″,3.93,−1.64,423.0,B1V,Jabhat al Akrab,B1 V,26530.0 K,11.4 M☉,6.6 R☉,9120.0 L☉,,14.4 h,5.0 Myr,False
ν Sco,ν,14.0,,145502,79374.0,16h 11m 59.74s,−19° 27′ 38.3″,4.0,−1.63,436.0,B2IV,"Jabbah, Jabah; quintuple star",B3V/ ? / ? / ?,13400.0 K,5.1 M☉,6.52 R☉,1260.0 L☉,3.48 cgs,,,False
H Sco,H,,,149447,81304.0,16h 36m 22.46s,−35° 15′ 19.3″,4.18,−0.90,339.0,K5III,"β Nor; suspected variable, Vmax = 4.15m, Vmin = 4.18m",K6III,3875.0 K,1.81 M☉,52.79 R☉,582.0 L☉,1.3 cgs,3.1 km/s,2.18 Gyr,False
N Sco,N,,,148703,80911.0,16h 31m 22.94s,−34° 42′ 15.6″,4.24,−2.56,746.0,B2III-IV,α Nor,B2 III-IV,21877.0 K,7.8 M☉,6.25 R☉,6918.0 L☉,4.0 cgs,70.0 km/s,22.0 Myr,False
Q Sco,Q,,,159433,86170.0,17h 36m 32.85s,−38° 38′ 05.5″,4.26,1.03,144.0,G8/K0III/IV,"suspected variable, Vmax = 4.26m, Vmin = 4.29m",K0 IIIb,4605.0 K,1.1 M☉,12.39 R☉,62.2 L☉,2.41 cgs,<1.0 km/s,,False
ω2 Sco,ω2,10.0,,144608,78990.0,16h 07m 24.30s,−20° 52′ 07.2″,4.31,−0.24,265.0,G6/G8III,"Jabhat al Akrab; on 18 November 2038, it will be occulted by Venus over a small part of Southeast Africa, S Indian Ocean",G6/8III,5363.0 K,3.27 M☉,15.0 R☉,163.0 L☉,2.62 cgs,,282.0 Myr,False
ο Sco,ο,19.0,,147084,80079.0,16h 20m 38.18s,−24° 10′ 09.4″,4.55,−3.24,1177.0,A4II/III,"suspected variable, Vmax = 4.52m, Vmin = 4.58m",A4II/III,8128.0 K,7.9 M☉,15.0 R☉,3162.0 L☉,2.42 cgs,23.0 km/s,39.8 Myr,False
13 Sco,c2,13.0,,145482,79404.0,16h 12m 18.21s,−27° 55′ 34.7″,4.58,−1.20,468.0,B2V,,B2V,24000.0 K,7.8 M☉,,3020.0 L☉,,165.0 km/s,11.0 Myr,False
2 Sco,A,2.0,,142114,77840.0,15h 53m 36.73s,−25° 19′ 37.5″,4.59,−1.03,434.0,B2.5Vn,,B2.5 Vn,20350.0 K,6.9 M☉,,457.4 L☉,,320.0 km/s,30.4 Myr,False
1 Sco,b,1.0,,141637,77635.0,15h 50m 58.75s,−25° 45′ 04.4″,4.63,−1.39,522.0,B1.5Vn,,B1.5 Vn,24000.0 K,8.3 M☉,3.7 R☉,3890.0 L☉,,310.0 km/s,10.3 Myr,False
ζ1 Sco,ζ1,,,152236,82671.0,16h 53m 59.73s,−42° 21′ 43.3″,4.7,−8.5,2600.0,B1Iae,"in NGC 6231; luminous blue variable, Vmax = 4.66m, Vmin = 4.86m",B1.5 Ia+,19000.0 K,53.0 M☉,159.0 R☉,106.0 L☉,1.7 cgs,60.0 km/s,6.5 Myr,False
ξ Sco A,ξ,,,144070,,16h 04m 22.10s,−11° 22′ 23.0″,4.77,,92.0,,51 Lib; sextuple star,F4(V) + F6(V) + G1V,6532.0 K,1.53 M☉,0.94 R☉,0.71 L☉,4.49 cgs,,2.3 Gyr,False
ι2 Sco,ι2,,,161912,87294.0,17h 50m 11.11s,−40° 05′ 25.5″,4.78,−5.50,3705.0,A6Ib,suspected variable,A2 Ibor A6 Ib,8246.0 K,8.8 M☉,78.0 R☉,5798.0 L☉,1.68 cgs,,29.8 Myr,False
22 Sco,i,22.0,,148605,80815.0,16h 30m 12.48s,−25° 06′ 54.6″,4.79,−0.61,393.0,B3V,suspected variable,B3 V,16683.0 K,4.4 M☉,3.4 R☉,601.0 L☉,4.5 cgs,169.0 km/s,8.0 Myr,False
HD 146624,d,,,146624,79881.0,16h 18m 17.92s,−28° 36′ 49.6″,4.8,1.63,140.0,A0V:,,A0 V,9441.0 K,2.13 M☉,1.6 R☉,21.46 L☉,3.99 cgs,39.0 km/s,10.0 Myr,False
V1073 Sco,k,,V1073,154090,83574.0,17h 04m 49.35s,−34° 07′ 22.5″,4.83,−4.74,2672.0,B2Iab,α Cyg variable,B0.7 Ia,2080022500.0 K,8.39 M☉,36.0 R☉,302000.0 L☉,2.702 .65cgs,47.0 km/s,4.2 Myr,False
β2 Sco,β2,,,144218,78821.0,16h 05m 26.58s,−19° 48′ 06.6″,4.9,−2.80,530.0,B2V,component of the β Sco system,B1V(B0.5IV-V + B1.5V),28000.0 K,15.0 M☉,6.3 R☉,31600.0 L☉,3.8 cgs,55.0 km/s,6.3 Myr,False
ψ Sco,ψ,15.0,,145570,79375.0,16h 12m 00.00s,−10° 03′ 51.1″,4.93,1.41,165.0,A3IV,,A1 V,8650.0 K,2.16 M☉,2.084 R☉,18.6 L☉,4.134 cgs,42.3 km/s,451.0 Myr,False
ξ Sco B,ξ,,,144069,78727.0,16h 04m 22.3s,−11° 22′ 18″,5.07,,92.0,F5IV,component of the ξ Sco system,F4(V) + F6(V) + G1V,6532.0 K,1.53 M☉,0.94 R☉,0.71 L☉,4.49 cgs,,2.3 Gyr,False
Antares B,α,21.0,,148479,,16h 29m 24.2s,−26° 25′ 51″,5.2,−0.9,553.0,B2.5V,component of the Antares system,M1.5Iab-Ib+ B2.5V,3660.0 K,16.0 M☉,19.0 %)R☉,75900.0 L☉,0.2 cgs,20.0 km/s,15.0 Myr,False
HD 151804,,,V973,151804,82493.0,16h 51m 33.72s,−41° 13′ 49.9″,5.23,−6.36,6792.0,O8Iaf,"α Cyg variable, Vmax = 5.22m, Vmin = 5.28m",O8 Iaf,29000.0 K,40.0 M☉,35.4 R☉,800000.0 L☉,3.0 cgs,104.0 km/s,2.1 Myr,False
χ Sco,χ,17.0,,145897,79540.0,16h 13m 50.91s,−11° 50′ 15.8″,5.24,−0.41,439.0,K3III,Has a planet (b),K3 III,4157.0 K,1.22 M☉,25.92 R☉,179.62 L☉,1.66 cgs,8.0 km/s,8.39 Gyr,False
HD 148688,,,V1058,148688,80945.0,16h 31m 41.77s,−41° 49′ 01.7″,5.31,−6.79,8579.0,B1Ia,α Cyg variable,,,,,,,,,False
HR 5907,,,V1040,142184,77859.0,15h 53m 55.87s,−23° 58′ 40.9″,5.41,0.01,393.0,B2V,"Algol variable, Vmax = 5.39m, Vmin = 5.43m, P = 1.02 d",B2.5V,17000.0 K,5.5 M☉,3.1 (equatorial)R☉,600.0 L☉,4.2 cgs,0.508276 d,206.0 Myr,False
HD 142990,,,V913,142990,78246.0,15h 58m 34.87s,−24° 49′ 53.1″,5.43,−0.45,488.0,B5V,"SX Ari variable, Vmax = 5.4m, Vmin = 5.47m, P = 0.98 d",B5 V,18000.0 K,5.7 M☉,2.8 R☉,794.0 L☉,4.15 cgs,0.978832 d,5.0 Myr,False
16 Sco,,16.0,,145607,79387.0,16h 12m 07.29s,−08° 32′ 51.3″,5.43,1.01,250.0,A4V,,,,,,,,,,False
HD 149404,,,V918,149404,81305.0,16h 36m 22.57s,−42° 51′ 31.9″,5.46,−4.39,3047.0,O9Ia,"rotating ellipsoidal variable, Vmax = 5.42m, Vmin = 5.5m, P = 9.81 d",O7.5I(f) + ON9.7I,34000.0 K,50.5 M☉,19.3 R☉,430000.0 L☉,3.55 }cgs,,,False
27 Sco,,27.0,,152820,82960.0,16h 57m 11.17s,−33° 15′ 34.1″,5.48,−1.25,724.0,K5III,,,,,,,,,,False
18 Sco,,18.0,,146233,79672.0,16h 15m 37.13s,−08° 22′ 05.7″,5.49,4.76,46.0,G1V,"solar twin; suspected variable, Vmax = 5.48m, Vmin = 5.59m",G2 Va,5817.0 K,1.01 M☉,1.007 R☉,1.043 L☉,4.437 cgs,22.7 d,7.18 Gyr,False
HD 155806,,,V1075,155806,84401.0,17h 15m 19.25s,−33° 32′ 54.3″,5.53,−5.13,4466.0,O8Ve,Be star,,,,,,,,,False
4 Sco,,4.0,,142445,77984.0,15h 55m 30.10s,−26° 15′ 57.3″,5.63,0.02,432.0,A3V,,A3 V,8356.0 K,2.64 M☉,,92.0 L☉,,128.0 km/s,,False
12 Sco,c1,12.0,,145483,79399.0,16h 12m 16.05s,−28° 25′ 01.9″,5.67,0.87,298.0,B9V,,B9V+ K7.9XR? + F3V,11402.0 K,2.939 M☉,,91.0 L☉,,,150.0 Myr,False
HD 159176,,,V1036,159176,86011.0,17h 34m 42.49s,−32° 34′ 54.0″,5.69,−4.40,3396.0,O6V+...,"in NGC 6383; trinary star; rotating ellipsoidal variable, Vmax = 5.67m, Vmin = 5.73m, P = 3.37 d",O6.5V + O7V,38000.0 K,46.4 M☉,,5.5 L☉,,,,False
11 Sco,,11.0,,144708,79005.0,16h 07m 36.44s,−12° 44′ 43.2″,5.75,0.17,426.0,B9V,,,,,,,,,,False
V1003 Sco,,,V1003,149711,81472.0,16h 38m 26.30s,−43° 23′ 54.2″,5.83,−0.79,686.0,B2.5IV,"rotating ellipsoidal variable, ΔV = 0.03m",,,,,,,,,False
3 Sco,,3.0,V927,142301,77909.0,15h 54m 39.54s,−25° 14′ 37.2″,5.87,0.14,455.0,B8III/IV,"SX Ari variable, ΔV = 0.03m, P = 1.46 d",,,,,,,,,False
V957 Sco,,,V957,162374,87460.0,17h 52m 13.66s,−34° 47′ 57.1″,5.87,−1.16,830.0,B6Ib,"In Messier 7; SX Ari variable, ΔV = 0.05m",B5 IIIp,16600.0 K,5.13 M☉,4.0 R☉,1148.0 L☉,3.94 cgs,30.0 km/s,50.0 Myr,False
V929 Sco,,,V929,144334,78877.0,16h 06m 06.38s,−23° 36′ 22.5″,5.9,0.03,487.0,B8V,"SX Ari variable, Vmax = 5.89m, Vmin = 5.91m, P = 1.50 d",,,,,,,,,False
V923 Sco,,,V923,153890,83491.0,17h 03m 50.87s,−38° 09′ 09.0″,5.91,1.88,209.0,F3V,"Algol variable, Vmax = 5.86m, Vmin = 6.24m, P = 34.83 d",,,,,,,,,False
V1068 Sco,,,V1068,152161,82650.0,16h 53m 42.44s,−43° 03′ 03.2″,5.95,−1.81,1160.0,M3II/III,slow irregular variable,,,,,,,,,False
V906 Sco,,,V906,162724,87616.0,17h 53m 54.77s,−34° 45′ 09.8″,6.0,−1.45,1009.0,B9V + B9V,"In Messier 7, Algol variable, Vmax = 5.96m, Vmin = 6.23m, P = 2.79 d",,,,,,,,,False
BM Sco,,,BM,160371,86527.0,17h 40m 58.55s,−32° 12′ 52.0″,6.01,−2.35,1531.0,K3III + (G),"in Messier 6; slow irregular variable, Vmax = 5.25m, Vmin = 6.46m",K2Ib Hδ1,3888.0 K,9.0 M☉,129.0 R☉,3388.0 L☉,1.1 cgs,,,False
HD 152248,,,V1007,152248,82691.0,16h 54m 10.06s,−41° 49′ 30.1″,6.06,,,O7e,"in NGC 6231; β Lyr variable, ΔV = 0.24m, P = 5.82 d",,,,,,,,,False
RR Sco,,,RR,152783,82912.0,16h 56m 37.85s,−30° 34′ 48.1″,6.1,,1150.0,M6IIIe,"Mira variable, Vmax = 5m, Vmin = 12.4m, P = 281.45 d",,,,,,,,,False
HD 154368,,,V1074,154368,83706.0,17h 06m 28.37s,−35° 27′ 03.7″,6.13,−2.85,2040.0,O9.5Iab,α Cyg variable,,,,,,,,,False
HR 6522,,,V949,158741,85839.0,17h 32m 24.64s,−34° 16′ 45.6″,6.16,1.06,341.0,F2IV,"δ Sct variable, Vmax = 6.13m, Vmin = 6.18m, P = 0.22 d",,,,,,,,,False
V861 Sco,,,V861,152667,82911.0,16h 56m 35.98s,−40° 49′ 24.4″,6.18,,,B0Ia,"in Trumpler 24; β Lyr variable, Vmax = 6.07m, Vmin = 6.4m, P = 7.85 d",,,,,,,,,False
RS Sco,,,RS,152476,82833.0,16h 55m 37.81s,−45° 06′ 10.7″,6.2,−0.08,588.0,M6-7e,"Mira variable, Vmax = 5.96m, Vmin = 13.0m, P = 319 d",,,,,,,,,False
V900 Sco,,,V900,152235,82669.0,16h 53m 58.85s,−41° 59′ 39.6″,6.29,,,B1Ia,"in Trumpler 24; rotating ellipsoidal variable, Vmax = 6.29m, Vmin = 6.34m, P = 2.63 d",,,,,,,,,False
ν Sco C,ν,14.0,,145501,,16h 11m 58.60s,−19° 26′ 59.0″,6.3,,,,component of the ν Sco system; α2 CVn variable,B3V/ ? / ? / ?,13400.0 K,5.1 M☉,6.52 R☉,1260.0 L☉,3.48 cgs,,,False
HD 157038,,,V975,157038,85020.0,17h 22m 39.22s,−37° 48′ 16.7″,6.33,,,B4Ia+...,"α Cyg variable, Vmax = 6.27m, Vmin = 6.35m",,,,,,,,,False
HD 151965,,,V911,151965,82554.0,16h 52m 27.42s,−40° 43′ 23.2″,6.35,0.07,588.0,B9p Si,"α² CVn variable, Vmax = 6.32m, Vmin = 6.38m",,,,,,,,,False
V1077 Sco,,,V1077,156325,84650.0,17h 18m 20.51s,−32° 33′ 11.1″,6.36,−1.57,1259.0,B5III,Be star,,,,,,,,,False
HD 145792,,,V1051,145792,79530.0,16h 13m 45.50s,−24° 25′ 19.4″,6.4,0.69,453.0,B6IV,SX Ari variable,,,,,,,,,False
V951 Sco,,,V951,162725,87624.0,17h 53m 58.13s,−34° 49′ 51.8″,6.41,−0.96,973.0,Ap...,"in Messier 7, α² CVn variable, Vmax = 6.39m, Vmin = 6.44m, P = 4.46 d",,,,,,,,,False
V915 Sco,,,V915,155603,84332.0,17h 14m 27.66s,−39° 45′ 59.9″,6.42,,,K0Ia,"variable star, Vmax = 6.22m, Vmin = 6.64m",K0Ia-0,4573.0 K,14.7 M☉,685.6 R☉,185200.0 L☉,0.003 cgs,,,False
HD 151932,,,V919,151932,82543.0,16h 52m 19.25s,−41° 51′ 16.2″,6.49,,,WN7h,"in Trumpler 24; Wolf–Rayet star, Vmax = 6.45m, Vmin = 6.61m, P = 2 d",WN7h,50100.0 K,22.0 M☉,10.14 R☉,630000.0 L☉,3.5 cgs,,,False
4U 1700-37,,,V884,153919,83499.0,17h 03m 56.77s,−37° 50′ 38.9″,6.51,,9100.0,O7.5Iaf,"rotating ellipsoidal variable and high-mass X-ray binary, Vmax = 6.51m, Vmin = 6.60m, P = 3.41 d",O6Iafcp,35000.0 K,46.0 M☉,21.9 R☉,660000.0 L☉,,,,False
HD 145102,,,V952,145102,79235.0,16h 10m 15.92s,−26° 54′ 32.8″,6.57,,547.0,B9p...,"α2 CVn variable, ΔV = 0.04m, P = 1.42 d",,,,,,,,,False
V453 Sco,,,V453,163181,87810.0,17h 56m 16.08s,−32° 28′ 30.0″,6.61,−5.43,8400.0,B0Ia,"β Lyr variable, Vmax = 6.36m, Vmin = 6.73m, P = 12.01 d",,,,,,,,,False
RV Sco,,,RV,153004,83059.0,16h 58m 19.75s,−33° 36′ 32.8″,6.61,,1440.0,G0Ib,"classical Cepheid, Vmax = 6.61m, Vmin = 7.49m, P = 6.06 d",,,,,,,,,False
HD 160529,,,V905,160529,86624.0,17h 41m 59.03s,−33° 30′ 13.7″,6.66,−8.9,8150.0,A3Iae,"luminous blue variable, Vmax = 6.21m, Vmin = 6.97m, P = 57 d",LBV,12000.0 K,13.0 M☉,330.0 R☉,290000.0 L☉,0.55 cgs,45.0 km/s,,False
25 Sco,,25.0,,151179,82140.0,16h 46m 51.35s,−25° 31′ 42.7″,6.72,−0.10,755.0,K0II,,K0 II,4777.0 K,2.075 M☉,12.719 R☉,135.0 L☉,2.509 cgs,,,False
V636 Sco,,,V636,156979,85035.0,17h 22m 46.48s,−45° 36′ 51.4″,6.74,,,F7/F8Ib/II + B9.5V,"classical Cepheid, Vmax = 6.4m, Vmin = 6.92m, P = 6.80 d",F7/8Ib/II-G5,,5.6 M☉,50.0 R☉,2500.0 L☉,,,,False
V760 Sco,,,V760,147683,80405.0,16h 24m 43.72s,−34° 53′ 37.5″,7.05,,1280.0,B4V,Algol variable,,,,,,,,,False
HR 5999,,,V856,144668,79080.0,16h 08m 34.29s,−39° 06′ 18.3″,7.05,,531.0,A7IVe,"UX Ori star, Vmax = 6.77m, Vmin = 8.0m",,,,,,,,,False
HD 147010,,,V933,147010,80024.0,16h 20m 05.49s,−20° 03′ 23.0″,7.37,,533.0,B9II/III,"α2 CVn variable, ΔV = 0.045m, P = 3.92 d",,,,,,,,,False
HD 153747,,,V922,153747,83410.0,17h 02m 53.82s,−38° 27′ 36.8″,7.42,,588.0,A0III,δ Sct variable,,,,,,,,,False
RY Sco,,,RY,162102,87345.0,17h 50m 32.34s,−33° 42′ 20.4″,7.51,,,F6Ib,"classical Cepheid, Vmax = 7.51m, Vmin = 8.36m, P = 20.32 d",,,,,,,,,False
HD 152219,,,V1292,152219,,16h 53m 55.56s,−41° 52′ 51.29″,7.57,,5900.0,O9IV,"in NGC 6231; Algol variable, Vmax = 7.57m, Vmin = 7.80m, P = 4.24 d",,,,,,,,,False
V393 Sco,,,V393,161741,87191.0,17h 48m 47.60s,−35° 03′ 29.6″,7.59,,2400.0,B3III,"double periodic or Algol variable, Vmax = 7.39m, Vmin = 8.31m, P = 7.71 d",,,,,,,,,False
HD 152218,,,V1294,152218,,16h 53m 59.99s,−41° 42′ 52.8″,7.61,,,O9.5IV(n),"in Trumpler 24; Algol variable, Vmax = 7.58m, Vmin = 7.67m, P = 5.60 d",,,,,,,,,False
V703 Sco,,,V703,160589,86650.0,17h 42m 16.81s,−32° 31′ 23.6″,7.85,,556.0,A9V,"double-mode δ Sct variable, Vmax = 7.58m, Vmin = 8.04m, P = 0.12 d",,,,,,,,,False
V482 Sco,,,V482,158443,85701.0,17h 30m 48.38s,−33° 36′ 36.0″,7.91,,,F9II,"classical Cepheid, Vmax = 7.63m, Vmin = 8.3m, P = 4.53 d",,,,,,,,,False
AH Sco,,,AH,155161,84071.0,17h 11m 17.02s,−32° 19′ 30.7″,8.1,,12000.0,M4-5Ia-Iab,"semiregular variable, Vmax = 6.7m, Vmin = 9.5m, P = 735 d; one of the largest known stars",M4-5 Ia-Iab,3682.0 K,20.0 M☉,1411.0 R☉,329000.0 L☉,0.5 cgs,,,False
V1034 Sco,,,V1034,,,16h 54m 19.85s,−41° 50′ 09.4″,8.23,,5900.0,O8V,"in NGC 6231; Algol variable, Vmax = 8.23m, Vmin = 8.63m, P = 2.44 d",,,,,,,,,False
RZ Sco,,,RZ,144018,78746.0,16h 04m 36.13s,−24° 06′ 00.6″,8.3,,,M3e,"semiregular variable, Vmax = 8.3m, Vmin = 12.3m, P = 162.1 d",,,,,,,,,False
HD 158393,,,V965,158393,85680.0,17h 30m 33.36s,−33° 39′ 15.9″,8.57,,937.0,G5:IIIe +F0/2IV/V,"RS CVn variable, Vmax = 8.46m, Vmin = 8.67m, P = 30.52 d",,,,,,,,,False
V500 Sco,,,V500,316354,87173.0,17h 48m 37.50s,−30° 28′ 33.5″,8.81,,1060.0,K0,"classical Cepheid, Vmax = 8.4m, Vmin = 9.13m, P = 9.32 d",,,,,,,,,False
HD 142666,,,V1026,142666,,15h 56m 40.02s,−22° 01′ 40.0″,8.86,,,A8Ve,"UX Ori star, Vmax = 8.57m, Vmin = 9.5m",,,,,,,,,False
V907 Sco,,,V907,163302,,17h 56m 55.56s,−34° 45′ 01.2″,8.86,,,B9V,"Algol variable, Vmax = 8.61m, Vmin = 9.2m, P = 3.78 d",,,,,,,,,False
V718 Sco,,,V718,145718,79476.0,16h 13m 11.59s,−22° 29′ 06.7″,8.86,,383.0,A8III/IV,"UX Ori star, Vmax = 8.75m, Vmin = 10.30m",,,,,,,,,False
V701 Sco,,,V701,317844,85985.0,17h 34m 24.51s,−32° 30′ 16.0″,8.97,,3500.0,B5V,"W UMa variable, Vmax = 8.63m, Vmin = 9.05m, P = 0.76 d",,,,,,,,,False
AK Sco,,,AK,152404,82747.0,16h 54m 44.85s,−36° 53′ 18.6″,9.0,,335.0,F5Ve,"UX Ori star, Vmax = 8.7m, Vmin = 12.8m",F5 IV-V,,1.25 M☉,,,,,18.0 Myr,False
HD 326823,,,V1104,326823,,17h 06m 53.91s,−42° 39′ 39.7″,9.03,,,O+...,"luminous blue variable, Vmax = 8.88m, Vmin = 9.20m, P = 6.12 d",WNpec,22000.0 K,5.5 M☉,19.51 R☉,80000.0 L☉,,,,False
KQ Sco,,,KQ,328953,82498.0,16h 51m 38.55s,−45° 25′ 36.1″,9.33,,1120.0,K7,"classical Cepheid, Vmax = 9.33m, Vmin = 10.26m, P = 28.71 d",,,,,,,,,False
HD 318107,,,V970,318107,,17h 39m 41.26s,−32° 17′ 57.4″,9.34,,,B8,α2 CVn variable,,,,,,,,,False
WR 86,,,V1035,156327,84655.0,17h 18m 23.06s,−34° 24′ 30.6″,9.35,,1770.0,WC7+B0III,"β Cep variable, ΔV = 0.017m, P = 0.15 d",WC7+ B0III,56000.0 K,19.0 M☉,10.0 R☉,200000.0 L☉,,,4.0 Myr,False
CD -35 11760,,,V1037,320156,,17h 37m 58.50s,−35° 23′ 04.32″,9.83,,,B4Ibe,"PV Tel variable, Vmax = 9.62m, Vmin = 9.83m",,,,,,,,,False
AI Sco,,,AI,320921,,17h 56m 18.57s,−33° 48′ 43.4″,9.98,,,G4,"RV Tau variable, Vmax = 8.88m, Vmin = 11.6m, P = 71.9 d",,,,,,,,,False
Scorpius X-1,,,V818,,,16h 19m 55.07s,−15° 38′ 24.8″,11.1,,11000.0,Oev,low-mass X-ray binary,M4-M5V,3050.0 K,0.4 M☉,1.25 R☉,0.114 L☉,,,,False
V921 Sco,,,V921,,,16h 59m 06.79s,−42° 42′ 08.6″,11.43,,,Bep,"γ Cas variable, ΔV = 0.3m",,,60.0 MJ,,,,,,False
HK Sco,,,HK,,,16h 54m 41.04s,−30° 23′ 06.7″,11.7,,,,"Z And variable, Vmax = 11.7m, Vmin = 14.7m, P = 458 d",,,,,,,,,False
T Sco,,,T,,,16h 17m 02.83s,−22° 58′ 31.3″,12.0,,32600.0,,"in Messier 80; nova, Vmax = 6.8m, Vmin = <12.0m",,,,,,,,,False
V866 Sco,,,V866,,,16h 11m 31.40s,−18° 38′ 24.5″,12.05,,,K5,"T Tau star, ΔV = 0.5m, P = 6.78 d",,,,,,,,,False
V1094 Sco,,,V1094,,,16h 08m 36.18s,−39° 23′ 02.5″,12.5,,,K6,"young stellar object, ΔV = 0.5m",K6V,4205.0 K,0.92 M☉,1.9 R☉,1.7 L☉,,,3.0 Myr,False
CL Sco,,,CL,,,16h 54m 51.98s,−30° 37′ 18.2″,13.25,,,M4,"Z And variable and re-radiating binary system, Vmax = 10.8m, Vmin = 13.7m, P = 625 d",,,,,,,,,False
GRO J1655-40,,,V1033,,,16h 54m 00.14s,−39° 50′ 44.9″,14.2,,,B9V,"X-ray nova containing black hole, Vmax = 14m, Vmin = 17.3m",F5IV,8000.0 (primary)[failed verification]K,,,,,,,False
Th 28,,,V1190,,,16h 08m 29.73s,−39° 03′ 11.0″,16.42,,,K0:,"T Tau star, Vmax = 16.42m, Vmin = 16.93m",,,,,,,,,False
MXB 1735-44,,,V926,,,17h 38m 58.3s,−44° 27′ 00″,17.4,,,,"X-ray burster, ΔV = 0.2m, P = 0.19 d",,,,,,,,,False
V992 Sco,,,V992,,,17h 07m 17.44s,−43° 15′ 22.0″,18.0,,,,"nova, Vmax = 7.26m, Vmin = 18.0m, P = 0.15 d",,,,,,,,,False
V1187 Sco,,,V1187,,,17h 29m 18.81s,−31° 46′ 01.5″,18.0,,,,"nova, Vmax = 9.6m, Vmin = 18m",,,,,,,,,False
V1186 Sco,,,V1186,,,17h 12m 51.21s,−30° 56′ 37.2″,18.0,,,,"nova, Vmax = 9.7m, Vmin = <18m",,,,,,,,,False
GX 349+2,,,V1101,,,17h 05m 44.49s,−36° 25′ 23.1″,18.6,,,,"low-mass X-ray binary, Vmax = 18.3m, Vmin = 19.3m, P = 0.94 d",,,,,,,,,False
U Sco,,,U,,,16h 22m 30.80s,−17° 52′ 43.2″,19.3,,,,"recurrent nova and eclipsing binary, Vmax = 7.5m, Vmin = 19.3m, P = 1.23 d",? /White Dwarf,,,,,,,,False
V745 Sco,,,V745,,,17h 55m 22.27s,−33° 15′ 58.5″,19.3,,,,"nova and rotating ellipsoidal variable, Vmax = 9.4m, Vmin = 19.3m, P = 510 d",,,,,,,,,False
V1280 Sco,,,V1280,,,16h 57m 40.91s,−32° 20′ 36.4″,20.0,,,,"nova, Vmax = 3.78m, Vmin = <20.0m",,,,,,,,,False
V1309 Sco,,,V1309,,,17h 57m 33.02s,−30° 43′ 10.4″,20.4,,,,"luminous red nova, Vmax = 7.9m, Vmin = 20.4m",,,,,,,,,False
FQ Sco,,,FQ,,,17h 08m 04.51s,−32° 42′ 02.2″,,,,,SS Cyg variable,,,,,,,,,False
V455 Sco,,,V455,,,17h 07m 21.73s,−34° 05′ 14.5″,,,,,Z And variable,,,,,,,,,False
V893 Sco,,,V893,,,16h 15m 15.15s,−28° 37′ 30.1″,,,,,SU UMa variable and eclipsing binary,,,,,,,,,False
V1018 Sco,,,V1018,,,17h 35m 02.72s,−33° 33′ 29.4″,,,,,semiregular variable,,,,,,,,,False
XTE J1720-318,,,V1228,,,17h 19m 58.99s,−31° 45′ 01.3″,,,,,X-ray nova,,,,,,,,,False
]]

return M
