# Version of MySQL
default['mysql']['version'] = '5.1.73'

# Location of MySQL installation
default['mysql']['windows']['dir'] = "C:\\Program Files\\MySQL\\MySQL Server 5.1"

# URL for MSI file to install MySQL 5.7.33
# default['mysql']['windows']['url'] = "https://dev.mysql.com/downloads/file/?id=500616"
default['mysql']['windows']['url'] = "https://downloads.mysql.com/archives/get/p/23/file/mysql-essential-5.1.73-winx64.msi"

# Server Root Password
default['mysql']['server_root_password'] = 'vagrant'

# MySQL Port
default['mysql']['port'] = '3306'

# MySQL Instance Configuration
default['mysql']['windows']['ServerType'] = 'DEVELOPMENT' # accepted values {DEVELOPMENT | SERVER | DEDICATED}
default['mysql']['windows']['DatabaseType'] = 'MYISAM' # accepted values {MIXED | INNODB | MYISAM}
default['mysql']['windows']['ConnectionUsage'] = 'DSS' # accepted values {DSS | OLTP}


# default['mysql']['windows']['AddBinToPath'] = 'yes' # accepted values {yes | no}
# default['mysql']['windows']['SkipNetworking'] = 'no' # accepted values {yes | no}. Specifying yes disables network access altogether
# default['mysql']['windows']['StrictMode'] = 'yes' # accepted values {yes | no}
