# Statically Compiled Go

This is an example showing how you can compile and link a static binary for use in a Docker container fairly easily.
It optionally will build using a docker container as well.

This assumes you are using Go 1.4 (I think it's 1.3 compatible as well, but haven't tested).

The output is a docker container tagged as "$USER/my-docker-image". It is
expected you use this as inspiration and edit it to suit your code / needs.

## Missing parts

This does not provide an opinion on Go project structure / vendoring currently. It might in the future.

There also is likely a better way to handle bundling certs depending on exactly what you're doing.

# LICENSE

Public Domain; if you absolutely need a license you can use it under the Apache 2.0 License as well.
