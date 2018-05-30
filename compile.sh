#!/bin/bash
module load matlab/2017a

cat > build.m <<END
addpath(genpath('/N/u/brlife/git/encode'))
addpath(genpath('/N/u/brlife/git/jsonlab'))
addpath(genpath('/N/u/brlife/git/vistasoft'))
addpath(genpath('/N/u/brlife/git/afq'))
addpath(genpath('/N/soft/rhel7/spm/8'))
mcc -m -R -nodisplay -d compiled main
exit
END
matlab -nodisplay -nosplash -r build && rm build.m
