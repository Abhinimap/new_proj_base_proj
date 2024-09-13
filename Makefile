.PHONY: gen genAll rebuild check get localize runDev runDevQa runDevStaging lines release apk

initial_setup_commands:
	flutter clean
	flutter packages pub get
	dart run build_runner build --delete-conflicting-outputs
	fluttergen -c pubspec.yaml

run_build_runner:
	dart run build_runner build

clean_project:
	flutter clean
	flutter packages pub get

set_icon:
	dart run flutter_launcher_icons

# clean project, install dependencies & generate sources
rebuild:
	flutter clean
	flutter packages pub get
	dart run build_runner build --delete-conflicting-outputs
	fluttergen -c pubspec.yaml

# generate image assets, colors, fonts
gen:
	flutter packages pub run build_runner build --delete-conflicting-outputs
	fluttergen -c pubspec.yaml

generate_app_bundle:
	flutter build appbundle --release --obfuscate --split-debug-info --debug-info-file=debug_info.sym

generate_apk:
	flutter build apk --release --obfuscate --split-debug-info --debug-info-file=debug_info.sym

lines:
	find . -name '*.dart' | xargs wc -l

## flavors
runDev:
	flutter run --flavor dev -t lib/main_dev.dart
runProd:
	flutter run --flavor dev -t lib/main.dart
#
#runDevQa:
#	#flutter run --flavor dev -t lib/main_qa.dart
#
#runDevStaging:
#	#flutter run --flavor dev -t lib/main_staging.dart
#
#release:
#	#flutter run --release -t lib/main_release.dart
#
#prodRelease:
#	#flutter run --flavor prod --release -t lib/main_release.dart


# push code

m ?= "UPDATE"
# use make gitacp for adding all,commiting and pushing in one go
# make gitacp m="commit message"

gitacp:
	git add . && git commit -m "$(m)" && git push

