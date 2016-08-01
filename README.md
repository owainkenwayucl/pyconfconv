# pyconfconv
Tools for reading python config files into R + bash

## Usage

To install the scripts into your ~/bin directory type:

```none
make install
```

This is not essential, although you need to have <tt>pyconfconv.py</tt> in your $PATH for <tt>pyconfconv.r</tt> to work unmodified.

## At the command-line

```none
$ pyconfconv.py -h
usage: pyconfconv.py [-h] [-i filename] [-l language] [-s section]

Convert python config files into useful formats.

optional arguments:
  -h, --help   show this help message and exit
  -i filename  Source file.
  -l language  Output language.
  -s section   Section to output.
```

If you do not select a section, then section names are used as prefixes for variable names with an underscore separating them.

## From a bash script

To use the bash wrapper, simply source <tt>pyconfconv.sh</tt> with the right arguments, e.g.

```bash
#!/usr/bin/env bash

source `which pyconfconv.sh` examples/config.ini hosts
```

# From an R script

To use the R wrapper, you need to make sure that <tt>pyconfconv.py</tt> is in your $PATH and, source <tt>pyconfconv.r</tt> and then eval either <tt>pyconfconverts(filename, section)</tt> or <tt>pyconfconvert(filename)</tt> depending on whether you want to pull out a section or not.

```r
#!/usr/bin/env Rscript

source("pyconfconv.r")

eval(parse(text=pyconfconverts("examples/config.ini", "hosts")))
```

or for the entire file:

```r
#!/usr/bin/env Rscript

source("pyconfconv.r")

eval(parse(text=pyconfconvert("examples/config.ini")))
```

