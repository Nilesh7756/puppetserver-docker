exec { "apt-get update" :

            command => "/usr/bin/apt-get update",
}

file { '/info.txt' :
        ensure => 'present',
        content => inline_template("Created by Puppet at <%= Time.now %>\n")
}

package { 'ntp' :
        ensure => 'installed',
}

package { 'apache2':
	ensure => present,
}

package { 'apache2-utils':
	ensure => present,
}

package { 'php5':
	ensure => present,
}

package { 'libapache2-mod-php5':
	ensure => present,
}

package { 'php5-mysql':
	ensure => present,
}

#Exec ['apt-get update'] -> File ['/info.txt']
