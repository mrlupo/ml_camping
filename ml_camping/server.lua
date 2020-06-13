data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('tent')
AddEventHandler('tent', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local count = data.checkItem(_source, "rope")
		local count2 = data.checkItem(_source, "cloth")
		local count3 = data.checkItem(_source, "woodenplanks")
		
        if count >= 1 and count2 >= 2 and count3 >= 2 then
         
            data.delItem(_source,"rope", 1)
            data.delItem(_source,"cloth", 2)
			data.delItem(_source,"woodenplanks", 2)
			TriggerClientEvent("ml_camping:settent", _source)
        else
            TriggerClientEvent("redemrp_notification:start", _source, ' You Are Missing Items', 2)
			TriggerClientEvent("redemrp_notification:start", _source, ' Hint: 1 rope, 2 cloth, 2 wooden planks', 5)
        end    
    
    end)
end)

RegisterServerEvent('campfire')
AddEventHandler('campfire', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local count = data.checkItem(_source, "stones")
		local count2 = data.checkItem(_source, "woodenlogs")
		
        if count >= 1 and count2 >= 2 then
         
            data.delItem(_source,"stones", 1)
            data.delItem(_source,"woodenlogs", 2)
			TriggerClientEvent('ml_camping:setcampfire', _source)
        else
            TriggerClientEvent("redemrp_notification:start", _source, ' You Are Missing Items', 2)
			TriggerClientEvent("redemrp_notification:start", _source, ' Hint: 1 stones, 2 wooden logs', 5)
        end    

    end)
end)

RegisterServerEvent('cauldron')
AddEventHandler('cauldron', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local count = data.checkItem(_source, "cauldron")
		local count2 = data.checkItem(_source, "woodenlogs")

        if count >= 1 and count2 >= 2 then
         
            data.delItem(_source,"cauldron", 1)
            data.delItem(_source,"woodenlogs", 2)
			
			TriggerClientEvent('ml_camping:setcauldron', _source)
        else
            TriggerClientEvent("redemrp_notification:start", _source, ' You Are Missing Items', 2)
			TriggerClientEvent("redemrp_notification:start", _source, ' Hint: 1 cauldron, 2 wooden logs', 5)
        end    
		
    end)
end)

RegisterServerEvent('hitch')
AddEventHandler('hitch', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
   
		local count = data.checkItem(_source, "hitch")

        if count >= 1 then
         
            data.delItem(_source,"hitch", 1)
          TriggerClientEvent('ml_camping:sethitch', _source)
        else
            TriggerClientEvent("redemrp_notification:start", _source, ' You dont have a hitch', 5)
        end     
  
    end)
end)

RegisterServerEvent('table')
AddEventHandler('table', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
   
		local count = data.checkItem(_source, "woodenplanks")

        if count >= 3 then
         
            data.delItem(_source,"woodenplanks", 3)
          TriggerClientEvent('ml_camping:settable', _source)
        else
            TriggerClientEvent("redemrp_notification:start", _source, ' You dont have a wooden planks', 5)
        end     
  
    end)
end)

RegisterServerEvent('chair')
AddEventHandler('chair', function()
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
   
		local count = data.checkItem(_source, "woodenplanks")

        if count >= 3 then
         
            data.delItem(_source,"woodenplanks", 3)
          TriggerClientEvent('ml_camping:setchair', _source)
        else
            TriggerClientEvent("redemrp_notification:start", _source, ' You dont have a wooden planks', 5)
        end     
  
    end)
end)

-- cookfood

RegisterServerEvent('def_cookfood:getmeat')
AddEventHandler("def_cookfood:getmeat", function(name, weapon)
    local _source = tonumber(source)
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local count = data.checkItem(_source, "rawmeat")
		if count >= 1 then
		
			data.delItem(_source,"rawmeat", 1)
			
          TriggerClientEvent('def_cookfood:cookmeat', _source)
		  
          Citizen.Wait(26000)
		  
                data.addItem(_source,"cookedmeat", 1)
                TriggerClientEvent("redemrp_notification:start", source, "Meat was cooked", 2, "success")
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You need: 1 Raw Meat', 3)
        end
    end)
end)

RegisterServerEvent('def_cookfood:getfish')
AddEventHandler("def_cookfood:getfish", function(name, weapon)
    local _source = tonumber(source)
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local count = data.checkItem(_source, "fish")
		if count >= 1 then
		
			data.delItem(_source,"fish", 1)
			
          TriggerClientEvent('def_cookfood:cookfish', _source)
		  
          Citizen.Wait(26000)
		  
                data.addItem(_source,"cookedfish", 1)
                TriggerClientEvent("redemrp_notification:start", source, "Fish was cooked", 2, "success")
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You need: 1 fish', 3)
        end
    end)
end)

RegisterServerEvent('def_cookfood:getwater')
AddEventHandler("def_cookfood:getwater", function(name, weapon)
    local _source = tonumber(source)
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		local count = data.checkItem(_source, "dirtywater")
		if count >= 1 then
		
			data.delItem(_source,"dirtywater", 1)
			
          TriggerClientEvent('def_cookfood:clean', _source)
		  
          Citizen.Wait(26000)
		  
                data.addItem(_source,"water", 1)
                TriggerClientEvent("redemrp_notification:start", source, "Water was cleaned", 2, "success")
        else
            TriggerClientEvent("redemrp_notification:start", _source, 'You need: 1 Dirty water', 3)
        end
    end)
end)


RegisterServerEvent("RegisterUsableItem:emptybottle")
AddEventHandler("RegisterUsableItem:emptybottle", function(source)
    TriggerClientEvent('ml_camping:Getwater', source)
end)


RegisterNetEvent("collect")
AddEventHandler("collect", function()

    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
            data.addItem(source,"dirtywater", 1)
			
    end)
    TriggerClientEvent("redemrp_notification:start",source, "You collected dirty water!", 2)
end)
