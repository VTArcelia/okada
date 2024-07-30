[felts version](https://github.com/MrFelt/voice-changer) set for [official repo](https://github.com/w-okada/voice-changer) and specifying all packages for first time running + what id recommend ie, scoop, installing most packages through scoop, and chrome:flags 

mandatory instructions are basically same for Felt's repo, where you install python and build tools, then run bat file from repo


### mandatory
install -> https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe make sure added to PATH

install -> https://aka.ms/vs/17/release/vs_BuildTools.exe with the optional boxes named "MSVC VS 2022" and "Windows 11 SDK" (or windows 10 sdk)

download and run the bat file from this repo called Okada.bat, answer what it asks, it'll do everything for you

optional download QuickLaunch.bat which will skip update check and venv requirements check to launch without any user inputs


### optional:
install scoop for convenience
https://github.com/ScoopInstaller/Scoop?tab=readme-ov-file#what-does-scoop-do
for a custom dir
https://github.com/ScoopInstaller/Install?tab=readme-ov-file#advanced-installation

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

close terminal(powershell) & reopen it

```powershell
scoop bucket add extras
scoop install ungoogled-chromium git
```


- another optional thing
Open Ungoogled-Chromium & go to chrome://flags 2,3,4,6 are mandatory, 1,5 are just dark mode
![reference image](https://raw.githubusercontent.com/Enrop/okada/main/Ungoogled-Chromium.png?token=GHSAT0AAAAAACOEIV4X5EUQXHZOR4EX24UMZQA5EPQ)

Change ungoogled's startup to always launch https://127.0.0.1:18888/



### troubleshooting install

if official repo changes requirements or changes the voice changer to a new layout and no longer builds, edit bat and target this repo instead https://github.com/Blanc-dot/voice-changer or for requirements, delete venv folder, go to server/requirements.txt

find: torch & torchaudio, remove them from the requirements.txt file,

edit bat file replace the third python -m pip line (the one with uvicode) with

```
python -m pip install requirements.txt
```


if randomly breaks from an install, you can delete the VENV folder that gets made, and re run the original Okada.bat script to remake the venv


### extra for hidden terminal (that can be opened whenever) that also opens your browser after a long enough delay to make the web ui load

create a bat file with the following in it

```bat
@echo off
start /min "" "%LOCALAPPDATA%\Microsoft\WindowsApps\wt.exe" -w _quake cmd /c "cd /d "Path\To\Voice\Changer\Folder\" && call\the\bat\from\this\repo"
timeout /t 20 /nobreak >nul
start "" "Path\to\Ungoogled\Chromium\If\Scoop\Use\Current\Folder\"
```

for the path to voice changer folder this is the one where the bat you got from this repo is.
& for path to ungoogled, use any chromium based browser, but ungoogled is rec

Before doing this bat file open up windows terminal normally and go into settings > actions > Show\Hide Quake Menu, set a keybind example: ctrl+shift+q

right click bat file you just made, create shortcut, 

ideally move the shortcut here %AppData%\Microsoft\Windows\Start Menu\Programs

right click shortcut, create a shortcut key of your choice ex: ctrl+shift+v

you can now call the voice changer whenever to open everything on its own from this setup, and to close it, press your keybind for show\hide quake mode, ctrl+c, y when prompted, ctrl+d


