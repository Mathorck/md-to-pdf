FROM debian:stable

RUN apt-get update && \
    apt-get install -y texlive-full pandoc fonts-jetbrains-mono

RUN mkdir -p /usr/share/templates

COPY template.tex /usr/share/templates/the_template.tex

WORKDIR /data

ENTRYPOINT ["pandoc", "--template=/usr/share/templates/the_template.tex", "--pdf-engine=lualatex"]

CMD ["--help"]