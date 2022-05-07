FROM ghcr.io/graalvm/native-image:ol8-java17-22.1.0 AS builder

RUN mkdir /source

WORKDIR /source
COPY . .

RUN ./gradlew nativeBuild

FROM debian:11.3-slim
LABEL version="1.0"

COPY --from=builder /source/build/native/nativeCompile/app /app/

WORKDIR /app
ENTRYPOINT ["./app"]
EXPOSE 8080