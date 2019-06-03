# helpers
delete_trailing_whitespace()
{
    local file=$1
    [ ! -f $file ] && return 1
    sed -i 's/[ \t]*$//' $file
    return 0
}

delete_trailing_whitespace_from_git()
{
    local git_root=$1
    [ ! -d $git_root/.git ] && return 1
    pushd $git_root
    for file in $(git ls-files -m)
    do
        delete_trailing_whitespace $file
    done
    popd
    return 0
}
