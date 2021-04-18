-------------------------------------------------------------------------------
-- Name:        Vectr2.lua
-- Description: Very simple Lua 2D vector library
-- Author:      Alexandr 'JFAexe' Konichenko
-- Version:     2021.4.18.7
-------------------------------------------------------------------------------

local setmetatable, getmetatable, assert, type, math = setmetatable, getmetatable, assert, type, math
local abs, ceil, floor, atan2 = math.abs, math.ceil, math.floor, math.atan2

local Vectr2, Vectr2Meta = { }, { }

Vectr2._meta = Vectr2Meta
Vectr2._type = 'vectr2'

local function isNumber( n )
    return type( n ) == 'number'
end

local function isTable( t )
    return type( t ) == 'table'
end

local function numAssert( t, a )
    assert( isNumber( t ), '[Vectr2] Wrong type of ' .. a .. ' argument. Expected number, got ' .. type( t ) .. '.' )
end

local function vectrAssert( a )
    assert( Vectr2.isVectr2( a ), '[Vectr2] Wrong type of vectr2 argument. Expected table (vectr2), got ' .. type( a ) .. '.' )
end

local function vectrNumAssert( a, b )
    assert( isNumber( a ) or Vectr2.isVectr2( a ), '[Vectr2] Wrong type of first argument. Expected number or table (vectr2), got ' .. type( a ) .. '.' )
    assert( isNumber( b ) or Vectr2.isVectr2( b ), '[Vectr2] Wrong type of second argument. Expected number or table (vectr2), got ' .. type( b ) .. '.' )
end

local function zeroAssert( a )
    assert( a ~= 0, '[Vectr2] Division by zero.' )
end

function Vectr2.isVectr2( t )
    return isTable( t ) and t[ '__type' ] == Vectr2._type
end

function Vectr2.isVectr2ByMeta( t )
    return getmetatable( t ) == Vectr2._meta
end

Vectr2Meta.__index = Vectr2Meta

function Vectr2Meta:__call( x, y )
    numAssert( x, 'x' )
    numAssert( y, 'y' )

    local _vec = { x = x or 0, y = y or x }

    _vec[ 1 ] = _vec.x
    _vec[ 2 ] = _vec.y

    _vec[ '__type' ] = Vectr2._type

    return setmetatable( _vec, Vectr2Meta )
end

function Vectr2Meta:__add( v )
    vectrNumAssert( self, v )

    local sn, vn = isNumber( self ), isNumber( v )

    return Vectr2( ( sn and self or self.x ) + ( vn and v or v.x ), ( sn and self or self.y ) + ( vn and v or v.y ) )
end

function Vectr2Meta:__sub( v )
    vectrNumAssert( self, v )

    local sn, vn = isNumber( self ), isNumber( v )

    return Vectr2( ( sn and self or self.x ) - ( vn and v or v.x ), ( sn and self or self.y ) - ( vn and v or v.y ) )
end

function Vectr2Meta:__mul( v )
    vectrNumAssert( self, v )

    local sn, vn = isNumber( self ), isNumber( v )

    return Vectr2( ( sn and self or self.x ) * ( vn and v or v.x ), ( sn and self or self.y ) * ( vn and v or v.y ) )
end

function Vectr2Meta:__div( v )
    vectrNumAssert( self, v )
    zeroAssert( v )

    local sn, vn = isNumber( self ), isNumber( v )

    return Vectr2( ( sn and self or self.x ) / ( vn and v or v.x ), ( sn and self or self.y ) / ( vn and v or v.y ) )
end

function Vectr2Meta:__pow( v )
    vectrNumAssert( self, v )

    local sn, vn = isNumber( self ), isNumber( v )

    return Vectr2( ( sn and self or self.x ) ^ ( vn and v or v.x ), ( sn and self or self.y ) ^ ( vn and v or v.y ) )
end

function Vectr2Meta:__mod( v )
    vectrNumAssert( self, v )
    zeroAssert( v )

    local sn, vn = isNumber( self ), isNumber( v )

    return Vectr2( ( sn and self or self.x ) % ( vn and v or v.x ), ( sn and self or self.y ) % ( vn and v or v.y ) )
end

function Vectr2Meta:__unm( )
    return Vectr2( -self.x, -self.y )
end

function Vectr2Meta:__len( )
    return self:len( )
end

function Vectr2Meta:__eq( v )
    vectrAssert( v )

    return self.x == v.x and self.y == v.y
end

function Vectr2Meta:__lt( v )
    vectrAssert( v )

    return self.x < v.x and self.y < v.y
end

function Vectr2Meta:__le( v )
    vectrAssert( v )

    return self.x <= v.x and self.y <= v.y
end

function Vectr2Meta:__tostring( )
    return '[x: ' .. tostring( self.x ) .. ', y: ' .. tostring( self.y ) .. ']'
end

function Vectr2Meta:__concat( v )
    return tostring( self ) .. ' ' .. tostring( v )
end

function Vectr2Meta:copy( )
    return self
end

function Vectr2Meta:set( x, y )
    numAssert( x, 'x' )
    numAssert( y, 'y' )

    self.x, self.y = x and x or self.x, y and y or self.y
end

function Vectr2Meta:unpack( )
    return self.x, self.y
end

function Vectr2Meta:floor( )
    return Vectr2( floor( self.x ), floor( self.y ) )
end

function Vectr2Meta:ceil( )
    return Vectr2( ceil( self.x ), ceil( self.y ) )
end

function Vectr2Meta:abs( )
    return Vectr2( abs( self.x ), abs( self.y ) )
end

function Vectr2Meta:angle( )
    return atan2( self.y, self.x )
end

function Vectr2Meta:scale( s )
    numAssert( s, 'scale' )

    return Vectr2( self.x * s, self.y * s )
end

function Vectr2Meta:cross( v )
    vectrAssert( v )

    return self.x * v.y - self.y * v.x
end

function Vectr2Meta:dot( v )
    vectrAssert( v )

    return self.x * v.x + self.y * v.y
end

function Vectr2Meta:perpDot( v )
    vectrAssert( v )

    return self.x * v.x - self.y * v.y
end

function Vectr2Meta:lenSq( )
    return self.x ^ 2 + self.y ^ 2
end

function Vectr2Meta:len( )
    return self:lenSq( ) ^ 0.5
end

function Vectr2Meta:dist( v )
    vectrAssert( v )

    return ( v - self ):len( )
end

function Vectr2Meta:mid( v )
    vectrAssert( v )

    return self + ( v - self ) * 0.5
end

function Vectr2Meta:normalize( )
    return self / self:len( )
end

function Vectr2Meta:normal( )
    return Vectr2( self.y, -self.x )
end

setmetatable( Vectr2, Vectr2Meta )

Vectr2.ZERO  = Vectr2( 0, 0 )
Vectr2.ONE   = Vectr2( 1, 1 )
Vectr2.UP    = Vectr2( 0, -1 )
Vectr2.DOWN  = Vectr2( 0, 1 )
Vectr2.LEFT  = Vectr2( -1, 0 )
Vectr2.RIGHT = Vectr2( 1, 0 )

return Vectr2