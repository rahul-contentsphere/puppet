source /etc/puppet/manifests/config/config.properties

echo "--------------------------------------------------------------------------------------------------------------------------------"
cd $CS_Refactored
echo "PWD:" $CS_Refactored
#Branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2 )
#echo "Branch: $Branch:"

#echo "--------------------------------------------------------------------------------------------------------------------------------"
#echo "PWD:" $CS_Refactored
echo "--------------------------------------------------------------------------------------------------------------------------------"
git pull
Branch=$(git branch 2>/dev/null | grep '^*' | colrm 1 2 )
echo "Branch: $Branch:"
#echo "PWD:" $CS_Refactored/$gui

echo "--------------------------------------------------------------------------------------------------------------------------------"
cd $CS_Refactored/$gui
echo "PWD:" $CS_Refactored/$gui
npm install
npm install -g gulp

echo "--------------------------------------------------------------------------------------------------------------------------------"
cd $CS_Refactored/$gui/$appconfig
echo "PWD:" $CS_Refactored/$gui/$appconfig
gulp webpack
#gulp prodsetup

echo "--------------------------------------------------------------------------------------------------------------------------------"
cd $CS_Refactored
echo "PWD" $CS_Refactored
chmod 777 gradlew
./gradlew  clean
./gradlew  war

echo "--------------------------------------------------------------------------------------------------------------------------------"
echo "Tomcat War, Location      :$CS_Refactored/REST/build/libs/edeka-1.0.0.war"
echo "Elastic Plugin, Location  :$CS_Refactored/ServerPlugins/elasticsearch/build/distributions/contentsphere-plugin-1.0.0.zip"
echo "Orientdb Plugin, Location :$CS_Refactored/ServerPlugins/OrientDB/build/libs/OrientDB.jar"
echo "                          :$CS_Refactored/ServerPlugins/OrientDB/src/main/resources/orientdb-server-config.xml"

