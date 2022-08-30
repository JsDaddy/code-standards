## Pre Commit Guide

### Introduction

This pre-commit script makes use of a symlink file in the git registry to target the `pre-commit.bash` file in _/scripts_

To register the symlink, run
`chmod +x scripts/*.bash && ./scripts/install-hooks.bash`
in a terminal in the root directory of the repository. Use a bash terminal for this, powershell typically doesn't work.

The `install-hooks.bash` file should look like this

```
GIT_DIR=$(git rev-parse --git-dir)

echo  "Installing hooks..."
# this command creates symlink to our pre-commit script
ln -s ../../scripts/pre-commit.bash $GIT_DIR/hooks/pre-commit
echo  "Done!"
```

### Sections

1. **Stash**
   The stash section stashes any non-staged files tracked by git.
2. **Import Sorter**
   The import sorter organizes imports across the dart files tracked by git in the repository. It is run multiple times due to the nested nature of our packages. One execution is for the root package, or the workspace. The script then moves into the child package and executes the sorter once more, before stepping out again to the root workspace and staging the changes.
3. **Formatter**
   The formatter lints the project files and stages any changes.
4. **Analyzer**
   The analyzer checks the code for errors and breaches of convention. Any warnings cause the commit to exit and must be dealt with before proceeding. If a warning is idiomatic but not desirable, ignore comments may be generated inline for the reported errors.
5. **Unit Tests**
   The script also executes unit tests using the dart test library, which looks for files with the convention of \*\_test.dart
   We use the convention of \*.\<subextension>.test.dart for test files, which will not be detected by the dart test library. To circumvent this issue, import tests into the /test/widget_test.dart file under an alias and execute the unit test functions in main()
   If no tests are found this will fail, it is recommended to place a generic test within the main function of /test/widget_test.dart such as

```
void  main() {
	test('App starts', () {
		expect(true, true);
	});
}
```