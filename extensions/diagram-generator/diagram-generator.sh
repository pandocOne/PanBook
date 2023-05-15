regext diagram-generator
# 通用
getArrayVar _G "ext-diagram-generator" true

function ext_diagram-generator() {
	# 依赖add header功能
	if [ "${_G[ext-diagram-generator]}"x == "true"x ];then
		_F0[diagram-generator]="-L $SCRIPTDIR/${_G[extdir]}/diagram-generator/diagram-generator.lua"

		extStat diagram-generator done
	else
		extStat diagram-generator skip
	fi
}

function ext_diagram-generator_help() {
	echo -e "\t-G ext-diagram-generator:<true|false>                        enable diagram-generator(default true)"
	exit 0
}
