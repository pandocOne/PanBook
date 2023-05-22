#!/bin/bash

# use this path to set custom addOptions, PANDOCVARS and LSTSET COPYPAGE

note "use -V device:(pc|mobile|kindel) to produce different size of pdf"
note "use -V cover:path to use custom cover image"
note "use -V logo:path to use custom logo image"
note "use -V newtxtext:true to enable newtxtext"

# 启用扩展

exts="diagram-generator plot longtable fontawesome5 header listings column abstract device lineblock tabu ipa zh_en coverletter grade longtable"
#for ext in $exts; do
#       #_G[ext-$ext]=true
#done
# copyright可以打开，但需要将elegantbook中copyright及licence等相关部分拷进来，并将\currenttime删除(需要找一下是那个宏包支持的)
exts="wrap theorem"
for ext in $exts; do
        unset _G[ext-$ext]
done

# introduction和problemset文档类中已有定义，取消writeHeader
unset _G[ext-wrap-introduction]
unset _G[ext-wrap-problemset]

#_P[top-level-division]=section
_P[listings]=""
_M[listings]=true
_M[listings-disable-line-numbers]=true
_M[CJKmainfont]="NotoSerifSC-Regular"
_V[titlepage]=yes
_V[titlepage-text-color]='000000'
_V[titlepage-rule-height]=0
_V[titlepage-background]="background3.pdf"
_M[include-auto]=yes
-V[highlight-style]=tango
# panbook clean; rm build/*.pdf; panbook book --style=eisvogel -d
<< comment
_V[book]=yes
_M[geometry]=a4paper
_M[fontsize]=12pt
_M[colorlinks]=true
_M[toc-title]=目录
_V[toc-own-page]=yes

_V[copyright]=true
_V[licence]=ccnd
_V[titlepage-rule-color]='360049'
comment

# theorem 已有定义，不用扩展中的定义
_G[ext-theorem-use-tex]=false

#if [ "${_P[template]}"x != "" ];then
#	_V[documentclass]="scrbook"
#	getArrayVar _V classoption "cn"
#_M[CJKmainfont]=SourceHanSerifCN-Medium
#	unset _V[lang]
#fi

# 默认模板需要禁用unicode-math. unicode-math和newtxmath不兼容
# https://github.com/ElegantLaTeX/ElegantBook/issues/9
_V[mathspec]="true"
