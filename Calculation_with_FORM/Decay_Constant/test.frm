#include symbols.hf

#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"

load Diagrams/save/FF1_`ext1'`ext2'`SX4'.sav;
L my = FF1x`ext1'`ext2'`SX4';
print my;
.end