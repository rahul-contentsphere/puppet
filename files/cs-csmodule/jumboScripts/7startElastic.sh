source config.properties

cd $elasticPath
echo $elasticPath
bin/elasticsearch -Des.insecure.allow.root=true -d

