set -eu



FORM="tform -q -l -w6 -t ./tempform"


for indextheory in SP4 SO4
do

    if [ "$indextheory" = "SP4" ]; then
        maxindex=2
    else
        maxindex=2
    fi

    SX4=$indextheory

    for index in $(seq 1 $maxindex)
    do
        eext1=$index

        echo '#define ext1 "'$eext1'"' >| setexternal.hf #this symbol means overwrite the file (creates or replaces the file)
        echo '#define SX4 "'$SX4'"' >> setexternal.hf #append to the file

        # NEW LOOP over 8 diagrams
        for vv in $(seq 1 8)
        do
            infile="VV${vv}.frm"
            logfile="VV${vv}.log"

            $FORM "$infile"
            mv "$logfile" log/${eext1}${indextheory}_VV${vv}.log
        done 
    
    done

done