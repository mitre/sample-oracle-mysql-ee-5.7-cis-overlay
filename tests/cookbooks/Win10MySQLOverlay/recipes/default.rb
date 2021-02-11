
# Download and extract MySQL 
remote_file "#{Chef::Config['file_cache_path']}\\MySQL.zip" do
  source node['mysql']['windows']['url']
  action :create_if_missing
end
archive_file "Extract MySQL directory" do
  path "#{Chef::Config['file_cache_path']}\\MySQL.zip"
  destination "#{Chef::Config['file_cache_path']}\\MySQL"
  action :extract
end
powershell_script "Move directory" do
  code <<-EOH
    mkdir #{node['mysql']['windows']['dir']}; mv #{Chef::Config['file_cache_path']}\\MySQL\\mysql-5.1.73-winx64\\* #{node['mysql']['windows']['dir']}
  EOH
end


# Template the my.ini configuration file
template "#{node['mysql']['windows']['dir']}\\my.ini" do
  source 'my.ini.erb'
  variables(
    'mysql_path': node['mysql']['windows']['dir'],
    'mysql_port': node['mysql']['port']
  )
end

# Make sure the MySQL executables are in the PATH
windows_path "#{node['mysql']['windows']['dir']}\\bin\\" do
  action :add
end

# Install MySQL as a service
powershell_script "Configure MySQL" do
  code <<-EOH
    mysqld.exe --install MySQL --defaults-file="#{node['mysql']['windows']['dir']}\\my.ini"
 EOH
end

# Allow MySQL through the firewall
windows_firewall_rule 'MySQL' do
  description 'MySQL traffic inbound and outbound'
  displayname 'MySQL'
  enabled true
  local_port '3306'
  firewall_action :allow
  service 'MySQL'
end

# Start MySQL service
windows_service 'MySQL' do
  service_name 'MySQL' 
  action :start
end

# Update MySQL root password
powershell_script "Update MySQL password" do
  code <<-EOH
    #{node['mysql']['windows']['dir']}\\bin\\mysqladmin.exe -u root password "#{node['mysql']['server_root_password']}"
  EOH
end


