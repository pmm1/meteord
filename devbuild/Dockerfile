FROM abernix/meteord:base
LABEL maintainer="Jesse Rosenberger"

ARG NODE_VERSION
ENV NODE_VERSION ${NODE_VERSION:-14.17.1}

ONBUILD RUN bash $METEORD_DIR/lib/install_meteor.sh
ONBUILD COPY ./ /app
ONBUILD RUN bash $METEORD_DIR/lib/build_app.sh
