#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname

class cs-csmodule::4update_plugins_war inherits cs-csmodule {
notify {"In 4update_plugins_war": }
#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname

#exec{'removeElasticPlugins':
#  command => "$destPath/elasticsearch-2.1.1/bin/plugin remove  contentsphere-plugin",

#} ->

#file { "remove_OrientDB.jar":
#	path    => "$destPath/orientdb-community-2.1.16/lib/OrientDB.jar",
#	ensure  => absent,
#} ->




#exec { "remove OrientDB.jar":
#        path    => ['/usr/bin','/usr/sbin','/bin','/sbin'],
#        command => "rm $destPath/orientdb-community-2.1.16/lib/OrientDB.jar",
      #  require => File["/home/mypackage-${version}.rpm"],
#} 


#exec { "remove orientdb-server-config.xml":
#        path    => ['/usr/bin','/usr/sbin','/bin','/sbin'],
#        command => "rm $destPath/orientdb-community-2.1.16/config/orientdb-server-config.xml",
      #  require => File["/home/mypackage-${version}.rpm"],
#}

#exec { "remove edeka.war":
#        path    => ['/usr/bin','/usr/sbin','/bin','/sbin'],
#        command => "rm $destPath/apache-tomcat-9.0.0.M17/webapps/edeka.war",
      #  require => File["/home/mypackage-${version}.rpm"],
#}


#file { "remove_orientdb-server-config.xml":
#        path    => "$destPath/orientdb-community-2.1.16/config/orientdb-server-config.xml",
#        ensure  => absent,
#} ->

#file { "remove_edeka.war":
#        path    => "$destPath/apache-tomcat-9.0.0.M17/webapps/edeka.war",
#        ensure  => absent,
#} -> 

exec{'installElasticPlugins':
  command => "$destPath/elasticsearch-2.1.1/bin/plugin install file:$destPath/contentsphere-plugin-1.0.0.zip",

} ->
file { "$destPath/orientdb-community-2.1.16/lib/OrientDB.jar":
    ensure => file,
    source => "$destPath/OrientDB.jar",

}
file { "$destPath/orientdb-community-2.1.16/config/orientdb-server-config.xml":
    ensure => file,
    source => "$destPath/orientdb-server-config.xml",
}

file { "$destPath/apache-tomcat-9.0.0.M17/webapps/edeka.war":
    ensure => file,
    source => "$destPath/edeka.war",
#
} 
#notify {"Exiting 4update_plugins_war": }
}
