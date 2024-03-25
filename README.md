install scoop for convenience
https://github.com/ScoopInstaller/Scoop?tab=readme-ov-file#what-does-scoop-do
for a custom dir
https://github.com/ScoopInstaller/Install?tab=readme-ov-file#advanced-installation

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

close terminal/powershell

```powershell
scoop bucket add extras
scoop install ungoogled-chromium git
```

install -> https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe

install -> https://aka.ms/vs/17/release/vs_BuildTools.exe with the optional boxes named "MSVC VS 2022" and "Windows 11 SDK"

Open Ungoogled-Chromium & go to chrome://flags 2,3,4,6 are mandatory, 1,5 are just dark mode
![image](https://raw.githubusercontent.com/Enrop/okada/main/Ungoogled-Chromium.png?token=GHSAT0AAAAAACOEIV4X5EUQXHZOR4EX24UMZQA5EPQ)

Change ungoogled's startup to always launch https://127.0.0.1:18888/

download and run the bat file from this repo, run ungoogled chromium from scoop folder


Optional/Future Proof: 

if official repo changes requirements & fails to build delete venv folder, go to server/requirements.txt

find: torch & torchaudio, remove them,

edit bat file replace the third python -m pip line (the one with uvicode) with

python -m pip install requirements.txt

