local timsar = {
'❤️ همیشه آنلاینه PGbot 😐',
'❤️ همیشه آنلاینه PGbot 😐',
},
'local' function run(msg, matches)
if msg.from.id == 274283910 then
local text = timsar[math.random(#timsar)]
return reply_msg(msg.id, text, ok_cb, false)
elseif msg.from.id == 274283910 then
  return "❤️ همیشه آنلاینه PGbot 😐"
elseif msg.from.id == 274283910 then
  return "❤️ همیشه آنلاینه PGbot 😐"
  elseif msg.from.id == 274283910 then
  return "❤️ همیشه آنلاینه PGbot 😐"
  elseif msg.from.id == 274283910 then
  return "❤️ همیشه آنلاینه PGbot 😐"
elseif msg.from.id == 274283910 then
  return "❤️❤️ همیشه آنلاینه PGbot 😐"
elseif is_admin1(msg) then
 return "❤️ همیشه آنلاینه PGbot 😐"
elseif is_owner(msg) then
  return " ❤️ همیشه آنلاینه PGbot 😐"
elseif is_momod(msg) then
 return "❤️ همیشه آنلاینه PGbot 😐"
else
return
end
end
return {
  patterns = {
   "^پينگ",
    "^وضعيت ربات$",
    "^[pP][Ii][Nn][Gg]$",
    "^[!#/]([Pp][Ii][Nn][Gg])",
    "^[/#!]([Oo][Nn][Ll][Ii][Nn][Ee]?)",
  },
  run = run
}
