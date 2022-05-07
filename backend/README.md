Generate GraalVM Configs:

- sdk install java XX.Y.Z.r${javaV}-grl
- gu install native-image
- ./gradlew install
- export SERVICE_ACCOUNT_JSON=$(cat sa-dev.json); export DRIVE_FOLDER_ID="1xuDn-FFI8tD11q-F2MNtZEd4BjW1cuWK"; export
  JAVA_HOME=~/.sdkman/candidates/java/current; export JAVA_OPTS=-agentlib:native-image-agent=config-output-dir=META-INF/native-image; build/install/run/bin/run
- ./gradlew nativeBuild
- export SERVICE_ACCOUNT_JSON=$(cat sa-dev.json); export DRIVE_FOLDER_ID="1xuDn-FFI8tD11q-F2MNtZEd4BjW1cuWK"; build/native/nativeCompile/run