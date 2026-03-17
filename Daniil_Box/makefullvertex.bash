############################################################################
# set -eu makes it stop after a failed command
set -eu
############################################################################
# the one we calculate

FORM="tform -l -w6 -t ./tempform"

# running over all cases and vertices
#for SX4 in SP4 SO4
for SX4 in Sp4
do
#for VERTEX in 2Mp2 4Mp2 6Mp2 2Mp4 4Mp4 2Mp6
for VERTEX in 2Mp2 4Mp2 2Mp4
do
  $FORM -l -d VERTEX=$VERTEX -d SX4=$SX4 makefullvertex.frm
  mv makefullvertex.log log/makefullvertex$VERTEX$SX4.log  
done
done