local M = {}
M.csv = [[
Name,B,F,G.,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
Altair,α,53,86.0,,187642.0,97649.0,19h 50m 46.68s,+08° 52′ 02.6″,0.76,2.20,17,A7IV-V,"Atair, Al Nesr Al Tair, Vulture Volans; 12th brightest star; nearby; has two optical components; δ Sct variable, ΔV = 0.004m, P = 0.06342 d",A7Vn,8620.0 (polar)K,1.86 M☉,1.565 (polar)R☉,10.6 L☉,4.29 cgs,7.77 hours,88.0 Myr,True
γ Aql,γ,50,,,186791.0,97278.0,19h 46m 15.57s,+10° 36′ 47.8″,2.72,−3.03,460,K3II,"Tarazed, Tarazad, Reda, Menkib al Nesr, Humerus Vulturis; double star; suspected variable",K3 II,4098.0 K,3.51 M☉,91.81 R☉,2146.0 L☉,1.52 cgs,8.0 km/s,270.0 Myr,True
ζ Aql,ζ,17,,,177724.0,93747.0,19h 05m 24.61s,+13° 51′ 49.4″,2.99,0.96,83,A0Vn,"Okab, Deneb el Okab, Denebokab Australis, Woo, Yuë (吳越), Dzeneb al Tair, Cauda (Vulturis) Volantis; triple star",A0 Vn,10952.0 (polar)K,2.53 M☉,2.148 (polar)R☉,52.5 L☉,4.15 (polar)cgs,10.575 hours,100.0 Myr,True
θ Aql,θ,65,117.0,,191692.0,99473.0,20h 11m 18.26s,−00° 49′ 17.3″,3.24,−1.48,287,B9.5III,"Antinous, Tseen Foo, Al Mizan III, Thanih Ras al Akab, Secunda Capitis Vulturis; spectroscopic binary; suspected variable",B9.5 III + B9.5 III,10300.0 K,3.564 M☉,4.76 R☉,229.8 L☉,3.64 cgs,36.3 km/s,215.0 Myr,True
δ Aql,δ,30,46.0,,182640.0,95501.0,19h 25m 29.75s,+03° 06′ 52.5″,3.36,2.43,50,F0IV,"Denebokab, Al Mizan I, Song, Sung, Djenubi Menkib al Nesr, Australior Humerus Vulturis; binary star; suspected variable",F0 IV+ K,6958.0 K,1.65 M☉,2.01 R☉,8.52 L☉,4.03 cgs,87.3 km/s,,True
λ Aql,λ,16,19.0,,177756.0,93805.0,19h 06m 14.95s,−04° 52′ 56.4″,3.43,0.51,125,B9Vn,Al Thalimain,B9Vn,12100.0 K,3.1 M☉,2.27 R☉,55.0 L☉,4.15 cgs,103.0 km/s,90.0 Myr,True
β Aql,β,60,98.0,,188512.0,98036.0,19h 55m 18.77s,+06° 24′ 28.6″,3.71,3.03,45,G8IVvar,"Alshain, Alschain, Alschairn, Unuk al Ghyrab, Collum Corvi; binary star; suspected variable; triple star; suspected variable",G9.5 IV+ M2.5 V,5090.0 K,1.24 M☉,3.096 R☉,5.878 L☉,3.549 cgs,5.08697 days,4.77 Gyr,True
η Aql,η,55,89.0,,187929.0,97804.0,19h 52m 28.36s,+01° 00′ 20.4″,3.87,−3.91,1173,F6Ib-G4Ib,"Al Mizan II; Cepheid variable, Vmax = 3.48m, Vmin = 4.39m, P = 7.17664 d",F6 Iab(or F6Ib–G4Ib) + B9.8 V+ F1−5 V,5747.0 K,4.24±0.58;5.7;6.15;M☉,59.0 R☉,3368.0 L☉,1.834 cgs,,150.0 Myr,True
ε Aql,ε,13,,,176411.0,93244.0,18h 59m 37.39s,+15° 04′ 06.5″,4.02,0.65,154,K2III,"Deneb el Okab, Denebokab Borealis, Woo, Yuë (吳越); triple star",K1-IIICN0.5,4760.0 K,2.1 M☉,10.13 R☉,54.0 L☉,2.91 cgs,4.4 km/s,,True
12 Aql,i,12,9.0,,176678.0,93429.0,19h 01m 40.84s,−05° 44′ 20.5″,4.02,0.73,149,K1IIIvar,suspected variable,K1 III,4662.0 K,1.185 M☉,12.28 R☉,58.2 L☉,2.31 cgs,3.6 km/s,3.64 Gyr,True
71 Aql,l,71,146.0,,196574.0,101847.0,20h 38m 20.27s,−01° 06′ 18.3″,4.31,−1.04,384,G8III SB,spectroscopic binary,G7.5 IIIa,5046.0 K,3.6 M☉,16.7 R☉,162.0 L☉,2.77 cgs,10.0 km/s,347.0 Myr,False
ι Aql,ι,41,64.0,,184930.0,96468.0,19h 36m 43.28s,−01° 17′ 11.6″,4.36,−0.51,307,B5III,Al Thalimain; double star,B5 IIIor B6 IV,14500.0 K,4.8 M☉,7.8 R☉,851.0 L☉,3.64 cgs,55.0 km/s,100.0 Myr,False
μ Aql,μ,38,58.0,,184406.0,96229.0,19h 34m 05.23s,+07° 22′ 45.5″,4.45,1.80,111,K3III,multiple star; suspected variable,K3-IIIb Fe0.5,4567.0 K,1.16 M☉,7.43 R☉,24.5 L☉,2.7 cgs,0.0 km/s,6.71 Gyr,False
ν Aql,ν,32,47.0,,182835.0,95585.0,19h 26m 31.09s,+00° 20′ 18.9″,4.64,−8.12,11643,F2Ib,double star; suspected variable,F3 Ib,6396.0 K,12.5 M☉,71.2 R☉,7645.0 L☉,1.43 cgs,13.0 km/s,15.0 Myr,False
ξ Aql,ξ,59,94.0,,188310.0,97938.0,19h 54m 14.882s,+08° 27′ 41.23″,4.722,0.74,204,G9IIIb,"Libertas, has a planet (b)",G9.5 IIIb,4841.0 K,1.74 M☉,10.17 R☉,58.54 L☉,2.61 cgs,5.2 km/s,980.0 Myr,False
69 Aql,,69,141.0,,195135.0,101101.0,20h 29m 38.96s,−02° 53′ 07.7″,4.91,1.07,191,K2III,,K1/2 III,4529.0 K,1.54 M☉,11.0 R☉,45.7 L☉,2.5 cgs,4.0 km/s,3.44 Gyr,False
70 Aql,,70,144.0,,196321.0,101692.0,20h 36m 43.63s,−02° 32′ 59.7″,4.91,−4.24,2203,K5II,,"K4+ III Ba1,K3 III,or K5 II",3900.0 K,6.2 M☉,102.0 R☉,4072.0 L☉,1.9 cgs,1.9 km/s,63.1 Myr,False
κ Aql,κ,39,63.0,,184915.0,96483.0,19h 36m 53.45s,−07° 01′ 38.9″,4.93,−3.32,1455,B0.5III,,B0.5 III,26500.0 K,15.5 M☉,12.5 R☉,52630.0 L☉,3.5 cgs,265.0 km/s,11.1 Myr,False
26 Aql,f,26,38.0,,181391.0,95066.0,19h 20m 32.84s,−05° 24′ 57.1″,4.98,1.61,154,G8III-IV...,spectroscopic binary,G8 III-IV,4940.0 K,3.2 M☉,6.0 R☉,21.0 L☉,3.2 cgs,1.3 km/s,,False
4 Aql,,4,2.0,,173370.0,91975.0,18h 44m 49.93s,+02° 03′ 36.3″,5.02,−0.78,472,B9V,,B9 V,10965.0 K,3.6 M☉,3.0 R☉,294.0 L☉,3.46 cgs,259.0 km/s,,False
36 Aql,e,36,54.0,,183630.0,95937.0,19h 30m 39.82s,−02° 47′ 19.9″,5.03,−0.91,502,M1IIIvar,suspected variable,K5 III,3576.0 K,1.1 M☉,75.0 R☉,927.0 L☉,,,,False
18 Aql,,18,,Y,178125.0,93867.0,19h 06m 58.60s,+11° 04′ 16.7″,5.07,−0.89,507,B8III,Y Aql; double star; eclipsing binary,B8 III,,5.6 M☉,,4875.0 L☉,,50.0 km/s,,False
23 Aql,,23,35.0,,180972.0,94885.0,19h 18m 32.49s,+01° 05′ 06.3″,5.1,−0.24,381,K2II-IIIvar,triple star,K1 II/III,4202.0 K,1.1 M☉,21.0 R☉,197.0 L☉,1.85 cgs,10.0 km/s,,False
37 Aql,,37,59.0,,184492.0,96327.0,19h 35m 07.25s,−10° 33′ 37.6″,5.12,−0.55,444,G8III,,G8 IIIa,4594.0 K,2.3 M☉,23.38 R☉,218.6 L☉,2.07 cgs,8.88 km/s,1.2 Gyr,False
ο Aql,ο,54,,,187691.0,97675.0,19h 51m 01.50s,+10° 24′ 57.8″,5.12,3.68,63,F8V,multiple star system,F8 V + M3 V,6176.0 K,1.25 M☉,1.48 R☉,2.79 L☉,4.3 cgs,3.0 km/s,3.3 Gyr,False
21 Aql,,21,29.0,V1288,179761.0,94477.0,19h 13m 42.70s,+02° 17′ 37.4″,5.14,−1.33,640,B8II-IIIp(Hg:),"V1288 Aql; double star; α2 CVn variable, Vmax = 5.06m, Vmin = 5.16m, P = 1.73 d",B8II-III(Hg?),12014.0 K,6.7 M☉,6.2 R☉,704.0 L☉,3.95 cgs,9.3 d,165.0 Myr,False
31 Aql,b,31,,,182572.0,95447.0,19h 24m 57.77s,+11° 56′ 34.3″,5.17,4.27,49,G8IVvar,triple star; suspected variable,G8 IV,5510.0 K,1.16 M☉,1.379 R☉,1.904 L☉,4.18 cgs,,4.5 Gyr,False
σ Aql,σ,44,68.0,,185507.0,96665.0,19h 39m 11.64s,+05° 23′ 52.0″,5.18,−1.42,682,B3V + B3V,"β Lyr variable, ΔV = 0.2m, P = 1.95026 d",B3 V + B3 V:,18493.0 K,5.8 M☉,3.7 R☉,1862.0 L☉,,36.1 km/s,140.0 Myr,False
19 Aql,,19,24.0,,178596.0,94068.0,19h 08m 59.92s,+06° 04′ 24.2″,5.23,2.03,142,F0III-IV,,F0 III-IV,6784.0 K,1.54 M☉,2.5 R☉,12.8 L☉,4.13 cgs,57.0 km/s,2.25 Gyr,False
11 Aql,,11,,,176303.0,93203.0,18h 59m 05.73s,+13° 37′ 21.2″,5.27,1.88,155,F8V,triple star; suspected variable,F8 V,6118.0 K,,3.49 R☉,15.4 L☉,3.94 cgs,24.6 km/s,1.5 Gyr,False
ω1 Aql,ω1,25,,,180868.0,94834.0,19h 17m 49.00s,+11° 35′ 43.4″,5.28,−0.28,422,F0IV,,F0 IV,7648.0 K,2.85 M☉,5.38 R☉,92.2 L☉,3.26 cgs,89.0 km/s,456.0 Myr,False
χ Aql A,χ,47,,,186203.0,96957.0,19h 42m 34.01s,+11° 49′ 35.8″,5.28,−1.53,751,F3V:+...,multiple star system,G2 Ib-II + B5 V,5545.0 K,,,420.0 L☉,,3.6 km/s,,False
φ Aql,φ,61,,,188728.0,98103.0,19h 56m 14.23s,+11° 25′ 25.4″,5.28,1.28,206,A1IV,spectroscopic binary; suspected variable,A1 IV+K1 V to M1 V,9484.0 K,2.39 M☉,2.5 R☉,28.2 L☉,4.3 cgs,27.0 km/s,280.0 Myr,False
FF Aql,,,,FF,176155.0,93124.0,18h 58m 14.75s,+17° 21′ 39.4″,5.33,−4.07,2470,F5Ia-F8Ia,"double star; Cepheid variable, Vmax = 5.18m, Vmin = 5.68m, P = 4.47092 d",F6Ib,6195.0 K,3.2 M☉,39.0 R☉,2238.0 L☉,1.28 cgs,10.0 km/s,60.0 Myr,False
20 Aql,,20,28.0,,179406.0,94385.0,19h 12m 40.70s,−07° 56′ 22.2″,5.35,−2.51,1216,B3V,,"B3 V,B3 IV,or B2/3 II",18700.0 K,8.6 M☉,,7284.0 L☉,,133.0 km/s,27.9 Myr,False
51 Aql,,51,82.0,,187532.0,97650.0,19h 50m 46.80s,−10° 45′ 48.9″,5.38,3.27,86,F0V,binary star,F5 V Fe-1 CH-0.7,6812.0 K,,,,4.16 cgs,77.5 km/s,1.6 Gyr,False
14 Aql,g,14,11.0,,176984.0,93526.0,19h 02m 54.49s,−03° 41′ 56.4″,5.4,−0.53,499,A1V,double star,A1 V,9908.0 K,3.25 M☉,2.0 R☉,213.9 L☉,,23.0 km/s,,False
15 Aql,h,15,15.0,,177463.0,93717.0,19h 04m 57.66s,−04° 01′ 52.9″,5.4,0.41,325,K1III,double star; suspected variable,K1 III,4560.0 K,,14.0 R☉,83.0 L☉,2.65 cgs,3.4 km/s,4.09 Gyr,False
66 Aql,,66,123.0,,192107.0,99631.0,20h 13m 13.87s,−01° 00′ 33.4″,5.44,−1.74,888,K5III,,K5 III,4040.0 K,,59.0 R☉,634.65 L☉,1.84 cgs,,,False
42 Aql,,42,65.0,,185124.0,96556.0,19h 37m 47.26s,−04° 38′ 51.0″,5.45,2.92,105,F3IV,,F3 IV/V,6749.0 K,1.26 M☉,,5.76 L☉,4.0 cgs,87.0 km/s,1.283 Gyr,False
27 Aql,d,27,40.0,,181440.0,95073.0,19h 20m 35.68s,−00° 53′ 31.8″,5.46,−0.51,509,B9III,,B9 III,11500.0 K,,,,3.61 cgs,55.0 km/s,,False
τ Aql,τ,63,107.0,,190327.0,98823.0,20h 04m 08.31s,+07° 16′ 40.6″,5.51,−0.53,527,K0III,,K0 III,4724.0 K,2.15 M☉,18.03 R☉,145.0 L☉,2.26 cgs,,1.0 Gyr,False
28 Aql,A,28,,V1208,181333.0,94982.0,19h 19m 39.35s,+12° 22′ 28.7″,5.53,0.39,347,F0III,"V1208 Aql; triple star; δ Sct variable, Vmax = 5.51m, Vmin = 5.56m, P = 0.149663 d",F0 III,7417.0 K,2.411 M☉,4.606 R☉,57.8 L☉,3.41 cgs,57.0 km/s,655.0 Myr,False
62 Ser,,(62),69.0,,175515.0,92872.0,18h 55m 27.44s,+06° 36′ 55.8″,5.58,0.81,293,G9III,"69 G. Aquilae, suspected variable",G9 III,4666.0 K,1.54 M☉,10.69 R☉,52.8 L☉,2.7 cgs,0.0 km/s,3.21 Gyr,False
22 Aql,,22,32.0,,180482.0,94727.0,19h 16m 31.02s,+04° 50′ 05.4″,5.59,−0.53,546,A3IV,,A1 Vor A3 IV,8453.0 K,2.89 M☉,,161.0 L☉,,70.0 km/s,,False
58 Aql,,58,95.0,,188350.0,97980.0,19h 54m 44.77s,+00° 16′ 25.2″,5.6,0.48,345,A0III,,B9 IV,7946.0 K,,5.62 R☉,116.5 L☉,3.8 cgs,110.0 km/s,,False
V1291 Aql,,,90.0,V1291,188041.0,97871.0,19h 53m 18.72s,−03° 06′ 52.2″,5.63,0.99,277,A5p(Sr-Cr-Eu),"α2 CVn variable, Vmax = 5.61m, Vmin = 5.67m, P = 224.5 d",F0VpSrCrEu,8770.0 K,2.26 M☉,2.32 R☉,25.7 L☉,4.03 cgs,6.7 km/s,670.0 Myr,False
45 Aql,,45,70.0,,185762.0,96807.0,19h 40m 43.31s,−00° 37′ 16.7″,5.64,0.93,285,A3IV,double star,A3 IV,9016.0 K,2.63 M☉,,75.8 L☉,,75.0 km/s,,False
62 Aql,,62,106.0,,190299.0,98844.0,20h 04m 23.15s,−00° 42′ 32.5″,5.67,−0.59,582,K4III,,K4 III,4246.0 K,0.89 M☉,22.89 R☉,153.0 L☉,1.69 cgs,,11.2 Gyr,False
π Aql B,π,52,,,187260.0,,19h 48m 42.10s,+11° 48′ 55.0″,5.7,,,,component of the π Aql system,G8 III: + A1 V,5937.0 K,,10.9 R☉,108.0 L☉,4.5 cgs,,,False
57 Aql A,,57,93.0,,188293.0,97966.0,19h 54m 37.65s,−08° 13′ 38.0″,5.7,0.64,335,B7Vn,double star,B7 Vn + B8 V,,,,,,190.0 km/s,,False
14 Sge,,(14),,,190229.0,98754.0,20h 03m 30.01s,+16° 01′ 52.6″,5.73,−0.72,637,B9MNp...,,B9p HgMn,13200.0 K,,,291.53 L☉,3.6 cgs,7.0 km/s,,False
π Aql,π,52,,,187259.0,97473.0,19h 48m 42.05s,+11° 48′ 57.3″,5.75,−0.46,570,F2V:+...,component of the π Aql system,G8 III: + A1 V,5937.0 K,,10.9 R☉,108.0 L☉,4.5 cgs,,,False
56 Aql,,56,92.0,,188154.0,97928.0,19h 54m 08.27s,−08° 34′ 27.0″,5.76,0.35,394,K5III,double star,K5 III,3972.0 K,,41.7 R☉,391.0 L☉,,,,False
35 Aql,c,35,51.0,V1431,183324.0,95793.0,19h 29m 00.99s,+01° 57′ 01.9″,5.79,1.94,192,A0V,"V1431 Aql; rapidly oscillating α2 CVn variable, ΔV = 0.04m",A0 V,8939.0 K,2.1 M☉,1.8 R☉,14.0 L☉,4.53 cgs,110.0 km/s,,False
5 Aql,,5,3.0,,173654.0,92117.0,18h 46m 28.58s,−00° 57′ 41.9″,5.89,1.40,258,A2m,binary star,A2 Vm + ? + F3 Vm,,,,,,71.0 km/s,,False
υ Aql,υ,49,78.0,,186689.0,97229.0,19h 45m 39.92s,+07° 36′ 47.4″,5.89,2.22,176,A3IV,,A3 IV,7906.0 K,1.68 M☉,,10.5 L☉,4.21 cgs,22.5 km/s,361.0 Myr,False
10 Aql,,10,,V1286,176232.0,93179.0,18h 58m 46.92s,+13° 54′ 24.4″,5.91,1.55,242,A4p(Eu-Cr-Sr),"V1286 Aql; α2 CVn variable, Vmax = 5.83m, Vmin = 5.93m, P = 6.05 d",F0 p Sr Eu,7550.0 K,1.39 M☉,2.46 R☉,17.73 L☉,3.8 cgs,18.0 km/s,,False
64 Aql,,64,113.0,,191067.0,99171.0,20h 08m 01.75s,−00° 40′ 40.9″,5.97,2.57,156,K1IV,,K1 III/IV,4786.0 K,1.17 M☉,4.49 R☉,11.17 L☉,3.31 cgs,1.51 km/s,6.2 Gyr,False
QS Aql,,,,QS,185936.0,96840.0,19h 41m 05.53s,+13° 48′ 56.5″,5.98,−2.54,1646,B5V,"double star; Algol variable, Vmax = 5.93m, Vmin = 6.06m, P = 2.51329 d",B5V,,,,,,,,False
ω2 Aql,ω2,29,,,181383.0,95002.0,19h 19m 53.04s,+11° 32′ 05.7″,6.03,1.37,278,A2V,,A2 Vor F0V,8472.0 K,2.1 M☉,2.25 R☉,23.4 L☉,4.06 cgs,152.0 km/s,224.0 Myr,False
8 Aql,,8,5.0,V1729,174589.0,92524.0,18h 51m 22.16s,−03° 19′ 04.1″,6.08,1.44,276,F2III,V1729 Aql; Delta Scuti variable,F0 IVor F2 III,7395.0 K,1.6 M☉,3.0 R☉,18.89 L☉,3.88 cgs,105.0 km/s,959.0 Myr,False
V923 Aql,,,55.0,V923,183656.0,95929.0,19h 30m 33.11s,+03° 26′ 39.8″,6.09,−1.26,962,B5.5IIIpe-B8V,"γ Cas variable, ΔV = 0.12m",B7III,16580.0 K,6.2 M☉,,1517.0 L☉,3.64 cgs,275.0 km/s,,False
R Aql,,,22.0,R,177940.0,93820.0,19h 06m 22.25s,+08° 13′ 48.0″,6.09,−2.04,1400,M6.5-9e,"Mira variable, Vmax = 5.5m, Vmin = 12.0m, P = 270.5 d",M5-9IIIe,2800.0 K,1.0 M☉,275.0 R☉,3470.0 L☉,,,,False
V500 Aql,,,,V500,,,19h 52m 27.98s,+08° 28′ 41.6″,6.1,,,pec(NOVA) – e+cont,"Nova Aquilae; Vmax = 6.1m, Vmin = 17.8m",,,,,,,,,False
68 Aql,,68,139.0,,194939.0,100977.0,20h 28m 24.89s,−03° 21′ 27.9″,6.12,−0.04,557,B9V,double star,B9 V:,10641.0 K,3.16 M☉,3.361 R☉,159.8 L☉,,138.0 km/s,,False
ψ Aql,ψ,48,,,186547.0,97139.0,19h 44m 34.19s,+13° 18′ 10.1″,6.25,−0.72,809,B9III-IV,,B9 III-IV,10167.0 K,3.8 M☉,6.5 R☉,506.0 L☉,3.41 cgs,7.1 days,247.0 Myr,False
46 Aql,,46,,,186122.0,96931.0,19h 42m 12.81s,+12° 11′ 35.8″,6.33,−0.39,720,B9III,,B9III,11773.0 K,3.6 M☉,4.2 R☉,268.0 L☉,3.78 cgs,9.3 days,176.0 Myr,False
V450 Aql,,,,V450,184313.0,96204.0,19h 33m 46.03s,+05° 27′ 56.8″,6.35,−0.75,858,M5III-M8III,"semiregular variable, Vmax = 6.30m, Vmin = 6.65m, P = 64.20 d",M5-5.5III,3326.0 K,,,2172.0 L☉,,,,False
U Aql,,,50.0,U,183344.0,95820.0,19h 29m 21.36s,−07° 02′ 38.6″,6.37,−2.07,1590,F5-G1I-II,"Cepheid variable, Vmax = 6.08m, Vmin = 6.86m, P = 7.02393 d",F5-G1 I-II+ B9.8V,6640.0 K,5.7 M☉,55.0 R☉,2570.0 L☉,1.3 cgs,,,False
V1472 Aql,,,,V1472,190658.0,98954.0,20h 05m 26.53s,+15° 30′ 01.3″,6.37,−0.44,749,M2 comp,"eclipsing variable, ΔV = ~0.16m",M2.5III,3670.0 K,,104.0 R☉,1100.0 L☉,,10.0 km/s,,False
V1401 Aql,,(64),108.0,V1401,190390.0,98910.0,20h 05m 05.42s,−11° 35′ 57.8″,6.38,−1.58,1273,F1III,"64 Sagittarii; semiregular variable, Vmax = 6.18m, Vmin = 6.55m",F2II,6192.0 K,4.1 M☉,35.0 R☉,6561309.0 L☉,1.49 cgs,,,False
24 Aql,,24,36.0,,181053.0,94913.0,19h 18m 50.93s,+00° 20′ 20.4″,6.4,0.52,488,K0II-III:..,multiple star,K0-IIIa:CH1Ba0.5,4733.0 K,2.2 M☉,11.17 R☉,56.397 L☉,2.48 cgs,,0.5 Gyr,False
V1339 Aql,,,84.0,V1339,187567.0,97607.0,19h 50m 17.48s,+07° 54′ 08.7″,6.49,−1.90,1552,B2.5IVe,"Be star; γ Cas variable, Vmax = 6.33m, Vmin = 6.52m",B2.5IVe,23310.0 K,13.0 M☉,7.7 R☉,,,,,False
57 Aql B,,57,,,188294.0,97967.0,19h 54m 38.06s,−08° 14′ 13.1″,6.49,1.27,361,B8V,component of the 57 Aql system,B7 Vn + B8 V,,,,,,190.0 km/s,,False
V1691 Aql,,,45.0,V1691,182475.0,95453.0,19h 25m 01.51s,−04° 53′ 04.4″,6.5,1.48,329,A9V,"δ Sct variable, ΔV = 0.04m, P = 0.0781 d",A9V,6907.0 K,,,23.0 L☉,,141.0 km/s,,False
V Aql,,,,V,177336.0,93666.0,19h 04m 24.15s,−05° 41′ 05.4″,6.78,−1.36,1207,"C5,4 – C6,4(N6)","carbon star; semiregular variable, Vmax = 6.6m, Vmin = 8.4m, P = 353 d","C5,4-C6,4(N6)",2800.0 K,2.5 M☉,234.0 R☉,6500.0 L☉,0.108 cgs,,,False
TT Aql,,,,TT,178359.0,93990.0,19h 08m 13.75s,+01° 17′ 55.2″,7.1,−4.84,7951,F6-G5,"Cepheid variable, Vmax = 6.46m, Vmin = 7.70m, P = 13.7546 d",G0/2Ib(F6-G5),6200.0 )K,8.6 M☉,100.5 R☉,5284.0 L☉,1.7 cgs,,,False
V604 Aql,,,,V604,,,19h 02m 6.33s,−04° 26′ 43.2″,7.6,,,pec(NOVA) – e+cont,"Nova Aquilae; Vmax = 7.6m, Vmin = 18.0m",pec(Nova),,,,,,,,False
V1703 Aql,,,,V1703,192263.0,99711.0,20h 13m 59.85s,−00° 52′ 00.8″,8.1,6.61,65,K2V,"Phoenicia, double star; has a planet (b); BY Draconis variable, ΔV = 0.03m, P = 23.98 d",K1/2 V,4955.0 K,0.65 M☉,0.74 R☉,0.295 L☉,4.51 cgs,2.1 km/s,6.6 Gyr,False
V1494 Aql,,,,V1494,,,19h 23m 5.38s,+04° 57′ 20.1″,8.8,,,pec(NOVA) – e+cont,"Nova Aquilae; Vmax = 5.03m, Vmin = 16.0m",,2000.0 )K,1.13 M☉,,3000.0 L☉,,,,False
V603 Aql,,,,V603,174107.0,92316.0,18h 48m 54.64s,+00° 35′ 02.9″,11.64,4.76,776,pec(NOVA) – e+cont,"Nova Aquilae 1918; Vmax = −1.4m, Vmin = 12.03m",sd:Be+,,,,,,,,False
χ Aql B,χ,47,,,186204.0,,19h 42m 37.90s,+11° 50′ 31.0″,12.3,5.35,800,G0:+A3V,component of the χ Aql system,G2 Ib-II + B5 V,5545.0 K,,,420.0 L☉,,3.6 km/s,,False
SS 433,,,,V1343,,,19h 11m 49.56s,+04° 58′ 57.6″,14.2,,15093,A7Ib,Sanduleak-Stephenson Star; eclipsing X-ray binary,A7Ib,,,,,,,,False
V606 Aql,,,,V606,,,19h 20m 24.3s,−00° 08′ 7.0″,,,700,pec(NOVA) – e+cont,"Nova Aquilae; Vmax = 5.5m, Vmin = 17.3m",,,,,,,,,False
]]

return M
