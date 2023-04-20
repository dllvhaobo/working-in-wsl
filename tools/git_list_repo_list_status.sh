#!/bin/bash 

if [ $# -eq 1 ];then 
    RPATH=$(realpath $1)
else 
    RPATH=$(pwd)
fi

echo $RPATH
repo_list=$(find $RPATH -name "*.git")

for i in $repo_list
do
    workspace=`dirname $(realpath $i)`
    cd ${workspace}
    echo '================================================================================='
    # echo "git repo path:$(realpath $i)"
    echo "git workspace:${workspace}" 
    echo "git list repo status "
    git status 
    cd $RPATH
    echo ""
done
