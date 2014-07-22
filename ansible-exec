#!/bin/bash

function usage {
    echo "Usage: $0 PLAYBOOK [ -i inventory ] [--VAR VALUE [...]] [ -- ANSIBLE-PLAYBOK_ARGS ]"
}

function get_arg {
    opt=$1
    shift
    [ $# = 0 ] && return 1
    echo $1
}

function args_error {
    echo "Option $1 requires an argument" >&2
    exit 1
}

if [ $# = 0 ]; then
    usage
    exit 0
fi

playbook=$1
playbook_dir=`dirname "$playbook"`
inventory="ansible_exec_dummy,"
ansible_playbook=ansible-playbook
ansible_args=()

shift
while [ -n "$1" ]; do
    case "$1" in
        --)
            shift
            ansible_args+=($@)
            break
            ;;
        -i)
            inventory=`get_arg "$@"` || args_error $1
            shift
            ;;
        --*)
            var=${1#--}
            if echo $var | grep -q =; then
                value=${var#*=}
                var=${var%%=*}
            else
                value=`get_arg "$@"` || args_error $1
                shift
            fi
            ansible_args+=(-e "$var=\"$value\"")
            ;;
        *)
            echo "$0: Invalid argument: $1" >&2
            usage >&2
            exit 2
            ;;
    esac
    shift
done

cd "$playbook_dir"
$ansible_playbook -i "$inventory" "$playbook" "${ansible_args[@]}"
