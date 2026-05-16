import obspython as obs
import os
import subprocess

# Path to your stow/commit script
SH_SCRIPT_PATH = os.path.expanduser("~/dotfiles/config_and_commit_stow.sh")

def show_mac_notification(title, message):
    """Triggers a native macOS notification toast."""
    os.system(f"osascript -e 'display notification \"{message}\" with title \"{title}\"'")

def run_backup_script():
    """Executes the shell script and notifies the user."""
    if os.path.exists(SH_SCRIPT_PATH):
        try:
            # 1. Show 'Backing up' notification
            show_mac_notification("OBS Cloud Sync", "Backing up scenes to GitHub...")

            # 2. Run the script
            # We use subprocess.run here instead of Popen if we want to wait for the result
            # to show the 'Complete' message, but that might hang OBS.
            # Instead, we'll fire a command that runs the script THEN shows the finish message.
            cmd = f"/bin/bash {SH_SCRIPT_PATH} && osascript -e 'display notification \"Backup complete!\" with title \"OBS Cloud Sync\"'"
            
            subprocess.Popen(
                ["/bin/bash", "-c", cmd],
                start_new_session=True,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            )
        except Exception as e:
            print(f"Failed to run backup script: {e}")
    else:
        print(f"Error: {SH_SCRIPT_PATH} not found.")

def on_event(event):
    """Listens for the OBS exit signal."""
    if event == obs.OBS_FRONTEND_EVENT_EXIT:
        run_backup_script()

def script_load(settings):
    """Called when the script is loaded into OBS."""
    obs.obs_frontend_add_event_callback(on_event)

def script_description():
    return "Runs config_and_commit_stow.sh with notifications when OBS closes."