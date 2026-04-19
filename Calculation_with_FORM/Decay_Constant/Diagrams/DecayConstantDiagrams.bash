set -eu



FORM="tform -q -l -w6 -t ./tempform"


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

        # NEW LOOP over FF1 → FF9
        for ff in $(seq 1 9)
        do
            infile="FF${ff}.frm"
            logfile="FF${ff}.log"

            $FORM "$infile"
            mv "$logfile" log/${eext1}${eext2}${indextheory}_FF${ff}.log
        done 
    
    done

done