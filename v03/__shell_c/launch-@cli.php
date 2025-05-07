<?php

if(!\is_file(\_\SITE_DIR.'/index.php')){
    throw new \Exception("Warning! index.php doesn't exist on site");
}

if($root = \__shell::root_info()){
    $browser_exe = $_REQUEST['--browser-exe'] ?? 'msedge';
    $url = \str_replace('\\','/', $root->url.\substr(\_\SITE_DIR,\strlen($root->dir)));
    \system("start {$browser_exe} {$url}");
}
