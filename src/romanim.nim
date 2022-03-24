#[
  romanim.nim
  Created by Nobuharu Shimazu on 3/24/2022
]#

import tables

const roman*: Table[string, int] = 
  {"I": 1, "IV": 4, "V": 5, "IX": 9, "X": 10, "XL": 40, "L": 50, "XC": 90, "C": 100, "CD": 400, "D": 500, "CM": 900, "M": 1000}.toTable

var isStrict* = false

type NotRomanNumException* = object of CatchableError

proc roman2int*(str: string): int =
  var i = 0;

  while i < len(str):
    if i + 1 < len(str) and roman.hasKey(str[i..i+1]):
      result += roman[str[i..i+1]]
      i += 2
    elif i < len(str) and roman.hasKey($str[i]):
      result += roman[$str[i]]
      i += 1
    else:
      if isStrict:
        raise newException(NotRomanNumException, "Not a Roman numeral")
      else:
        # There's no concept of 0 and negative numbers in Roman numerals
        return -1

proc int2roman*(num: int): int =
  discard

proc isRoman*(str: string): bool =
  discard