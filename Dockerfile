FROM scratch
ADD bin/helloworld /helloworld
EXPOSE 8080
CMD ["/helloworld"]
