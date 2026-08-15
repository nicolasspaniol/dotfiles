declare-option -hidden range-specs fold_attr_ranges
set-face global FoldedAttr default+di

define-command fold-attr -params 0..1 -docstring "fold-attr [<attr>]: fold all instances of HTML attribute <attr> ('class', if unspecified)" %{
    set-option buffer fold_attr_ranges %val{timestamp}

    evaluate-commands -draft %{
        execute-keys %sh{
            printf '%%s%s="[^"]*"<ret>' "${1:-class}"
        }
        evaluate-commands %sh{
            printf "set-option -add buffer fold_attr_ranges "
            printf "'%s|{FoldedAttr}${1:-class}…' " $kak_selections_desc
        }
    }

    add-highlighter -override buffer/fold-attr replace-ranges fold_attr_ranges
}
