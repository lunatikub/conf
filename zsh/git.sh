
gpush() {
    }

gcherry () {
    br=$1
    for ci in $(git  log --pretty=format:'%h' $br --not origin/p_1 --reverse)
    do
        git cherry-pick $ci
    done
}

greview () {
    br=refs/devel/$3

    git fetch origin +refs/devel/\*:refs/devel/\*

    clear
    git ll $br --not origin/p_1
    read

    for ci in $(git log --pretty=format:'%h' $br --reverse --not origin/p_1)
    do
        git show $ci
    done
}

__greview () {
    read -cA line

    c1=$(echo $line | cut -d' ' -f2)
    c2=$(echo $line | cut -d' ' -f3)

    if [ ! -z "$c2" ]
    then
        reply=($(cat /tmp/REFS_DEV | grep "${c1}/.*${c2}.*"))
        return
    fi

    reply=($(cat /tmp/REFS_NAME))
}

compctl -K __greview greview
compctl -K __greview gpush

gorigin () {
    git reset --hard origin/$1
}

gfetch () {
    git fetch origin +refs/devel/\*:refs/devel/\*
}

gclean () {
    [ -z "$1" ] && echo "Et ta soeur elle a pas d'iXengine ?" && return
    [ -z "$2" ] && echo "Et ton pere il a pas de Bundle ?" && return
    git checkout -f
    git checkout $1
    git reset --hard origin/$1
    git clean -dfx
    git pull --rebase
    git gc
    gfetch
    cd libqmprotocols/
    git checkout -f
    git clean -dfx
    git checkout p_1
    git pull --rebase
    gfetch
    git gc
    git checkout $2
    git reset --hard origin/$2
    git pull --rebase
    cd ../proto_definition
    git checkout -f
    git clean -dfx
    git pull --rebase
    git gc
    cd ../
}

__gclean () {
    reply=(ixe_4 ixe_4_18_2 ixe_4_19 ixe_4_20_vnfc ixe_4_21 \
        p_1 p_1_110 p_1_120 p_1_130 p_1_140 p_1_150 p_1_160 p_1_170 p_1_180 p_1_190 p_1_200 \
        p_1_210 p_1_220 p_1_230 p_1_240 p_1_250)
}

compctl -K __gclean gclean

gview () {
    echo "framework ------------------------------"
    git status
    echo "protodefinition ------------------------"
    cd proto_definition
    git status
    echo "bundle ---------------------------------"
    cd ../libqmprotocols
    git status
    cd ../
}

gnew () {
    name="$1"

    git clone git@sources.foret:ixe $name
    cd $name
    git clone git@sources.foret:libqmprotocols
    git clone git@sources.foret:proto_definition
}
