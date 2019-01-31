.PHONY=build
NAME = Wallet
WORKSPACE = $(NAME).xcworkspace
PROJECT = $(NAME).xcodeproj
XCODE_VERSION = "$(shell xcodebuild -version 2>/dev/null)"

help: ##Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
count: ##Show line of code count
	cloc "Sources"
setup: ##Setup project
	bash bootstrap.sh
update: ##Update project
	bash bootstrap.sh update
cert: ##Download all certificates from apple
	fastlane setup
synx: ## Create folder for project group
	bundle exec synx $(PROJECT)
clean: ##Remove pods
	pod deintegrate & pod clean
lint: ## Code style autocorrect
	swiftlint autocorrect --config .swiftlintautocorrect.yml
sourcery: ## Code style autocorrect
	sourcery
swiftgen: ## Generate localizable
	swiftgen
format: ## Generate localizable
	swiftformat Sources Frameworks Business --disable fileHeader,blankLinesAroundMark,redundantSelf,unusedArguments
