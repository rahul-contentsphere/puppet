file {"/tmp/testfolder/apache-tomcat-9.0.0.M17.tar.gz":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0644,
     source => "puppet://master/files/apache-tomcat-9.0.0.M17.tar.gz"
    }

file {"/tmp/testfolder/elasticsearch-2.1.1.tar.gz":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0644,
     source => "puppet://master/files/elasticsearch-2.1.1.tar.gz"
    }

file {"/tmp/testfolder/jdk-8u20-linux-x64.tar.gz":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0644,
     source => "puppet://master/files/jdk-8u20-linux-x64.tar.gz"
    }

file {"/tmp/testfolder/orientdb-community-2.1.16.tar.gz":
     ensure => file,
     owner => "root",
     group => "root",
     mode => 0644,
     source => "puppet://master/files/orientdb-community-2.1.16.tar.gz"
    }

exec { 'tar -zxvf /tmp/testfolder/apache-tomcat-9.0.0.M17.tar.gz':
     cwd     => '/tmp/testfolder',
     path    => ['/usr/bin', '/usr/sbin', '/bin',],
     require => File["/tmp/testfolder/apache-tomcat-9.0.0.M17.tar.gz"],
    }

exec { 'tar -zxvf /tmp/testfolder/elasticsearch-2.1.1.tar.gz ':
     cwd     => '/tmp/testfolder',
     path    => ['/usr/bin', '/usr/sbin', '/bin',],
     require => File["/tmp/testfolder/elasticsearch-2.1.1.tar.gz"],
    }
exec { 'tar -zxvf /tmp/testfolder/jdk-8u20-linux-x64.tar.gz':
     cwd     => '/tmp/testfolder',
     path    => ['/usr/bin', '/usr/sbin', '/bin',],
     require => File["/tmp/testfolder/jdk-8u20-linux-x64.tar.gz"],
    }
exec { 'tar -zxvf /tmp/testfolder/orientdb-community-2.1.16.tar.gz':
     cwd     => '/tmp/testfolder',
     path    => ['/usr/bin', '/usr/sbin', '/bin',],
     require => File["/tmp/testfolder/orientdb-community-2.1.16.tar.gz"],
    }

