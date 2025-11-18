--Day Two, 18.11.2025
--Variables & Functions: “Garden Health Calculator"
--Declare core variables
local totalTiles = 100
local dirtyTiles = 42
local weeds = 15
local trash = 23 
--Write a function that computes garden health as a percentage:
local function CalculateGardenHealth(total, dirty, weeds, trash)
	local cleantiles = total - (dirty + weeds + trash)
	local health = (cleantiles / total) * 100
	return math.floor(health)
end

--Call and print:
local health = CalculateGardenHealth(totalTiles, dirtyTiles, weeds, trash)
print("Garden Health " .. health .. " % ")

--Add dynamic updates:
local function CleanAction(cleanAmount)
	dirtyTiles -= cleanAmount
	print( cleanAmount .. " tiles cleaned! New Health " .. CalculateGardenHealth(totalTiles, dirtyTiles, weeds, trash) .. " % ")
end

for i = 1, 5 do 
	CleanAction(math.random(1,5))
end




--Challange:
local totalTiless = 200
local dirtyTiless = math.random(10,60)
local weedTiless = math.random(5,25)
local trashTiless = math.random(5,30)

local function GardenHealth(totalTiless, dirtyTiless, weedTiless, trashTiless)
	local dirty = math.max(dirtyTiless, 0)
	local weeds = math.max(weedTiless, 0)
	local trash = math.max(trashTiless, 0)

	local cleanTiless = totalTiless - (dirty + weeds + trash)
	cleanTiless = math.clamp(cleanTiless, 0, totalTiless)

	local health = (cleanTiless / totalTiless) * 100
	return math.floor(health)
end

local function CleanGardenAction()
	local options = {"dirtyTiless", "weedTiless", "trashTiless"}
	local choice = options[math.random(1, #options)]

	local cleaned = math.random(1, 8)

	if choice == "dirtyTiless" then
		dirtyTiless = math.max(dirtyTiless - cleaned, 0)
	elseif choice == "weedTiless" then
		weedTiless = math.max(weedTiless - cleaned, 0)
	elseif choice == "trashTiless" then
		trashTiless = math.max(trashTiless - cleaned, 0)
	end

	print("Cleaned " .. cleaned .. " from " .. choice) 
end

-- Starthealth merken, bevor die Simulation losgeht
local startHealth = GardenHealth(totalTiless, dirtyTiless, weedTiless, trashTiless)
local endHealth = startHealth

for minute = 1, 10 do
	CleanGardenAction()
	endHealth = GardenHealth(totalTiless, dirtyTiless, weedTiless, trashTiless)
	print("Minute " .. minute .. " - Health " .. endHealth .. "%")
end

-- 📈 Verbesserung berechnen
local improvement = endHealth - startHealth

-- 🧠 Condition bestimmen
local condition 
if endHealth < 50 then
	condition = "Terrible"
elseif endHealth < 80 then
	condition = "Improving"
else
	condition = "Beautiful"
end

-- 🪴 Final Evaluation
print("----Garden Summary----")
print("Start Health: " .. startHealth .. "%")
print("End Health: " .. endHealth .. "%")
print("Improvement " .. improvement .. "%")
print("Condition " .. condition)
print("----------------------")

