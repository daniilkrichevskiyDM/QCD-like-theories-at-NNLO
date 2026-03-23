#include symbols.hf
#include setexternal.hf


*download my diagrams
load save/MM1_`ext1'`ext2'`SX4'.sav;
load save/MM2_`ext1'`ext2'`SX4'.sav;
load save/MM3_`ext1'`ext2'`SX4'.sav;
load save/MM4_`ext1'`ext2'`SX4'.sav;
load save/MM5_`ext1'`ext2'`SX4'.sav;
load save/MM6_`ext1'`ext2'`SX4'.sav;
load save/MM7_`ext1'`ext2'`SX4'.sav;
load save/MM8_`ext1'`ext2'`SX4'.sav;
load save/MM9_`ext1'`ext2'`SX4'.sav;

G Diagram1My = MM1x`ext1'`ext2'`SX4';
G Diagram2My = MM2x`ext1'`ext2'`SX4';
G Diagram3My = MM3x`ext1'`ext2'`SX4';
G Diagram4My = MM4x`ext1'`ext2'`SX4';
G Diagram5My = MM5x`ext1'`ext2'`SX4';
G Diagram6My = MM6x`ext1'`ext2'`SX4';
G Diagram7My = MM7x`ext1'`ext2'`SX4';
G Diagram8My = MM8x`ext1'`ext2'`SX4';
G Diagram9My = MM9x`ext1'`ext2'`SX4';


.sort

*download Hans' diagrams

load ../Hans_diagrams/save/MM1_`ext1'`ext2'`SX4'.sav;
load ../Hans_diagrams/save/MM2_`ext1'`ext2'`SX4'.sav;
load ../Hans_diagrams/save/MM3_`ext1'`ext2'`SX4'.sav;
load ../Hans_diagrams/save/MM4_`ext1'`ext2'`SX4'.sav;
load ../Hans_diagrams/save/MM5_`ext1'`ext2'`SX4'.sav;
load ../Hans_diagrams/save/MM6_`ext1'`ext2'`SX4'.sav;
load ../Hans_diagrams/save/MM7_`ext1'`ext2'`SX4'.sav;
load ../Hans_diagrams/save/MM8_`ext1'`ext2'`SX4'.sav;
load ../Hans_diagrams/save/MM9_`ext1'`ext2'`SX4'.sav;

G Diagram1Hans = MM1x`ext1'`ext2'`SX4'Hans;
G Diagram2Hans = MM2x`ext1'`ext2'`SX4'Hans;
G Diagram3Hans = MM3x`ext1'`ext2'`SX4'Hans;
G Diagram4Hans = MM4x`ext1'`ext2'`SX4'Hans;
G Diagram5Hans = MM5x`ext1'`ext2'`SX4'Hans;
G Diagram6Hans = MM6x`ext1'`ext2'`SX4'Hans;
G Diagram7Hans = MM7x`ext1'`ext2'`SX4'Hans;
G Diagram8Hans = MM8x`ext1'`ext2'`SX4'Hans;
G Diagram9Hans = MM9x`ext1'`ext2'`SX4'Hans;



*calculate the difference
.sort

G diff1 = Diagram1My - Diagram1Hans;
G diff2 = Diagram2My - Diagram2Hans;
G diff3 = Diagram3My - Diagram3Hans;
G diff4 = Diagram4My - Diagram7Hans;
G diff5 = Diagram5My - Diagram6Hans;
G diff6 = Diagram6My - Diagram5Hans;
G diff7 = Diagram7My - Diagram4Hans;
G diff8 = Diagram8My - Diagram8Hans;
G diff9 = Diagram9My - Diagram9Hans;

.sort
*Print Diagram1Hans;
b A;
Print diff1,...,diff9, Diagram7My, Diagram4Hans ;

.end