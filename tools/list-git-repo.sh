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
    if [ $(git branch | wc -l) -ge 2 ];then 
        echo "("
        echo "*********************************************************************************"
        echo "git repo path:" 
        echo $(realpath $i)
        echo "*********************************************************************************"
        echo "git branch"
        git branch 
        echo "git repo info"
        git remote get-url origin
        echo ")"
        echo ""
    fi
    cd $RPATH

done
