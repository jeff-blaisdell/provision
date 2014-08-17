name "redis-server"
description "Redis server installation."
default_attributes({
  'redisio' => {
    'servers' => [
      {
      	'name' => 'master',
      	'port' => '6379'
      },
    ]
  }
})
run_list(
  "recipe[redis::default]"
)