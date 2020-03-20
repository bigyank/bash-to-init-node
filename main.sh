#!/usr/bin/env bash
set -e

# colors defined
RED='\033[0;31m'
NC='\033[0m' # no color
GREEN='\033[0;32m'
LCYAN='\033[1;36m'
YELLOW='\033[0;33m'

# Checks for existing eslintrc file
function checkEslint(){
    if [ -f ".eslintrc.js" -o -f ".eslintrc.yaml" -o -f ".eslintrc.yml" -o -f ".eslintrc.json" -o -f ".eslintrc" ]; then
        echo -e "${RED}Existing ESLint config file(s) found:${NC}"
        ls -a .eslint* | xargs -n 1 basename
        echo
        echo -e "${RED}CAUTION:${NC} there is loading priority when more than one config file is present: https://eslint.org/docs/user-guide/configuring#configuration-file-formats"
        echo
        echo -e "${RED}Improper Script Exit${NC}"
        exit 1
    fi
}

function checkPrettier(){
    # Checks for existing prettierrc files
    if [ -f ".prettierrc.js" -o -f "prettier.config.js" -o -f ".prettierrc.yaml" -o -f ".prettierrc.yml" -o -f ".prettierrc.json" -o -f ".prettierrc.toml" -o -f ".prettierrc" ]; then
        echo -e "${RED}Existing Prettier config file(s) found${NC}"
        ls -a | grep "prettier*" | xargs -n 1 basename
        echo
        echo -e "${RED}Improper Script Exit${NC}"
        exit 2
    fi
}


checkEslint
checkPrettier

# ----------------------
# Perform Configuration
# ----------------------
echo
echo -e "${GREEN}Configuring your development environment... ${NC}"
npm init -y

echo
echo -e "1/5 ${LCYAN}ESLint & Prettier Installation... ${NC}"
echo
npm i -D eslint prettier

echo
echo -e "2/5 ${YELLOW}Conforming to Airbnb's JavaScript Style Guide... ${NC}"
echo
npx install-peerdeps --dev eslint-config-airbnb

echo
echo -e "3/5 ${LCYAN}Making ESlint and Prettier play nice with each other... ${NC}"
echo "See https://github.com/prettier/eslint-config-prettier for more details."
echo
npm i -D eslint-plugin-prettier eslint-config-prettier eslint-plugin-node eslint-config-node

echo
echo -e "4/5 ${YELLOW}Building your .eslintrc.json file...${NC}"
touch .eslintrc.json

echo '{
  "extends": ["airbnb", "prettier", "plugin:node/recommended"],
  "plugins": ["prettier"],
  "rules": {
    "prettier/prettier": "error",
    "no-unused-vars": "warn",
    "no-console": "off",
    "func-names": "off",
    "no-process-exit": "off",
    "object-shorthand": "off",
    "class-methods-use-this": "off"
  }
}'> .eslintrc.json

echo
echo -e "5/5 ${YELLOW}Building your .prettierrc.json file... ${NC}"
touch .prettierrc
echo '{ "singleQuote": true }' > .prettierrc

echo
echo -e "${GREEN}Finished setting up!${NC}"
echo