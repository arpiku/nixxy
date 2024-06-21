# literate-haskell.kak - Literate Haskell syntax for Kakoune

declare-user-mode literate-haskell-mode

define-command -docstring 'Enter Literate Haskell mode' \
    enter-literate-haskell-mode %{ evaluate-commands %sh{ echo "
    hook buffer filetype=*.lhs %{
        set buffer filetype literate-haskell
    }
    hook -group literate-haskell-mode global WinSetOption filetype=*.lhs %{
        add-highlighter shared/literate-haskell
    }
    add-highlighter shared/literate-haskell group
    add-highlighter shared/literate-haskell/markdown regex ^[^>].* 0:default
    add-highlighter shared/literate-haskell/code ref default
    add-highlighter shared/literate-haskell/code ref haskell
    "} }

# Add filetype detection
hook global BufCreate \*.lhs %{
    set-option buffer filetype literate-haskell
    enter-user-mode literate-haskell-mode
}

hook global BufSetOption filetype=*.lhs %{
    set buffer filetype literate-haskell
    hook -group literate-haskell-mode global WinSetOption filetype=*.lhs %{
        add-highlighter shared/literate-haskell
    }
    add-highlighter shared/literate-haskell group
    add-highlighter shared/literate-haskell/markdown regex ^[^>].* 0:default
    add-highlighter shared/literate-haskell/code ref default
    add-highlighter shared/literate-haskell/code ref haskell
}

