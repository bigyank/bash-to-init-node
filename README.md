# Installation

1. Navigate to your app directory where you want to include this style configuration.

   ```bash
   cd my-app
   ```

2. Run this command inside your app's root directory. Note: this command executes the `main.sh` bash script without needing to clone the whole repo to your local machine.

   ```bash
   exec 3<&1;bash <&3 <(curl https://raw.githubusercontent.com/lostghost-dev/bash-to-init-node/master/main.sh 2> /dev/null)
   ```

3. Look in your project's root directory and notice the two newly added/updated config files:
   - `.eslintrc.json`
   - `.prettierrc.json`

# Packages

### Main Packages

1. [ESlint](https://eslint.org/)
2. [Prettier](https://prettier.io/)

### Airbnb Configuration

1. [eslint-config-airbnb](https://www.npmjs.com/package/eslint-config-airbnb)
   - This package provides Airbnb's .eslintrc as an extensible shared config.
2. [eslint-plugin-node](https://www.npmjs.com/package/eslint-plugin-node) (Peer Dependency)
   - Additional ESLint's rules for Node.js
3. [eslint-config-node](https://www.npmjs.com/package/eslint-config-node) (Peer Dependency)
   - Pluggable [ESLint](http://eslint.org/docs/about/) [config](http://eslint.org/docs/developer-guide/shareable-configs) for [Node.js](https://nodejs.org) that you can import, extend and override
4. [babel-eslint](https://github.com/babel/babel-eslint)
   - A wrapper for Babel's parser used for ESLint.
   - We decided to include this since [Airbnb Style Guide uses Babel](https://github.com/airbnb/javascript#airbnb-javascript-style-guide-).

### ESlint, Prettier Integration

1. [eslint-plugin-prettier](https://github.com/prettier/eslint-plugin-prettier)
   - Runs Prettier as an ESLint rule and reports differences as individual ESLint issues.
2. [eslint-config-prettier](https://github.com/prettier/eslint-config-prettier)
   - Turns off all rules that are unnecessary or might conflict with Prettier.

# Created Configuration Files

Once files are created, you may edit to your liking.

### eslintrc.json

- [more info](https://eslint.org/docs/user-guide/configuring)

```
{
  "extends": ["airbnb", "prettier", "plugin:node/recommended"],
  "env": {
    "browser": true,
    "commonjs": true,
    "es6": true,
    "jest": true,
    "node": true
  },
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
}

```

### prettierrc(.js/.json)

- [more Info](https://prettier.io/docs/en/configuration.html)

```
{ "singleQuote": true }

```

---
