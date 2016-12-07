FROM operable/elixir:1.3.4-r0

# Setup Operable user. UID/GID default to 60000 but can be overriden.
ARG OPERABLE_UID
ENV OPERABLE_UID ${OPERABLE_UID:-60000}

ARG OPERABLE_GID
ENV OPERABLE_GID ${OPERABLE_UID:-60000}

RUN addgroup -g $OPERABLE_GID operable && \
    adduser -h /home/operable -D -u $OPERABLE_UID -G operable -s /bin/ash operable

RUN mkdir -p /home/operable/template_processors && apk update -U && apk add gcc g++ libstdc++ make
COPY . /home/operable/template_processors

RUN chown -R operable /home/operable

USER operable
RUN cd /home/operable/template_processors && mix local.hex --force && mix local.rebar --force && make ci