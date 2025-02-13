local Games = loadstring(game:HttpGet(""))() -- nil, waiting for first script release

for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
	else
	error("No Game Found");
    end
end
