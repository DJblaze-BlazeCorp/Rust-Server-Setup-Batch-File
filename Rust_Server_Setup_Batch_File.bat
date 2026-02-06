@echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0"
title RUST SERVER MANAGER - WRAPPED MODE

REM ===============================
REM MAIN HEADER
REM ===============================
REM Enable ANSI escape characters
for /f %%A in ('echo prompt $E ^| cmd') do set "ESC=%%A"

REM Header Colors
set "HEADER_ORANGE=%ESC%[38;5;208m"
set "HEADER_BLUE=%ESC%[38;5;33m"
set "FEATURES_YELLOW=%ESC%[38;5;226m"
set "FEATURES_CYAN=%ESC%[38;5;51m"
set "RESET=%ESC%[0m"

echo %HEADER_ORANGE%////////////////////////////////////////////////////////////////////////////%RESET%
echo %HEADER_ORANGE%//%HEADER_BLUE%************************************************************************%HEADER_ORANGE%//%RESET%
echo %HEADER_ORANGE%//%HEADER_BLUE%**%RESET%                                                                    %HEADER_BLUE%**%HEADER_ORANGE%//%RESET%
echo %HEADER_ORANGE%//%HEADER_BLUE%**%RESET%  %HEADER_ORANGE%RUST SERVER SETUP BATCH FILE                                      %HEADER_BLUE%**%HEADER_ORANGE%//%RESET%
echo %HEADER_ORANGE%//%HEADER_BLUE%**%RESET%  %HEADER_ORANGE%Created by: DJBlaze                                               %HEADER_BLUE%**%HEADER_ORANGE%//%RESET%
echo %HEADER_ORANGE%//%HEADER_BLUE%**%RESET%  %HEADER_ORANGE%Version: v1.0.0                                                   %HEADER_BLUE%**%HEADER_ORANGE%//%RESET%
echo %HEADER_ORANGE%//%HEADER_BLUE%**%RESET%  %HEADER_ORANGE%Date: February 6 2026                                             %HEADER_BLUE%**%HEADER_ORANGE%//%RESET%
echo %HEADER_ORANGE%//%HEADER_BLUE%**%RESET%                                                                    %HEADER_BLUE%**%HEADER_ORANGE%//%RESET%
echo %HEADER_ORANGE%//%HEADER_BLUE%************************************************************************%HEADER_ORANGE%//%RESET%
echo %HEADER_ORANGE%////////////////////////////////////////////////////////////////////////////%RESET%

echo.
echo %FEATURES_CYAN%~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~%RESET%
echo %FEATURES_CYAN%~%RESET%                                                                             %FEATURES_CYAN%~%RESET%
echo %FEATURES_CYAN%~%RESET%  %FEATURES_YELLOW%AUTOMATED FEATURES                                                         %FEATURES_CYAN%~%RESET%
echo %FEATURES_CYAN%~%RESET%  %FEATURES_YELLOW%-- SteamCMD Installation/Update                                            %FEATURES_CYAN%~%RESET%
echo %FEATURES_CYAN%~%RESET%  %FEATURES_YELLOW%-- Rust Dedicated Server Installation/Update                               %FEATURES_CYAN%~%RESET%
echo %FEATURES_CYAN%~%RESET%  %FEATURES_YELLOW%-- Optional Oxide/uMod Installation                                        %FEATURES_CYAN%~%RESET%
echo %FEATURES_CYAN%~%RESET%  %FEATURES_YELLOW%-- Dynamic Server Configuration Generation                                 %FEATURES_CYAN%~%RESET%
echo %FEATURES_CYAN%~%RESET%  %FEATURES_YELLOW%-- Automatic Port Assignment                                               %FEATURES_CYAN%~%RESET%
echo %FEATURES_CYAN%~%RESET%  %FEATURES_YELLOW%-- Color-Coded Visual Interface                                            %FEATURES_CYAN%~%RESET%
echo %FEATURES_CYAN%~%RESET%  %FEATURES_YELLOW%-- Comprehensive Logging System                                            %FEATURES_CYAN%~%RESET%
echo %FEATURES_CYAN%~%RESET%                                                                             %FEATURES_CYAN%~%RESET%
echo %FEATURES_CYAN%~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~%RESET%
echo.

