obs = obslua

function script_description()
    return "This script prints a message and runs a command when OBS is shut down."
end

function script_unload()
    print("🦊🦊🦊 Running Shutdown Script.")
    -- os.execute('"/Users/insert/dotfiles/Library/Application Support/obs-studio/assets_vulbyte/scripts"')

    os.execute('"/Users/insert/dotfiles/Library/Application Support/obs-studio/assets_vulbyte/scripts/git_commit.sh"')

    print("🦊🦊🦊 OBS has been shut down.") 
end

