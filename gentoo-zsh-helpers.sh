portage_keywords="keywords|accept_keywords|license|mask|unmask|use"

edit-portage() {	
	if [[ $1 =~ $portage_keywords ]]; then
		if [[ "`whoami`" == "root" ]] ; then
			cmd_str="$EDITOR /etc/portage/package.$1"
		else
			cmd_str="sudo $EDITOR /etc/portage/package.$1"
		fi
		eval $cmd_str
	else
		echo  $keywords;
	fi
}



