#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname
class cs-csmodule::2extract_base_packages inherits cs-csmodule {
#$destPath = "/tmp/testfolder"
#$sourcePath = "master/files" #here, master is the hostname

notify {"In 2extract_base_packages": }


exec { 'UntarApacheTomcat':
     cwd     => "${destPath}",
     command => "tar -xzf ${destPath}/apache-tomcat-9.0.0.M17.tar.gz",
     path    => ['/usr/bin', '/usr/sbin', '/bin',],
     require => File["${destPath}/apache-tomcat-9.0.0.M17.tar.gz"],
    }
exec { 'UntarElasticSearch':
     cwd     => "${destPath}",
     command => "tar -xzf ${destPath}/elasticsearch-2.1.1.tar.gz",
     path    => ['/usr/bin', '/usr/sbin', '/bin',],
     require => File["${destPath}/elasticsearch-2.1.1.tar.gz"],
    }
exec { 'UntarJava':
     cwd     => "${destPath}",
     command => "tar -xzf ${destPath}/jdk-8u20-linux-x64.tar.gz",
     path    => ['/usr/bin', '/usr/sbin', '/bin',],
     require => File["${destPath}/jdk-8u20-linux-x64.tar.gz"],
    } ->

exec {'update-alts':
     command => "update-alternatives --install /usr/bin/java java ${destPath}/jdk1.8.0_20/bin/java 2",
     path    => ['/usr/bin', '/usr/sbin', '/bin',],
     require => Exec["UntarJava"],
    }

exec { 'UntarOrientdb':
     cwd     => "${destPath}",
     command => "tar -xzf ${destPath}/orientdb-community-2.1.16.tar.gz",
     path    => ['/usr/bin', '/usr/sbin', '/bin',],
     require => File["${destPath}/orientdb-community-2.1.16.tar.gz"],
    }
#notify {"Exiting 2extract_base_packages": }
}
