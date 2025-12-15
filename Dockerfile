FROM debian:stable

RUN apt-get update && \
    apt-get install -y texlive-full pandoc fonts-jetbrains-mono

RUN mkdir -p /usr/share/templates

COPY eisvogel.latex /usr/share/templates/the_template.latex

WORKDIR /data

ENTRYPOINT ["pandoc", "--template=/usr/share/templates/the_template.latex", "--pdf-engine=lualatex"]

CMD ["--help"]