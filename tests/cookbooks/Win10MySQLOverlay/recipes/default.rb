
# Installing MySQL via msi
windows_package "MySQL Server"  do
	installer_type :msi
	source node['mysql']['windows']['url']
	# options %W[
  #   INSTALLDIR="#{node['mysql']['windows']['dir']}"
  # ].join(' ')
end

# Make sure the mysql executable is in the PATH
windows_path "#{node['mysql']['windows']['dir']}\\bin\\" do
  action :add
end

# Execute the configuration script, install the service, start the service
powershell_script "Configure MySQL" do
  code <<-EOH
    MySQLInstanceConfig.exe -i -q "-l#{node['mysql']['windows']['dir']}\\mysql_install_log.txt" "-nMySQL Server 5.1" "-p#{node['mysql']['windows']['dir']}" -v5.1.73 "-t#{node['mysql']['windows']['dir']}\\my-template.ini" "-c#{node['mysql']['windows']['dir']}\\my.ini" ServerType=#{node['mysql']['windows']['ServerType']} DatabaseType=#{node['mysql']['windows']['DatabaseType']} ConnectionUsage=#{node['mysql']['windows']['ConnectionUsage']} Port=#{node['mysql']['port']} ServiceName=MySQL RootPassword=#{node['mysql']['server_root_password']} AddBinToPath=yes SkipNetworking=no StrictMode=yes
    mysqld.exe --initialize --defaults-file=#{node['mysql']['windows']['dir']}\\my.ini
    mysqld.exe --install MySQL
    net start MySQL
    break
    exit
  EOH
end


