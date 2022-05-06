FROM ghcr.io/graalvm/native-image:ol8-java17-22.1.0 AS builder

RUN mkdir /source

WORKDIR /source
COPY . .

RUN ./gradlew nativeBuild

FROM debian:11.3-slim
LABEL version="1.0"

COPY --from=builder /source/build/native/nativeCompile/run /app/
#COPY --from=builder /opt/graalvm-ce-java11-20.3.0/lib/libsunec.so /

#COPY --from=debian:10.2 /usr/lib/x86_64-linux-gnu/libz* /usr/lib/x86_64-linux-gnu/
#COPY --from=debian:10.2 /lib/x86_64-linux-gnu/libz* /lib/x86_64-linux-gnu/

#RUN chmod +x /run
WORKDIR /app
ENTRYPOINT ["./run"]
EXPOSE 8080
CMD ["Hello World from GraalVM native inside Docker."]