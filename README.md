# Termux & Total Commander Bridge (Android 16+)

A universal wrapper script to bridge **Total Commander** and **Termux** on modern Android versions (SDK 36+). 

## 🛑 The Problem on Android 16
Recent Android security updates have introduced strict restrictions that break traditional workflows between file managers and Termux:
1.  **Error 10437 (Invalid Source):** Blocks starting background services from third-party apps.
2.  **Error 405 (Permission Denied):** Prevents direct execution of scripts located in shared storage.
3.  **Variable Resolution Failure:** Total Commander fails to resolve `%P%N` when used with generic `termux:sh` commands.

## ✅ The Solution
This project provides a **wrapper script** (`universal_exec.sh`) that resides inside Termux's private storage. It acts as a trusted gateway to execute scripts located anywhere on your device.

## 🚀 Installation

### 1. Setup the Script in Termux
Open Termux and run the following commands:

```bash
mkdir -p ~/.termux/scripts/
curl -o ~/.termux/scripts/universal_exec.sh https://raw.githubusercontent.com/Corteky/termux-tc-bridge/main/universal_exec.sh
chmod +x ~/.termux/scripts/universal_exec.sh
```

### 2. Configure Total Commander Button
Create a new button in the Total Commander button bar:
* **Function type:** `View file with app` (Search "Termux" in list)
* **Command:** `com.termux/.app.TermuxActivity`
* **Parameters:**
    ```text
    termux:/data/data/com.termux/files/home/.termux/scripts/universal_exec.sh %P%N
    ```
### 3. How to Use in Total Commander

Once the button is configured, the workflow is seamless:

1.  **Navigate** to your project folder using Total Commander.
2.  **Select** the file you want to run (e.g., `myscript.py`, `deploy.sh`) by tapping its icon or name so it gets highlighted.
3.  **Tap** the new "Universal Launcher" button you created in the toolbar.
4.  **Done!** Termux will open automatically and execute your script using the correct interpreter.

*Supported extensions: `.sh` (Bash), `.py` (Python), `.js` (Node.js).*

### 4. Customization: Adding New Languages

The script comes pre-configured for **Bash**, **Python**, and **Node.js**. If you want to add support for other languages (e.g., Ruby, Perl, Lua), you can easily edit the `universal_exec.sh` file.

1.  Open the script in Termux:
    ```bash
       nano ~/.termux/scripts/universal_exec.sh
    ```
2.  Locate the `case "$TARGET" in` block.
3.  Add your new extension pattern and the corresponding interpreter command.

**Example: Adding Ruby support**
```bash
    *.rb)
        echo -e "${GREEN}[EXEC] Ruby script detected...${NC}"
        ruby "$TARGET"
        ;;
```
## 📄 License
MIT License
