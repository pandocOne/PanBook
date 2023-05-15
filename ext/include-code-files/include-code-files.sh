regext include-code-files
# 通用
getArrayVar _G "ext-include-code-files" true

function ext_include-code-files() {
	# 依赖add header功能
	if [ "${_G[ext-include-code-files]}"x == "true"x ];then
		_F0[include-code-files]="--lua-filter $SCRIPTDIR/${_G[extdir]}/include-code-files/include-code-files.lua"

		extStat include-code-files done
	else
		extStat include-code-files skip
	fi
}

function ext_include-code-files_help() {
	echo -e "\t-G ext-include-code-files:<true|false>                        enable include-code-files(default true)"
	exit 0
}
