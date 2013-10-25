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
	cmd_str="";
}

compctl -k portage_keywords edit-portage;


fastmerge() {
	if [[ -z "$1" ]]; then
		echo "I need a package name to emerge";
	else
		if [[ "`whoami`" == "root" ]] ; then
			cmd_str="emerge -av $1;rehash";
		else
			cmd_str="sudo emerge -av $1;rehash";
		fi
		eval $cmd_str
	fi
	cmd_str="";
}

unmerge() {
	if [[ -z "$1" ]]; then
		echo "I need a package name to unmerge";
	else
		if [[ "`whoami`" == "root" ]] ; then
			cmd_str="emerge -aC $1;rehash";
		else
			cmd_str="sudo emerge -aC $1;rehash";
		fi
		eval $cmd_str
	fi
	cmd_str="";	
}

system-update() {
	if [[ "`whoami`" == "root" ]] ; then
		cmd_str="emerge -DuvaN @world; rehash";
	else
		cmd_str="sudo emerge -DuvaN @world;rehash";
	fi
		eval $cmd_str
	cmd_str="";	
}


#Aliases
alias kern-update="zcat /proc/config.gz > .config && genkernel  --menuconfig --no-clean all && emerge @module-rebuild" #by  Fei Wong Reed
