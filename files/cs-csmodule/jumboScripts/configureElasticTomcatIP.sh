source config.properties
getIP=$(hostname -I)
ip=${getIP::-1}

#ip=$(hostname -I)

echo "IP=" $ip

sed -i "s/# network.host: 192.168.0.1/  network.host: $ip/g" $elasticPath/config/elasticsearch.yml
sed -i "s/# http.port: 9200/  http.port: $elasticPort/g" $elasticPath/config/elasticsearch.yml



sed -i "s/<listener protocol=\"binary\" socket=\"default\" port-range=\"2424-2430\" ip-address=\"0.0.0.0\"\/>/<listener protocol=\"binary\" socket=\"default\" port-range=\"$orientdbBinaryPortRange\" ip-address=\"0.0.0.0\"\/>/g" $orientdbPath/config/orientdb-server-config.xml

sed -i "s/<listener protocol=\"http\" socket=\"default\" port-range=\"2480-2490\" ip-address=\"0.0.0.0\">/<listener protocol=\"http\" socket=\"default\" port-range=\"$orientdbHttpPortRange\" ip-address=\"0.0.0.0\">/g" $orientdbPath/config/orientdb-server-config.xml





sed -i "s/<Engine name=\"Catalina\" defaultHost=\"localhost\">/<Engine name=\"Catalina\" defaultHost=\"$ip\">/g" $tomcatPath/conf/server.xml
sed -i "s/<Host name=\"localhost\"  appBase=\"webapps\"/<Host name=\"$ip\"  appBase=\"webapps\"/g" $tomcatPath/conf/server.xml
sed -i "s/<Server port=\"8005\" shutdown=\"SHUTDOWN\">/<Server port=\"$tomcatServerPort\" shutdown=\"SHUTDOWN\">/g" $tomcatPath/conf/server.xml
sed -i "s/<Connector port=\"8080\" protocol=\"HTTP\/1.1\"/<Connector port=\"$tomcatPort\" protocol=\"HTTP\/1.1\"/g" $tomcatPath/conf/server.xml
sed -i "s/redirectPort=\"8443\" \/>/redirectPort=\"$tomcatRedirectPort\" \/>/g" $tomcatPath/conf/server.xml
#sed -i "s/<Connector port=\"8009\" protocol=\"AJP\/1.3\" redirectPort=\"8443\" \/>/<Connector port=\"$tomcatConnectorPort\" protocol=\"AJP\/1.3\" redirectPort=\"$tomcatRedirectPort\" \/>/g" $tomcatPath/conf/server.xml
sed -i "s/<Connector port=\"8009\" protocol=\"AJP\/1.3\" redirectPort=\"1443\" \/>/<Connector port=\"$tomcatConnectorPort\" protocol=\"AJP\/1.3\" redirectPort=\"$tomcatRedirectPort\" \/>/g" $tomcatPath/conf/server.xml


