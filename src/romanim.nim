#[
  romanim.nim
  Created by Nobuharu Shimazu on 3/24/2022
]#

import tables, re

const roman*: OrderedTable[string, int] = [
  ("M",  1000),
  ("CM", 900),
  ("D",  500),
  ("CD", 400),
  ("C",  100),
  ("XC", 90),
  ("L",  50),
  ("XL", 40),
  ("X",  10),
  ("IX", 9),
  ("V",  5),
  ("IV", 4),
  ("I",  1),
].toOrderedTable

var isStrict* = false

type RomanNumException* = object of CatchableError

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
        raise newException(RomanNumException, "Not Roman numerals: '" & str & "'")
      else:
        return -1

proc int2roman*(num: int): string =
  if num <= 0:
    raise newException(RomanNumException, "Cannot convert 0 or negative numbers to Roman numerals")
  
  var copyNum = num;

  while copyNum > 0:
    for r, n in roman:
      while copyNum >= n:
        result &= r
        copyNum -= n

proc isRoman*(str: string): bool =
  return match(str, re"^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$")