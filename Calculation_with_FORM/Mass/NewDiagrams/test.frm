#include symbols.hf
#define ext1 "1"
#define ext2 "1"
#define SX4 "SP4"


load ../Hans_diagrams/save/MM1_`ext1'`ext2'`SX4'.sav;

G F1= MM1x`ext1'`ext2'`SX4'Hans;

Print;

.end