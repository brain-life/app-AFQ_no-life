#!/bin/bash

[ $PBS_O_WORKDIR ] && cd $PBS_O_WORKDIR

mkdir -p compiled

module load matlab/2017a

cat > build.m <<END
disp('adding paths to compile');
addpath(genpath('/N/soft/rhel7/spm/8')) %spm needs to be loaded before vistasoft as vistasoft provides nanmean that works
addpath(genpath('/N/u/brlife/git/encode'))
addpath(genpath('/N/u/brlife/git/jsonlab'))
addpath(genpath('/N/u/brlife/git/vistasoft'))
addpath(genpath('/N/u/brlife/git/afq'))

disp('compiling');
mcc -m -R -nodisplay -d compiled main
disp('done!');
exit
END
matlab -nodisplay -nosplash -r build && rm build.m
