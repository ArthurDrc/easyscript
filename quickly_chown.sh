echo "Please enter the username you want grant access on"
read username
echo "Please enter the directory you want grant power to your user"
read dir
echo "Do you want recursive?(y/n)"
read r
if [ $r = y ] ; then 
	 REG="-R" 
	 HOWLONG=5 
fi
if [ $r = n ] ; then 
         REG=""
         HOWLONG=5 
fi  
sudo chown $1 $username:$username $dir
echo "All Done!"
