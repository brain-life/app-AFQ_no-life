#!/bin/bash
module load matlab/2017a
#module load spm

cat > build.m <<END
addpath(genpath('/N/u/brlife/git/encode'))
%addpath(genpath('/N/u/brlife/git/vistasoft'))
%addpath(genpath('/N/u/brlife/git/afq'))
addpath(genpath('/N/u/brlife/git/jsonlab'))
addpath(genpath('/N/soft/rhel7/spm/8'))

%need to use lindsey's patched version to work around the spm issue
addpath(genpath('/N/u/kitchell/Karst/Applications/vistasoft'))
addpath(genpath('/N/u/kitchell/Karst/Applications/AFQ'))

mcc -m -R -nodisplay -d compiled main
exit
END
matlab -nodisplay -nosplash -r build && rm build.m
