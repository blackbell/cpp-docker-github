FROM spritsail/alpine-cmake:latest as builder

WORKDIR /app
ADD . /app
RUN mkdir build && cd build && cmake .. && make

FROM alpine:latest as runner
COPY --from=builder /app/build/bin /usr/bin
CMD ["hello_world"]
