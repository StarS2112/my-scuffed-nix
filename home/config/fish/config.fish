# # Commands to run in interactive sessions can go here
# if status is-interactive
#     # No greeting
#     set fish_greeting
#
#     # Use starship transient prompt layouts
#     function starship_transient_prompt_func
#         starship module character
#     end
#     if test "$TERM" != "linux"
#         starship init fish | source
#         enable_transience
#     end
#
#     # NixOS & Kitty Aliases
#     alias clear "printf '\033[2J\033[3J\033[1;1H'"
#     alias celar "printf '\033[2J\033[3J\033[1;1H'"
#     alias claer "printf '\033[2J\033[3J\033[1;1H'"
#
#     if test "$TERM" != "linux"
#         alias ls 'eza --icons=auto'
#     end
#     if test "$TERM" = "xterm-kitty"
#         alias ssh 'kitten ssh'
#     end
#
#     # Launch Fastfetch at the very end once environment variables are loaded
#     fastfetch
# end


if status is-interactive
    set -g fish_greeting ""
    fastfetch
end
