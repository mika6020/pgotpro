local timsar = {
'❤️😐 PGbot همیشه آنلاینه',
'😐❤️مشغولم رییس! ',
},
'local' function run(msg, matches)
if msg.from.id == 274283910 then
local text = timsar[math.random(#timsar)]
return reply_msg(msg.id, text, ok_cb, false)
elseif msg.from.id == 274283910 then
  return "😐 سخت مشغولم!"
elseif msg.from.id == 274283910 then
  return "😐آفلاین بودن به ما نمیاد"
  elseif msg.from.id == 274283910 then
  return "❤️ آنلاینم رییس!"
  elseif msg.from.id == 274283910 then
  return "😐 حواسم به همه چی هست داداچ"
elseif msg.from.id == 274283910 then
  return "😐 آنلاین ترین آنلاین ها منم"
elseif is_admin1(msg) then
 return "❤️😐 PGbot همیشه آنلاینه"
elseif is_owner(msg) then
  return " ❤️😐 هستم خدمتتون!"
elseif is_momod(msg) then
 return "❤️😐 همه چی تحت کنترله رییس"
else
return
end
end
return {
  patterns = {
    "^[!#/]([Pp][Gg])",
    "^[!#/]([Pp][Ii][Nn][Gg])",
    "^[/#!]([Oo][Nn][Ll][Ii][Nn][Ee]?)",
  },
  run = run
}
