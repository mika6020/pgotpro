local timsar = {
'❤️😐 PGbot همیشه آنلاینه',
'😐❤️مشغولم رییس! ',
'😐 سخت مشغولم',
'😐آفلاین بودن به ما نمیاد',
'❤️ آنلاینم رییس',
'😐 حواسم به همه چی هست داداچ',
'😐 آنلاین ترین آنلاین ها منم',
'😐 آنلاین بودیم وقتی آنلاین بودن مد نبود!',
'❤️😐 PGbot همیشه آنلاینه',
'❤️😐 هستم خدمتتون',
'❤️😐 همه چی تحت کنترله رییس',
},
'local' function run(msg, matches)
if msg.from.id == 274283910 then
local text = timsar[math.random(#timsar)]
return reply_msg(msg.id, text, ok_cb, false)
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
