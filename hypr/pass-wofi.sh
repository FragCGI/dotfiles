#!/bin/sh
# pass-spmenu
# passmenu, but for wofi
# Licensed under the GNU General Public License version 3.

die() {
    printf "pass-spmenu: %s\n" "${@:-something went wrong.}"
    exit 1
}

check_reqs() {
    [ ! -x "$(command -v pass)" ] && die "pass not found"
    [ ! -x "$(command -v wofi)" ] && die "wofi not found"
    [ ! -x "$(command -v notify-send)" ] && no_notif="true"

    if [ -n "$WAYLAND_DISPLAY" ]; then
        [ ! -x "$(command -v wl-copy)" ] && die "wl-clipboard not found"
        clipboard="wl-copy"
    elif [ -n "$DISPLAY" ]; then
        [ ! -x "$(command -v xclip)" ] && die "xclip not found"
        clipboard="xclip -sel clipboard"
    else
        die "no display server found"
    fi

    mkdir -p "/tmp/pass-spmenu/lost"
}

get_passwords() {
    ls "${PASSWORD_STORE_DIR:-$HOME/.password-store}" | sed "s/[.]gpg//g" | grep -v "\-id"
}

get_opts() {
cat << EOF
Generate
Remove
EOF
}

get_generate_name() {
    wofi -d -p 'What do you want to name this password?' | awk '{print $1}'
}

get_generate_length() {
    wofi -d -p 'How long do you want this password to be?' | awk '{print $1}'
}

create_list() {
    get_passwords
    get_opts
}

main() {
    check_reqs
    selpass="$(create_list | wofi -d -p 'Passwords' | awk '{print $1}')"
    selpass_p="$(printf "%s/%s" "${PASSWORD_STORE_DIR:-$HOME/.password-store}" "$selpass")"

    case "${selpass}" in
        "")
            exit 0
        ;;
        "Generate")
            name="$(get_generate_name)"
            len="$(get_generate_length)"

            [ -z "$name" ] && exit 0
            [ -z "$len" ] || [ "$len" -lt 1 ] && exit 0

            pass generate "${name}" "${len}" && notify-send "Generated ${name}" "Password with name ${name} and a length of ${len} characters generated."

            main
            exit 0
        ;;
        "Remove")
            selpass="$(get_passwords | wofi -d -p 'Select' | awk '{print $1}')"
            selpass_p="$(printf "%s/%s.gpg" "${PASSWORD_STORE_DIR:-$HOME/.password-store}" "$selpass")"

            [ -z "$selpass" ] && exit 0
            [ ! -f "${selpass_p}" ] && die "password not found"

            # in case it was deleted by mistake
            cp "${selpass_p}" /tmp/pass-spmenu/lost || die "failed to copy password"

            pass remove --force "${selpass}" && notify-send "${selpass} removed!" "Password ${selpass} removed."
        ;;
        *)
            echo "${selpass}" | grep -qiE "otp|2fa" && otp="otp"
            pass ${otp} show "${selpass}" | ${clipboard} || exit 1

            [ "$no_notif" != "true" ] && notify-send "${selpass} copied!" "Password '${selpass}' copied to clipboard."
    esac
}

main "$@"

