install -> https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe

install -> https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe

install -> https://aka.ms/vs/17/release/vs_BuildTools.exe with the optional boxes named "MSVC VS 2022" and "Windows 11 SDK"

optional install -> https://developer.nvidia.com/cuda-12-1-0-download-archive for gpu acceleration on onnx stuff

download and run the bat file from this repo

optionally check official repo and see if requirements has been updated, if so delete the last python -m pip install line, and replace with

python -m pip install requirements.txt

just remember to remove anything related to torch from the original requirements.txt, why do we do this, it's so we can have the GPU variant which we specify before hand, else we can't use gpu
