--ml
local Keys = {
    ["R"] = 0xE30CD707,["Q"] = 0xDE794E3E,["O"] = 0xF1301666,["X"] = 0x8CC9CD42,
}
local campfire = 0
local tent = 0
local cauldron = 0
local hitch = 0
local Table = 0
local chair = 0

local WaterTypes = {
    [1] =  {["name"] = "Sea of Coronado",       ["waterhash"] = -247856387, ["watertype"] = "lake"},
    [2] =  {["name"] = "San Luis River",        ["waterhash"] = -1504425495, ["watertype"] = "river"},
    [3] =  {["name"] = "Lake Don Julio",        ["waterhash"] = -1369817450, ["watertype"] = "lake"},
    [4] =  {["name"] = "Flat Iron Lake",        ["waterhash"] = -1356490953, ["watertype"] = "lake"},
    [5] =  {["name"] = "Upper Montana River",   ["waterhash"] = -1781130443, ["watertype"] = "river"},
    [6] =  {["name"] = "Owanjila",              ["waterhash"] = -1300497193, ["watertype"] = "river"},
    [7] =  {["name"] = "HawkEye Creek",         ["waterhash"] = -1276586360, ["watertype"] = "river"},
    [8] =  {["name"] = "Little Creek River",    ["waterhash"] = -1410384421, ["watertype"] = "river"},
    [9] =  {["name"] = "Dakota River",          ["waterhash"] = 370072007, ["watertype"] = "river"},
    [10] =  {["name"] = "Beartooth Beck",       ["waterhash"] = 650214731, ["watertype"] = "river"},
    [11] =  {["name"] = "Lake Isabella",        ["waterhash"] = 592454541, ["watertype"] = "lake"},
    [12] =  {["name"] = "Cattail Pond",         ["waterhash"] = -804804953, ["watertype"] = "lake"},
    [13] =  {["name"] = "Deadboot Creek",       ["waterhash"] = 1245451421, ["watertype"] = "river"},
    [14] =  {["name"] = "Spider Gorge",         ["waterhash"] = -218679770, ["watertype"] = "river"},
    [15] =  {["name"] = "O'Creagh's Run",       ["waterhash"] = -1817904483, ["watertype"] = "lake"},
    [16] =  {["name"] = "Moonstone Pond",       ["waterhash"] = -811730579, ["watertype"] = "lake"},
    [17] =  {["name"] = "Roanoke Valley",       ["waterhash"] = -1229593481, ["watertype"] = "river"},
    [18] =  {["name"] = "Elysian Pool",         ["waterhash"] = -105598602, ["watertype"] = "lake"},
    [19] =  {["name"] = "Heartland Overflow",   ["waterhash"] = 1755369577, ["watertype"] = "swamp"},
    [20] =  {["name"] = "Lagras",               ["waterhash"] = -557290573, ["watertype"] = "swamp"},
    [21] =  {["name"] = "Lannahechee River",    ["waterhash"] = -2040708515, ["watertype"] = "river"},
    [22] =  {["name"] = "Dakota River",         ["waterhash"] = 370072007, ["watertype"] = "river"},
}


Citizen.CreateThread(function()
	local sexe =  IsPedMale(PlayerPedId())
    local checkbox2 = false
    WarMenu.CreateMenu('ml', "camp")
    WarMenu.SetSubTitle('ml', 'camping menu')
	
    WarMenu.CreateSubMenu('inv1', 'ml', 'set')
	WarMenu.CreateSubMenu('inv2', 'ml', 'del')
	WarMenu.CreateSubMenu('inv3', 'ml', 'del full')


    while true do

        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())
		local sexe =  IsPedMale(PlayerPedId())
		
        if WarMenu.IsMenuOpened('ml') then
		
		if WarMenu.MenuButton('camp set', 'inv1') then
            end
		if WarMenu.MenuButton('camp del', 'inv2') then
            end	
		if WarMenu.MenuButton('full camp del', 'inv3') then
            end	

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('inv1') then

            if WarMenu.Button('set campfire') then
		
		TriggerServerEvent("campfire", function()  --check/del campfire items
			end)
			
		elseif WarMenu.Button('set tent') then
		
		TriggerServerEvent("tent", function()  --check/del tent items
			end)
			
		elseif WarMenu.Button('set cauldron') then 
		
		TriggerServerEvent("cauldron", function()  --check/del cauldron items
			end)
		
		elseif WarMenu.Button('set hitch') then
		
		TriggerServerEvent("hitch", function()  --check/del hitch items
			end)
		
		elseif WarMenu.Button('set table') then
		
		TriggerServerEvent("table", function()  --check/del table items
			end)
		
		elseif WarMenu.Button('set chair') then
		
		TriggerServerEvent("chair", function()  --check/del chair items
			end)
       
            end

            WarMenu.Display()
			
		elseif WarMenu.IsMenuOpened('inv2') then
		if WarMenu.Button('del campfire') then
		TriggerEvent("ml_camping:delcampfire")
		
		elseif WarMenu.Button('del tent') then
		TriggerEvent("ml_camping:deltent")
		
		elseif WarMenu.Button('del cauldron') then 
		TriggerEvent("ml_camping:delcauldron")
		
		elseif WarMenu.Button('del hitch') then
		TriggerEvent("ml_camping:delhitch")
		
		elseif WarMenu.Button('del table') then
		TriggerEvent("ml_camping:deltable")
		
		elseif WarMenu.Button('del chair') then
		TriggerEvent("ml_camping:delchair")
	
       
            end

            WarMenu.Display()
			
			elseif WarMenu.IsMenuOpened('inv3') then
		if WarMenu.Button('del full camp') then
		TriggerEvent("ml_camping:delfullcamp")


			end

            WarMenu.Display()

       -- elseif whenKeyJustPressed(keys["J"]) then 
         --   WarMenu.OpenMenu('ml')
        end
		
	
        Citizen.Wait(0)
    end
