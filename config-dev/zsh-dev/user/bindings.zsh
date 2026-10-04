bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

(( $+widgets[autosuggest-toggle] )) && bindkey '^\\' autosuggest-toggle
(( $+widgets[history-substring-search-up] )) && bindkey '^[[A' history-substring-search-up
(( $+widgets[history-substring-search-down] )) && bindkey '^[[B' history-substring-search-down
