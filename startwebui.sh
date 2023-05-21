echo "************ zhujinhuatest killAndStart, Begin... **************"
#得到对应服务的进程号

keyword=webui-langchain.py
str=`ps -ef | grep $keyword | grep -v "grep"|awk '{print $2}'`
kill -9 $str
if [ "$?" -eq 0 ]; then
	echo "killed pid is "$str
    echo "kill success"
else
    echo "kill failed"
fi
 
nowDate=`date +"%Y-%m-%d"`
#进入对应的目录，重启服务
nohup python $keyword  >nohup.log 2>&1 &  
 
nowstr=`ps -ef | grep $keyword | grep -v "grep"|awk '{print $2}'`
#打印出现在新的进程号
echo "now pid is "$nowstr
echo "************ ok! Start Success... **************"
