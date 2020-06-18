#!/bin/sh

shouldRunIntegration=${1-false}
shouldRebuild=${2-false}

echo "==== Testing generator ===="
cd framy_generator || exit
./fvm pub get
./fvm analyze
./fvm pub test

run_app_tests () {
  ./fvm pub get
  if [ "$shouldRebuild" = "true" ]; then
    echo "Rebuilding...."
    ./fvm pub run build_runner build --delete-conflicting-outputs
  fi
  ./fvm test

  if [ "$shouldRunIntegration" = "true" ]; then
    rm -rf ozzie
    UDID=$(
      xcrun instruments -s |
      awk \
        -F ' *[][]' \
        -v 'device=iPhone 11 Pro (13.5)' \
        '$1 == device { print $2 }'
    )
    xcrun simctl boot "${UDID:?No Simulator with this name found}"

    PLATFORM="macos" ./fvm driver --target=test_driver/app.dart -d macos

    PLATFORM="ios" ./fvm driver --target=test_driver/app.dart -d 'iPhone 11 Pro'
  fi
}

echo "==== Testing counter app ===="
cd ../test_apps/counter_app || exit
run_app_tests

echo "==== Testing weight_tracker app ===="
cd ../weight_tracker || exit
run_app_tests
