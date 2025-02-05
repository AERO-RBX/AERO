local g={
Baseplate = 4483381587,
}

local function Game(e)
e = e or {}
  if game.PlaceId == e.Game then
    loadstring(game:HttpGet(e.Link))()
  end
end


Game({
	Game = g.Baseplate,
	Link = "https://raw.githubusercontent.com/Lunar-Eclipse111/Swift.LOL/refs/heads/Scripts/Scripts/Universal/Dex"
})
