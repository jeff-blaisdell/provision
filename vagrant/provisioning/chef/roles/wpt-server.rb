name "wpt-server"
description "Creates a Web Page Test server."
run_list(
    "recipe[apt]",
    "recipe[apache2]",
    "recipe[php]",
    "recipe[wpt::php]",
    "recipe[wpt]",
    "recipe[apache2::mod_expires]",
    "recipe[apache2::mod_headers]",
    "recipe[apache2::mod_rewrite]",
    "recipe[apache2::mod_php5]"
)
