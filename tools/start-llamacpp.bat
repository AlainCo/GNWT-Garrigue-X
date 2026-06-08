@setlocal
@echo off

:: set mandatory
:: LLAMA_ARG_MODEL
:: LLAMA_HOME where the binary is

:: set optionally
:: LLAMA_ARG_LOG_FILE
:: LLAMA_ARG_LOG_VERBOSITY
:: LLAMA_ARG_CACHE_PROMPT  (default enabled)
:: LLAMA_ARG_HOST (default localhost)
:: LLAMA_ARG_ENDPOINT_METRICS
:: LLAMA_ARG_THREADS with your number of core 
:: LLAMA_ARG_MODELS_DIR models dir for autoload
:: LLAMA_ARG_MODELS_PRESET preset configuration of models
:: LLAMA_ARG_MODELS_MAX number of models loaded (advised 1)
:: LLAMA_ARG_MODELS_AUTOLOAD if models are automatically loaded (advised 1)


:: set to change our default
:: LLAMA_ARG_PORT (we set 8000 by default)
:: LLAMA_ARG_CTX_SIZE (we set 4096 by default)
:: LLAMA_ARG_UBATCH (we set 64 by default)
:: LLAMA_ARG_BATCH (we set 128 by default)
:: LLAMA_ARG_MLOCK (we set 1 by default)
:: LLAMA_ARG_CACHE_RAM (we set 2048 by default)
:: LLAMA_MODEL_DIR (we set to %LLAMA_HOME%\model by default)



:: ============= base configurion
:: tcp port
if "%LLAMA_ARG_PORT%"=="" (
    echo LLAMA_ARG_PORT environment variable is not set. Set to 8000.
    set LLAMA_ARG_PORT=8000
)
echo Using llamacpp port: %LLAMA_ARG_PORT%
:: home dir
if "%LLAMA_HOME%"=="" (
    echo LLAMA_HOME environment variable is not set. Please set it to the path of your llama server installation.
    exit /b 1
)
echo Using llamacpp server from LLAMA_HOME: %LLAMA_HOME%



if NOT "%LLAMA_ARG_MODELS_DIR%" == "" goto onmodelsdir
if NOT "%LLAMA_ARG_MODELS_PRESET%" == "" goto onmodelspreset

:: model home
if "%LLAMA_MODEL_DIR%"=="" (
    echo LLAMA_MODEL_DIR environment variable is not set. set to %LLAMA_HOME%\model
    set LLAMA_MODEL_DIR=%LLAMA_HOME%\model
)
echo Changing Working Directory to model directory:  %LLAMA_MODEL_DIR%
cd /d "%LLAMA_MODEL_DIR%"
if errorlevel 1 (
    echo Cannot change current directory to %LLAMA_MODEL_DIR% 
    exit /b 1
)
:: model
if "%LLAMA_ARG_MODEL%"=="" (
    echo LLAMA_ARG_MODEL environment variable is not set. Please set it to the name of the llama model you want to use.
    exit /b 1
)
echo Using llamacpp model: %LLAMA_ARG_MODEL%
if not exist "%LLAMA_ARG_MODEL%" (
    echo model %LLAMA_ARG_MODEL% does not exist.
    exit /b 1
)
goto ondonemodel

:onmodelsdir
echo LLAMA_ARG_MODELS_DIR set to %LLAMA_ARG_MODELS_DIR% (directory where models can be loaded on demand)
goto onroutermode

:onmodelspreset
echo LLAMA_ARG_MODELS_PRESET set to %LLAMA_ARG_MODELS_PRESET% (configuration file of models)
goto onroutermode

:onroutermode
echo LLAMA_ARG_MODELS_MAX set to %LLAMA_ARG_MODELS_MAX% (max number of model loaded at a time)
echo LLAMA_ARG_MODELS_AUTOLOAD set to "%LLAMA_ARG_MODELS_AUTOLOAD%" (wether models are loaded automatically. default true)
:: model explicitly set in router mode
if NOT "%LLAMA_ARG_MODEL%" == "" (
    echo Using llamacpp model: %LLAMA_ARG_MODEL%
    if not exist "%LLAMA_ARG_MODEL%" (
        echo model %LLAMA_ARG_MODEL% does not exist.
        exit /b 1
    )
)
:ondonemodel


set TS=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%-%TIME:~0,2%%TIME:~3,2%
set TS=%TS: =0%
if NOT "%LLAMA_ARG_LOG_FILE_BY_DATE%" == "" (
	set LLAMA_ARG_LOG_FILE=%LLAMA_ARG_LOG_FILE_BY_DATE%.%TS%.log
)

:: ================== performance configuration
:: context
if "%LLAMA_ARG_CTX_SIZE%"=="" (
    echo LLAMA_ARG_CTX_SIZE environment variable is not set. Set to 4096.
    set LLAMA_ARG_CTX_SIZE=4096
)
echo Using llamacpp context size: %LLAMA_ARG_CTX_SIZE%

::batch size
if "%LLAMA_ARG_BATCH%"=="" (
    echo LLAMA_ARG_BATCH environment variable is not set. Set to 64.
    set LLAMA_ARG_BATCH=128
)
echo Using llamacpp ubatch size: %LLAMA_ARG_BATCH%

::ubatch size
if "%LLAMA_ARG_UBATCH%"=="" (
    echo LLAMA_ARG_UBATCH environment variable is not set. Set to 64.
    set LLAMA_ARG_UBATCH=64
)
echo Using llamacpp ubatch size: %LLAMA_ARG_UBATCH%

::ubatch size
if "%LLAMA_ARG_MLOCK%"=="" (
    echo LLAMA_ARG_MLOCK environment variable is not set. Set to 1.
    set LLAMA_ARG_MLOCK=1
)
echo Using llamacpp ubatch size: %LLAMA_ARG_UBATCH%

::ram cache size
if "%LLAMA_ARG_CACHE_RAM%"=="" (
    echo LLAMA_ARG_CACHE_RAM environment variable is not set. Set to 1.
    set LLAMA_ARG_CACHE_RAM=1
)
echo Using llamacpp ram cache size: %LLAMA_ARG_CACHE_RAM%


:: ==== run openai REST service
set LLAMA_
@echo on
"%LLAMA_HOME%\llama-server.exe" 
@echo off
echo.
pause
@endlocal

