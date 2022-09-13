# Code standarts for Angular application

At the start a new project follow the next steps:

## Configure ESLint and Prettier

1. Run **npm install prettier eslint-plugin-prettier eslint-config-prettier eslint --save-dev**
2. Copy [.prettierrc.json](.prettierrc.json) file to your project to root folder
3. Add script - **"lint": "ng lint"** to [package.json](package.json)
4. Run **npm run lint** and follow instruction or install those packages in manually

- @angular-eslint/builder
- @angular-eslint/eslint-plugin
- @angular-eslint/eslint-plugin-template
- @angular-eslint/schematics
- @angular-eslint/template-parser
- @typescript-eslint/eslint-plugin
- @typescript-eslint/parser

4. Copy [.eslintrc.json](.eslintrc.json) file to your project to root folder
5. If You installed packages manually you need to add value of properties "lint" and "cli" look the [angular.json](angular.json)

## Configure husky pre-commit

1. Run **npm install husky --save-dev**
2. Add script - **"prepare": "husky install"** to [package.json](package.json)
3. Run **npm run prepare** after that will be created .husky folder in root project
4. Run **npx husky add .husky/pre-commit "npm lint"** after that will be created file pre-commit in .husky folder.
   In this file you can add any scripts what you want
