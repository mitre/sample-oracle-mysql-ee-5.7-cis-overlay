
include_controls 'oracle-mysql-ee-5.7-cis-baseline' do
    control '1.1' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    
    control '1.2' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '1.3' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems' 
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '1.4' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '1.5' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '2.1' do
        only_if { os.linux? or os.windows? }
    end
    control '2.2' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '2.3' do
        query = 'SELECT User FROM mysql.user;'

        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
      
        mysql_account_list = sql_session.query(query).stdout.strip.split("\r\n")
        if !mysql_account_list.empty?
          mysql_account_list.each do |user|
            describe "Mysql database user: #{user}" do
              subject { user }
              it { should be_in attribute('mysql_users') }
            end
          end
        else
          impact 0.0
          describe 'There are no mysql database users, therefore this control is not applicable' do
            skip 'There are no mysql database users, therefore this control is not applicable'
          end
        end
        only_if { os.linux? or os.windows? }
    end
    control '2.4' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        only_if { os.linux? or os.windows? }
    end
    control '3.1' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '3.2' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '3.3' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '3.4' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '3.5' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '3.6' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '3.7' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '3.8' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '3.9' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
    end
    control '4.1' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        only_if { os.linux? or os.windows? }
    end
    control '4.3' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
        only_if { os.linux? }
    end
    control '4.5' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
        only_if { os.linux? }
        describe mysql_conf(attribute('mysql_config_file')) do
            its('skip-grant-tables') { should cmp 'FALSE' }
        end
    end
    control '4.6' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
        only_if { os.linux? }
    end
    control '4.8' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '4.9' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '5.1' do
        mysql_user_query = %{SELECT user
            FROM mysql.user
            WHERE (Select_priv = 'Y')
            OR (Insert_priv = 'Y') OR (Update_priv = 'Y') OR (Delete_priv = 'Y') OR (Create_priv = 'Y') OR (Drop_priv = 'Y');
            }
        mysql_user_db_query = %{SELECT user, host FROM mysql.db WHERE db = 'mysql'
            AND ((Select_priv = 'Y') OR (Insert_priv = 'Y') OR (Update_priv = 'Y') OR (Delete_priv = 'Y') OR (Create_priv = 'Y')
            OR (Drop_priv = 'Y'));
            }
        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
        mysql_user_privs = sql_session.query(mysql_user_query).stdout.strip.split("\r\n")
        mysql_user_db_privs = sql_session.query(mysql_user_db_query).stdout.strip.split("\r\n")
        
        if !mysql_user_privs.empty?
            mysql_user_privs.each do |user|
                describe "The mysql user: #{user} with privilege access in the mysql.user table" do
                    subject { user }
                    it { should be_in attribute('mysql_administrative_users') }
                end
            end
        end
        if !mysql_user_db_privs.empty?
            mysql_user_db_privs.each do |user|
                describe "The mysql user: #{user} with privilege access in the mysql.db table" do
                    subject { user }
                    it { should be_in attribute('mysql_administrative_users') }
                end
            end
        end
        
        if mysql_user_privs.empty? && mysql_user_db_privs.empty?
            impact 0.0
            describe 'There are no mysql users configured with full database access, therefore this control is not applicable' do
                skip 'There are no mysql users configured with full database access, therefore this control is not applicable'
            end
        end
    end
    control '5.2' do
        query = %{select user from mysql.user where File_priv = 'Y';}

        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
        mysql_user_file_priv = sql_session.query(query).stdout.strip.split("\r\n")

        if !mysql_user_file_priv.empty?
            mysql_user_file_priv.each do |user|
                describe "The mysql user: #{user} with file_priv" do
                    subject { user }
                    it { should be_in attribute('mysql_administrative_users') }
                end
            end
        end

        if mysql_user_file_priv.empty?
            impact 0.0
            describe 'There are no mysql users with file_priv allowed, therefore this control is not applicable' do
                skip 'There are no mysql users with file_priv allowed, therefore this control is not applicable'
            end
        end
    end
    control '5.3' do
        query = %{select user from mysql.user where Process_priv = 'Y';}

        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
        mysql_user_process_priv = sql_session.query(query).stdout.strip.split("\r\n")

        if !mysql_user_process_priv.empty?
            mysql_user_process_priv.each do |user|
                describe "The mysql user: #{user} with process_priv" do
                    subject { user }
                    it { should be_in attribute('mysql_administrative_users') }
                end
            end
        end
        if mysql_user_process_priv.empty?
            impact 0.0
            describe 'There are no mysql users with process_priv allowed, therefore this control is not applicable' do
                skip 'There are no mysql users with process_priv allowed, therefore this control is not applicable'
            end
        end
    end
    control '5.4' do
        query = %{select user from mysql.user where Super_priv = 'Y';}

        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
        mysql_user_super_priv = sql_session.query(query).stdout.strip.split("\r\n")
    
        if !mysql_user_super_priv.empty?
            mysql_user_super_priv.each do |user|
                describe "The mysql user: #{user} with super_priv" do
                    subject { user }
                    it { should be_in attribute('mysql_administrative_users') }
                end
            end
        end
        if mysql_user_super_priv.empty?
            impact 0.0
            describe 'There are no mysql users with super_priv allowed, therefore this control is not applicable' do
                skip 'There are no mysql users with super_priv allowed, therefore this control is not applicable'
            end
        end

    end
    control '5.5' do
        query = %{select user from mysql.user where Shutdown_priv = 'Y';}

        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
        mysql_user_shutdown_priv = sql_session.query(query).stdout.strip.split("\r\n")
      
        if !mysql_user_shutdown_priv.empty?
          mysql_user_shutdown_priv.each do |user|
            describe "The mysql user: #{user} with shutdown_priv" do
              subject { user }
              it { should be_in attribute('mysql_administrative_users') }
            end
          end
        end
        if mysql_user_shutdown_priv.empty?
          impact 0.0
          describe 'There are no mysql users with shutdown_priv allowed, therefore this control is not applicable' do
            skip 'There are no mysql users with shutdown_priv allowed, therefore this control is not applicable'
          end
        end
    end
    control '5.6' do
        query = %{select user from mysql.user where Create_user_priv = 'Y';}

        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
        mysql_user_create_user_priv = sql_session.query(query).stdout.strip.split("\r\n")
    
        if !mysql_user_create_user_priv.empty?
            mysql_user_create_user_priv.each do |user|
                describe "The mysql user: #{user} with create_user_priv" do
                    subject { user }
                    it { should be_in attribute('mysql_administrative_users') }
                end
            end
        end
        if mysql_user_create_user_priv.empty?
                impact 0.0
            describe 'There are no mysql users with create_user_priv allowed, therefore this control is not applicable' do
                skip 'There are no mysql users with create_user_priv allowed, therefore this control is not applicable'
            end
        end
    end
    control '5.7' do
        mysql_user_query = %{SELECT user FROM mysql.user WHERE Grant_priv = 'Y';}
        mysql_user_db_query = %{SELECT user FROM mysql.db WHERE Grant_priv = 'Y';}
        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
        mysql_user_privs = sql_session.query(mysql_user_query).stdout.strip.split("\r\n")
        mysql_user_db_privs = sql_session.query(mysql_user_db_query).stdout.strip.split("\r\n")
    
        if !mysql_user_privs.empty?
            mysql_user_privs.each do |user|
                describe "The mysql user: #{user} with grant_priv access in the mysql.user table" do
                    subject { user }
                    it { should be_in attribute('mysql_administrative_users') }
                end
            end
        end
        if !mysql_user_db_privs.empty?
            mysql_user_db_privs.each do |user|
                describe "The mysql user: #{user} with grant_priv access in the mysql.db table" do
                    subject { user }
                    it { should be_in attribute('mysql_administrative_users') }
                end
            end
        end
    
        if mysql_user_privs.empty? && mysql_user_db_privs.empty?
            impact 0.0
            describe 'There are no mysql users configured with grant_priv access, therefore this control is not applicable' do
                skip 'There are no mysql users configured with grant_priv access, therefore this control is not applicable'
            end
        end


    end
    control '5.8' do
        query = %{select user from mysql.user where Repl_slave_priv = 'Y';}
        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
        mysql_user_repl_slave_priv = sql_session.query(query).stdout.strip.split("\r\n")
    
        if !mysql_user_repl_slave_priv.empty?
            mysql_user_repl_slave_priv.each do |user|
                describe "The mysql user: #{user} with repl_slave_priv" do
                    subject { user }
                    it { should be_in attribute('mysql_administrative_users') }
                end
            end
        end
        if mysql_user_repl_slave_priv.empty?
            impact 0.0
            describe 'There are no mysql users with repl_slave_priv allowed, therefore this control is not applicable' do
                skip 'There are no mysql users with repl_slave_priv allowed, therefore this control is not applicable'
            end
        end
    end
    control '5.9' do
        query = %{SELECT User
            FROM mysql.db
            WHERE Select_priv='Y'
                OR Insert_priv='Y'
                OR Update_priv='Y'
                OR Delete_priv='Y'
                OR Create_priv='Y'
                OR Drop_priv='Y'
                OR Alter_priv='Y';}
        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
        mysql_user_privs = sql_session.query(query).stdout.strip.split("\r\n")
    
        if !mysql_user_privs.empty?
            mysql_user_privs.each do |user|
                describe "The mysql user: #{user} with privileges to modify or create data structures" do
                    subject { user }
                    it { should be_in attribute('mysql_users_allowed_modify_or_create') }
                end
            end
        end
        if mysql_user_privs.empty?
            impact 0.0
            describe 'There are no mysql users allowed to modify or create data structures, therefore this control is not applicable' do
                skip 'There are no mysql users allowed to modify or create data structures, therefore this control is not applicable'
            end
        end

    end
    control '6.1' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '6.2' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
        only_if { os.linux? }
    end
    control '6.4' do
        impact 0.0
        desc 'caveat', 'This control is not applicable on mysql on Microsoft systems'
        describe 'This control is not applicable on mysql on Microsoft systems' do
            skip 'This control is not applicable on mysql on Microsoft systems'
        end
        only_if { os.linux? }
    end
    
    control '6.2' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '6.3' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '6.4' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        describe mysql_conf(attribute('mysql_config_file')) do
            its('log-raw') { should cmp 'OFF' }
        end
    end
    control '6.5' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '6.6' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '6.7' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '6.8' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '6.9' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '6.10' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '6.11' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '6.12' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
        only_if { os.linux? or os.windows? }
        query = %{SELECT LOAD_OPTION FROM information_schema.plugins WHERE PLUGIN_NAME='audit_log';}
        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
        audit_log_plugin = sql_session.query(query).stdout.strip
        describe 'The MySQL audit plugin' do
            subject { audit_log_plugin }
            it { should cmp 'FORCE_PLUS_PERMANENT' }
        end
    
        describe mysql_conf(attribute('mysql_config_file')) do
            its('mysqld.audit_log') { should cmp 'FORCE_PLUS_PERMANENT' }
        end
    end
    control '7.1' do
        only_if { os.linux? or os.windows? }
    end
    control '7.2' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '7.3' do
        describe mysql_conf(attribute('mysql_config_file')) do
            its('client.password') { should be_nil }
        end
    end
    control '7.4' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '7.6' do
        only_if { os.linux? or os.windows? }
        validate_password_length_query = %{SELECT @@validate_password_length}
        validate_password_mixed_case_count_query = %{SELECT @@validate_password_mixed_case_count}
        validate_password_number_count_query = %{SELECT @@validate_password_number_count}
        validate_password_special_char_count_query = %{SELECT @@validate_password_special_char_count}
        validate_password_policy_query = %{SELECT @@validate_password_policy}
        validate_password_check_user_name_query = %{SELECT @@validate_password_check_user_name}
        users_wih_username_equal_to_password_query = %{SELECT User,authentication_string,Host FROM mysql.user
            WHERE authentication_string=CONCAT('*', UPPER(SHA1(UNHEX(SHA1(user)))));}

        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))

        validate_password_length = sql_session.query(validate_password_length_query).stdout.strip
        validate_password_mixed_case_count = sql_session.query(validate_password_mixed_case_count_query).stdout.strip
        validate_password_number_count = sql_session.query(validate_password_number_count_query).stdout.strip
        validate_password_special_char_count = sql_session.query(validate_password_special_char_count_query).stdout.strip
        validate_password_policy = sql_session.query(validate_password_policy_query).stdout.strip
        validate_password_check_user_name = sql_session.query(validate_password_check_user_name_query).stdout.strip
        users_wih_username_equal_to_password = sql_session.query(users_wih_username_equal_to_password_query).stdout.strip

        describe 'The MySQL validate_password_length variable' do
            subject { validate_password_length }
            it { should cmp >= 14 }
        end

        describe 'The MySQL validate_password_mixed_case_count variable' do
            subject { validate_password_mixed_case_count }
            it { should cmp >= 1 }
        end

        describe 'The MySQL validate_password_number_count variable' do
            subject { validate_password_number_count }
            it { should cmp >= 1 }
        end

        describe 'The MySQL validate_password_special_char_count variable' do
            subject { validate_password_special_char_count }
            it { should cmp >= 1 }
        end

        describe.one do
            describe 'The MySQL validate_password_policy variable' do
            subject { validate_password_policy }
            it { should cmp 'MEDIUM' }
            end
            describe 'The MySQL validate_password_policy variable' do
            subject { validate_password_policy }
            it { should cmp 'STRONG' }
            end
        end

        describe mysql_conf(attribute('mysql_config_file')) do
            its('plugin-load') { should cmp 'validate_password.so' }
            its('validate-password') { should cmp 'FORCE_PLUS_PERMANENT' }
        end

        describe.one do
            describe 'The MySQL validate_password_check_user_name variable' do
            subject { validate_password_check_user_name }
            it { should cmp 1 }
            end
            describe 'The MySQL users with their password identical to their username' do
            subject { users_wih_username_equal_to_password }
            it { should be_empty }
            end
        end
    end
    control '7.7' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '7.8' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '8.2' do
        query = %{SELECT user FROM mysql.user WHERE HOST NOT IN ('::1', '127.0.0.1', 'localhost');}
        sql_session = mysql_session(attribute('user'), attribute('password'), attribute('host'), attribute('port'))
    
        remote_users = sql_session.query(query).stdout.strip.split("\r\n")
    
        remote_users.each do |user|
    
            query_ssl_type = "SELECT ssl_type FROM mysql.user
            WHERE HOST NOT IN ('::1', '127.0.0.1', 'localhost') AND user = '#{user}';"
            ssl_type = sql_session.query(query_ssl_type).stdout.strip
    
            describe.one do
                describe "The ssl_type for remote user: #{user}" do
                    subject { ssl_type }
                    it { should cmp 'ANY' }
                end
                describe "The ssl_type for remote user: #{user}" do
                    subject { ssl_type }
                    it { should cmp 'X509' }
                end
                describe "The ssl_type for remote user: #{user}" do
                    subject { ssl_type }
                    it { should cmp 'SPECIFIED' }
                end
            end
        end
        if remote_users.empty?
            impact 0.0
            describe 'There are no mysql remote users, therefore this control is not applicable' do
                skip 'There are no mysql remote users, therefore this control is not applicable'
            end
        end

    end
    control '9.3' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '9.4' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
    control '9.5' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable since the related security control is not included in ***SPONSOR*** policy'
    end
end
