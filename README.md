<div><img width="60%" src="Vectr2.svg?sanitize=true"></div>

Very simple and far from perfect 2D vector lua library.

### Coordinate system
```
       Y
      -1
       │
 -1 ── 0 ── 1 X
       │
       1
```

## Usage
```lua
local Vectr2 = require('vectr2')
```

## Creation
```lua
Vectr2(x, y) --> Vectr2(x, y)
Vectr2(x, _) --> Vectr2(x, x)
Vectr2(_, _) --> Vectr2(0, 0)
Vectr2.ZERO  --> Vectr2(0, 0)
Vectr2.ONE   --> Vectr2(1, 1)
Vectr2.UP    --> Vectr2(0, -1)
Vectr2.DOWN  --> Vectr2(0, 1)
Vectr2.LEFT  --> Vectr2(-1, 0)
Vectr2.RIGHT --> Vectr2(1, 0)
```

## Summation
```lua
vec1 + vec2 --> Vectr2(vec1.x + vec2.x, vec1.y + vec2.y)
vec1 + x    --> Vectr2(vec1.x + x, vec1.y + x)
x + vec1    --> Vectr2(x + vec1.x, x + vec1.y)
```

## Subtraction
```lua
vec1 - vec2 --> Vectr2(vec1.x - vec2.x, vec1.y - vec2.y)
vec1 - x    --> Vectr2(vec1.x - x, vec1.y - x)
x - vec1    --> Vectr2(x - vec1.x, x - vec1.y)
```

## Multiplication
```lua
vec1 * vec2 --> Vectr2(vec1.x * vec2.x, vec1.y * vec2.y)
vec1 * x    --> Vectr2(vec1.x * x, vec1.y * x)
x * vec1    --> Vectr2(x * vec1.x, x * vec1.y)
```

## Division
```lua
vec1 / vec2 --> Vectr2(vec1.x / vec2.x, vec1.y / vec2.y)
vec1 / x    --> Vectr2(vec1.x / x, vec1.y / x)
x / vec1    --> Vectr2(x / vec1.x, x / vec1.y)
```

## Exponentiation
```lua
vec1 ^ vec2 --> Vectr2(vec1.x ^ vec2.x, vec1.y ^ vec2.y)
vec1 ^ x    --> Vectr2(vec1.x ^ x, vec1.y ^ x)
x ^ vec1    --> Vectr2(x ^ vec1.x, x ^ vec1.y)
```

## Remainder of the division
```lua
vec1 % vec2 --> Vectr2(vec1.x % vec2.x, vec1.y % vec2.y)
vec1 % x    --> Vectr2(vec1.x % x, vec1.y % x)
x % vec1    --> Vectr2(x % vec1.x, x % vec1.y)
```

## Comparison
```lua
vec1 < vec2  --> vec1.x < vec2.x and vec1.y < vec2.y
vec1 <= vec2 --> vec1.x <= vec2.x and vec1.y <= vec2.y
vec1 == vec2 --> vec1.x == vec2.x and vec1.y == vec2.y
```

## String
```lua
tostring(vec1) --> '[x: vec1.x, y: vec1.y]'
text .. vec1   --> 'text [x: vec1.x, y: vec1.y]'
```

## Other
```lua
-vec1                    --> negative vec1
#vec1                    --> length of vec1 (lua 5.2+ I guess)
Vectr2.isVectr2(t)       --> true if t is table and has vectr2 __type
Vectr2.isVectr2ByMeta(t) --> true if t's metatable is same as Vectr2's metatable
Vectr2._meta             --> Vectr2 Metatable if needed
```

## Methods
```lua
vec1:copy()        --> copy of vec1
vec1:set(x, y)     --> sets x and y of vec1 (nil values will be ignored and not set)
vec1:unpack()      --> vec1.x and vec1.y
vec1:floor()       --> floors vec1
vec1:ceil()        --> ceils vec1
vec1:abs()         --> abs of vec1
vec1:angle()       --> vec1 angle
vec1:scale(x)      --> scales vec1
vec1:cross(vec2)   --> cross product of vec1 and vec2
vec1:dot(vec2)     --> dot product of vec1 and vec2
vec1:perpDot(vec2) --> perp dot product of vec1 and vec2
vec1:lenSq()       --> squared length of vec1
vec1:len()         --> length of vec1
vec1:dist(vec2)    --> distance between vec1 and vec2
vec1:mid(vec2)     --> middle of vec1 and vec2
vec1:normalize()   --> normalized copy of vec1
vec1:normal()      --> normal of vec1
```

Currently no lua 5.3+ functions.

## License
[MIT](LICENSE)
