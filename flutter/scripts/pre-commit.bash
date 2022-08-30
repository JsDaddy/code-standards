# To avoid running this pre-commit simply write your commit like:
# git commit -m "test commit" --no-verify
# with the --no-verify flag being the operative addition

printf "\e[33;1m%s\e[0m\n" 'Pre-Commit'

# Undo the stash of the files
pop_stash_files () {
	if [ -n "$hasChanges" ]; then
		printf "\e[33;1m%s\e[0m\n" '=== Applying git stash changes ==='
		git stash pop
	fi
}

# Stash unstaged files
hasChanges=$(git diff)
if [ -n "$hasChanges" ]; then
	printf "\e[33;1m%s\e[0m\n" 'Stashing unstaged changes'
	git stash push --keep-index
fi

# Flutter import sorter
printf "\e[33;1m%s\e[0m\n" '=== Running Flutter import sorter ==='
flutter pub run import_sorter:main
hasNewFilesSorted=$(git diff)
if [ -n "$hasNewFilesSorted" ]; then
	git add .
	printf "\e[33;1m%s\e[0m\n" 'Sorted imports added to git stage'
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Flutter import sorter'
printf '%s\n' "${avar}"

# Flutter formatter
printf "\e[33;1m%s\e[0m\n" '=== Running Flutter formatter ==='
flutter format .

hasNewFilesFormatted=$(git diff)
if [ -n "$hasNewFilesFormatted" ]; then
	git add .
	printf "\e[33;1m%s\e[0m\n" 'Formatted files added to git stage'
fi
printf "\e[33;1m%s\e[0m\n" 'Finished running Flutter Formatter'
printf '%s\n' "${avar}"

# Flutter Analyzer
printf "\e[33;1m%s\e[0m\n" '=== Running Flutter analyzer'
flutter analyze

if [ $? -ne 0 ]; then
	printf "\e[31;1m%s\e[0m\n" '=== Flutter analyzer error ==='
	pop_stash_files
	exit 1
fi

printf "\e[33;1m%s\e[0m\n" 'Finished running Flutter analyzer'
printf '%s\n' "${avar}"

# Unit tests
printf "\e[33;1m%s\e[0m\n" '=== Running Unit Tests ==='
flutter test -r expanded

if [ $? -ne 0 ]; then
	printf "\e[31;1m%s\e[0m\n" '=== Unit tests error ==='
	pop_stash_files
	exit 1
fi

printf "\e[33;1m%s\e[0m\n" 'Finished running Unit Tests'
printf '%s\n' "${avar}"

pop_stash_files

printf "\e[33;1m%s\e[0m\n" 'Finished all tasks'
