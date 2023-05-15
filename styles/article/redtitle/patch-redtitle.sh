#!/bin/bash

exts="diagram-generator plot longtable fontawesome5 header listings column abstract device lineblock tabu grade ipa zh_en"
for ext in $exts; do
	#_G[ext-$ext]=true
	unset _G[ext-$ext]
done
exts="copyright longtable wrap coverletter theorem"
for ext in $exts; do
	unset _G[ext-$ext]
done
_G[ext-diagram-generator]=true

unset _G[includes]
unset _G[crossref]

pans="citeproc toc bibliography csl top-level-division number-sections metadata-file"
for pan in $pans; do
	unset _P[$pan]
done

unset _G[citeproc]
unset _V[indent]
unset _V[licence]
unset _V[classoption]
unset _V[documentclass]
# panbook art --style=redtitle

<< comment
_M[mainfont]=NotoSansCJKsc-Regular
_M[CJKmainfont]=NotoSerifSC-Regular
comment

