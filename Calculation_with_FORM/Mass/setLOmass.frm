#if `SX4'==SP4
id LOmass(i1?) = m2p 
#elseif `SX4'==SO4
id LOmass(i1?{1,2,3,4,5}) = mp2;
id LOmass(i1?{6,7}) = muu;
id LOmass(i1?{8,9}) = mdd;
#endif