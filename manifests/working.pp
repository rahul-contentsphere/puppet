file { '/tmp/cs/':
    ensure => 'directory',
    owner  => 'cs',
    group  => 'cs',
    mode   => '744',
    recurse => true,
  } ->

  
  
exec{'get_java':
  command => "/usr/bin/wget -q --no-cookies --no-check-certificate --header 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie' 'http://download.oracle.com/otn-pub/java/jdk/8u20-b26/jdk-8u20-linux-x64.tar.gz'",
   cwd     => '/tmp/cs',
} ->

exec { 'tar -zxvf /tmp/cs/jdk-8u20-linux-x64.tar.gz':
  cwd     => '/tmp/cs',
  path    => ['/usr/bin', '/usr/sbin', '/bin',],
  require => Exec["get_java"],
} ->

exec{'update-alts':
  command => "update-alternatives --install /usr/bin/java java /tmp/cs/jdk1.8.0_20/bin/java 2",
  path    => ['/usr/bin', '/usr/sbin', '/bin',],
  require => Exec["tar -zxvf /tmp/cs/jdk-8u20-linux-x64.tar.gz"],
} ->

  
  
exec{'get_elastic':
  command => "/usr/bin/wget -q https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.1/elasticsearch-2.1.1.tar.gz -O /tmp/cs/elastic.tar.gz",
} ->

exec { 'tar -zxvf /tmp/cs/elastic.tar.gz':
  cwd     => '/tmp/cs',
  path    => ['/usr/bin', '/usr/sbin', '/bin',],
  require => Exec["get_elastic"],
} ->

exec{'elastic':
  command => "/tmp/cs/elasticsearch-2.1.1/bin/elasticsearch -Des.insecure.allow.root=true -d",
  require => Exec["tar -zxvf /tmp/cs/elastic.tar.gz"],
} ->


exec{'get_orientdb':
  command => "/usr/bin/wget -q https://orientdb.com/download.php?file=orientdb-community-2.1.16.tar.gz -O /tmp/cs/orientdb.tar.gz",
   cwd     => '/tmp/cs',
} ->

exec { 'tar -zxvf /tmp/cs/orientdb.tar.gz':
  cwd     => '/tmp/cs',
  path    => ['/usr/bin', '/usr/sbin', '/bin',],
  require => Exec["get_orientdb"],
} ->


exec{'orientdb':
  command => "/opt/cs/orientdb-community-2.1.16/bin/orientdb.sh start",
  require => Exec["tar -zxvf /tmp/cs/orientdb.tar.gz"],
} ->




exec{'get_tomcat':
  command => "/usr/bin/wget -q http://archive.apache.org/dist/tomcat/tomcat-9/v9.0.0.M17/bin/apache-tomcat-9.0.0.M17.tar.gz -O /tmp/cs/tomcat.tar.gz",
} ->

exec { 'tar -zxvf /tmp/cs/tomcat.tar.gz':
  cwd     => '/tmp/cs',
  path    => ['/usr/bin', '/usr/sbin', '/bin',],
  require => Exec["get_tomcat"],

} ->

exec{'tomcat':
  command => "/tmp/cs/apache-tomcat-9.0.0.M17/bin/startup.sh",
 require => Exec["tar -zxvf /tmp/cs/tomcat.tar.gz"],
}

