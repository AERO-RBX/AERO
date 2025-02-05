local g={
Baseplate = 4483381587,
}

local function Render_Game(e)
e = e or {}
  if game.PlaceId == e.Game then
    loadstring(game:HttpGet(e.Link))()
  end
end
