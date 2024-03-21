@echo off

:: Set the name of your virtual environment folder
set VENV_DIR=%~dp0\voice-changer\venv\
set SERV_DIR=%~dp0\voice-changer\server\
set REPO_DIR=%~dp0\voice-changer\
set REPO_URL=https://github.com/w-okada/voice-changer

:download
cd %REPO_DIR%
if exist %REPO_DIR% (
    echo "'%REPO_DIR%' already exists. Updating..."
    git pull
    if %ERRORLEVEL% NEQ 0 (
        pause
    )
) else (
    echo "Directory '%REPO_DIR%' does not exist. Cloning repository..."
	git clone %REPO_URL% voice-changer
    if %ERRORLEVEL% NEQ 0 (
        pause
    ) 
)

:venv
if exist %VENV_DIR% (
    echo "Virtual environment '%VENV_DIR%' already exists. Activating..."
    call %VENV_DIR%\Scripts\activate.bat
) else (
    echo "Virtual environment '%VENV_DIR%' not found. Creating..."
    python -m venv %VENV_DIR%
    if %ERRORLEVEL% NEQ 0 (
        echo "Error creating virtual environment. Please check your Python installation."
        pause
        exit /B 1
    )
    echo "Virtual environment created successfully. Activating..."
    call %VENV_DIR%\Scripts\activate.bat
)

set /P "Q=Is this your first time running? (y/n): "
if /I "%Q%" == "y" goto requirements
if /I "%Q%" == "Y" goto requirements

REM If %Q% is not "y" or "Y", go to start
goto start

:requirements
call %VENV_DIR%\Scripts\activate.bat
cd %SERV_DIR%
python -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
python -m pip install fairseq==0.12.2 pyworld==0.3.4
python -m pip install uvicorn==0.21.1 pyOpenSSL==23.1.1 numpy==1.23.5 resampy==0.4.2 python-socketio==5.8.0 fastapi==0.95.1 python-multipart==0.0.6 onnxruntime-gpu==1.13.1 scipy==1.10.1 matplotlib==3.7.1 websockets==11.0.2 faiss-cpu==1.7.3 torchcrepe==0.0.18 librosa==0.9.1 gin==0.1.6 gin_config==0.5.0 einops==0.6.0 local_attention==1.8.5 websockets==11.0.2 sounddevice==0.4.6 dataclasses_json==0.5.7 onnxsim==0.4.28 torchfcpe==0.0.3

:start
call %VENV_DIR%\Scripts\activate.bat
cd %SERV_DIR%
python MMVCServerSIO.py -p 18888 --https true ^
    --content_vec_500 pretrain/checkpoint_best_legacy_500.pt  ^
    --content_vec_500_onnx pretrain/content_vec_500.onnx ^
    --content_vec_500_onnx_on true ^
    --hubert_base pretrain/hubert_base.pt ^
    --hubert_base_jp pretrain/rinna_hubert_base_jp.pt ^
    --hubert_soft pretrain/hubert/hubert-soft-0d54a1f4.pt ^
    --nsf_hifigan pretrain/nsf_hifigan/model ^
    --crepe_onnx_full pretrain/crepe_onnx_full.onnx ^
    --crepe_onnx_tiny pretrain/crepe_onnx_tiny.onnx ^
    --rmvpe pretrain/rmvpe.pt ^
    --model_dir model_dir ^
    --samples samples.json
