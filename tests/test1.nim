# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

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