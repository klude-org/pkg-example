<?php

class __shell {
    
    public static function root_info(){
        static $I; return $I ?? $I = (function(){
            for (
                $i=0, $dx=\getcwd(); 
                $dx && $i < 20 ; 
                $i++, $dx = (\strchr($dx, DIRECTORY_SEPARATOR) != DIRECTORY_SEPARATOR) ? \dirname($dx) : null
            ){ 
                if(\is_file($f = "{$dx}/http-root-info.json")){
                    if($root = \json_decode(\file_get_contents($f))){
                        return $root;
                    }
                }
            }
        })();
    }
}