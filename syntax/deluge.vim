" Vim syntax file
" Language: Zoho Deluge
" Maintainer: yasuhiroki
" Latest Revision: 2026-06-14

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Keywords
syn keyword delugeKeyword if else while return break continue in void throws try catch
syn keyword delugeKeyword update insert delete into from fetch
syn match delugeKeyword "\<else\s\+if\>"
syn match delugeKeyword "\<for\s\+each\>"

syn keyword delugeBoolean true false
syn keyword delugeNull null
syn match delugeConstant "\<\(GET\|POST\|PUT\|DELETE\|PATCH\|HEAD\|OPTIONS\|JSON\)\>"
syn keyword delugeCommand alert info cancel submit

" Built-in functions and objects
syn keyword delugeBuiltin input list map date datetime string int decimal bool bigint long float
syn match delugeBuiltin "\<zoho\.[a-zA-Z0-9._]\+\>"

" Functions
syn match delugeFunction "\<[a-zA-Z_][a-zA-Z0-9_]*\ze\s*("

" Comments
syn region delugeComment start="/\*" end="\*/"
syn match delugeComment "//.*$"

" Strings
syn region delugeString start=+"+ skip=+\\"+ end=+"+
syn region delugeString start=+'+ skip=+\\'+ end=+'+

" Numbers
syn match delugeNumber "\<\d\+\(\.\d\+\)\?\>"

" Operators and Delimiters
syn match delugeArithmeticOperator "[-+%]\|/\%([/*]\)\@!\|\*\%(/\)\@!"
syn match delugeLogicalOperator "&&\|||\|!"
syn match delugeRelationalOperator "==\|!=\|<\|>\|<=\|>="
syn match delugeAssignmentOperator "=\|+=\|-=\|*=\|/=\|%="
syn match delugeDelimiter "[()\[\]{},;:]"

" Integration blocks (uses colon for keys)
let s:integration_keywords = 'invokeUrl\|invokeapi\|ftp\|sftp'
execute 'syn region delugeIntegration start="\<\(' . s:integration_keywords . '\)\ze\s*\[" end="\]" contains=delugeIntegrationKey,delugeString,delugeNumber,delugeComment,delugeConstant,delugeDelimiter,delugeBuiltin,delugeFunction'
execute 'syn match delugeIntegrationCommand "\<\(' . s:integration_keywords . '\)\>" containedin=delugeIntegration'
syn match delugeIntegrationBracket "\[\|\]" containedin=delugeIntegration
syn match delugeIntegrationKey "[a-zA-Z0-9- ]\+\ze:" containedin=delugeIntegration

" Highlighting
hi def link delugeKeyword Keyword
hi def link delugeBoolean Boolean
hi def link delugeNull Constant
hi def link delugeConstant Constant
hi def link delugeCommand Statement
hi def link delugeBuiltin Function
hi def link delugeFunction Function
hi def link delugeComment Comment
hi def link delugeString String
hi def link delugeNumber Number
hi def link delugeIntegrationCommand Function
hi def link delugeIntegrationBracket Delimiter
hi def link delugeIntegrationKey Type
hi def link delugeDelimiter Delimiter
"hi def link delugeArithmeticOperator Operator
"hi def link delugeLogicalOperator Operator
"hi def link delugeRelationalOperator Operator
"hi def link delugeAssignmentOperator Operator

let b:current_syntax = "deluge"
