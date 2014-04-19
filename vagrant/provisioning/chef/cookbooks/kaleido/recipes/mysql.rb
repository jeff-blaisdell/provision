node.set['mysql']['server_root_password'] = 'password1'
node.set['mysql']['port'] = '3308'
node.set['mysql']['data_dir'] = '/data'

mysql_service 'mysql' do
  version '5.5'
  action :create
end