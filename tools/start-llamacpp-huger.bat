@setlocal
@echo off
set SCRIPTDIR=%~dp0.
set LLAMA_ARG_MODEL=Mistral-Small-3.2-24B-Instruct-2506-UD-Q5_K_XL.gguf
%SCRIPTDIR%\start-llamacpp.bat
@endlocal
