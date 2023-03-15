FROM postgis/postgis:14-3.3

# DL3008: Pin versions in apt get install
# hadolint ignore=DL3008
RUN apt-get update \
      && apt-get install -y --no-install-recommends \
            libtap-parser-sourcehandler-pgtap-perl \
            postgresql-14-pgtap \
      && rm -rf /var/lib/apt/lists/*

COPY ./create_extension.sql /docker-entrypoint-initdb.d/20_pgtap.sql
