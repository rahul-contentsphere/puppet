
source /etc/puppet/manifests/config/config.properties
echo "Reading variables from config file:/etc/puppet/manifests/config/config.properties"
echo "-------------------------------------------------------------------------------------------------------------------------------------"
#echo "$CS_Refactored"
echo "Coping war/plugins Files"
sleep 3
cp $CS_Refactored/REST/build/libs/edeka-1.0.0.war $cs_csmoduleWarPluginFolderPath/edeka.war
echo "$CS_Refactored/REST/build/libs/edeka-1.0.0.war copied to $cs_csmoduleWarPluginFolderPath/edeka.war"

cp $CS_Refactored/ServerPlugins/elasticsearch/build/distributions/contentsphere-plugin-1.0.0.zip $cs_csmoduleWarPluginFolderPath/
echo "$CS_Refactored/ServerPlugins/elasticsearch/build/distributions/contentsphere-plugin-1.0.0.zip copied to $cs_csmoduleWarPluginFolderPath/"

cp $CS_Refactored/ServerPlugins/OrientDB/build/libs/OrientDB.jar $cs_csmoduleWarPluginFolderPath/
echo "$CS_Refactored/ServerPlugins/OrientDB/build/libs/OrientDB.jar copid to  $cs_csmoduleWarPluginFolderPath/"

cp $CS_Refactored/ServerPlugins/OrientDB/src/main/resources/orientdb-server-config.xml $cs_csmoduleWarPluginFolderPath/
echo "$CS_Refactored/ServerPlugins/OrientDB/src/main/resources/orientdb-server-config.xml copied to $cs_csmoduleWarPluginFolderPath/"
echo "-------------------------------------------------------------------------------------------------------------------------------------"


echo "-------------------------------------------------------------------------------------------------------------------------------------"
echo "Extracting edeka.war at $cs_csmoduleWarPluginFolderPath"
sleep 3
echo "-------------------------------------------------------------------------------------------------------------------------------------"
cd $cs_csmoduleWarPluginFolderPath
jar -xf edeka.war


echo "-------------------------------------------------------------------------------------------------------------------------------------"
mv edeka.war edekaNoConfig.war
echo "moved edeka.war to edekaNoConfig.war"
echo "-------------------------------------------------------------------------------------------------------------------------------------"


echo "-------------------------------------------------------------------------------------------------------------------------------------"
cp $cs_csmodulePropertyFiles/* $cs_csmoduleWarPluginFolderPath/WEB-INF/classes/databaseProperties/
echo "Copied Property files from $cs_csmodulePropertyFiles/ to $cs_csmoduleWarPluginFolderPath/WEB-INF/classes/databaseProperties/ "
echo "-------------------------------------------------------------------------------------------------------------------------------------"


echo "-------------------------------------------------------------------------------------------------------------------------------------"
echo "Creating edeka.war"
sleep 3
jar -cf edeka.war gui/ META-INF/ WEB-INF/
echo "-------------------------------------------------------------------------------------------------------------------------------------"

rm -r gui/ META-INF/ WEB-INF/ 

ls -l $cs_csmoduleWarPluginFolderPath