end)

--setting 
RegisterCommand("setcamp", function(source, args, rawCommand) -- craft COMMAND
local _source = source

	WarMenu.OpenMenu('ml')

end, false)

RegisterNetEvent('ml_camping:setcampfire')
AddEventHandler('ml_camping:setcampfire', function()
if campfire ~= 0 then
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        campfire = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Creating Camp")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("p_campfire02x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    campfire = prop

end)

RegisterNetEvent('ml_camping:settent')
AddEventHandler('ml_camping:settent', function()
 if tent ~= 0 then
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Colocando tienda")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("mp005_s_posse_tent_bountyhunter07x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    tent = prop

end)

RegisterNetEvent('ml_camping:setcauldron')
AddEventHandler('ml_camping:setcauldron', function()
if cauldron ~= 0 then
        SetEntityAsMissionEntity(cauldron)
        DeleteObject(cauldron)
        cauldron = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Settting food pot")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("S_CAMPFIRECOMBINED01X"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    cauldron = prop

end)

RegisterNetEvent('ml_camping:sethitch')
AddEventHandler('ml_camping:sethitch', function()
if hitch ~= 0 then
        SetEntityAsMissionEntity(hitch)
        DeleteObject(hitch)
        hitch = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "setting hitch")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("P_HITCHINGPOST05X"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    hitch = prop

end)

RegisterNetEvent('ml_camping:settable')
AddEventHandler('ml_camping:settable', function()
if Table ~= 0 then
        SetEntityAsMissionEntity(Table)
        DeleteObject(Table)
        Table = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Setting table")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("S_BFTABLE01X"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    Table = prop

end)

