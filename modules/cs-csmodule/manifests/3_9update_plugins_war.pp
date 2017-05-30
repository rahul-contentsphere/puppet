#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname

class cs-csmodule::3_9update_plugins_war inherits cs-csmodule {
notify {"In 3_9update_plugins_war": }

exec	{'remove_ElasticPlugins':
	command => "$destPath/elasticsearch-2.1.1/bin/plugin remove  contentsphere-plugin",

	} ->

exec 	{'remove_OrientDB.jar':
   	command         => "rm $destPath/orientdb-community-2.1.16/lib/OrientDB.jar",
    	user            => root,
   	onlyif          => "test -f rm $destPath/orientdb-community-2.1.16/lib/OrientDB.jar",
    	path            => ['/usr/bin','/usr/sbin','/bin','/sbin'],
#    notify          => Notify['$destPath/orientdb-community-2.1.16/lib/OrientDB.jar  found'],         
  	}

exec 	{'remove_orientdb-server-config.xml':
    	command         => "rm $destPath/orientdb-community-2.1.16/config/orientdb-server-config.xml",
    	user            => root,
    	onlyif          => "test -f rm $destPath/orientdb-community-2.1.16/config/orientdb-server-config.xml",
    	path            => ['/usr/bin','/usr/sbin','/bin','/sbin'],
#    notify          => Notify['$destPath/orientdb-community-2.1.16/lib/OrientDB.jar  found'],
 	}
exec 	{'remove_edeka.war':
    	command         => "rm  $destPath/apache-tomcat-9.0.0.M17/webapps/edeka.war",
    	user            => root,
    	onlyif          => "test -f rm $destPath/apache-tomcat-9.0.0.M17/webapps/edeka.war",
    	path            => ['/usr/bin','/usr/sbin','/bin','/sbin'],
#    notify          => Notify['$destPath/orientdb-community-2.1.16/lib/OrientDB.jar  found'],
  	}
file {'remove_edeka':
    ensure => absent,
    path => "$destPath/apache-tomcat-9.0.0.M17/webapps/edeka",
    recurse => true,
    purge => true,
    force => true,
   }
}
