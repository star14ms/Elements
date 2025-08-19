local M = {}
M.csv = [[
Name,B,F,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
α Lep,α,11,,36673.0,25985.0,05h 32m 43.81s,−17° 49′ 20.3″,2.58,−5.40,1283.0,F0Ib,"Arneb (Elarneb), Arsh; suspected variable, Vmax = 2.56m, Vmin = 2.62m",F0 Ib,7290.0 K,13.0 M☉,105.0 R☉,27000.0 L☉,1.34 cgs,21.0 km/s,13.0 Myr,True
β Lep,β,9,,36079.0,25606.0,05h 28m 14.73s,−20° 45′ 33.2″,2.81,−0.63,159.0,G5II,Nihal (Nibal),G5 II,5434.0 K,3.5 M☉,15.9 R☉,160.0 L☉,2.6 cgs,11.0 km/s,240.0 Myr,True
ε Lep,ε,2,,32887.0,23685.0,05h 05m 27.65s,−22° 22′ 15.1″,3.19,−1.02,227.0,K4III,"suspected variable, Vmax = 3.12m, Vmin = 3.20m",K4 III,4131.0 K,1.7 M☉,40.1 R☉,372.0 L☉,1.43 cgs,,1.72 Gyr,True
μ Lep,μ,5,,33904.0,24305.0,05h 12m 55.87s,−16° 12′ 19.5″,3.29,−0.47,184.0,B9IV: HgMn,"α2 CVn variable, Vmax = 2.97m, Vmin = 3.41m, P = 2 d",B9 IV:HgMn,12800.0 K,3.7 M☉,3.39 R☉,251.0 L☉,3.77 cgs,16.0 km/s,138.0 Myr,True
ζ Lep,ζ,14,,38678.0,27288.0,05h 46m 57.35s,−14° 49′ 19.0″,3.55,1.89,70.0,A2Vann,has a possible asteroid belt,A2 IV-V(n),9772.0 K,1.46 M☉,1.5 R☉,14.0 L☉,4.41 cgs,245.0 km/s,231.0 Myr,True
γ Lep,γ,13,,38393.0,27072.0,05h 44m 27.97s,−22° 26′ 51.0″,3.59,3.83,29.0,F7V,,F6 V,6276.0 K,1.17 M☉,1.3 R☉,2.36 L☉,4.35 cgs,5.91 days,1.3 Gyr,True
η Lep,η,16,,40136.0,28103.0,05h 56m 24.32s,−14° 10′ 04.9″,3.71,2.82,49.0,F1V,,F2 V,6899.0 K,1.42 M☉,1.52 R☉,6.03 L☉,4.13 cgs,26.0 km/s,1.8 Gyr,True
δ Lep,δ,15,,39364.0,27654.0,05h 51m 19.15s,−20° 52′ 39.0″,3.76,1.08,112.0,G8III/IV,,K1 IV Fe−0.5orK0 IIIb Fe−1.5 CH0.5,4684.0 K,0.94 M☉,10.01 R☉,45.7 L☉,2.41 cgs,0.0 km/s,10.7 Gyr,True
λ Lep,λ,6,,34816.0,24845.0,05h 19m 34.53s,−13° 10′ 36.4″,4.29,−3.30,1076.0,B0.5IV,,B0.5 V,30400.0 K,15.0 M☉,4.5 R☉,15488.0 L☉,4.3 cgs,30.0 km/s,8.0 Myr,False
κ Lep,κ,4,,33949.0,24327.0,05h 13m 13.89s,−12° 56′ 28.6″,4.36,−1.81,559.0,B7V,suspected variable,B9 V,11588.0 K,4.86 M☉,2.6 R☉,1346.0 L☉,3.44 cgs,135.0 km/s,,False
ι Lep,ι,3,,33802.0,24244.0,05h 12m 17.89s,−11° 52′ 08.9″,4.45,0.11,241.0,B8V,,B7.5 Vn+ K7.2 XR? + G8 Ve,13781.0 K,3.37 M☉,,153.0 L☉,4.25 cgs,185.0 km/s,94.0 Myr,False
θ Lep,θ,18,,41695.0,28910.0,06h 06m 09.33s,−14° 56′ 07.0″,4.67,1.08,170.0,A0V,,A0 V,10453.0 K,2.35 M☉,,41.0 L☉,4.12 cgs,246.0 km/s,207.0 Myr,False
17 Lep,,17,SS,41511.0,28816.0,06h 04m 59.13s,−16° 29′ 03.9″,4.92,−2.66,1069.0,Ap shell,"rotating ellipsoidal and Z And variable, Vmax = 4.82m, Vmin = 5.06m, P = 260.34 d",A1V + M6III,9000.0 K,2.71 M☉,18.0 R☉,1900.0 L☉,2.0 cgs,,,False
8 Lep,,8,,35337.0,25202.0,05h 23m 30.16s,−13° 55′ 38.5″,5.25,−3.47,1811.0,B2IV,,,,,,,,,,False
19 Lep,,19,,42042.0,29048.0,06h 07m 41.63s,−19° 09′ 57.6″,5.28,−1.41,710.0,M1III,semiregular variable,,,,,,,,,False
ν Lep,ν,7,,34863.0,24873.0,05h 19m 59.03s,−12° 18′ 56.2″,5.29,0.25,332.0,B7/B8V,,B7/8 Vor B7 IVnn,12417.0 K,3.28 M☉,3.0 R☉,138.0 L☉,,285.0 km/s,,False
10 Lep,,10,,36473.0,25853.0,05h 31m 07.62s,−20° 51′ 48.8″,5.53,0.93,272.0,A0V,,,,,,,,,,False
RX Lep,,,RX,33664.0,24169.0,05h 11m 22.85s,−11° 50′ 57.2″,5.6,−0.08,447.0,M6.2III,"semiregular variable, Vmax = 5.12m, Vmin = 6.65m, P = 79.54 d",M6.2III,3300.0 K,4.0 M☉,200.0 R☉,4500.0 L☉,,,,False
1 Lep,,1,,32503.0,23474.0,05h 02m 44.94s,−22° 47′ 42.3″,5.74,−0.29,524.0,K1IV,,,,,,,,,,False
YY Lep,,,YY,41933.0,28984.0,06h 06m 57.52s,−21° 48′ 44.2″,5.74,−1.54,931.0,M3II/III,semiregular variable,,,,,,,,,False
12 Lep,,12,,38090.0,26865.0,05h 42m 13.96s,−22° 22′ 25.5″,5.88,−0.97,765.0,A2/A3V,,,,,,,,,,False
HD 38392,,,AK,38392.0,,05h 44m 26.50s,−22° 25′ 18.0″,6.15,,,K2V,"common proper motion with γ Lep; BY Draconis variable, ΔV = 0.06m, P = 21.4 d",K2V,4869.0 K,0.8 M☉,0.793 R☉,0.3 L☉,4.66 cgs,2.8 km/s,0.9 Gyr,False
HD 40745,,,AC,40745.0,28434.0,06h 00m 17.66s,−12° 53′ 59.7″,6.21,2.32,195.0,F2IV,γ Doradus variable,,,,,,,,,False
HD 35850,,,AF,35850.0,25486.0,05h 27m 04.75s,−11° 54′ 03.0″,6.3,4.16,87.0,F7V:,"RS CVn variable, Vmax = 6.26m, Vmin = 6.35m, P = 1 d",F8V(n)k:,6130.0 K,1.218 M☉,1.25 R☉,1.84 L☉,4.3 cgs,0.966 d,24.0 Myr,False
HD 34798,,,YZ,34798.0,24825.0,05h 19m 17.44s,−18° 31′ 11.8″,6.37,−0.56,791.0,B5IV/V,53 Per variable,,,,,,,,,False
HD 34797,,,TX,34797.0,24827.0,05h 19m 18.31s,−18° 30′ 34.4″,6.54,,799.0,B7Vp,"α2 CVn variable, ΔV = 0.04m, P = 2.28715 d",,,,,,,,,False
S Lep,,,S,41698.0,28874.0,06h 05m 45.54s,−24° 11′ 43.9″,6.74,−0.46,898.0,M5III,"semiregular variable, Vmax = 6m, Vmin = 7.58m, P = 97.3 d",,,,,,,,,False
HD 42659,,,UV,42659.0,29365.0,06h 11m 21.75s,−15° 47′ 35.0″,6.77,,429.0,Ap...,rapidly oscillating Ap star,,,,,,,,,False
4 Mon,,(4),,42116.0,29118.0,06h 08m 25.39s,−11° 08′ 46.6″,6.9,1.80,342.0,A2,,,,,,,,,,False
HD 37847,,,TW,37847.0,26714.0,05h 40m 39.72s,−20° 17′ 55.6″,7.0,,720.0,K0IV,"RS CVn variable, ΔV = 0.32m, P = 28.84338 d",,,,,,,,,False
T Lep,,,T,32803.0,23636.0,05h 04m 50.85s,−21° 54′ 16.5″,7.4,,2670.0,M6ev,"Mira variable, Vmax = 7.4m, Vmin = 14.3m, P = 372 d",M6e-M9e,2800.0 K,2.7 M☉,204.0 R☉,,0.5 cgs,,,False
R Lep,,,R,31996.0,23203.0,04h 59m 36.50s,−14° 48′ 21.0″,7.71,,1350.0,"C7,6e","Hind's Crimson Star; Mira variable, Vmax = 5.5m, Vmin = 11.7m, P = 445 d","C7,6e(N6e)",2290.0 K,1.49 M☉,910.0 R☉,13200.0 L☉,0.4 cgs,,,False
RY Lep,,,RY,38882.0,27400.0,05h 48m 10.25s,−20° 01′ 25.0″,8.25,,647.0,A9V,"δ Sct variable, Vmax = 8.05m, Vmin = 8.46m, P = 0.2251475 d",,,,,,,,,False
RS Lep,,,RS,40640.0,,05h 59m 18.42s,−20° 13′ 25.1″,9.88,,,A0V,"Algol variable, Vmax = 9.91m, Vmin = 10.38m, P = 1.2885439 d",,,,,,,,,False
U Lep,,,U,31599.0,22952.0,04h 56m 17.99s,−21° 13′ 02.0″,10.52,,1910.0,A9/F0Iab:,"RR Lyr variable, Vmax = 9.890m, Vmin = 11.093m, P = 0.5814789 d",,,,,,,,,False
]]

return M
