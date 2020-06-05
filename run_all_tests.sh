#!/bin/sh

cd framy_generator
./fvm analyze
./fvm pub test
cd ../test_apps/counter_app
#./fvm pub run build_runner build --delete-conflicting-outputs
./fvm test
rm -rf ozzie
./fvm driver --target=test_driver/app_bar.dart -d macos
./fvm driver --target=test_driver/fonts_page.dart -d macos