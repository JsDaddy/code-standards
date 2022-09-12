# Code standarts for NestJS application

At the start a new project follow the next steps:

## Configure ESLint and Prettier

1. Run **npm install prettier eslint-plugin-prettier eslint-config-prettier eslint --save-dev**
2. Copy [.prettierrc.json](.prettierrc.json) file to your project to root folder
3. Copy [.eslintrc.json](.eslintrc.json) file to your project to root folder
4. Add script - **"lint": "eslint \"{src,apps,libs,test}/\**/*.ts\" --fix"** to [.package.json](.package.json)

## Configure husky pre-commit

1. Run **npm install husky --save-dev**
2. Add script - **"prepare": "husky install"** to [.package.json](.package.json)
3. Run **npm run prepare** after that will be created .husky folder in root project
4. Run **npx husky add .husky/pre-commit "npm lint"** after that will be created file pre-commit in .husky folder.
In this file you can add any scripts what you want

## Configure environment

1. Run **npm i --save @nestjs/config**
2. Add ConfigModule to [./src/app.module.ts](./src/app.module.ts) like in the example
3. Copy [.env](.env) file to your project to root folder and change the secret data to yours

## Configure swagger

1. Run **npm install --save @nestjs/swagger**
2. Сopy the swagger section from the [./src/main.ts](./src/main.ts) file
3. Change the title, description and tag to your own

## Configure database

1. Run **npm install --save @nestjs/typeorm typeorm postgres pg**
1. Copy the entire contents of the folder [./src/database/](./src/database/)
2. Add TypeOrmModule to [./src/app.module.ts](./src/app.module.ts) like in the example

## Configure docker

1. Copy [.docker-compose.yaml.json](.docker-compose.yaml.json) file to your project to root folder
2. Copy the entire contents of the folder [./docker/](./docker/)
3. Copy [.init.sh](.init.sh) file to your project to root folder
4. Start docker with command **COMPOSE_HTTP_TIMEOUT=300 docker-compose --env-file=.env -f docker-compose.yaml up -d --build**
