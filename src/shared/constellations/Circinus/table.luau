local M = {}
M.csv = [[
Name,B,Var,HD,HIP,RA,Dec,vis. mag.,abs. mag.,Dist. (ly),Sp. class,Notes,Spectral type,Temperature,Mass,Radius,Luminosity,Surface gravity,Rotation,Age,Main Star
α Cir,α,,128898.0,71908.0,14h 42m 30.69s,−64° 58′ 28.5″,3.18,2.11,53.0,F1Vp,"rapidly oscillating Ap star, Vmax = 3.17m, Vmin = 3.19m, P = 0.004740 d",A7 Vp SrCrEu,7500.0 K,1.7 M☉,1.967 R☉,10.51 L☉,4.1 cgs,4.479 days,12.0 millionyears,True
β Cir,β,,135379.0,74824.0,15h 17m 30.96s,−58° 48′ 03.2″,4.07,1.71,97.0,A3Va,has a planet (b),A3 Va,8676.0 K,1.96 M☉,1.92 R☉,19.0 L☉,4.281 cgs,59.0 km/s,500.0 Myr,True
γ Cir,γ,,136415.0,75323.0,15h 23m 22.66s,−59° 19′ 14.5″,4.48,−1.49,509.0,B5III + F8,"γ Cas variable, Vmax = 4.43m, Vmin = 4.52m; double star",B5 IV+ F8 V,15135.0 K,6.0 M☉,,,,,63.1 Myr,True
ε Cir,ε,,135291.0,74837.0,15h 17m 38.89s,−63° 36′ 37.8″,4.85,−0.44,373.0,K2.5III,,K2.5 III,4767.0 K,4.3 M☉,24.0 R☉,338.0 L☉,2.22 cgs,,,False
δ Cir,δ,,135240.0,74778.0,15h 16m 56.90s,−60° 57′ 26.1″,5.04,−6.42,6392.0,O8.5V,"Algol variable, Vmax = 5.04m, Vmin = 5.20m, P = 3.902476 d",O7.5III(f)(O8IV+ O9.5V + B0.5V(),37500.0 K,20.0 M☉,9.256 R☉,153000.0 L☉,3.806 cgs,150.0 km/s,,False
θ Cir,θ,,131492.0,73129.0,14h 56m 44.00s,−62° 46′ 51.6″,5.08,−1.96,834.0,B4Vnp,"emission-line star; γ Cas variable, Vmax = 4.81m, Vmin = 5.65m",B3 Ve(B2 + B2),19099.0 K,9.3 M☉,,,3.38 cgs,195.0 km/s,27.1 Myr,False
η Cir,η,,132905.0,73776.0,15h 04m 48.05s,−64° 01′ 52.9″,5.16,0.59,267.0,G8III,,G8 III,5250.0 K,2.9 M☉,10.0 R☉,78.0 L☉,2.7 cgs,,414.0 Myr,False
CO Cir,,CO,129954.0,72438.0,14h 48m 44.56s,−66° 35′ 36.7″,5.91,−1.82,1144.0,B2.5V,Be star; variable,,,,,,,,,False
AX Cir,,AX,130701.0,72773.0,14h 52m 35.27s,−63° 48′ 35.3″,5.91,−1.55,1012.0,F8II + A/F,"Cepheid variable, Vmax = 5.65m, Vmin = 6.09m, P = 5.273268 d",F8 II + B6 V,5443.0 K,11.56 M☉,45.68 R☉,2050.0 L☉,2.0 cgs,7.4 km/s,,False
ζ Cir,ζ,,131058.0,72965.0,14h 54m 42.59s,−65° 59′ 27.8″,6.09,−1.79,1226.0,B3Vn,"variable star, ΔV = 0.005m, P = 3.72065 d",B2/3 Vn,16788.0 K,5.5 M☉,3.8 R☉,602.0 L☉,4.03 cgs,264.0 km/s,31.6 Myr,False
BU Cir,,BU,129557.0,72121.0,14h 45m 10.97s,−55° 36′ 05.8″,6.10,−2.52,1725.0,B2III,"β Cep variable, ΔV = 0.02m, P = 0.127552 d; double star",,,,,,,,,False
BP Cir,,BP,129708.0,72264.0,14h 46m 41.98s,−61° 27′ 43.0″,7.52,,,F2/F3II+B6.0,"Cepheid variable, Vmax = 7.37m, Vmin = 7.71m, P = 2.39810 d",F2/3II + B6V,6356.0 K,5.0 M☉,30.38 R☉,917.0 L☉,2.75 cgs,,,False
WR 66,,CC,134877.0,74634.0,15h 14m 57.72s,−59° 50′ 30.3″,11.34,,,WN8(h),"Wolf–Rayet star, ΔV = 0.1m",,,,,,,,,False
BX Cir,,BX,,,14h 01m 36.47s,−66° 09′ 56.3″,12.62,,,B+...,"prototype BX Circini variable, Vmax = 12.57m, Vmin = 12.62m, P = 0.10658 d",OB+,,0.42 M☉,2.31 R☉,,3.35 cgs,,,False
BW Cir,,BW,,,13h 58m 09.92s,−64° 44′ 04.9″,16.9,,,,low-mass X-ray binary,,,,,,,,,False
Circinus X-1,,BR,,,15h 20m 40.85s,−57° 10′ 00.1″,21.4,,,,low-mass X-ray binary,B5–A0 I,,,,,,,,False
]]

return M
