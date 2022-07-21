Generate GraalVM Configs:

- sdk install java XX.Y.Z.r${javaV}-grl
- gu install native-image
- ./gradlew install
- export SERVICE_ACCOUNT_JSON=$(cat sa-dev.json); export
  JAVA_HOME=~/.sdkman/candidates/java/current; export JAVA_OPTS=-agentlib:native-image-agent=config-output-dir=META-INF/native-image; build/install/app/bin/app
- ./gradlew nativeBuild
- export SERVICE_ACCOUNT_JSON=$(cat sa-dev.json); build/native/nativeCompile/app
