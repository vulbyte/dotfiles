import obspython as obs
import os
import subprocess

# Path to your stow/commit script
SH_SCRIPT_PATH = os.path.expanduser("~/dotfiles/config_and_commit_stow.sh")

def run_backup_script():
    """Executes the shell script in a detached process."""
    if os.path.exists(SH_SCRIPT_PATH):
        try:
            # We use Popen so OBS can finish closing while the script pushes to Git
            subprocess.Popen(
                ["/bin/bash", SH_SCRIPT_PATH],
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
    return "Runs ~/dotfiles/config_and_commit_stow.sh automatically when OBS closes."
