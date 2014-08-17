redisio_install "redis-servers" do
  version '2.6.9'
  download_url 'http://redis.googlecode.com/files/redis-2.6.9.tar.gz'
  default_settings node['redisio']['default_settings']
  servers node['redisio']['servers']
  safe_install true
  base_piddir node['redisio']['base_piddir']
end