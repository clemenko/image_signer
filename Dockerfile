FROM alpine as build
RUN apk -U add docker

FROM alpine
LABEL maintainer="clemenko@docker.com", \
      org.label-schema.vcs-url="https://github.com/clemenko/image_signer", \
      org.label-schema.docker.cmd="docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v ~/.docker/:~/.docker/ clemenko/signer"
RUN apk -U upgrade && apk add --no-cache curl py2-pip bash vim &&\
    pip install --no-cache-dir --upgrade pip requests &&\
    pip install --no-cache-dir flask &&\
    rm -rf /var/cache/apk/*

COPY --from=build /usr/bin/docker /usr/bin/
WORKDIR /code
ADD . /code
EXPOSE 5000
CMD ["python", "hook.py"]
