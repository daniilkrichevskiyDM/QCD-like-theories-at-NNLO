############################################################################
# set -eu makes it stop after a failed command
set -eu
############################################################################
# the one we calculate

FORM="tform -l -w6 -t ./tempform"

# running over all cases and vertices
#for SX4 in SP4 SO4
for SX4 in SP4 SO4
do

for VERTEX in A1Mp2 A1Mp4 A1Mp6 A3Mp2 A3Mp4 A5Mp2
do
  $FORM -l -d VERTEX=$VERTEX -d SX4=$SX4 makefullvertex_with_vectors.frm
  mv makefullvertex_with_vectors.log log/makefullvertex_with_vectors$VERTEX$SX4.log  
done
done


# to run a bash file