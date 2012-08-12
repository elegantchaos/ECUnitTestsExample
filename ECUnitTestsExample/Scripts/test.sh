#!/usr/bin/env bash

echo Testing Mac ECUnitTestsExample

base=`dirname $0`
source "$base/test-common.sh"

xcodebuild -workspace "ECUnitTestsExample.xcworkspace" -scheme "ECUnitTestsExample" -sdk "$testSDKMac" test | "$base/$testConvertOutput"
