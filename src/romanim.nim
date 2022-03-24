#[
  romanim.nim
  Created by Nobuharu Shimazu on 3/24/2022
]#

import tables

const roman: Table[string, int] = 
  {"I": 1, "IV": 4, "V": 5, "IX": 9, "X": 10, "XL": 40, "L": 50, "XC": 90, "C": 100, "CD": 400, "D": 500, "CM": 900, "M": 1000}.toTable

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
      break

proc int2roman*(num: int): int =
  discard

proc isRoman*(str: string): bool =
  discard