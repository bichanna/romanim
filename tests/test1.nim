#[
  test1.nim
  Created by Nobuharu Shimazu on 3/24/2022
]#

import unittest

import romanim
test "Roman -> int":
  romanim.isStrict = false
  check roman2int("III") == 3
  check roman2int("XVII") == 17
  check roman2int("blah blah") == -1

test "int -> Roman":
  check int2roman(1995) == "MCMXCV"
  check int2roman(35) == "XXXV"
  check int2roman(2022) == "MMXXII"