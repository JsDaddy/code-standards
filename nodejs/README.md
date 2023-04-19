# Code standarts for NestJS application

At the start a new project follow the next steps:

## Configure ESLint and Prettier

1. Run `npm install prettier eslint-plugin-prettier eslint-config-prettier eslint --save-dev`
2. Copy [./.prettierrc](./.prettierrc) file to your project to root folder
3. Copy [./.eslintrc.js](./.eslintrc.js) file to your project to root folder
4. Add script - `"lint": "eslint \"{src,apps,libs,test}/\**/*.ts\" --fix"` to [./package.json](./package.json)

## Configure husky pre-commit/commitlint

1. Run `npm install husky --save-dev`
2. Add script - `"prepare": "cd .. && husky install nodejs/.husky"` to [./package.json](./package.json)
3. Run `npm run prepare` after that will be created .husky folder in root project
4. Run `npm i --save @commitlint/cli`
5. Copy [./commitlint.config.js](./commitlint.config.js) file to your project to root folder
6. Copy the entire contents of the folder [./.husky/](./.husky/)

## Good practices

1. Check [./good-practices.md](./good-practices.md) for better code