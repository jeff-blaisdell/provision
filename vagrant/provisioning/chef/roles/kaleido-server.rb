name "kaleido-server"
description "Kaleido server installation."
run_list(
  "recipe[kaleido::java]", "recipe[kaleido::mysql]", "recipe[kaleido::database]", "recipe[kaleido::artifactory]"
)