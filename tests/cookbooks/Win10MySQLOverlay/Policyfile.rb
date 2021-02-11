# Policyfile.rb - Describe how you want Chef Infra Client to build your system.

name 'Win10MySQLOverlay'

default_source :supermarket

run_list 'Win10MySQLOverlay::default'

cookbook 'Win10MySQLOverlay', path: '.'

