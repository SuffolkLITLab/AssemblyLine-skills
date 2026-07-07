#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y \
  build-essential \
  gcc \
  g++ \
  make \
  ghostscript \
  qpdf \
  tesseract-ocr \
  tesseract-ocr-eng \
  tesseract-ocr-spa \
  poppler-utils \
  libqpdf-dev \
  libjpeg-dev \
  zlib1g-dev \
  libtiff5 \
  libtiff5-dev \
  libleptonica-dev \
  libpng-dev \
  libwebp-dev \
  libopenjp2-7 \
  libopenjp2-7-dev \
  libzbar0 \
  libzbar-dev \
  pngquant \
  unpaper \
  jbig2enc
