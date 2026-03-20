Symbol D;
Index m1=2,m2=2,m3=2,m4=2;
Index n1=3,n2=3,n3=3,n4=3,n5=3,n6=3;
Index r1=D,r2=D,r3=D,r4=D,r5=D,r6=D;

Local F1 = e_(m1,m2)*e_(m3,m4);
Local F2 = e_(m1,m2)*e_(m2,m3);
Local F3 = e_(m1,m2)*e_(m1,m2);
Local G1 = e_(n1,n2,n3)*e_(n4,n5,n6);
Local G2 = e_(n1,n2,n3)*e_(n3,n4,n5);
Local G3 = e_(n1,n2,n3)*e_(n2,n3,n4);
Local G4 = e_(n1,n2,n3)*e_(n1,n2,n3);
Local H1 = e_(r1,r2,r3)*e_(r4,r5,r6);
Local H2 = e_(r1,r2,r3)*e_(r3,r4,r5);
Local H3 = e_(r1,r2,r3)*e_(r2,r3,r4);
Local H4 = e_(r1,r2,r3)*e_(r1,r2,r3);
Contract;
Print;
.end
