_tms_complete() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    local categories
    categories="install dev docs index tree sync tools list info run meta cycle reveal dev cycle echo status doctor help "

    case "${COMP_CWORD}" in
        1)
            COMPREPLY=( $(compgen -W "${categories}" -- "${cur}") )
            return 0
            ;;
        2)
            case "${prev}" in
                install)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                dev)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                docs)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                index)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                tree)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                sync)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                tools)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                list)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                info)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                run)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                meta)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;
                dev)
                    COMPREPLY=( $(compgen -W "description example " -- "${cur}") )
                    return 0
                    ;;

            esac
            ;;
    esac
}
complete -F _tms_complete tms
