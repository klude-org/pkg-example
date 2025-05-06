<?php

$browser_exe = $_REQUEST['--browser-exe'] ?? 'msedge';
if($root = \__shell::root_info()){
    $url = \str_replace('\\','/', $root->url.\substr(getcwd(),\strlen($root->dir)));
    \system("start {$browser_exe} {$url}");
}        
