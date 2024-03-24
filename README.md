```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

close terminal/powershell

```
scoop bucket add extras
scoop install ungoogled-chromium git
```

install -> https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe

install -> https://aka.ms/vs/17/release/vs_BuildTools.exe with the optional boxes named "MSVC VS 2022" and "Windows 11 SDK"


download and run the bat file from this repo

if official repo changes requirements, go to server/requirements.txt

find: torch & torchaudio, remove them,

edit bat file replace the third python -m pip line (the one with uvicode) with

python -m pip install requirements.txt

otherwise you wont have your gpu selectable, as it will only give you the CPU versions of torch