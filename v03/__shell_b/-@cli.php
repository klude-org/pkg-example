<?php


if(!\is_file($f = \_\INCP_DIR.'/.local/.shell.bat')){
    $root_dir = \__shell::root_info()->dir;
    $shell_script = \str_replace('\\','/', __DIR__.'/.shell.bat');
    $cli_dir = __DIR__.'\\cli';
    $session_uniqid=\uniqid();
    \is_dir($d = \dirname($f)) OR \mkdir($d, 0777, true);
    \file_put_contents($f,<<<BAT
    @echo off
    SET "FX__SESSION={$session_uniqid}"
    SET "FX__DOCUMENT_ROOT={$root_dir}"
    SET "FX__PHP_EXEC_STD_PATH=C:/xampp/current/php/php.exe"
    SET "FX__PHP_EXEC_XDBG_PATH=C:/xampp/current/php__xdbg/php.exe"
    SET "FX__ENV_FILE=___set_cli_env_vars__.bat"
    SET "FX__DEBUG=0"
    SET "FX__CONFIG_LOADED=1"
    if not defined FY__ORIGINAL_PATH SET "FY__ORIGINAL_PATH=%Path%"
    SET PATH={$cli_dir};%FY__ORIGINAL_PATH%
    echo [92mEPX WIN SHELL 250306-03[0m
    cmd /k
    exit /b 0
    BAT);
}