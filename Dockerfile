FROM node:16

#RUN groupadd --system ${EP_GID:+--gid "{$EP_GID}" --non-unique} etherpad && \
#	useradd --system ${EP_UID:+--uid "{EP_UID}" --non-unique} --gid etherpad \
#	${EP_HOME:+--home-dir "${EP_HOME}"} --create-home \
#	${EP_SHELL:+--shell "${EP_SHELL}"} etherpad

#ARG EP_DIR=/opt/etherpad-lite
#RUN mkdir -p "${EP_DIR}" && chown etherpad:etherpad "${EP_DIR}"

#ENTRYPOINT ["/bin/sh", "/usr/bin/apt"]

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - 
RUN git clone --branch master https://github.com/ether/etherpad-lite.git \
    && cd etherpad-lite
#USER etherpad
 
#RUN cd etherpad-lite && src/bin/run.sh --root
WORKDIR etherpad-lite

EXPOSE 8080
CMD ["src/bin/run.sh", "--root"]
