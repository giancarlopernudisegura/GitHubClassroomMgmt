for dir in */; do
    if [[ -d $dir ]]; then
        cd $dir
        git checkout master
        git pull
        cd ..
    fi
done
