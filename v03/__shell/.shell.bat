::<?php echo "\r   \r"; if(0): ?>
:: Installed: #__FW_INSTALLED__#
:: #####################################################################################################################
:: #region LICENSE
::     /* 
::                                                EPX-WIN-SHELL
::     PROVIDER : KLUDE PTY LTD
::     PACKAGE  : EPX-PAX
::     AUTHOR   : BRIAN PINTO
::     RELEASED : 2025-03-10
::     
::     The MIT License
::     
::     Copyright (c) 2017-2025 Klude Pty Ltd. https://klude.com.au
::     
::     of this software and associated documentation files (the "Software"), to deal
::     in the Software without restriction, including without limitation the rights
::     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
::     copies of the Software, and to permit persons to whom the Software is
::     furnished to do so, subject to the following conditions:
::     
::     The above copyright notice and this permission notice shall be included in
::     all copies or substantial portions of the Software.
::     
::     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
::     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
::     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
::     AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
::     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
::     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
::     THE SOFTWARE.
::         
::     */
:: #endregion
:: # ###################################################################################################################
:: # i'd like to be a tree - pilu (._.) // please keep this line in all versions - BP
:: FW__ - variable
:: FX__ - constant
:: FY__ - env
@echo off
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: INCP DIR
if not defined FW__INCP_DIR SET FW__INCP_DIR=%CD%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PATH
if not defined FY__ORIGINAL_PATH SET "FY__ORIGINAL_PATH=%Path%"
SET PATH=%~dp0cli;%FY__ORIGINAL_PATH%

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PHP
if "%FX__DEBUG%" NEQ "" (
    SET FW__PHP_EXEC_PATH=%FX__PHP_EXEC_XDBG_PATH%
) else (
    SET FW__PHP_EXEC_PATH=%FX__PHP_EXEC_STD_PATH%
)

if NOT exist %FW__PHP_EXEC_PATH% (
    SET FW__PHP_EXEC_PATH=php.exe
)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: PHP ENV
if defined FW__ENV_FILE (
    SET "FW__ENV_FILE=%FX__ENV_FILE%"
)

SET CMD_FILE_A=%~dp0__\%1\-@cli%FY__PANEL%.bat
SET CMD_FILE_B=%~dp0__\%1-@cli%FY__PANEL%.bat

if exist "%CMD_FILE_A%" (
    call %CMD_FILE_B% %*
    goto :L__DONE
) else if exist "%CMD_FILE_B%" (
    call %CMD_FILE_B% %*
    goto :L__DONE
)

if exist "%FW__INCP_DIR%\index.php" (
    %FW__PHP_EXEC_PATH% "%FW__INCP_DIR%\index.php" %*
) else (
    %FW__PHP_EXEC_PATH% "%~f0" %*
)

:L__DONE
if %ERRORLEVEL%==2 (
    %FW__PHP_EXEC_PATH% "%~f0" %*
) else if exist "%FW__ENV_FILE%" (
    call "%FW__ENV_FILE%"
    del "%FW__ENV_FILE%"
)
  
exit /b 0

<?php endif; 

include \_\START_FILE;

