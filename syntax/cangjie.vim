" Vim syntax file
" Language: Cangjie
" Maintainer: Converted from TextMate grammar
" Latest Revision: 2025

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword cangjieKeyword VArray const differentiable grad vjp valWithGrad adjoint adjointOf
syn keyword cangjieKeyword when except include primal stage main mut Nothing prop redef
syn keyword cangjieKeyword unsafe struct enum This package import class interface extend
syn keyword cangjieKeyword func let var sealed type init this super if else case try catch
syn keyword cangjieKeyword finally for do while throw return continue break is as in match
syn keyword cangjieKeyword where spawn synchronized macro quote static public internal
syn keyword cangjieKeyword private protected external override abstract open operator
syn keyword cangjieKeyword foreign inout

" Boolean and special constants
syn keyword cangjieBoolean true false
syn keyword cangjieType IntNative UIntNative Int8 Int16 Int32 Int64 UInt8 UInt16 UInt32 UInt64
syn keyword cangjieType Float16 Float32 Float64 Rune Bool Unit Option String

" Operators
syn match cangjieOperator "[@!;]"
syn match cangjieOperator "\<in\>"

" Comments
syn region cangjieCommentBlock start="/\*" end="\*/" contains=cangjieCommentBlock
syn match cangjieCommentLine "//.*$"

" Strings
syn region cangjieString start='"' end='"' skip='\\.' contains=cangjieEscape,cangjieInterpolation
syn region cangjieString start='"""' end='"""' contains=cangjieEscape,cangjieInterpolation
syn region cangjieString start="'" end="'" skip='\\.' contains=cangjieEscape
syn region cangjieRawString start='r"' end='"'
syn region cangjieRawString start="r'" end="'"
syn region cangjieJsonString start='J"' end='"' contains=cangjieEscape
syn region cangjieByteString start='b"' end='"' contains=cangjieEscape
syn region cangjieByteString start="b'" end="'" contains=cangjieEscape

" Raw strings with hash marks
syn region cangjieRawString start='#\+"\ze' end='"\#\+' 
syn region cangjieRawString start='##\+"\ze' end='"##\+'

" String interpolation
syn region cangjieInterpolation matchgroup=cangjieOperator start='\${' end='}' contained contains=ALL

" Escape sequences
syn match cangjieEscape '\\[tbrn'"\\fv0]' contained
syn match cangjieEscape '\\u{[0-9a-fA-F]\{1,8}}' contained

" Numbers - Binary
syn match cangjieNumber '\<0[bB][01][01_]*\%(u8\|u16\|u32\|u64\|i8\|i16\|i32\|i64\)\?\>'

" Numbers - Octal
syn match cangjieNumber '\<0[oO][0-7][0-7_]*\%(u8\|u16\|u32\|u64\|i8\|i16\|i32\|i64\)\?\>'

" Numbers - Decimal
syn match cangjieNumber '\<[0-9][0-9_]*\%(u8\|u16\|u32\|u64\|i8\|i16\|i32\|i64\)\?\>'

" Numbers - Hexadecimal
syn match cangjieNumber '\<0[xX][0-9a-fA-F][0-9a-fA-F_]*\%(u8\|u16\|u32\|u64\|i8\|i16\|i32\|i64\)\?\>'

" Floating point - Decimal
syn match cangjieFloat '\<[0-9][0-9_]*[eE][-]\?[0-9][0-9_]*\%(f16\|f32\|f64\)\?\>'
syn match cangjieFloat '\.[0-9][0-9_]*\%([eE][-]\?[0-9][0-9_]*\)\?\%(f16\|f32\|f64\)\?\>'
syn match cangjieFloat '\<[0-9][0-9_]*\.[0-9][0-9_]*\%([eE][-]\?[0-9][0-9_]*\)\?\%(f16\|f32\|f64\)\?\>'

" Floating point - Hexadecimal
syn match cangjieFloat '\<0[xX]\%(\.[0-9a-fA-F][0-9a-fA-F_]*\|[0-9a-fA-F][0-9a-fA-F_]*\.[0-9a-fA-F][0-9a-fA-F_]*\|[0-9a-fA-F][0-9a-fA-F_]*\)[pP][-]\?[0-9][0-9_]*'

" Character literals
syn match cangjieChar "b'\%([^'\\]\|\\[tbrn'\\\"fv0]\|\\u{[0-9a-fA-F]\{1,2}}\)'"

" Functions
syn match cangjieFunction '\<\w\+\ze\s*('
syn match cangjieFunction '\<\w\+\ze\s*<[^>]*>\s*('

" Macros (annotations)
syn match cangjieMacro '@\w\+'

" Types and classes
syn match cangjieType '\<[A-Z]\w*\>'
syn match cangjieClass '\<\w\+\ze\s*<[^>]*>'

" Package and import paths
syn match cangjieModule '\w\+\.\ze\w' contained
syn region cangjiePackage start='package\s\+' end='\%(\s\|$\)' contains=cangjieKeyword,cangjieModule
syn region cangjieImport start='import\s\+' end='\%(\s\|$\)' contains=cangjieKeyword,cangjieModule,cangjieOperator

" Quote blocks
syn region cangjieQuote matchgroup=cangjieKeyword start='quote\s*(' end=')' contains=cangjieQuoteInside
syn region cangjieQuoteInside start='(' end=')' contained contains=cangjieQuoteInside

" Highlighting links
hi def link cangjieKeyword Keyword
hi def link cangjieBoolean Boolean
hi def link cangjieType Type
hi def link cangjieClass Type
hi def link cangjieOperator Operator
hi def link cangjieCommentBlock Comment
hi def link cangjieCommentLine Comment
hi def link cangjieString String
hi def link cangjieRawString String
hi def link cangjieJsonString String
hi def link cangjieByteString String
hi def link cangjieChar Character
hi def link cangjieEscape SpecialChar
hi def link cangjieInterpolation Special
hi def link cangjieNumber Number
hi def link cangjieFloat Float
hi def link cangjieFunction Function
hi def link cangjieMacro PreProc
hi def link cangjieModule Identifier
hi def link cangjiePackage Identifier
hi def link cangjieImport Include
hi def link cangjieQuote String

let b:current_syntax = "cangjie"
