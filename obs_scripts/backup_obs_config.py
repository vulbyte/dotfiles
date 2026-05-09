import obspython as obs
import subprocess
import os

# --- CONFIGURATION ---
# This points to the Bash script we just made
BASH_SCRIPT_PATH = os.path.expanduser("~/dotfiles/misc_scripts/sync-obs-files.sh")

def run_backup():
    if os.path.exists(BASH_SCRIPT_PATH):
        print(f"Triggering OBS backup: {BASH_SCRIPT_PATH}")
        # We use Popen so the bash script runs in the background 
        # and doesn't get killed when OBS finishes closing.
        subprocess.Popen(["/bin/bash", BASH_SCRIPT_PATH])
    else:
        print(f"Error: Bash script not found at {BASH_SCRIPT_PATH}")

def script_unload():
    """
    This function is called automatically by OBS when 
    the script is removed or when OBS closes.
    """
    run_backup()

def script_description():
    return "Automatically runs sync-obs-files.sh when OBS closes."
