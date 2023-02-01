[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Download and convert bible texts to ebooks

## Introduction

The bible is the most read book on Earth. And while it is widely available, it is sometimes difficult to find a PDF format (or to tweak your own), or an epub for your e-reader. The code in this repository downloads bibles in order to convert them to latex/epub format.

It functions in 2 steps:

1. Download the bible text and save it to *01_inputs* in csv format
2. Read from *01_inputs* and save as tex and html documents (folder: *02_outputs*), which can be inserted into any latex or epub template

A basic latex template is provided in *03_templates*.

**Disclaimer on copyright:** Many bible texts are copyrighted, and laws differ in each country. The current repository makes it possible to create your own files for your own private use, but please ensure that copyright is respected. It is your responsibility what you do with your finished ebooks, and distributing them may not be legal. This repository is meant for *private* use.

## Dependencies

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Jupyter Notebook](https://img.shields.io/badge/jupyter-%23FA0F00.svg?style=for-the-badge&logo=jupyter&logoColor=white)
![Pandas](https://img.shields.io/badge/pandas-%23150458.svg?style=for-the-badge&logo=pandas&logoColor=white)

The following python packages are required, beyond the standard that is typically installed:

  - Pandas
  - BeautifulSoup4
  - requests


## License

This software and templates are distributed under the GNU GPL version 3 (see license file).

