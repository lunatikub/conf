#!/bin/bash

VENV_DIR=~/venv

V_add() {
    local name="$1"
    [ -z "${name}" ] && \
        echo 2>&1 "[V] V_add <name>" && return 1
    mkdir -p ${VENV_DIR}
    pushd ${VENV_DIR}
    echo "[V] Create venv: ${VENV_DIR}/${name}"
    python -m venv ${name}
    popd
}

V_set() {
    local name="$1"
    [ -z "${name}" ] && \
        echo 2>&1 "[V] V_set <name>" && return 1
    [ ! -d ${VENV_DIR}/${name} ] && \
        echo 2>&1 "[V] ${VENV_DIR}/${name} doesn't exist..." && return 1
    source ${VENV_DIR}/${name}/bin/activate
}

V_unset() {
    deactivate
}

V_rm() {
    local name="$1"
    [ -z "${name}" ] && \
        echo 2>&1 "[V] V_rm <name>" && return 1
    [ ! -d ${VENV_DIR}/${name} ] && \
        echo 2>&1 "[V] ${VENV_DIR}/${name} doesn't exist..." && return 1
    rm -rf ${VENV_DIR}/${name}
}

_V_comp() {
    COMPREPLY=($(compgen -W "$(ls ${VENV_DIR})"))
}

complete -F _V_comp V_set
complete -F _V_comp V_rm
