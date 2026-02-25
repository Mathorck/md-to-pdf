FROM debian:stable

RUN apt-get update && \
    apt-get install -y \
    texlive \
    texlive-lang-french \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-luatex \
    texlive-xetex \
    pandoc \
    fonts-jetbrains-mono \
    fonts-inter && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/share/templates

COPY eisvogel.latex /usr/share/templates/the_template.latex

WORKDIR /data

# ENTRYPOINT ["bash"]
ENTRYPOINT ["pandoc", "source.md", "--from", "markdown", "--number-sections", "-V", "lang=fr-FR", "--listings", "--template=/usr/share/templates/the_template.latex", "--pdf-engine=lualatex"]

CMD ["-o", "bin/result.pdf"]