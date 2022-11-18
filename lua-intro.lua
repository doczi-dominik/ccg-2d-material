-- Egysoros komment

--[[
Többsoros
komment
]]


--[[ VÁLTOZÓK ]]--

-- Globális -- RITKÁN HASZNÁLATOS
-- Bárhonnan elérhető 
Egesz = 5

-- Lokális -- GYAKRAN HASZNÁLATOS
-- Csak abban a fájlban/függvényen/loopban/if-ben ahol deklarálták
local tizedes = 69.420

local szoveg = "aaaaa"
local szoveg2 = 'ez is szoveg, nincs karakter típus'

local lua_a_legjobb = true

local semmi = nil


-- [[ MŰVELETEK (példák) ]]

print(5 + 2)
print(5 - 2)
print(5 * 2)
print(5 / 2)
print(5 % 2)

-- PRIME BULLSHIT NUMERO UNO: Se +=, Se ++, Se a társaik
Egesz = Egesz + 1

-- PRIME BULLSHIT NUMERO DOS: + helyett ..
print("string ".." összefűzés")

-- PRIME BULLSHIT? NUMERO TRES
-- Szöveget csak szöveggel lehet összefűzni, más esetben
-- konvertálni kell tostring()-el
print("Tíz: "..tostring(10))

print(not true)
print(true and true)
print(false or true)


--[[ ELÁGAZÁS ]]

if Egesz % 2 == 0 then
    print("páros")
end

if Egesz == 1 then
    print("egy")
elseif Egesz == 3 then  -- elseif külön kulcszó, csak egybeírva műkszik
    print("három")
end

if szoveg2 ~= "" then  -- PRIME BULLSHIT #4: != helyett ~=
    print("nem üres")
else
    print("üres")
end


-- [[ CIKLUSOK ]]

while false do
    print("soha!!")
end

-- PRIME BULLSHIT (most fr fr) #5
-- Ellentétes do-while
-- C#: Ha a feltétel IGAZ akkor ISMÉTLŐDIK, különben MEGÁLL
-- Lua: Ha a feltétel IGAZ akkor MEGÁLL, különben ISMÉTLŐDIK
repeat
    print("végtelen!!")
until false

for i=1, 11, 2 do
    print(i) -- 1, 3, 5, 7, 9, 11
end


-- [[ FÜGGVÉNYEK  ]]

---Köszön
---@param nev string
local function koszones(nev)
    print("Hello", nev)
end

koszones("Peti")

---@param x number
---@return number
---@return number
local function trig(x)
    return math.sin(x), math.cos(x)
end

local sin, cos = trig(90)

print(sin)  -- 1
print(cos)  -- 0

---@param x number
---@return number
---@return number
local trig2 = function(x)
    return math.tan(x), math.tanh(x)
end


-- [[ TÁBLÁK ]]

local lista_forma = {"egy", "ketto", "harom"}

-- PRIME BULLSHIT #6
-- Indexelés 1-től kezdődik
print(lista_forma[1]) -- egy
print(lista_forma[3]) -- harom

lista_forma[4] = "negy"

print(#lista_forma)  -- 4

for index, ertek in ipairs(lista_forma) do
    print(index, ertek) -- 1 egy
end

local obj_forma = {
    x = 64,
    y = 64,
    szeles = 10,
    magas = 20
}

print(obj_forma.szeles)  -- 10

obj_forma.halott = true

for kulcs, ertek in pairs(obj_forma) do  -- NINCS FIX SORREND
    print("idk")
end

local elbaszott = {
    [false] = "NE",
    ["CSINÁLJ"] = 8.64,
    [0] = "ILYET"
}

print(elbaszott[false])  -- NE


--[[ """" OOP """" ]]

---@class IRajzolhato
---@field rajzol fun(this: IRajzolhato)

---@class Kor : IRajzolhato
---@field x number
---@field y number
---@field r number

---@param x number
---@param y number
---@param r number
---@return Kor
local function UjKor(x, y, r)
    return {
        x = x,
        y = y,
        r = r,
        ---@param this Kor
        rajzol = function(this)
        end
    }
end

---@class Haromszog : IRajzolhato
---@field x1 number
---@field y1 number
---@field x2 number
---@field y2 number
---@field x3 number
---@field y3 number

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
---@return Haromszog
local function UjHaromSzog(x1, y1, x2, y2, x3, y3)
    return {
        x1 = x1,
        y1 = y1,
        x2 = x2,
        y2 = y2,
        x3 = x3,
        y3 = y3,
        ---@param this Haromszog
        rajzol = function(this)
        end
    }
end

---@type IRajzolhato
local rajzolo

rajzolo = UjKor(64, 64, 128)
rajzolo.rajzol(rajzolo)

rajzolo = UjHaromSzog(16, 16, 64, 16, 32, 32)
rajzolo.rajzol(rajzolo)

rajzolo:rajzol()