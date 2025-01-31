if status is-interactive
    # Commands to run in interactive sessions can go here
end
# ---- Custom greetings ----
function fish_greeting
    echo "Welcome back, Master! Ready to conquer the terminal today?"
end
# ---- Starship ----
starship init fish | source
# ---- Rosepine theme ----
fish_config theme choose "Rosé Pine"
# ---- EZA (better ls) ----
alias ls="eza --icons=always"
# ---- Zoxide (better cd) ----
zoxide init fish | source
alias cd="z"
# ---- SUDO Function ----
function sudo
    if test (count $argv) -ge 2 -a "$argv[1]" = "dnf" -a "$argv[2]" = "update"
        command sudo dnf update; and flatpak update
    else
        command sudo $argv
    end
end

