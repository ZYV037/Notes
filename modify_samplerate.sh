modify_samplerate(){
sac_file=$1
sac<<EOF 
r $sac_file
INTERPOLATE DELTA 0.002
w $sac_file
quit
EOF
}

log_file=/mnt_c2/阳泉背景噪声/总数据cut/cutSacDir/log.txt
modify_sample_dir()
{
for file in ./*
do
	if test -f $file
	then
		if  [[ $file == ./Y*.sac ]];then			
		echo $file >> $log_file
		modify_samplerate $file
		fi
	fi
	if test -d $file
	then
		cd $file >> $log_file
		modify_sample_dir $file
		cd ../  >> $log_file
	fi
done
}

modify_sample_dir .
