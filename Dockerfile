# Latest TeX Live (full scheme, rebuilt weekly by the TeX Live team)
FROM texlive/texlive:latest

# Latest pandoc release: https://github.com/jgm/pandoc/releases
ARG PANDOC_VERSION=3.12

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    fonts-jetbrains-mono \
    fonts-inter && \
    curl -fsSL -o /tmp/pandoc.deb \
    "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-$(dpkg --print-architecture).deb" && \
    apt-get install -y /tmp/pandoc.deb && \
    rm -rf /tmp/pandoc.deb /var/lib/apt/lists/*

RUN mkdir -p /usr/share/templates

# Eisvogel 3.5.1, margins changed to 3.5cm
COPY eisvogel.latex /usr/share/templates/the_template.latex

WORKDIR /data

# ENTRYPOINT ["bash"]
ENTRYPOINT ["pandoc", "source.md", "--from", "markdown", "--number-sections", "-V", "lang=fr-FR", "--syntax-highlighting=idiomatic", "--template=/usr/share/templates/the_template.latex", "--pdf-engine=lualatex"]

CMD ["-o", "bin/result.pdf"]
