local M = {}
M.csv = [[
Name,B,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
β Ara,β,,157244.0,85258.0,17h 25m 18.00s,−55° 31′ 47.4″,2.84,−3.49,603.0,K0/1Ib,,K0/1Ib,4232.0 K,7.89 M☉,141.4 R☉,5774.0 L☉,0.97 cgs,5.4 km/s,50.1 Myr,True
α Ara,α,,158427.0,85792.0,17h 31m 50.52s,−49° 52′ 33.5″,2.84,−1.51,242.0,B2Vne,"Choo, Tchou; λ Eri and γ Cas variable, Vmax = 2.73m, Vmin = 3.00m, P = 0.98127 d",B2 Vne,18044.0 K,9.6 M☉,4.5 R☉,5800.0 L☉,3.99 cgs,375.0 km/s,,True
ζ Ara,ζ,,152786.0,83081.0,16h 58m 37.23s,−55° 59′ 24.2″,3.12,−3.11,574.0,K5III,,K3 III,4246.0 K,8.0 M☉,114.0 R☉,3800.0 L☉,1.2 cgs,,50.0 [citation needed]Myr,True
γ Ara,γ,,157246.0,85267.0,17h 25m 23.66s,−56° 22′ 39.7″,3.31,−4.40,1136.0,B1Ib,,B1 Ib,21240.0 K,19.0 M☉,14.2 R☉,120000.0 L☉,3.5 cgs,4.8 days,15.7 Myr,True
δ Ara,δ,,158094.0,85727.0,17h 31m 05.98s,−60° 41′ 01.0″,3.6,−0.19,187.0,B8V,,B8 Vn+ G8 V,12549.0 K,3.44 M☉,3.12 R☉,214.0 L☉,3.81 cgs,255.0 km/s,125.0 Myr,True
θ Ara,θ,,165024.0,88714.0,18h 06m 37.88s,−50° 05′ 29.2″,3.65,−3.81,1012.0,B2Ib,,B2 Ib,17231.0 K,8.9 M☉,20.1 R☉,3450.0 L☉,2.7 cgs,95.0 km/s,28.2 Myr,True
η Ara,η,,151249.0,82363.0,16h 49m 47.11s,−59° 02′ 28.7″,3.77,−1.14,313.0,K5III,binary star,K5 III,4147.0 K,1.12 M☉,40.44 R☉,575.0 L☉,1.06 cgs,1.55 km/s,4.98 Gyr,True
ε1 Ara,ε1,,152980.0,83153.0,16h 59m 35.05s,−53° 09′ 37.8″,4.06,−0.79,304.0,K4III,,K3 III,4302.0 K,1.63 M☉,29.52 R☉,347.0 L☉,1.85 cgs,4.2 km/s,1.82 Gyr,True
σ Ara,σ,,159217.0,86092.0,17h 35m 39.61s,−46° 30′ 20.1″,4.56,−0.80,385.0,A0V,,A0 V,9986.0 K,2.56 M☉,4.9 R☉,215.0 L☉,3.47 cgs,,,False
λ Ara,λ,,160032.0,86486.0,17h 40m 23.73s,−49° 24′ 54.6″,4.76,3.06,71.0,F3IV,suspected δ Sct variable,F4 V,6495.0 K,1.37 M☉,1.711 R☉,4.69 L☉,4.064 cgs,15.5 km/s,2.44 Gyr,False
μ Ara,μ,,160691.0,86796.0,17h 44m 08.72s,−51° 50′ 00.9″,5.12,4.20,50.0,G3IV-V,"Cervantes, has four planets (b, c, d, & e)",G3IV–V,5974.0 K,1.1 M☉,1.28 R☉,1.879 L☉,4.3 cgs,3.1 km/s,6.34 Gyr,False
κ Ara,κ,,157457.0,85312.0,17h 26m 00.03s,−50° 38′ 00.7″,5.19,−0.24,398.0,K1III,a triple star system.,G8 III,4855.0 K,3.23 M☉,18.22 R☉,166.1 L☉,2.56 cgs,1.0 km/s,,False
ι Ara,ι,,157042.0,85079.0,17h 23m 16.08s,−47° 28′ 05.4″,5.21,−1.51,721.0,B2IIIne,"Be star, Vmax = 5.18m, Vmin = 5.26m, P = 0.5565 d",B2 IVe + sdO,20172.0 K,8.3 M☉,6.3 R☉,10864.0 L☉,4.18 cgs,340.0 km/s,30.0 Myr,False
π Ara,π,,159492.0,86305.0,17h 38m 05.57s,−54° 30′ 00.3″,5.25,2.12,137.0,A7V,,A5 IV-V,8215.0 K,1.73 M☉,1.9 R☉,13.3 L☉,4.36 cgs,54.1 km/s,319.0 Myr,False
ε2 Ara,ε2,,153580.0,83431.0,17h 03m 08.71s,−53° 14′ 11.9″,5.27,3.17,86.0,F6V,,F5 V Fe+0.5+ DA3.2,6577.0 K,1.4 M☉,1.8 R☉,4.56 L☉,4.29 cgs,45.4 km/s,1.77 Gyr,False
ρ2,ρ2,,152824.0,83057.0,16h 58m 17.95s,−50° 38′ 27.9″,5.53,−0.50,523.0,B9IV,,B9 IVor B9 V,10520.0 K,3.42 M☉,5.104 R☉,238.0 L☉,,302.0 km/s,,False
V539 Ara,ν1,V539,161783.0,87314.0,17h 50m 28.39s,−53° 36′ 44.6″,5.68,−1.33,823.0,B2V + B3V,"Algol variable and slowly pulsating B star, Vmax = 5.71m, Vmin = 6.24m, P = 3.169094 d",B2 V + B3 V + A1 V,18100.0 K,6.239 M☉,4.551 R☉,2000.0 L☉,3.917 cgs,100.0 km/s,23.2 Myr,False
V854 Ara,,V854,155035.0,84105.0,17h 11m 38.67s,−48° 52′ 24.2″,5.94,−1.09,830.0,M1/M2III,slow irregular variable,M1.5 III,3675.0 K,4.07 M☉,172.0 R☉,3454.0 L☉,,,,False
V862 Ara,,V862,158220.0,85751.0,17h 31m 23.28s,−56° 55′ 15.47″,5.95,-3.14,2146.0,B7II-III,Be star,B7II-III,9657.0 K,,,1176.0 L☉,,,,False
HR 6384,,V829,155341.0,84311.0,17h 14m 13.40s,−56° 53′ 18.6″,6.08,−1.90,1283.0,M1/2II/III+A,"semiregular variable, Vmax = 6.02m, Vmin = 6.25m, P = 50.58 d",M1/M2II/III + A,3562.0 K,,160.39 R☉,3732.0 L☉,,,,False
ν2 Ara,ν2,,161917.0,87379.0,17h 51m 11.03s,−53° 07′ 49.0″,6.09,0.13,508.0,B9.5III/IV,,B9.5 III-IV,9586.0 K,2.4 M☉,3.9 R☉,117.0 L☉,3.64 cgs,,,False
V828 Ara,,V828,153261.0,83323.0,17h 01m 47.39s,−58° 57′ 29.6″,6.26,−2.96,2280.0,B2IVne,"Be star, Vmax = 6.11m, Vmin = 6.24m",B1 V:neor B2 IVne,21150.0 K,10.1 M☉,4.5 R☉,11045.0 L☉,,,20.4 Myr,False
V626 Ara,,V626,160342.0,86628.0,17h 42m 03.62s,−50° 30′ 38.4″,6.28,−2.01,1482.0,M3III,"slow irregular variable, Vmax = 6.23m, Vmin = 6.46m",M3 III,3479.0 K,1.1 M☉,95.0 R☉,2002.0 L☉,0.48 cgs,,,False
V872 Ara,,V872,149989.0,81650.0,16h 40m 44.39s,−51° 28′ 42.9″,6.3,2.86,159.0,A9V,γ Dor variable,A9 VorF1 V nn m-4,7003.0 K,1.6 M☉,1.7 R☉,6.27 L☉,4.21 cgs,136.0 km/s,1.144 Gyr,False
ρ1 Ara,ρ1,V846,152478.0,82868.0,16h 56m 08.85s,−50° 40′ 29.2″,6.3,−0.51,751.0,B3Vnpe,Be star,B3 Vnpe,19800.0 K,6.5 M☉,4.21 R☉,1418.0 L☉,3.75 cgs,370.0 km/s,18.4 Myr,False
HD 157832,,V750,157832.0,85467.0,17h 27m 54.81s,−47° 01′ 34.4″,6.65,-5.07,7200.0,B2Vne,"γ Cas variable, Vmax = 6.62m, Vmin = 6.68m, P = 1.10406 d",,,,,,,,,False
R Ara,,R,149730.0,81589.0,16h 39m 44.74s,−56° 59′ 39.8″,6.73,2.20,262.0,B9IV/V,"Algol variable, Vmax = 6.17m, Vmin = 7.32m, P = 4.42522 d",B9Vp(B5V + F1IV),12500.0 K,5.0 M☉,3.41 R☉,257.0 L☉,4.07 cgs,202.0 km/s,,False
HD 155555,,V824,155555.0,84586.0,17h 17m 25.50s,−66° 57′ 03.7″,6.77,4.18,102.5,G5IV+K0IV-V,"RS CVn variable, ΔV = 0.07m, P = 1.6816 d",,,,,,,,,False
V535 Ara,,V535,159441.0,86306.0,17h 38m 05.55s,−56° 49′ 17.3″,7.36,2.02,381.0,A8V,"W UMa variable, Vmax = 7.17m, Vmin = 7.75m, P = 0.62930098 d",,,,,,,,,False
RW Ara,,RW,158830.0,,17h 34m 49.23s,−57° 08′ 50.5″,8.97,,,A1IV,"Algol variable, Vmax = 8.85m, Vmin = 11.45m, P = 4.3674535 d",,,,,,,,,False
S Ara,,S,,88064.0,17h 59m 10.75s,−49° 26′ 00.5″,10.73,1.81,1980.0,A3,"RR Lyr variable, Vmax = 9.92m, Vmin = 11.24m, P = 0.451848 d",A3 II,6563.0 K,0.62 M☉,3.01 R☉,27.0 L☉,2.9 cgs,,,False
SAO 244567,,V839,,,17h 16m 21.08s,−59° 29′ 23.3″,10.75,-2.96,18000.0,B3e,central star of Stingray Nebula,,,,0.08 ly,,,,,False
AE Ara,,AE,,,17h 41m 04.91s,−47° 03′ 27.0″,11.0,,,M2-5.5+Be,"Z And variable, Vmax = 11.0m, Vmin = 13.6m, P = 803.4 d",,,,,,,,,False
CPD -56 8032,,V837,,83916.0,17h 09m 00.86s,−56° 54′ 48.1″,11.04,,,WC10,"central star of planetary nebula; Wolf–Rayet star Vmax = 10.9m, Vmin = 12.4m",,,,,,,,,False
AT Ara,,AT,,,17h 30m 33.80s,−46° 05′ 58.9″,11.5,,,K2+,"SS Cyg variable, Vmax = 11.5m, Vmin = 15.32m, P = 0.37555 d",,,,,,,,,False
GX 339-4,,V821,,,17h 02m 49.36s,−48° 47′ 22.8″,15.5,,,,"X-ray nova, Vmax = 15.4m, Vmin = 20.4m, P = 1.7557 d",,,,,,,,,False
BPM 25114,,V820,,,17h 47m 46.9s,−52° 07′ 10″,15.62,,,DA:,"variable white dwarf, Vmax = 15.57m, Vmin = 15.74m, P = 2.8391 d",,,,,,,,,False
4U 1636-53,,V801,,,16h 40m 55.5s,−53° 45′ 05″,17.5,,,A1IV,"X-ray burster, Vmax = 16.5m, Vmin = 19.5m, P = 0.15804693 d",,,,,,,,,False
BF Ara,,BF,,,17h 38m 21.33s,−47° 10′ 41.5″,,,,,SU UMa variable,,,,,,,,,False
OY Ara,,OY,149990.0,,16h 40m 50.27s,−52° 25′ 51.3″,,,,,nova and Algol variable,,,0.82 M☉,,,,,,False
]]

return M
