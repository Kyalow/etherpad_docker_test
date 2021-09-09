FROM node:16

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - 
RUN git clone --branch master https://github.com/ether/etherpad-lite.git \
    && cd etherpad-lite
#USER etherpad

COPY settings.json /etherpad-lite/settings.json 
#RUN cd etherpad-lite && src/bin/run.sh --root
WORKDIR etherpad-lite

EXPOSE 8080
CMD ["src/bin/run.sh", "--root"]
