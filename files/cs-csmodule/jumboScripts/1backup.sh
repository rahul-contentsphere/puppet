source config.properties
cd $elasticPath
tar -zcvf $backupFolder/elasticsearch_data_`date +%d%b%Y_%H%M`.tar.gz data/
tar -zcvf $backupFolder/elasticsearch_logs_`date +%d%b%Y_%H%M`.tar.gz logs/

cd $orientdbPath
tar -zcvf $backupFolder/orientdb_data_`date +%d%b%Y_%H%M`.tar.gz databases/
tar -zcvf $backupFolder/orientdb_logs_`date +%d%b%Y_%H%M`.tar.gz log/

cd $tomcatPath
tar -zcvf $backupFolder/tomcat_logs_`date +%d%b%Y_%H%M`.tar.gz 	logs/

