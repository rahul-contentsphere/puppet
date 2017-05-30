./configureElasticTomcatIP.sh  #Comment out this script, run it only once to configure Ips and Ports in application directories

./2stopElastic.sh*   
sleep 2
./3stopOrientdb.sh*  
sleep 2
./4stopTomcat.sh*  
sleep 2
./1backup.sh*	   
sleep 2
./5clearlogs.sh*   
#./6clearData.sh*   
slepp 2
puppet agent -t
sleep 2

./7startElastic.sh*	
sleep 2

#Change Port
sed -i "s/<listener protocol=\"binary\" socket=\"default\" port-range=\"2424-2430\" ip-address=\"0.0.0.0\"\/>/<listener protocol=\"binary\" socket=\"default\" port-range=\"$orientdbBinaryPortRange\" ip-address=\"0.0.0.0\"\/>/g" $orientdbPath/config/orientdb-server-config.xml
sed -i "s/<listener protocol=\"http\" socket=\"default\" port-range=\"2480-2490\" ip-address=\"0.0.0.0\">/<listener protocol=\"http\" socket=\"default\" port-range=\"$orientdbHttpPortRange\" ip-address=\"0.0.0.0\">/g" $orientdbPath/config/orientdb-server-config.xml
sleep 2

./8startOrientdb.sh*	
sleep 2

./9startTomcat.sh*
