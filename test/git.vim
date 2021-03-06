let s:suite = themis#suite('git')
let s:assert = themis#helper('assert')

let s:git = dein#types#git#define()

function! s:suite.protocol() abort "{{{
  " Protocol errors
  call s:assert.equals(s:git.init(
        \ 'http://github.com/Shougo/dein.vim', {}),
        \ {})

  call s:assert.equals(s:git.init(
        \ 'foo://github.com/Shougo/dein.vim', {}),
        \ {})
endfunction"}}}

function! s:suite.init() abort "{{{
  call s:assert.equals(s:git.init(
        \ 'https://github.com/Shougo/dein.vim', {}),
        \ { 'uri': 'https://github.com/Shougo/dein.vim.git',
        \   'type': 'git', 'directory': 'github.com/Shougo/dein.vim' })
  call s:assert.equals(s:git.init(
        \ 'Shougo/dein.vim', {}),
        \ { 'uri': 'https://github.com/Shougo/dein.vim.git',
        \   'type': 'git', 'directory': 'github.com/Shougo/dein.vim' })
  call s:assert.equals(s:git.init(
        \ 'https://github.com:80/Shougo/dein.vim', {}),
        \ { 'uri': 'https://github.com/Shougo/dein.vim.git',
        \   'type': 'git', 'directory': 'github.com/Shougo/dein.vim' })
endfunction"}}}

" vim:foldmethod=marker:fen:
