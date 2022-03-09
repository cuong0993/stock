#!/bin/bash

find . -name "*.g.dart" -type f -delete
find . -name "*.gr.dart" -type f -delete
find . -name "*.freezed.dart" -type f -delete
find . -name "*.config.dart" -type f -delete

(
	flutter packages pub run build_runner build --delete-conflicting-outputs
)
(
	cd data || exit
	flutter packages pub run build_runner build --delete-conflicting-outputs
)
(
	cd application || exit
	flutter packages pub run build_runner build --delete-conflicting-outputs
)
(
	cd domain || exit
	flutter packages pub run build_runner build --delete-conflicting-outputs
)
