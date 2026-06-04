@setlocal
@echo off

:: configure the environment for running the Do-My-Work CLI tool on GNWT-Garrigue-X to GNWT-Garrigue-X-en translation

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "PROJECT_DIR=%%~fI"
for %%I in ("%PROJECT_DIR%\..") do set "PROJECTS_BASE_DIR=%%~fI"

cd /d "%PROJECT_DIR%" || goto :errorandexit

:: set the path to the Do-My-Work CLI executable, either from an environment variable or default to "do-my-work"
if "%DOMYWORK_EXE%"=="" (
        set DOMYWORK_EXE=do-my-work
) 
echo DOMYWORK_EXE is set to "%DOMYWORK_EXE%".

"%DOMYWORK_EXE%" --help >nul: 2>nul:
if %ERRORLEVEL% NEQ 0 (
    echo "%DOMYWORK_EXE%" is not available in the system PATH.
    echo Please ensure that the Do-My-Work CLI tool is installed and available in the PATH.
    goto :errorandexit
)
if "%CONFIG_FILE%"=="" (
    set CONFIG_FILE=%PROJECT_DIR%\tools\config\GNWT-Garrigue-X-en.yaml
)
if NOT exist "%CONFIG_FILE%" (
    echo Configuration file "%CONFIG_FILE%" not found.
    goto :errorandexit
)
echo CONFIG_FILE is set to "%CONFIG_FILE%".

if "%SOURCE_DIR%"=="" (
    set SOURCE_DIR=%PROJECT_DIR%
)
if NOT exist "%SOURCE_DIR%\." (
    echo Source directory "%SOURCE_DIR%" not found.
    goto :errorandexit
)
echo SOURCE_DIR is set to "%SOURCE_DIR%".

if "%TARGET_DIR%"=="" (
    set TARGET_DIR=%PROJECTS_BASE_DIR%\GNWT-Garrigue-X-en
)
if NOT exist "%TARGET_DIR%\." (
    echo Target directory "%TARGET_DIR%" not found.
    goto :errorandexit
)

echo TARGET_DIR is set to "%TARGET_DIR%".

if "%DATA_DIR%"=="" (
    set DATA_DIR=%TARGET_DIR%\work\data
)
if NOT exist "%DATA_DIR%\." (
    md "%DATA_DIR%" 
    if %ERRORLEVEL% NEQ 0 (
        echo Could not create data directory "%DATA_DIR%".
        goto :errorandexit
    )
)
echo DATA_DIR is set to "%DATA_DIR%".
echo.
:: now all seems OK, let's run the actual work

set DO_MY_WORK_OPTS=--config "%CONFIG_FILE%" --input-dir "%SOURCE_DIR%" --output-dir "%TARGET_DIR%" --data-dir "%DATA_DIR%"

echo Running reference-index-tree  with url check...
call :rundomywork  reference-index-tree --check-urls

echo Running copy-resource-tree...
call :rundomywork copy-resource-tree

echo Running translate-document-tree with review enabled...
call :rundomywork translate-document-tree --with-review

echo Running  spurious-file-report...
call :rundomywork  spurious-file-report

timeout /t 60
@endlocal
@goto :eof

:errorandexit
echo exiting with error
pause
exit /b 1


:rundomywork
timeout /t 15
echo "%DOMYWORK_EXE%"  %* %DO_MY_WORK_OPTS%
"%DOMYWORK_EXE%"  %* %DO_MY_WORK_OPTS%
if %ERRORLEVEL% GTR 1 (
    echo Do-My-Work CLI tool execution failed with exit code %ERRORLEVEL%.
    goto :errorandexit
)
if %ERRORLEVEL% GTR 0 (
    echo Do-My-Work CLI tool execution returns benign exit code %ERRORLEVEL%.
) else (
    echo Do-My-Work CLI tool execution returns success exit code 0.
)

echo.
goto :eof