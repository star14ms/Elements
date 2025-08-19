local M = {}
M.csv = [[
Name,B,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
γ Mic,γ,,199951.0,103738.0,21h 01m 17.46s,−32° 15′ 28.0″,4.67,0.49,223.0,G8III,"variable star, ΔV = 0.007m, P = 8.72829 d",G6 III,5227.0 K,2.8 M☉,9.49 R☉,60.5 L☉,2.985 cgs,,620.0 Myr,True
ε Mic,ε,,202627.0,105140.0,21h 17m 56.25s,−32° 10′ 20.9″,4.71,1.19,165.0,A0V,,A1V,9126.0 K,2.18 M☉,2.2 R☉,35.62 L☉,4.37 cgs,127.0 km/s,525.0 Myr,True
θ1 Mic,θ1,,203006.0,105382.0,21h 20m 45.58s,−40° 48′ 34.2″,4.8,1.01,186.0,A2p,"α² CVn variable, Vmax = 4.77m, Vmin = 4.87m, P = 2.1215 d",A7VpSrCrEu,9240.0 K,2.32 M☉,2.35 R☉,36.3 L☉,4.06 cgs,43.7 km/s,437.0 Myr,True
α Mic,α,,198232.0,102831.0,20h 49m 58.08s,−33° 46′ 46.8″,4.89,−0.45,380.0,G8III,,G7 IIIor G8 III,4881.0 K,3.19 M☉,18.41 R☉,173.0 L☉,2.27 cgs,2.6 km/s,400.0 Myr,True
ι Mic,ι,,197937.0,102693.0,20h 48m 29.00s,−43° 59′ 17.8″,5.11,2.04,134.0,F1IV,,F2V,6997.0 K,1.42 M☉,2.4 R☉,12.65 L☉,3.9 cgs,115.0 km/s,1.094 Gyr,True
ν Mic,ν,,195569.0,101477.0,20h 33m 55.06s,−44° 30′ 57.5″,5.12,1.01,216.0,K0III,,K0 III,4832.0 K,2.46 M☉,11.0 R☉,59.0 L☉,2.78 cgs,2.02 km/s,377.0 Myr,False
ζ Mic,ζ,,200163.0,103882.0,21h 02m 57.97s,−38° 37′ 52.3″,5.32,2.58,115.0,F3V,,F5 V,6627.0 K,1.4 M☉,,7.5 L☉,3.97 cgs,44.4 km/s,2.2 Gyr,False
η Mic,η,,200702.0,104177.0,21h 06m 25.50s,−41° 23′ 09.4″,5.55,−1.73,931.0,K3III,,K3 III,4365.0 K,1.2 M☉,47.41 R☉,735.0 L☉,1.1 cgs,,,False
δ Mic,δ,,200718.0,104148.0,21h 06m 01.12s,−30° 07′ 29.8″,5.69,0.65,332.0,K0/K1III,,K0/1 III,4805.0 K,1.96 M☉,10.87 R☉,57.0 L☉,2.45 cgs,2.12 km/s,,False
θ2 Mic,θ2,,203585.0,105696.0,21h 24m 24.80s,−41° 00′ 24.1″,5.76,0.00,463.0,A0III,,A0IIIpSi,10378.0 K,,,78.22 L☉,,,,False
β Mic,β,,198529.0,102989.0,20h 51m 58.76s,−33° 10′ 40.7″,6.06,−0.48,661.0,A1IV,,A1 IV,8942.0 K,2.96 M☉,3.5 R☉,77.25 L☉,3.58 cgs,275.0 km/s,337.0 Myr,False
AV Mic,,AV,196829.0,102096.0,20h 41m 24.63s,−42° 08′ 01.3″,6.28,−1.01,934.0,M3II,"semiregular variable, Vmax = 6.25m, Vmin = 6.35m",M4 III,3539.0 K,2.4 M☉,77.5 R☉,849.0 L☉,2.14 cgs,,,False
BY Mic,,BY,198853.0,103168.0,20h 54m 06.58s,−27° 55′ 30.7″,6.41,−0.93,956.0,M1III,slow irregular variable,,,,,,,,,False
Lacaille 8760,,AX,202560.0,105090.0,21h 17m 15.3s,−38° 52′ 02″,6.68,8.69,12.865,M0V,UV Ceti variable,M0Ve,3800.0 K,0.6 M☉,0.51 R☉,0.072 L☉,4.78 cgs,3.3 km/s,4.8 Gyr,False
AU Mic,,AU,197481.0,102409.0,20h 45m 09.53s,−31° 20′ 27.2″,8.63,,32.306,M1Ve,"T Tauri star, ΔV = 0.079m, P = 4.85 d; has a protoplanetary disk",M1Ve,3665.0 K,0.6 M☉,0.82 R☉,0.102 L☉,4.52 cgs,4.8367 d,2.4 Myr,False
HD 203932,,BI,203932.0,,21h 26m 03.87s,−29° 55′ 44.1″,8.81,,,A5p,"rapidly oscillating Ap star, ΔB < 0.0024m, P = 5.9 minutes",,,,,,,,,False
HD 202759,,AW,202759.0,105249.0,21h 19m 05.92s,−33° 55′ 07.9″,9.05,,5300.0,A0:IIIw,"RR Lyr variable, Vmax = 9.04m, Vmin = 9.13m, P = 0.305684 d",,,,,,,,,False
BO Mic,,BO,197890.0,102626.0,20h 47m 45.01s,−36° 35′ 40.8″,9.34,5.80,170.1,K3V(e),"Speedy Mic; rotating variable, ΔV = 0.059m, P = 0.3804 d; one of the fastest known rotating stars",K3Ve,4750.0 K,0.82 M☉,1.06 R☉,,,0.38 days,33.0 Myr,False
V Mic,,V,203495.0,105638.0,21h 23m 48.77s,−40° 42′ 05.12″,9.4,,2100.0,M4e,Mira variable,,,,,,,,,False
ZZ Mic,,ZZ,199757.0,103684.0,21h 00m 35.20s,−42° 39′ 20.3″,9.43,,911.0,A6IV,"δ Sct variable, Vmax = 9.27m, Vmin = 9.59m, P = 0.0671792 d",,,,,,,,,False
AT Mic,,AT,196982.0,102141.0,20h 41m 50.16s,−32° 26′ 06.8″,10.36,,34.87,M4Ve,"flare star and BY Dra variable, ΔV = 0.029m, P = 0.7813 d",M4 Ve+ M4.5e,3150.0 K,0.27 M☉,0.573 R☉,0.0304 L☉,,,12.0 Myr,False
CD-43 14304,,DD,,,21h 00m 06.36s,−42° 38′ 44.9″,11.0,,,M0.2e,"Z And variable, Vmax = 11.0m, Vmin = 11.7m, P = 399 d",K2 IIIor K5/M0 IIIe,3941.0 K,1.45 M☉,103.0 R☉,,0.25 cgs,<3.0 km/s,,False
CD−36 14261,,DH,,,20h 36m 08.3s,−36° 07′ 12″,11.6,,55.0,M3Ve,BY Draconis variable,,,,,,,,,False
]]

return M
