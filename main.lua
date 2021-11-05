-- https://api.cuberite.org/Writing-a-Cuberite-plugin.html

function Initialize(Plugin)
  Plugin:SetName("CuberiteExamplePlugin")
  Plugin:SetVersion(1)

  LOG("Initialised " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
  return true
end

function OnDisable()
  LOG("Shutting down ...")
end
