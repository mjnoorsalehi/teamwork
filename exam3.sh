function file_manipulation()
{
	echo -e "############################################################\nPlease choose one of the following choices:\n1.Create File.\n2.List Directory.\n3.Filter.\n4.Create Alias\n5.Destroy Alias.\n6.Exit\n############################################################"
	read chnum
	if ((chnum==1))
	then
		echo "Enter file name:"
		read fname
		touch $fname	
	elif ((chnum==2))
	then
		ls -lah
	elif ((chnum==3))
        then
		echo -e "Choose Filter type:\n1.Print Directory with size\n2.Find Directory\n3.Dir/File size more than 1KB"
                read ftype
                if ((ftype==1))
                then
			ls -lah | awk '{print $5 "\t" $9}'
		elif ((ftype==2))
		then
			echo "Enter dir name..."
			read dname
			ls -lah | awk "/$dname/ "'{print $5 "\t" $9}'
		elif ((ftype==3))
		then
			ls -l --block-size=K | awk '/K/ {print}'
		fi
	elif ((chnum==4))
        then
		shopt -s expand_aliases
		echo "Enter Alias name:"
		read alias
		echo "Enter command:"
                read command
		alias "$alias=$command"
	elif ((chnum==5))
	then		
	       	echo "Enter Alias:"
		read alias
		unalias $alias
	elif ((chnum==6))
	then
		clear
		a=0
	fi
}
a=1
while (($a==1))
do
	file_manipulation
done
	
