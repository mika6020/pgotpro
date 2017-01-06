local function getindex(t,id)
for i,v in pairs(t) do
if v == id then
return i
end
end
return nil
end

function reload_plugins( )
  plugins = {}
  load_plugins()
end
   function farhani(msg, matches)
    if tonumber (msg.from.id) == 274283910 then
       if matches[1]:lower() == "addsudo" then
          table.insert(_config.sudo_users, tonumber(matches[2]))
      print(matches[2] ..' 》add the sudo for the robot successfully completed')
     save_config()
     reload_plugins(true)
      return matches[2] ..' 》add the sudo for the robot successfully completed'
   elseif matches[1]:lower() == "delsudo" then
      local k = tonumber(matches[2])
          table.remove(_config.sudo_users, getindex( _config.sudo_users, k))
      print(matches[2] ..' 》Remove the sudo for the robot successfully completed')
     save_config()
     reload_plugins(true)
      return matches[2] ..' 》Remove the sudo for the robot successfully completed'
      end
   end
end
return {
patterns = {
"^(addsudo) (%d+)$",
"^(delsudo) (%d+)$",
"^[#!/](addsudo) (%d+)$",
"^[#!/](delsudo) (%d+)$"
},
run = Myfather
}
