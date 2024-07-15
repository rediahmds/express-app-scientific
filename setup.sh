#!/bin/bash

# 1. Check if git is installed or not
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing Git..."
    sudo apt update
    sudo apt install -y git
    if ! command -v git &> /dev/null; then
        echo "Failed to install Git. Please install it manually and rerun the script."
        exit 1
    fi
fi

# 2. Install nvm from the link
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 3. Source the nvm script directly
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# 4. Check if nvm is installed successfully
if ! command -v nvm &> /dev/null; then
    echo "NVM installation failed."
    exit 1
fi

# 5. Install latest LTS version of Node.js
echo "Installing latest LTS version of Node.js..."
nvm install --lts

# 6. Check Node and npm version
echo "Node version: $(node -v)"
echo "npm version: $(npm -v)"

# 7. Create and change directory to /home/dev
echo "Creating and changing to /home/dev directory..."
mkdir -p /home/dev
cd /home/dev

# 8. Clone GitHub repo
echo "Cloning GitHub repository..."
git clone https://github.com/rediahmds/express-app-scientific.git

# 9. Change directory into the repo
echo "Changing to repository directory..."
cd express-app-scientific

# 10. Run npm install
echo "Running npm install..."
npm install

# 11. Install pm2 globally with npm
echo "Installing pm2 globally..."
npm install -g pm2

# 12. Run the app with pm2
echo "Starting the app with pm2..."
pm2 start app.js

# 13. Autostart pm2
echo "Setting up pm2 to autostart..."
pm2 startup

# 14. Run pm2 status
echo "Checking pm2 status..."
pm2 status

# 15. Save pm2 state
echo "Saving pm2 state..."
pm2 save

echo "Script execution completed."
