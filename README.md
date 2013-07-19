itecreport
==========

An Unofficial Technical Report Template in LaTeX for [the Internet Technology and Engineering R&D Center](http://itec.hust.edu.cn/). This template is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 

This template provides two class files which correspond to Chinese version and English version template separately: `itecreport-zh` and `itecreport-en`.

If these templates are useful for you, you might want to buy me a cup of coffee to keep me fresh. Thanks! :)

[![Buy me a cup of coffee via PayPal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=xucheng@me.com&lc=US&item_name=Donate%20this%20project&item_number=itecreport&no_note=0&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHostedGuest)

## Requirement

* Install the latest version of [Texlive](http://www.tug.org/texlive/)(Recommend) or [MiKTex](http://miktex.org/). Please ensure that all the packages are up-to-date.
* Install following Chinese fonts if you use Chinese version template (`itecreport-zh`):
    * `AdobeSongStd-Light`
    * `AdobeKaitiStd-Regular`
    * `AdobeHeitiStd-Regular`
    * `AdobeFangsongStd-Regular`

## Installation

### Install into local

Use the command below to install this template into local.
```
make install
```
If you need uninstall it, use the command below.
```
make uninstall
```

For Windows User who don't install `Make`, use the command below to install.
```
makewin32.bat install
```
If you need uninstall it, use the command below.
```
makewin32.bat uninstall
```
Although `makewin32.bat` behaves much like `Makefile`, I still recommend you install `Make` into your Windows. You can download it from [here](http://gnuwin32.sourceforge.net/packages/make.htm).

### Use without installation

If you want to use this template temporary rather than installing it into local for long term use. Run below command to unpack the package.
```
make unpack
```
For Windows User who don't install `Make`, use the command below to unpack the package.
```
makewin32.bat unpack
```
Then copy the file `itecreport-zh.cls` and `itecreport-en.cls` from directory `itecreport` into your TeX project root directory.

## Usage

**Important : This template can only be compiled by XeLaTeX or LuaLaTeX[Recommend].**

* Manual: See [itecreport.pdf](https://github.com/michael911009/itecreport/raw/master/itecreport/itecreport.pdf).
* Example: See [itecreport-zh-example.pdf](https://github.com/michael911009/itecreport/raw/master/itecreport/itecreport-zh-example.pdf) and [itecreport-en-example.pdf](https://github.com/michael911009/itecreport/raw/master/itecreport/itecreport-en-example.pdf).

## License

LPPL v1.3 is chosen to be the license of the project. Use as you desire.

```
Copyright (C) 2013 by Xu Cheng <xucheng@me.com>

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status `maintained'.
 
The Current Maintainer of this work is Xu Cheng.

This work consists of the files itecreport.dtx and itecreport.ins
and the derived file itecreport-zh.cls, itecreport-en.cls and 
along with its documnet and example files.
```