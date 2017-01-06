
do

function run(msg, matches)
       if not is_owner(msg) then
        return "You're Not Allowed!"
       end
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then
        return "First use /newlink or if bot isn't creator user /setlink"
       end
         local text = "*Group link  :\n"..group_link
          send_large_msg('user#id'..msg.from.id, text.."\n", ok_cb, false)
           return "لینک گروه به پی وی شما ارسال شد!"
end

return {
  patterns = {
    "^[/#!]([Ll]inkpv)$",
    "^([Ll]inkpv)$"
  },
  run = run
}

end
