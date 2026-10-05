# md to pdf

This is a tool to create reports with markdown it uses LaTex and the Eisgovel template

## Versions

| Component | Version | Update |
|---|---|---|
| TeX Live | latest (`texlive/texlive:latest`, full scheme) | rebuild the image |
| pandoc | 3.12 | `PANDOC_VERSION` in `Dockerfile` |
| [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template/releases) | 3.5.1, margins set to 3.5cm | replace `eisvogel.latex`, then set `margin=3.5cm` again |

For other output formats (e.g. DOCX), override the entrypoint so the LaTeX template is not used: `--entrypoint pandoc`.

## How to compile the image

```
docker build -t mathorck/md-to-pdf .
```

## How to use the container

use the files in the example folder

```
docker run -v ${PWD}:/data mathorck/md-to-pdf -o bin/result.pdf
```

# Credits

[@MrAresInFlesh](https://github.com/MrAresInFlesh) - Who learn me how to use it

[@enhuiz](https://github.com/enhuiz) - template creator