REM ===============================
REM ANSI COLOR DEFINITIONS FOR MAIN SCRIPT
REM ===============================
set "GREEN=%ESC%[92m" REM input / prompts
set "PURPLE=%ESC%[35m" REM manager/changer / step 6
set "CYAN=%ESC%[96m" REM step 1
set "YELLOW=%ESC%[93m" REM step 2
set "STEP3=%ESC%[91m" REM step 3 unique (red)
set "DARKBLUE=%ESC%[34m" REM step 4 (server data + server creation)
set "STEP5=%ESC%[36m" REM step 5 (pick server - cyan-ish)
set BASEDIR=%cd%
set STEAMCMD_DIR=%BASEDIR%\steamcmd
set RUST_DIR=%BASEDIR%\rust_server
set SERVERS_DIR=%RUST_DIR%\server
set LOGFILE=%BASEDIR%\rust_manager_log.txt
echo [%date% %time%] Starting script > "%LOGFILE%"

REM ===============================
REM SCRIPT INTRO / PRE-FLIGHT CHECK
REM ===============================
echo %PURPLE%==========================================
echo RUST SERVER MANAGER - WRAPPED MODE
echo ==========================================%RESET%
echo.
echo %PURPLE%Performing initial system check...%RESET%
echo.
echo [%date% %time%] Performing pre-flight checks >> "%LOGFILE%"
REM SteamCMD check
if exist "%STEAMCMD_DIR%\steamcmd.exe" (
    echo %PURPLE%SteamCMD is already installed.%RESET%
    echo [%date% %time%] SteamCMD already installed >> "%LOGFILE%"
) else (
    echo %PURPLE%SteamCMD is not installed and will be downloaded.%RESET%
    echo [%date% %time%] SteamCMD not installed, will download >> "%LOGFILE%"
)
REM Rust server check
if exist "%RUST_DIR%\RustDedicated.exe" (
    echo %PURPLE%Rust server files are already installed.%RESET%
    echo [%date% %time%] Rust server already installed >> "%LOGFILE%"
) else (
    echo %PURPLE%Rust server is not installed and will be downloaded.%RESET%
    echo [%date% %time%] Rust server not installed, will download >> "%LOGFILE%"
)
echo.
echo %PURPLE%After these checks, the script will continue to install any missing components.%RESET%
echo %GREEN%Press any key to continue...%RESET%
powershell -command "$null = [Console]::ReadKey($true)"
echo %ESC%[1A%ESC%[2K%PURPLE%Press any key to continue...%RESET%
echo [%date% %time%] Pre-flight check complete >> "%LOGFILE%"

REM ================================
REM STEP 1 - STEAMCMD CHECK
REM ================================
echo.
echo %CYAN%==========================================
echo [STEP 1] Checking SteamCMD
echo ==========================================%RESET%
echo [%date% %time%] Starting Step 1 >> "%LOGFILE%"
if not exist "%STEAMCMD_DIR%\steamcmd.exe" (
    echo %CYAN%SteamCMD not found. Downloading...%RESET%
    echo [%date% %time%] Downloading SteamCMD >> "%LOGFILE%"
    mkdir "%STEAMCMD_DIR%"
    echo %CYAN%Downloading SteamCMD ZIP...%RESET%
    powershell -NoProfile -ExecutionPolicy Bypass ^
      -Command "Invoke-WebRequest https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -OutFile steamcmd.zip"
    echo %CYAN%Extracting SteamCMD...%RESET%
    powershell -NoProfile -ExecutionPolicy Bypass ^
      -Command "Expand-Archive steamcmd.zip steamcmd -Force"
    del steamcmd.zip
    echo %CYAN%SteamCMD extracted.%RESET%
    echo [%date% %time%] SteamCMD downloaded and extracted >> "%LOGFILE%"
) else (
    echo %CYAN%SteamCMD found.%RESET%
    echo [%date% %time%] SteamCMD found >> "%LOGFILE%"
)
echo %CYAN%Initializing SteamCMD...%RESET%
"%STEAMCMD_DIR%\steamcmd.exe" +quit > steam_init.log 2>&1
echo %CYAN%SteamCMD ready.%RESET%
del steam_init.log
echo %GREEN%Press any key to continue...%RESET%
powershell -command "$null = [Console]::ReadKey($true)"
echo %ESC%[1A%ESC%[2K%CYAN%Press any key to continue...%RESET%
echo [%date% %time%] Step 1 complete: SteamCMD ready >> "%LOGFILE%"

REM ================================
REM STEP 2 - RUST DEDICATED SERVER INSTALL
REM ================================
:RUST_INSTALL
echo.
echo %YELLOW%==========================================
echo [STEP 2] Rust Dedicated Server Check
echo ==========================================%RESET%
REM Check for RustDedicated.exe
if exist "%RUST_DIR%\RustDedicated.exe" (
    echo %YELLOW%Rust Dedicated Server: Installed%RESET%
    echo [%date% %time%] Rust server found >> "%LOGFILE%"
) else (
    echo %YELLOW%Rust Dedicated Server: Missing%RESET%
    echo [%date% %time%] Rust server missing >> "%LOGFILE%"
)
REM Prompt user to install/update
echo %GREEN%Do you want to install or update Rust Dedicated Server? (Y/N)%RESET%
:CHOICE_LOOP_RUST
for /f "usebackq delims=" %%k in (`powershell -command "[Console]::ReadKey($true).Key"`) do set "key=%%k"
if /i "!key!"=="Y" (set "choice=1" & goto CHOICE_DONE_RUST)
if /i "!key!"=="N" (set "choice=2" & goto CHOICE_DONE_RUST)
goto CHOICE_LOOP_RUST
:CHOICE_DONE_RUST
echo %ESC%[1A%ESC%[2K%YELLOW%Do you want to install or update Rust Dedicated Server? (Y/N)%RESET%
if !choice!==1 (
    echo %YELLOW%You chose to install/update Rust Dedicated Server.%RESET%
) else (
    echo %YELLOW%You chose NOT to install/update Rust Dedicated Server.%RESET%
)
echo [%date% %time%] Rust server choice: !choice! >> "%LOGFILE%"
if !choice!==2 goto AFTER_RUST
REM Install/update Rust server via SteamCMD
echo %YELLOW%Installing/updating Rust Dedicated Server via SteamCMD...%RESET%
echo [%date% %time%] Installing/updating Rust server >> "%LOGFILE%"
"%STEAMCMD_DIR%\steamcmd.exe" +login anonymous +force_install_dir "%RUST_DIR%" +app_update 258550 validate +quit > rust_install.log 2>&1
echo %YELLOW%Rust Dedicated Server installation complete.%RESET%
echo [%date% %time%] Rust server installed/updated >> "%LOGFILE%"
del rust_install.log
echo %GREEN%Press any key to continue...%RESET%
powershell -command "$null = [Console]::ReadKey($true)"
echo %ESC%[1A%ESC%[2K%YELLOW%Press any key to continue...%RESET%
:AFTER_RUST

REM ================================
REM STEP 3 - OXIDE / uMod
REM ================================
echo.
echo %STEP3%==========================================
echo [STEP 3] OXIDE / uMod
echo ==========================================%RESET%
echo %GREEN%Install Oxide/uMod? (Y/N)%RESET%
:CHOICE_LOOP_OXIDE
for /f "usebackq delims=" %%k in (`powershell -command "[Console]::ReadKey($true).Key"`) do set "key=%%k"
if /i "!key!"=="Y" (set "choice=1" & goto CHOICE_DONE_OXIDE)
if /i "!key!"=="N" (set "choice=2" & goto CHOICE_DONE_OXIDE)
goto CHOICE_LOOP_OXIDE
:CHOICE_DONE_OXIDE
echo %ESC%[1A%ESC%[2K%STEP3%Install Oxide/uMod? (Y/N)%RESET%
if !choice!==1 (
    echo %STEP3%You chose to install Oxide/uMod.%RESET%
) else (
    echo %STEP3%You chose NOT to install Oxide/uMod.%RESET%
)
echo [%date% %time%] Oxide choice: !choice! >> "%LOGFILE%"
if !choice!==2 goto SERVER_DATA
echo %STEP3%Downloading Oxide from uMod.org...%RESET%
echo [%date% %time%] Downloading Oxide >> "%LOGFILE%"
powershell -NoProfile -ExecutionPolicy Bypass ^
  -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest https://umod.org/games/rust/download -OutFile oxide.zip"
echo %STEP3%Download complete.%RESET%
echo %STEP3%Extracting Oxide into Rust server directory...%RESET%
powershell -NoProfile -ExecutionPolicy Bypass ^
  -Command "Expand-Archive oxide.zip rust_server -Force"
del oxide.zip
echo %STEP3%Oxide installed.%RESET%
echo [%date% %time%] Oxide installed >> "%LOGFILE%"
echo %GREEN%Press any key to continue...%RESET%
powershell -command "$null = [Console]::ReadKey($true)"
echo %ESC%[1A%ESC%[2K%STEP3%Press any key to continue...%RESET%
echo [%date% %time%] Step 3 complete >> "%LOGFILE%"

REM ================================
REM STEP 4 - SERVER DATA (CREATE/NOT)
REM ================================
:SERVER_DATA
mkdir "%SERVERS_DIR%" 2>nul
echo.
echo %DARKBLUE%==========================================
echo [STEP 4] SERVER DATA
echo ==========================================%RESET%
REM Prompt stays GREEN while waiting for input
echo %GREEN%Create new server? (Y/N)%RESET%
:CHOICE_LOOP_NEW_SERVER
for /f "usebackq delims=" %%k in (`powershell -command "[Console]::ReadKey($true).Key"`) do set "key=%%k"
REM After key press, show DARKBLUE feedback
if /i "!key!"=="Y" (set "choice=1" & goto CREATE_SERVER_FEEDBACK)
if /i "!key!"=="N" (set "choice=2" & goto LIST_SERVERS_FEEDBACK)
goto CHOICE_LOOP_NEW_SERVER

:CREATE_SERVER_FEEDBACK
echo %ESC%[1A%ESC%[2K%DARKBLUE%You chose to create a new server.%RESET%
goto CREATE_SERVER

:LIST_SERVERS_FEEDBACK
echo %ESC%[1A%ESC%[2K%DARKBLUE%You chose NOT to create a new server.%RESET%
goto STEP5_PICK_SERVER

:CREATE_SERVER
set /p SERVERNAME=%GREEN%Enter server name (no spaces): %RESET%
echo %ESC%[1A%ESC%[2K%DARKBLUE%Enter server name (no spaces): !SERVERNAME!%RESET%
echo [%date% %time%] Server name entered: !SERVERNAME! >> "%LOGFILE%"
REM VALIDATION
if "!SERVERNAME!"=="" goto CREATE_SERVER
if not "!SERVERNAME!"=="!SERVERNAME: =!" goto CREATE_SERVER
if exist "%SERVERS_DIR%\!SERVERNAME!" goto CREATE_SERVER

REM Get server configuration details
set /p DESCRIPTION=%GREEN%Enter server description: %RESET%
echo %ESC%[1A%ESC%[2K%DARKBLUE%Enter server description: !DESCRIPTION!%RESET%

set /p TAGS=%GREEN%Enter server tags (comma separated): %RESET%
echo %ESC%[1A%ESC%[2K%DARKBLUE%Enter server tags (comma separated): !TAGS!%RESET%

set /p MAXPLAYERS=%GREEN%Enter max players (default 50): %RESET%
if "!MAXPLAYERS!"=="" set MAXPLAYERS=50
echo %ESC%[1A%ESC%[2K%DARKBLUE%Enter max players (default 50): !MAXPLAYERS!%RESET%

set /p WORLDSIZE=%GREEN%Enter world size (default 3000): %RESET%
if "!WORLDSIZE!"=="" set WORLDSIZE=3000
echo %ESC%[1A%ESC%[2K%DARKBLUE%Enter world size (default 3000): !WORLDSIZE!%RESET%

REM Generate numeric seed (7-20 digits)
for /f %%i in ('powershell -command "(Get-Random -Minimum 1000000 -Maximum 9999999999999999)"') do set SEED=%%i

REM Generate numeric RCON password (7-20 digits) - different from seed
:GENERATE_PASSWORD
for /f %%i in ('powershell -command "(Get-Random -Minimum 1000000 -Maximum 9999999999999999)"') do set RCONPASS=%%i
if "!RCONPASS!"=="!SEED!" goto GENERATE_PASSWORD

REM Calculate ports
set TMP_COUNT=0
for /d %%D in ("%SERVERS_DIR%\*") do set /a TMP_COUNT+=1
set /a OFFSET=!TMP_COUNT!
set /a SERVER_PORT=28015 + 2 * !OFFSET!
set /a RCON_PORT=!SERVER_PORT! + 1

REM Create server directory
mkdir "%SERVERS_DIR%\!SERVERNAME!" 2>nul
mkdir "%SERVERS_DIR%\!SERVERNAME!\cfg" 2>nul
mkdir "%SERVERS_DIR%\!SERVERNAME!\logs" 2>nul

REM Show generated values
echo %DARKBLUE%Generated Values:%RESET%
echo %DARKBLUE%Seed: !SEED!%RESET%
echo %DARKBLUE%RCON Password: !RCONPASS!%RESET%
echo [%date% %time%] Generated Seed: !SEED! Password: !RCONPASS! >> "%LOGFILE%"

REM Create start_ServerName.bat
set "OUTFILE=start_!SERVERNAME!.bat"
(
echo @echo off
echo title Rust Server - !SERVERNAME!
echo mode con: cols=120 lines=3000
echo cd /d "%RUST_DIR%"
echo RustDedicated.exe -batchmode +server.identity "!SERVERNAME!" +server.port !SERVER_PORT! +rcon.password "!RCONPASS!" +rcon.web 1 +server.level "Procedural Map" +server.worldsize !WORLDSIZE! +server.seed !SEED! +server.secure 0 +server.encryption 0 -logfile "server\!SERVERNAME!\logs\serverlog.txt"
echo pause
) > "!OUTFILE!"

REM Create server.cfg file using a safer method
set "CFGFILE=%SERVERS_DIR%\!SERVERNAME!\cfg\server.cfg"

REM Write config file line by line to avoid escaping issues
echo //////////////////////////////////////////////////////////////// > "!CFGFILE!"
echo // Server Config - !SERVERNAME!// >> "!CFGFILE!"
echo //////////////////////////////////////////////////////////////// >> "!CFGFILE!"
echo. >> "!CFGFILE!"
echo // ================================================================ >> "!CFGFILE!"
echo // SERVER IDENTITY ^& BROWSER APPEAL >> "!CFGFILE!"
echo // ================================================================ >> "!CFGFILE!"
echo server.hostname "!SERVERNAME!" >> "!CFGFILE!"
echo server.description "!DESCRIPTION!" >> "!CFGFILE!"
echo server.tags "!TAGS!" >> "!CFGFILE!"
echo server.url ""  // Discord invite? e.g., "https://discord.gg/XXXXX" >> "!CFGFILE!"
echo server.headerimage ""  // Banner URL (1280x720px) for server list pop! >> "!CFGFILE!"
echo. >> "!CFGFILE!"
echo // ================================================================ >> "!CFGFILE!"
echo // BASIC WORLD ^& PLAYER SETTINGS >> "!CFGFILE!"
echo // ================================================================ >> "!CFGFILE!"
echo server.maxplayers "!MAXPLAYERS!" >> "!CFGFILE!"
echo server.saveinterval "300" >> "!CFGFILE!"
echo server.maxvehicles "25"  // Anti-spam/lag for small server >> "!CFGFILE!"
echo server.seed "!SEED!" >> "!CFGFILE!"
echo server.worldsize "!WORLDSIZE!" >> "!CFGFILE!"
echo. >> "!CFGFILE!"
echo // ================================================================ >> "!CFGFILE!"
echo // RCON ^& ADMIN >> "!CFGFILE!"
echo // ================================================================ >> "!CFGFILE!"
echo rcon.password "!RCONPASS!" >> "!CFGFILE!"
echo rcon.web "1" >> "!CFGFILE!"
echo rcon.port "!RCON_PORT!" >> "!CFGFILE!"
echo. >> "!CFGFILE!"
echo // ================================================================ >> "!CFGFILE!"
echo // PERFORMANCE ^& STABILITY TWEAKS >> "!CFGFILE!"
echo // ================================================================ >> "!CFGFILE!"
echo server.maxunloadtime "300"   // Unload distant areas (perf++) >> "!CFGFILE!"
echo server.sleepmode "false"     // No auto-sleep >> "!CFGFILE!"
echo server.itemdespawn "300"     // Quick loot cleanup >> "!CFGFILE!"
echo server.stability "1"         // Realistic building physics >> "!CFGFILE!"

echo %DARKBLUE%Created server files for !SERVERNAME!:%RESET%
echo %DARKBLUE% - Start script: !OUTFILE!%RESET%
echo %DARKBLUE% - Config file: !CFGFILE!%RESET%
echo [%date% %time%] Created server !SERVERNAME! >> "%LOGFILE%"
goto STEP5_PICK_SERVER

REM ================================
REM STEP 5 - PICK A SERVER
REM ================================
:STEP5_PICK_SERVER
set COUNT=0
for /d %%D in ("%SERVERS_DIR%\*") do (
    set /a COUNT+=1
    set "SERVER[!COUNT!]=%%~nxD"
)
if !COUNT! EQU 0 (
    echo %STEP5%No existing servers to pick.%RESET%
    echo %GREEN%Press any key to exit...%RESET%
    powershell -command "$null = [Console]::ReadKey($true)"
    exit /b
)
echo.
echo %STEP5%==========================================
echo [STEP 5] SELECT A SERVER
echo ==========================================%RESET%
REM Display servers
for /L %%i in (1,1,!COUNT!) do (
    echo %STEP5%%%i^) !SERVER[%%i]!%RESET%
)
echo.
set /p SEL=%GREEN%Select server number (1-!COUNT!): %RESET%
echo %ESC%[1A%ESC%[2K%STEP5%Select server number (1-!COUNT!): !SEL!%RESET%
set /a SEL_NUM=!SEL! 2>nul
if !SEL_NUM! geq 1 if !SEL_NUM! leq !COUNT! (
    for /f "tokens=1* delims==" %%a in ('set SERVER[!SEL_NUM!]') do set "SERVERNAME=%%b"
    echo %STEP5%Starting server !SERVERNAME!...%RESET%
    start "" "start_!SERVERNAME!.bat"
    echo %STEP5%==========================================%RESET%
    echo %STEP5%DONE - SERVER STARTED%RESET%
    echo %STEP5%==========================================%RESET%
    echo %GREEN%Press any key to exit...%RESET%
    powershell -command "$null = [Console]::ReadKey($true)"
    echo %ESC%[1A%ESC%[2K%STEP5%Press any key to exit...%RESET%
    exit /b
) else (
    echo %STEP5%Invalid selection.%RESET%
    goto STEP5_PICK_SERVER
)
