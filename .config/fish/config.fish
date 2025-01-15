if status is-interactive
    # Commands to run in interactive sessions can go here
end
# ---- Custom greetings ----
function fish_greeting
    echo "Welcome back, Master! Ready to conquer the terminal today?"
end
# ---- EZA (better ls) ----
alias ls="eza --icons=always"
# ---- Zoxide (better cd) ----
zoxide init fish | source
alias cd="z"
# ---- Updates (checks both rpm and flatpak update with just SUDO DNF UPDATE) ----
function sudo
    if test (count $argv) -ge 2 -a "$argv[1]" = "dnf" -a "$argv[2]" = "update"
        command sudo dnf update; and flatpak update
    else
        command sudo $argv
    end
end

