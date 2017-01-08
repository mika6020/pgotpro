local timsar = {
'❤️😐 PGbot همیشه آنلاینه',
'❤️😐 PGbot همیشه آنلاینه',
},
'local' function run(msg, matches)
if msg.from.id == 274283910 then
local text = timsar[math.random(#timsar)]
return reply_msg(msg.id, text, ok_cb, false)
elseif msg.from.id == 274283910 then
  return "❤️😐 PGbot همیشه آنلاینه"
elseif msg.from.id == 274283910 then
  return "❤️😐 PGbot همیشه آنلاینه"
  elseif msg.from.id == 274283910 then
  return "❤️😐 PGbot همیشه آنلاینه"
  elseif msg.from.id == 274283910 then
  return "❤️😐 PGbot همیشه آنلاینه"
elseif msg.from.id == 274283910 then
  return "❤️😐 PGbot همیشه آنلاینه"
elseif is_admin1(msg) then
 return "❤️😐 PGbot همیشه آنلاینه"
elseif is_owner(msg) then
  return " ❤️😐 PGbot همیشه آنلاینه"
elseif is_momod(msg) then
 return "❤️😐 PGbot همیشه آنلاینه"
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
