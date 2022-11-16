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

local function koszones(nev)
    print("Hello", nev)
end

koszones("Peti")

local function trig(x)
    return math.sin(x), math.cos(x)
end

local sin, cos = trig(90)

print(sin)  -- 1
print(cos)  -- 0

local trig2 = function(x)
    return math.tan(x), math.tanh(x)
end


-- [[ TÁBLÁK ]]

local lista_forma = {"egy, ketto", "harom"}

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

local kisbetus_koszono = {
    nev = "Peti",
    koszon = function(k)
        print("cs", k.nev)
    end
}

local nagybetus_koszono = {
    nev = "Pisti",
    koszon = function(k)
        print("SZIAAAA", k.nev)
    end
}

local koszono

koszono = kisbetus_koszono
koszono.koszon(koszono) -- cs Peti

koszono = nagybetus_koszono
koszono.koszon(koszono) -- SZIAAAA Pisti

koszono:koszon()