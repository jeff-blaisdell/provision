default['mysql']['server_root_password'] = 'password1'
default['mysql']['port'] = '3308'
default['mysql']['data_dir'] = '/data'

mysql_service 'mysql' do
  version '5.5'
  action :create
end