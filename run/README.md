Generate GraalVM Configs:

- sdk install java XX.Y.Z.r${javaV}-grl
- gu install native-image
- ./gradlew extractGraalTooling
- ./gradlew install
  JAVA_HOME=~/.sdkman/candidates/java/current \
  JAVA_OPTS=-agentlib:native-image-agent=config-output-dir=src/graal \
  build/install/run/bin/run
- ./gradlew nativeImage