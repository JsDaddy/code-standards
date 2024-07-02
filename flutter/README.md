# Code standards for Flutter application

To start a new project with the specified coding standards, follow these steps:

1. **Add `jsdaddy_custom_lints` to your `pubspec.yaml` file:**

   ```yaml
   dev_dependencies:
     jsdaddy_custom_lints:
       git:
         url: https://github.com/JsDaddy/dart-linter-rules
   ```

2. **Add `commitlint_cli` to your `pubspec.yaml` file:**

   - [commitlint_cli](https://pub.dev/packages/commitlint_cli)

3. **Copy Configuration Files:**

   - Copy [analysis_options.yaml](analysis_options.yaml) to the root folder of your project.
   - Copy the [hooks](.github/hooks/) and [scripts](.github/scripts/) folders to the `.github` folder.
   - Copy [commitlint.yaml](commitlint.yaml) to the root folder of your project.

4. **Set Up Git Hooks:**

   - Run the following command to set up the hooks:

   ```
   chmod +x .github/scripts/* && .github/scripts/setup_hooks.sh
   ```

## Commitlint

Commitlint ensures that your commit messages adhere to the [conventional commit format](https://conventionalcommits.org/).

### Commit Message Format

The general pattern for a commit message looks like this:

```
type(scope): subject
```

### Common Types

- **build**: Changes that affect the build system or external dependencies
- **chore**: Other changes that don't modify src or test files
- **ci**: Changes to our CI configuration files and scripts
- **docs**: Documentation only changes
- **feat**: A new feature
- **fix**: A bug fix
- **perf**: A code change that improves performance
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **revert**: Reverts a previous commit
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- **test**: Adding missing tests or correcting existing tests
