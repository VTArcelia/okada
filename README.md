[felts version](https://github.com/MrFelt/voice-changer) set for [official repo](https://github.com/w-okada/voice-changer) and specifying all packages for first time running + what id recommend ie, scoop, installing most packages through scoop, and chrome:flags 

mandatory instructions are basically same for Felt's repo, where you install python and build tools, then run [bat file](https://github.com/MrFelt/voice-changer/releases) from his repo


### mandatory
install Python 3.10.11 -> https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe make sure added to PATH, do not have any version of conda installed unless you are willing to tweak the bat file for your own needs. Run python --version in cmd to verify that you are actually on 3.10.11 if you aren't then your errors are self induced.

install Git -> https://git-scm.com/downloads/win because git is needed

install Build Tools -> https://aka.ms/vs/17/release/vs_BuildTools.exe press "Desktop Development with C++" it should have the optional boxes named "MSVC VS 2022" and "Windows 11 SDK" (or windows 10 sdk) checked, that is all the prereqs.


download and run the bat file from this repo called Okada.bat, answer what it asks, it'll do everything for you



### optional:

download QuickLaunch.bat which will skip update check and venv requirements check to launch without any user inputs

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

note: if you installed git above you can skip the git from scoop, I prefer getting as much through scoop as possible

- another optional thing
Open Ungoogled-Chromium & go to chrome://flags 2,3,4,6 are mandatory, 1,5 are just dark mode
![reference image](https://raw.githubusercontent.com/VTArcelia/okada/main/Ungoogled-Chromium.png)

Change ungoogled's startup to always launch https://127.0.0.1:18888/



### troubleshooting install

if official repo changes requirements or changes the voice changer to a new layout and no longer builds, edit bat and target this repo instead https://github.com/VTArcelia/voice-changer or for requirements, delete venv folder, go to server/requirements.txt

find: torch & torchaudio, remove them from the requirements.txt file,

edit bat file replace the third python -m pip line (the one with uvicode) with

```
python -m pip install requirements.txt
```


if randomly breaks from an install, you can delete the VENV folder that gets made, and re run the original Okada.bat script to remake the venv


### extra for setting Silence Front to be permanently off

navigate through the following folders, voice-changer/server/voice_changer/RVC 

find RVCSettings.py, change  silenceFront: int = 1 to  silenceFront: int = 0, 
aka change the 1 to a 0 only on silencefront

Now you will have better results when using the Rest API. (my preferred choice)
