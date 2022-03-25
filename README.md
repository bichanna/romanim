# romanim
 - Converts Roman numerals to what you understand without a blink.
 - Converts what you understand without a blink to Roman numerals.

## Installation
```bash
$ nimble install romanim
```

## Usage
Add romanim to your dependencies:
```
requires "romanim >= 0.1.0"
```

And use it!
```nim
import romanim

echo int2roman(2022)   # MMXXII

echo roman2int("XVI")  # 16

echo isRoman("MV")     # true
```

## License
[MIT](https://github.com/bichanna/romanim/blob/master/LICENSE.txt)