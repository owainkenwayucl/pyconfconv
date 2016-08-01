#!/usr/bin/env python3
# Simple program to all you to use python config files in other languages.
# Owain Kenway

# Where this is distributed it's done so under the MIT license.

import configparser

# Read in config file and output a bash script
def bashconv(filename, section):
  config = configparser.ConfigParser()
  config.read(filename)

  if section == '':
    for i in config.sections():
      for j in config.options(i):
        print('export ' + i.strip() + '_' + j.strip() + '=' + config.get(i,j).strip())
  else:
    if config.has_section(section):
      for k in config.options(section):
        print('export ' + k.strip() + '=' + config.get(section,k).strip())

# Read in a config file and output an R script.
def rconv(filename, section):
  config = configparser.ConfigParser()
  config.read(filename)

  if section == '':
    for i in config.sections():
      print('# ' + i.strip())
      for j in config.options(i):
        print(i.strip() + '_' + j.strip() + ' <- "' + config.get(i,j).strip() + '"')
  else:
    if config.has_section(section):
      for k in config.options(section):
        print(k.strip() + ' <- "' + config.get(section,k).strip() + '"')


if __name__ == '__main__':
  import argparse, sys

  parser = argparse.ArgumentParser(description='Convert python config files into useful formats.')
  parser.add_argument('-i', metavar='filename', type=str, help='Source file.')
  parser.add_argument('-l', metavar='language', type=str, choices=['bash', 'r'], help='Output language.')
  parser.add_argument('-s', metavar='section', type=str, help='Section to output.')

  args = parser.parse_args()

  if (args.i != None):
    filename = args.i
    lang = 'bash'
    section = ''
    if (args.l != None):
      lang = args.l
    if (args.s != None):
      section = args.s
    
    if lang == 'bash':
      bashconv(filename, section)
    if lang == 'r':
      rconv(filename, section)

  else:
    print('Error - must specify input file.')
    sys.exit(2)
  
