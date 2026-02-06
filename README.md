<div align="center">
  
# <span style="color:#FF4500">🎮</span> Rust Server Setup Batch File

**Streamline your Rust server deployment**

[Windows](#requirements) • [Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [License](#-license)

</div>

---

## <span style="color:#4169E1">👤 Author</span>

**<span style="color:#228B22">Your Name</span>**
<span style="color:#4682B4">🔧</span> GitHub: [@DJBlaze](https://github.com/DJblaze-BlazeCorp) 

---

## <span style="color:#FF69B4">✨ Features</span>

<span style="color:#9370DB">**Automated Installation**</span> — Downloads and installs SteamCMD and Rust server files automatically

<span style="color:#9370DB">**Oxide/uMod Support**</span> — Optionally installs Oxide/uMod for plugin support  

<span style="color:#9370DB">**Server Creation Wizard**</span> — Guides you through setting up a new server with customizable settings

<span style="color:#9370DB">**Dynamic Port Assignment**</span> — Automatically assigns unique ports based on the number of existing servers

<span style="color:#9370DB">**Config Generation**</span> — Creates individual `.bat` startup scripts and `server.cfg` configuration files

<span style="color:#9370DB">**Color-Coded Interface**</span> — Provides clear visual feedback during execution using ANSI color codes

## <span style="color:#32CD32">🚀 Installation</span>

### <span style="color:#FFA500">Prerequisites</span>
- Windows 10 or Windows 11
- PowerShell enabled and accessible from command line
- Internet connection for downloading necessary components

### <span style="color:#FFA500">Download and Run</span>

1. Download the latest release:
   ```batch
   Rust_Server_Setup_Batch_File.bat
   ```

2. Or clone the repository:
   ```bash
   git clone https://github.com/username/repo.git
   cd repo
   Rust_Server_Setup_Batch_File.bat
   ```

3. Run as Administrator for best results

## <span style="color:#FFD700">📋 Usage</span>

### <span style="color:#4169E1">Initial Setup</span>

1. Save the provided script as `Rust_Server_Setup_Batch_File.bat`
2. Run it by double-clicking or executing via Command Prompt
3. Follow the on-screen prompts:
   - Allow the script to download and install SteamCMD if needed
   - Choose whether to install/update the Rust dedicated server
   - Decide whether to install Oxide/uMod
   - Create a new server or select an existing one

### <span style="color:#4169E1">Creating a New Server</span>

When prompted:
- Enter a unique server name without spaces
- Provide a description and comma-separated tags
- Specify maximum player count (default: 50)
- Set world size (default: 3000)

The script will generate:
- A unique seed and RCON password
- Startup port numbers based on existing servers
- A personalized `start_<servername>.bat` file
- A corresponding `server.cfg` inside `<server>/cfg/`

### <span style="color:#4169E1">Starting Your Server</span>

After creation, you can either:
- Re-run the script and choose the server from the list
- Directly run the generated `start_<servername>.bat` file located in the base directory

## <span style="color:#1E90FF">📁 Directory Structure</span>

Upon first run, the following directories will be created:

```
├── steamcmd/                 # Contains SteamCMD binaries
├── rust_server/              # Main Rust server installation
│   └── server/               # Folder containing all server instances
│       └── <your_server>/    # Individual server folder
│           ├── cfg/          # Configuration files
│           └── logs/         # Log output
└── start_<servername>.bat    # Per-server launch script
```

## <span style="color:#FF69B4">🎯 Key Benefits</span>

✅ <span style="color:#32CD32">**Zero Manual Configuration**</span> - Everything is automated  
✅ <span style="color:#32CD32">**Plugin Ready**</span> - Supports Oxide/uMod modding framework  
✅ <span style="color:#32CD32">**Multi-Server Support**</span> - Manage multiple server instances  
✅ <span style="color:#32CD32">**Professional Interface**</span> - Color-coded feedback system  
✅ <span style="color:#32CD32">**Comprehensive Logging**</span> - Detailed operation tracking  

## <span style="color:#8A2BE2">⚙️ Technical Details</span>

### <span style="color:#FF8C00">Script Workflow</span>

1. <span style="color:#4169E1">**Preflight Check**</span> - Verifies SteamCMD and Rust server installation status
2. <span style="color:#4169E1">**SteamCMD Setup**</span> - Downloads and initializes SteamCMD if missing
3. <span style="color:#4169E1">**Rust Server Installation**</span> - Installs or updates Rust dedicated server
4. <span style="color:#4169E1">**Oxide/uMod Integration**</span> - Optional plugin framework installation
5. <span style="color:#4169E1">**Server Configuration**</span> - Interactive wizard for server setup
6. <span style="color:#4169E1">**Launch Management**</span> - Easy server selection and startup

### <span style="color:#FF8C00">Color Coding System</span>

- <span style="color:#DA70D6">**Purple**</span> - General information and prompts
- <span style="color:#00CED1">**Cyan**</span> - Step 1 (SteamCMD operations)
- <span style="color:#FFD700">**Yellow**</span> - Step 2 (Rust server operations)
- <span style="color:#9370DB">**Magenta**</span> - Step 3 (Oxide/uMod installation)
- <span style="color:#4169E1">**Blue**</span> - Step 4 (Server data and creation)
- <span style="color:#20B2AA">**Teal**</span> - Step 5 (Server selection)

## <span style="color:#4169E1">🛡️ Security Notes</span>

- This script uses anonymous login to SteamCMD; no account credentials required
- For public servers, consider adjusting security settings in `server.cfg`
- Ensure firewall allows traffic on assigned ports (starting at UDP/TCP 28015 onwards)
- Logs are saved both in per-server log folders and globally in `rust_manager_log.txt`

## <span style="color:#FF1493">📝 Configuration Files</span>

### <span style="color:#FF6347">server.cfg</span>
Generated configuration includes:
- Server identity and browser appeal settings
- Basic world and player settings
- RCON and administration configuration
- Performance and stability tweaks

### <span style="color:#FF6347">Startup Scripts</span>
Each server gets its own `start_<servername>.bat` with:
- Proper command-line arguments
- Unique port assignments
- Dedicated log file output

## <span style="color:#FF8C00">🆘 Troubleshooting</span>

### <span style="color:#FFA500">Common Issues</span>

1. <span style="color:#FF4500">**Script closes immediately**</span> - Run from Command Prompt to see error messages
2. <span style="color:#FF4500">**Download failures**</span> - Check internet connection and firewall settings
3. <span style="color:#FF4500">**Permission errors**</span> - Run as Administrator
4. <span style="color:#FF4500">**Port conflicts**</span> - Script automatically assigns unique ports

### <span style="color:#FFA500">Log Files</span>
Check `rust_manager_log.txt` for detailed operation logs and error information.

## <span style="color:#228B22">📄 License</span>

This project is open-source and available under the MIT License.

## <span style="color:#FFA500">ℹ️ Disclaimer</span>

This tool is not officially affiliated with Facepunch Studios or the developers of Rust. Use at your own risk. Always back up important server data before making changes.

## <span style="color:#4169E1">🔄 Version History</span>

<span style="color:#FFD700">**v1.0**</span> - Initial release
- Full SteamCMD automation
- Rust server installation/update
- Oxide/uMod support
- Interactive server creation wizard
- Color-coded interface
- Comprehensive logging

---

<div align="center">
  
**<span style="color:#FF69B4">Made with ❤️ by Your Name</span>**  
**<span style="color:#4169E1">For the Rust community</span>**

</div>
