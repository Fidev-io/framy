#!/bin/sh

cd framy_generator
./fvm analyze
./fvm test
cd ../test_apps/counter_app
./fvm test
./fvm driver --target=test_driver/app_bar.dart -d macos