RegisterNetEvent('ml_camping:setchair')
AddEventHandler('ml_camping:setchair', function()
if chair ~= 0 then
        SetEntityAsMissionEntity(chair)
        DeleteObject(chair)
        chair = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Setting Chair")
    Citizen.Wait(30000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("P_WOODENCHAIR01X"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    chair = prop

end)

--deleting

RegisterNetEvent('ml_camping:delcampfire')
AddEventHandler('ml_camping:delcampfire', function()
if campfire == 0 then
        print("There is no campfire.")
    else
        SetEntityAsMissionEntity(campfire)
        DeleteObject(campfire)
        campfire = 0
    end

end)

RegisterNetEvent('ml_camping:deltent')
AddEventHandler('ml_camping:deltent', function()
if tent == 0 then
        print("There is no tent.")
    else
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end

end)

RegisterNetEvent('ml_camping:delcauldron')
AddEventHandler('ml_camping:delcauldron', function()
if cauldron == 0 then
        print("There is no cauldorn.")
    else
        SetEntityAsMissionEntity(cauldron)
        DeleteObject(cauldron)
        cauldron = 0
    end

end)

RegisterNetEvent('ml_camping:delhitch')
AddEventHandler('ml_camping:delhitch', function()
if hitch == 0 then
        print("There is no hitch.")
    else
        SetEntityAsMissionEntity(hitch)
        DeleteObject(hitch)
        hitch = 0
    end

end)

RegisterNetEvent('ml_camping:deltable')
AddEventHandler('ml_camping:deltable', function()
if Table == 0 then
        print("There is no table.")
    else
        SetEntityAsMissionEntity(Table)
        DeleteObject(Table)
        Table = 0
    end

end)

RegisterNetEvent('ml_camping:delchair')
AddEventHandler('ml_camping:delchair', function()
if chair == 0 then
        print("There is no chair.")
    else
        SetEntityAsMissionEntity(chair)
        DeleteObject(chair)
        chair = 0
    end

end)

-- deleting all

RegisterNetEvent('ml_camping:delfullcamp')
AddEventHandler('ml_camping:delfullcamp', function()

TriggerEvent("ml_camping:delcampfire")

Citizen.Wait(0)

TriggerEvent("ml_camping:deltent")

Citizen.Wait(0)

TriggerEvent("ml_camping:delcauldron")

Citizen.Wait(0)

TriggerEvent("ml_camping:delhitch")

Citizen.Wait(0)

TriggerEvent("ml_camping:deltable")

Citizen.Wait(0)

TriggerEvent("ml_camping:delchair")

end)


RegisterNetEvent('ml_camping:Getwater')
AddEventHandler('ml_camping:Getwater', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local Water = Citizen.InvokeNative(0x5BA7A68A346A5A91,coords.x+3, coords.y+3, coords.z)
    local canCollect = false
    for k,v in pairs(WaterTypes) do 
        if Water == WaterTypes[k]["waterhash"]  then
            canCollect = true           
            break            
        end
    end
    if canCollect then
         TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 27000, true, false, false, false)
		exports['progressBars']:startUI(27000, "Collecting water...")
		Citizen.Wait(27000)

        ClearPedTasksImmediately(ped)
        ClearPedSecondaryTask(ped)
        
            TriggerServerEvent("collect")
      
    else
        Citizen.Wait(2000)
        TriggerEvent("redemrp_notification:start", "You can't collect water here!", 3)
    end
end)

--cookfood

Citizen.CreateThread(function()
    WarMenu.CreateMenu('campfire', "prepare food")
    WarMenu.SetSubTitle('campfire', 'prepare food')
    WarMenu.CreateSubMenu('cook', 'campfire', 'cook food')
	WarMenu.CreateSubMenu('cook1', 'campfire', 'Liquids')
  

    while true do

        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(PlayerPedId())

        if WarMenu.IsMenuOpened('campfire') then
            if WarMenu.MenuButton('Cook Food', 'cook') then
            end
			if WarMenu.MenuButton('Liquids', 'cook1') then
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('cook') then
            
            if WarMenu.Button('Cook Raw Meat') then
                       TriggerServerEvent("def_cookfood:getmeat")
					   WarMenu.CloseMenu() 
			elseif WarMenu.Button('Cook Fish') then
                       TriggerServerEvent("def_cookfood:getfish")
					   WarMenu.CloseMenu() 
 
			end
   
            WarMenu.Display()
		elseif WarMenu.IsMenuOpened('cook1') then
            
            if WarMenu.Button('Clean Dirty Water') then
                       TriggerServerEvent("def_cookfood:getwater")
					   WarMenu.CloseMenu() 
 
			end
   
            WarMenu.Display()	
		
        end
        Citizen.Wait(0)
    end
end)

local Gedrukt = false

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
        local craftObject = GetClosestObjectOfType(pos, 2.0, GetHashKey("p_campfire02x"), false, false, false)
        if craftObject ~= 0 then
            local objectPos = GetEntityCoords(craftObject)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, objectPos.x, objectPos.y, objectPos.z, true) < 2.5 then
                awayFromObject = false
                DrawText3D(objectPos.x, objectPos.y, objectPos.z, "~g~R~w~ - Cook Food")
                if IsControlJustReleased(0, Keys["R"]) and Gedrukt == false then
                    Gedrukt = true
					WarMenu.OpenMenu('campfire')
                    --TriggerServerEvent('ec-menu:server:hasmeat')
                end
				Gedrukt = false
            end
        end
        if awayFromObject then
            Wait(1000)
			
        end
    end
end)

 local cookMeat = false
 local cleanWater = false
 local cookFish = false

RegisterNetEvent('def_cookfood:cookmeat')
AddEventHandler('def_cookfood:cookmeat', function()
	
    local playerPed = PlayerPedId()
	cookMeat = true  
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 27000, true, false, false, false)
    exports['progressBars']:startUI(27000, "Cooking meat...")
    Citizen.Wait(27000)
    ClearPedTasksImmediately(PlayerPedId())

end)

RegisterNetEvent('def_cookfood:clean')
AddEventHandler('def_cookfood:clean', function()

    local playerPed = PlayerPedId()
	cleanWater = true
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 27000, true, false, false, false)
    exports['progressBars']:startUI(27000, "Cleaning water...")
    Citizen.Wait(27000)
    ClearPedTasksImmediately(PlayerPedId())

end)

RegisterNetEvent('def_cookfood:cookfish')
AddEventHandler('def_cookfood:cookfish', function()
	
    local playerPed = PlayerPedId()
	local cookFish = true
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 27000, true, false, false, false)
    exports['progressBars']:startUI(27000, "Cooking fish...")
    Citizen.Wait(27000)
    ClearPedTasksImmediately(PlayerPedId())

end)


function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    local factor = (string.len(text)) / 150
    DrawSprite("generic_textures", "hud_menu_4a", _x, _y+0.0125,0.015+ factor, 0.03, 0.1, 100, 1, 1, 190, 0)
end

function ShowPrompt(msg)
    SetTextScale(0.5, 0.5)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end