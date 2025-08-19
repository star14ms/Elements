local M = {}
M.csv = [[
Name,B,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
α Pyx,α,,74575.0,42828.0,08h 43m 35.55s,−33° 11′ 11.1″,3.68,−3.39,845.0,B1.5III,"β Cep variable, Vmax = 3.67m, Vmin = 3.70m",B1.5III,24300.0 K,10.7 M☉,6.3 R☉,10000.0 L☉,3.63 cgs,11.0 km/s,,True
β Pyx,β,,74006.0,42515.0,08h 40m 06.14s,−35° 18′ 29.9″,3.97,−1.41,388.0,G5II/III,,G7II/III,5283.0 K,3.77 M☉,20.0 R☉,283.0 L☉,2.68 cgs,11.8 km/s,,True
γ Pyx,γ,,75691.0,43409.0,08h 50m 32.01s,−27° 42′ 36.2″,4.02,−0.01,209.0,K3III,,K3 III,4270.0 K,1.64 M☉,21.87 R☉,178.0 L☉,2.35 cgs,,4.29 Gyr,True
κ Pyx,κ,,78541.0,44824.0,09h 08m 02.86s,−25° 51′ 30.7″,4.62,−1.25,487.0,K4/K5III,"variable star, ΔV = 0.006m, P = 8.50919 d",K4III,3931.0 K,,66.7 R☉,927.0 L☉,1.44 cgs,,,False
θ Pyx,θ,,80874.0,45902.0,09h 21m 29.60s,−25° 57′ 55.5″,4.71,−1.31,522.0,M0III,semiregular variable,M0.5 III Ba0.5,3825.0 K,,54.0 R☉,970.0 L☉,,,,False
λ Pyx,λ,,81169.0,46026.0,09h 23m 12.34s,−28° 50′ 02.1″,4.71,0.98,182.0,G8III,,G8.5 IIIb Fe−1,5152.0 K,2.47 M☉,8.03 R☉,41.0 L☉,3.03 cgs,4.4 km/s,,False
ζ Pyx,ζ,,73898.0,42483.0,08h 39m 42.49s,−29° 33′ 39.1″,4.86,0.56,236.0,G5III,,G6 IIIb CN-0.5,4876.0 K,1.96 M☉,,69.0 L☉,2.72 cgs,,1.88 Gyr,False
δ Pyx,δ,,76483.0,43825.0,08h 55m 31.52s,−27° 40′ 53.9″,4.87,0.66,226.0,A3IV,,A3 IV,8609.0 K,1.84 M☉,1.6 R☉,59.0 L☉,3.77 cgs,68.0 km/s,296.0 Myr,False
η Pyx,η,,73495.0,42334.0,08h 37m 52.17s,−26° 15′ 17.9″,5.24,0.89,242.0,A0V,suspected variable,A0 V,11614.0 K,2.51 M☉,,42.0 L☉,4.33 cgs,238.0 km/s,67.0 Myr,False
ε Pyx,ε,,78922.0,45001.0,09h 09m 56.41s,−30° 21′ 55.0″,5.59,1.52,212.0,A4IV,"variable star, ΔV = 0.006m, P = 6.15574 d",A4 IV,6368.0 K,2.07 M☉,,19.0 L☉,3.26 cgs,108.3 km/s,560.0 Myr,False
XY Pyx,,XY,71801.0,41515.0,08h 27m 59.43s,−35° 06′ 49.6″,5.75,−1.68,1000.0,B2V,β Lyr variable,,,,,,,,,False
AI Pyx,,AI,75112.0,43114.0,08h 46m 49.25s,−34° 37′ 22.7″,6.33,−0.86,896.0,B3V,irregular variable,,,,,,,,,False
VX Pyx,,VX,72688.0,41939.0,08h 32m 58.51s,−34° 38′ 02.6″,6.36,0.78,426.0,G8III,"RS CVn variable, Vmax = 6.32m, Vmin = 6.42m",,,,,,,,,False
AK Pyx,,AK,75306.0,43215.0,08h 48m 14.63s,−28° 38′ 19.6″,6.42,−0.45,771.0,M5III,semiregular variable,M5III,3410.0 KK,,,1500.0 L☉,,,,False
TY Pyx,,TY,77137.0,44164.0,08h 59m 42.72s,−27° 48′ 58.7″,6.87,,183.9,G5IV+G5IV,"RS CVn variable, Vmax = 6.85m, Vmin = 7.5m, P = 3.1985787 d",G5IV + G5IV,5400.0 K,,2.2 R☉,,,,,False
HD 73256,,CS,73256.0,42214.0,08h 36m 23.02s,−30° 02′ 15.5″,8.08,5.27,119.0,G9V,"BY Dra variable, ΔV = 0.03m, P = 13.97 d; has a planet (b)",G8 IV-V Fe+0.5,5532.0 K,1.01 M☉,0.94 R☉,0.74 L☉,4.49 cgs,3.22 km/s,2.5 Gyr,False
RZ Pyx,,RZ,75920.0,43541.0,08h 52m 04.40s,−27° 29′ 01.5″,9.17,,1220.0,B7V,β Lyr variable,B7V,,,,,,,,False
R Pyx,,R,,42975.0,08h 45m 30.70s,−28° 12′ 02.8″,10.4,,1860.0,C,"Mira variable, Vmax = 7.8m, Vmin = 12.0m, P = 364.7 d",,,,,,,,,False
XX Pyx,,XX,,,08h 58m 39.04s,−24° 35′ 10.6″,11.49,,,A4V,δ Sct and rotating ellipsoidal variable,A4V + M3V,9431.0 K,1.85 M☉,1.9 R☉,27.0 L☉,4.21 cgs,1.5 d,316.0 Myr,False
T Pyx,,T,,,09h 04m 41.50s,−32° 22′ 47.5″,15.5,,,,"recurrent nova, Vmax = 6.2m, Vmin = 15.5m, P = 0.07622886 d",White Dwarf,,0.7 M☉,,,,,,False
VZ Pyx,,VZ,,,08h 59m 19.84s,−24° 28′ 55.4″,16.8,,,,"SU UMa variable, Vmax = 11.8m, Vmin = 16.8m, P = 0.07332 d",,,,,,,,,False
]]

return M
