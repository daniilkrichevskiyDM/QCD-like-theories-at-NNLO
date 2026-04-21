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

for VERTEX in S0Mp2 S0Mp4 S0Mp6 S2Mp2 S2Mp4 S4Mp2
do
  $FORM -l -d VERTEX=$VERTEX -d SX4=$SX4 makefullvertex_with_Scalar_source.frm
  mv makefullvertex_with_Scalar_source.log log/makefullvertex_with_Scalar_source$VERTEX$SX4.log  
done
done


# to run a bash file