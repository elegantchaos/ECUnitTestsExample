#!/usr/bin/env bash

base=`dirname $0`

sym="/tmp/ecunittests"
obj="$sym/obj"

rm -rf "$sym"
mkdir -p "$sym"

echo Testing Mac ECUnitTests Examples


xcodebuild -workspace "ECUnitTestsExample.xcworkspace" -scheme "Mac Example" -sdk "macosx" test | "$base/ocunit2junit.rb"

echo Testing iOS ECUnitTests Examples

#xcodebuild -workspace "ECUnitTestsExample.xcworkspace" -scheme "iOS Example" -sdk "iphonesimulator" -arch i386 build test ONLY_ACTIVE_ARCH=NO # | "$base/ocunit2junit.rb"

cd ECUnitTests
xcodebuild -project "ECUnitTests.xcodeproj" -target "ECUnitTestIOS" -arch i386 -sdk "iphonesimulator" build OBJROOT="$obj" SYMROOT="$sym"
cd ../ECUnitTestsExample
xcodebuild -project "ECUnitTestsExample.xcodeproj" -target "iOS Tests" -arch i386 -sdk "iphonesimulator" build OBJROOT="$obj" SYMROOT="$sym" TEST_AFTER_BUILD=YES

#rm -rf "$sym"


