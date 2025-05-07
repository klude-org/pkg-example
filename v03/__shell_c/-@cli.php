<?php


if(!\is_file($f = \_\SITE_DIR.'/.local/.shell.bat')){
    $site_dir = \_\SITE_DIR;
    $root_dir = \__shell::root_info()->dir;
    $shell_script = \str_replace('\\','/', __DIR__.'/.shell.bat');
    $shell_dir = __DIR__;
    $session_uniqid=\uniqid();
    $start_file=\_\START_FILE;
    \is_dir($d = \dirname($f)) OR \mkdir($d, 0777, true);
    \file_put_contents($f, <<<BAT
    @echo off
    if not defined FX__ORIGINAL_PATH (
        SET "FX__ORIGINAL_PATH=%Path%"
        SET "FX__SITE_DIR={$site_dir}"
        SET "FX__SESSION={$session_uniqid}"
        SET "FX__START_FILE={$start_file}"
        SET "FX__DOCUMENT_ROOT={$root_dir}"
        SET "FX__PHP_EXEC_STD_PATH=C:/xampp/current/php/php.exe"
        SET "FX__PHP_EXEC_XDBG_PATH=C:/xampp/current/php__xdbg/php.exe"
        SET "FX__ENV_FILE=%~dp0___set_cli_env_vars__.bat"
        SET "FX__CONFIG_LOADED=1"
    )
    SET PATH={$shell_dir};%FX__ORIGINAL_PATH%
    if not defined FW__DEBUG SET "FW__DEBUG=0"
    echo [92mEPX WIN SHELL 250306-03[0m
    cmd /k
    exit /b 0
    BAT);
}