#!/usr/bin/env bash

# colors defined
RED='\033[0;31m'
NC='\033[0m' # no color
GREEN='\033[0;32m'
LCYAN='\033[1;36m'
YELLOW='\033[0;33m'

# check Node
function checkNode(){
    node -v &> /dev/null
}

# Checks for existing eslintrc file
function checkEslint(){
    if [ -f ".eslintrc.js" -o -f ".eslintrc.yaml" -o -f ".eslintrc.yml" -o -f ".eslintrc.json" -o -f ".eslintrc" ]; then
        ls -a .eslint* | xargs -n 1 basename
        echo
        return 1
    fi
}

function checkPrettier(){
    # Checks for existing prettierrc files
    if [ -f ".prettierrc.js" -o -f "prettier.config.js" -o -f ".prettierrc.yaml" -o -f ".prettierrc.yml" -o -f ".prettierrc.json" -o -f ".prettierrc.toml" -o -f ".prettierrc" ]; then
        ls -a | grep "prettier*" | xargs -n 1 basename
        echo
        return 1
    fi
}

# check if node is installed
if checkNode; then
    echo
    echo -e "${GREEN}Sweet! Node is available${NC}"
else
    echo
    echo -e "${RED}Node isnt installed, Please install and try again${NC}"
    exit 1
fi

# check for eslint files
if checkEslint; then
    echo
    echo -e "${GREEN}Working Directory seems clean! Marching Forward${NC}"
else
    echo
    echo -e "${RED}Ancient eslint files found!${NC}"
    exit 1
fi

# check for eslint files
if checkPrettier; then
    echo
    echo -e "${GREEN}Working directory is pretty${NC}"
else
    echo
    echo -e "${RED}Working directory is dirty!${NC}"
    exit 1
fi

# ----------------------
# Perform Configuration
# ----------------------
echo
echo -e "${GREEN}Configuring your development environment... ${NC}"
if [ ! -f ./package.json ]; then
    npm init -y &> /dev/null
fi

echo
echo -e "1/5 ${LCYAN}ESLint & Prettier Installation... ${NC}"
echo
npm i -D eslint && npm install --save-dev --save-exact prettier

echo
echo -e "3/5 ${LCYAN}Choose Eslint seetings ${NC}"
echo
npx eslint --init


echo
echo -e "5/5 ${YELLOW}Building your .prettierrc.json file... ${NC}"
touch .prettierrc
echo '{ "singleQuote": true, "endOfLine": "auto" }' > .prettierrc

echo
echo -e "${GREEN}Finished setting up!${NC}"
echo
