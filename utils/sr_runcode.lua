Runcode = {
	debug = true
}

function Runcode.OutputDebug(message)
	if not Runcode.debug then return end

	print(message)
	AddPlayerChatAll(message)
end

function Runcode.ToggleDebug(player)
	Runcode.debug = not Runcode.debug

	AddPlayerChat("Runcode debug is now ".. Runcode.debug and "enabled" or "disabled")
end
AddCommand("runcodedebug",Runcode.ToggleDebug)

function Runcode.runString(player, commandString)
	local pName = GetPlayerName(player)

	Runcode.OutputDebug(pName.." executed command: "..commandString)

	-- Test with a return value, see if it comes back with load
	local commandFunc, errorMsg = load("return "..commandString)
	if errorMsg then
		-- Command string failed, try without return
		commandFunc, errorMsg = load(commandString)

		-- Check errorMsg again
		if errorMsg then
			return Runcode.OutputDebug("Error: "..errorMsg)
		end
	end

	-- Checks done, execute our function.
	local results = {pcall(commandFunc)}
	if not results[1] then
		return Runcode.OutputDebug("Error: "..results[2])
	end

	local resultsString = ""
	local first = true

	for i=2, #results do
		if first then
			first = false
		else
			resultsString = resultsString..", "
		end

		local resultType = type(results[i])

		resultsString = resultsString .. tostring(results[i]) .. " [ "..resultType.." ] "
	end

	if #results > 1 then
		return Runcode.OutputDebug("Command results: "..resultsString)
	end

	Runcode.OutputDebug("Command Executed!")
end

AddCommand("run",
	function(player,...)
		local commandstring = table.concat({...}, " ")
		return Runcode.runString(player,commandstring)
	end
)