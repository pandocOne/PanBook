#!/bin/bash

# use this path to set custom addOptions, PANDOCVARS and LSTSET COPYPAGE

note "use -V device:(pc|mobile|kindel) to produce different size of pdf"
note "use -V cover:path to use custom cover image"
note "use -V logo:path to use custom logo image"
note "use -V newtxtext:true to enable newtxtext"

# 启用扩展

exts="diagram-generator plot longtable fontawesome5 header listings column abstract device lineblock tabu grade ipa zh_en"
#for ext in $exts; do
#       #_G[ext-$ext]=true
#done
exts="copyright longtable wrap coverletter theorem"
for ext in $exts; do
        unset _G[ext-$ext]
done

# introduction和problemset文档类中已有定义，取消writeHeader
unset _G[ext-wrap-introduction]
unset _G[ext-wrap-problemset]

_P[top-level-division]=section
#_V[book]=yes
_P[listings]=""
_M[listings]=true
_M[listings-disable-line-numbers]=true
# panbook clean; rm build/*.pdf; panbook art --style=eisvogel1 -d
_M[CJKmainfont]=NotoSerifSC-Regular
_M[geometry]=a4paper
_M[fontsize]=14pt
_M[colorlinks]=true
_M[toc-title]=目录
_V[titlepage]=yes
_V[titlepage-text-color]='000000'
_V[titlepage-rule-height]=40
_V[titlepage-rule-color]='FF7F00'
_V[titlepage-background]="./images/reading-tea1.jpg"
_V[titlepage-logo]="./images/logo.png"
<< comment
_V[toc-own-page]=yes
_V[include-auto]=yes
_V[copyright]=true
_V[licence]=ccnd
comment

# theorem 已有定义，不用扩展中的定义
_G[ext-theorem-use-tex]=false

if [ "${_P[template]}"x != "" ];then
	_V[documentclass]="eisvogel1"
	getArrayVar _V classoption "cn"
	_M[CJKmainfont]="NotoSerifSC-Regular"
	unset _V[lang]
fi

# 默认模板需要禁用unicode-math. unicode-math和newtxmath不兼容
# https://github.com/ElegantLaTeX/ElegantBook/issues/9
_V[mathspec]="true"
