# md to pdf

This is a tool to create reports with markdown it uses LaTex and the Eisgovel template

## How to compile the image

```
docker build -t mathorck/md-to-pdf .
```

## How to use the container

use the files in the example folder

```
docker run -v ${PWD}:/data mathorck/md-to-pdf -o bin/result.pdf
```