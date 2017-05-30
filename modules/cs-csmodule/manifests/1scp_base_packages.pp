#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname

class cs-csmodule::1scp_base_packages inherits cs-csmodule {
#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname

notify {"In 1scp_base_packages": }

file {"$destPath/apache-tomcat-9.0.0.M17.tar.gz":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0644,
     source => "puppet://${sourcePath}/apache-tomcat-9.0.0.M17.tar.gz"
    }

file {"$destPath/elasticsearch-2.1.1.tar.gz":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0644,
     source => "puppet://${sourcePath}/elasticsearch-2.1.1.tar.gz"
    }

file {"$destPath/jdk-8u20-linux-x64.tar.gz":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0644,
     source => "puppet://${sourcePath}/jdk-8u20-linux-x64.tar.gz"
    }

file {"$destPath/orientdb-community-2.1.16.tar.gz":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0644,
     source => "puppet://${sourcePath}/orientdb-community-2.1.16.tar.gz"
    }
#notify {"Exiting 1scp_base_packages": }
}
