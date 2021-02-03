# Policyfile.rb - Describe how you want Chef Infra Client to build your system.

name 'windows-10-mysql'

default_source :supermarket

run_list 'windows-10-mysql::default'

cookbook 'windows-10-mysql', path: '.'

