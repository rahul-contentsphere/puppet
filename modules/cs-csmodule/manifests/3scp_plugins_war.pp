#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname
class cs-csmodule::3scp_plugins_war inherits cs-csmodule {
#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname

notify {"In 3scp_plugins_war": }



file {"$destPath/contentsphere-plugin-1.0.0.zip":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0744,
     source => "puppet://${sourcePath}/${moduleName}/${warPluginFolder}/contentsphere-plugin-1.0.0.zip"
    }

file {"$destPath/OrientDB.jar":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0744,
     source => "puppet://${sourcePath}/${moduleName}/${warPluginFolder}/OrientDB.jar"
    }

file {"$destPath/orientdb-server-config.xml":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0744,
     source => "puppet://${sourcePath}/${moduleName}/${warPluginFolder}/orientdb-server-config.xml"
    }

file {"$destPath/edeka.war":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0744,
     source => "puppet://${sourcePath}/${moduleName}/${warPluginFolder}/edeka.war"
    }

#notify {"Exiting 3scp_plugins_war": }
}
