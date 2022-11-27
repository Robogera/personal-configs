# Messy config, fix later

# Plugins
evaluate-commands %sh{
	plugins="$kak_config/plugins"
	mkdir -p "$plugins"
	[ ! -e "$plugins/plug.kak" ] && \
		git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
	printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
}

plug "andreyorst/plug.kak" noload

plug "andreyorst/smarttab.kak" defer smarttab %{
	set-option global softtabstop 2
} config %{
	hook global BufNewFile .* noexpandtab
	hook global BufOpenFile .* noexpandtab
}

# plug 'delapouite/kakoune-mirror' %{
# 	# Suggested mapping
# 	map global normal "'" ': enter-user-mode -lock mirror<ret>'
# }
plug "tinted-theming/base16-kakoune" theme

plug "alexherbo2/auto-pairs.kak"
plug "alexherbo2/surround.kak"

plug "kak-lsp/kak-lsp" do %{
        cargo install --locked --force --path .
        # optional: if you want to use specific language servers
	mkdir -p ~/.config/kak-lsp
	cp -n kak-lsp.toml ~/.config/kak-lsp/
}

plug "gustavo-hms/luar" %{
        plug "gustavo-hms/peneira" %{
                    require-module peneira
        }
}

evaluate-commands %sh{
      echo "colorscheme base16-$BASE16_THEME"
}

# add required filetypes if needed
hook global WinSetOption filetype=(rust|python|go|javascript|typescript|c|cpp|yaml) %{
        lsp-enable-window
}

# tab / s-tab to scroll through the completions
hook global InsertCompletionShow .* %{
	try %{
		execute-keys -draft 'h<a-K>\h<ret>'
		map window insert <tab> <c-n>
		map window insert <s-tab> <c-p>
		hook -once -always window InsertCompletionHide .* %{
			unmap window insert <tab> <c-n>
			unmap window insert <s-tab> <c-p>
		}
	}
}

# j k to leave insert mode
hook global InsertChar k %{ try %{
      exec -draft hH <a-k>jk<ret> d
        exec <esc>
}}

# indentwidth is coverted to tabstop with the help of the smarttab plugin
# set global tabstop 4
# set global indentwidth 4
# 
# hook global WinSetOption filetype=yaml {
# 	set-option window tabstop 2
# 	set-option window indentwidth 2
# }
set global tabstop 2
set global indentwidth 2

set-option global luar_interpreter luajit

add-highlighter global/ number-lines -hlcursor
add-highlighter global/ wrap -indent -word -marker "↪ "
add-highlighter global/ show-matching

map global user l %{:enter-user-mode lsp<ret>} -docstring "LSP mode"
map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'
map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object e '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
map global object k '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
map global object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
map global object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'

