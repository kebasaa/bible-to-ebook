[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Download and convert bible texts to ebooks

## Introduction

The bible is the most read book on Earth. And while it is widely available, it is sometimes difficult to find a PDF format (or to tweak your own), or an epub for your e-reader. The code in this repository downloads bibles in order to convert them to latex/epub format.

It functions in the following steps:

1. Go to [bible.com](https://www.bible.com) and open your bible and translation of choice. Any passage will do. For example, in the American Standard Version, an example link is: https://www.bible.com/bible/12/DEU.34.ASV From this link, extract the number (here *12*) and the version identifier (here *ASV*) and add them to the file *00_structures/languages_version.xml*. Remove any unwanted versions, otherwise they will all be downloaded sequentially. For the language code *lcode*, preferably use the [ISO 639-3 code](https://en.wikipedia.org/wiki/ISO_639-3) for your language. These codes can easily be found on [Wikipedia](https://www.wikipedia.org/).
2. Run *01_bible_download.ipynb* to download the bible text. It will be saved it to *01_inputs* in csv format
3. Run *02_process.ipynb* to have the files read from *01_inputs* and saved as tex and html documents (output folder: *02_outputs*)
4. Insert the tex or html into your latex or epub template of choice. A basic latex template is provided in *03_templates*.

**Disclaimer on copyright:** Many bible texts are copyrighted, and laws differ in each country. The current repository makes it possible to create your own files for your own private use, but please ensure that copyright is respected. It is your responsibility what you do with your finished ebooks, and distributing them may not be legal. This repository is meant for *private* use.

**Provided bible example:** Only the American Standard Version (1901) is provided as an example as it is free of copyright and available in the public domain.

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

