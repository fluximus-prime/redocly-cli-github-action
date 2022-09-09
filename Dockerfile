FROM ghcr.io/redocly/redoc/cli:latest

COPY LICENSE README.md /

COPY generate-docs.sh /generate-docs.sh

ENTRYPOINT ["/generate-docs.sh"]
