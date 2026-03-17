set -eu
# running all the MM programs in the correct order

#this part of code writes a file "setexternal.hf".

# SP4 or SO4

FORM="tform -l -w6 -t ./tempform"

#this is for SP4
#SX4=SP4 # assign variables


for indextheory in SP4 SO4
do

    if [ "$indextheory" = "SP4" ]; then
        maxindex=5
    else
        maxindex=9
    fi

    SX4=$indextheory

    for index in $(seq 1 $maxindex)
    do
        eext1=$index
        eext2=$index

        echo '#define ext1 "'$eext1'"' >| setexternal.hf #this symbol means overwrite the file (creates or replaces the file)
        echo '#define ext2 "'$eext2'"' >> setexternal.hf #append to the file
        echo '#define SX4 "'$SX4'"' >> setexternal.hf #append to the file

        for diagramindex in 2Mp2 2Mp4
        do
            echo '#define diagram "'$diagramindex'"' >| setdiagram.hf

            $FORM MM1.frm
            mv MM1.log log/$eext1$eext2$indextheory$diagramindex.log  

        done
    done

done


# FORM="tform -l -w6 -t /export/scratch/bijnens/tempform"
# $FORM MM1.frm
# $FORM MM2.frm
# $FORM MM3.frm
# $FORM MM4.frm
# $FORM MM5.frm
# $FORM MM6.frm
# $FORM MM7.frm
# $FORM MM8.frm
# $FORM MM9.frm

# $FORM AM1.frm
# $FORM AM2.frm
# $FORM AM3.frm

# $FORM AM9.frm

# $FORM S1.frm
# $FORM S2.frm
# $FORM S3.frm
# $FORM S4.frm
# $FORM S5.frm
# $FORM S6.frm
# $FORM S7.frm
# $FORM S8.frm
# $FORM Sall.frm

# putting things together
# unrenormalized Fpi and masses
# $FORM MMallp4.frm

# form -l MMall_Z.frm
# form -l MMall_nr.frm




