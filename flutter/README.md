# Code standarts for Flutter application

On start new project follow the next steps:

1. Add `jsdaddy_custom_lints` to your `pubspec.yaml` file:
```yaml
dev_dependencies:
  jsdaddy_custom_lints:
    git:
        url: https://github.com/JsDaddy/dart-linter-rules
```
1. Copy [analysis_options.yaml](analysis_options.yaml) to your project to root folder.
2. Copy [scripts](scripts) folder to your project to root folder
3. Follow these instructions [pre-commit.md](scripts/pre-commit.md) to install `pre-commit` hook
