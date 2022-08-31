# Code standarts for Angular application

At the start a new project follow the next steps:

## Configure ESLint and Prettier

1. Run **npm install prettier eslint-plugin-prettier eslint-config-prettier eslint --save-dev**
2. Copy [.prettierrc.json](.prettierrc.json) file to your project to root folder
3. Copy [.eslintrc.json](.eslintrc.json) file to your project to root folder
4. Add script - **"lint": "ng lint"** to [package.json](package.json)

## Configure husky pre-commit

1. Run **npm install husky --save-dev**
2. Add script - **"prepare": "husky install"** to [package.json](package.json)
3. Run **npm run prepare** after that will be created .husky folder in root project
4. Run **npx husky add .husky/pre-commit "npm lint"** after that will be created file pre-commit in .husky folder.
In this file you can add any scripts what you want