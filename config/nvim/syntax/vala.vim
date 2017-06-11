if exists("b:current_syntax")
    finish
endif

runtime syntax/cs.vim

syn keyword csModifier weak
syn keyword csType var
syn match csContextualStatement /\<\(construct\)[[:space:]\n]*{/me=s+9

