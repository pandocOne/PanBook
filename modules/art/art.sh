# 注册模块及帮助信息
regmod art
_H[art]="make article"

function func_art() {
	initBody "main.md"
	initBib
	initMetadataFile
	initMakefile
	initVscodeTask

	getArrayVar _G style ctexart
	getArrayVar _P "top-level-division" "section"
	init
	_P[metadata-file]=${_P[metadata-file]}

	if [ ${_G[t]} == "tex" ];then
		getArrayVar _V documentclass ctexart
	fi

	_copystyle
	_patch
	
	if [ ${_G[t]} == "tex" ];then
		# 启用扩展
		execExtensions
	fi

	partCompile
	getPandocParam
	getXeLaTeXParam
	eval ${_G[pandoc-param]}

	# 非tex时不用xelatex编译
	if [ ${_G[t]} == "tex" ];then
		TEX_OUTPUT=${_G[ofile]}.${_G[t]}
		# gif格式图片编译报错，需要引用eps格式，需转换后使用
		sed -i -r "s#(\includegraphics\{.*?).(gif)(\})#\1.eps\3#g" $TEX_OUTPUT
		# 网络图片需要替换为本地文件
		sed -i -r "s#(\includegraphics\{)http(s)?://(.*)#\1${_G[imgdirrelative]}/\3#g" $TEX_OUTPUT

		floatListings $TEX_OUTPUT

		latexmk -f -xelatex ${_G[xelatex]} -output-directory=${_G[build]} $TEX_OUTPUT #1&>/dev/null
	fi
	compileStatus ${_G[function]}
}

function func_art_help()
{
	note "todo"
}
