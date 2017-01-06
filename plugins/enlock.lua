

do
local function is_en(jtext)
if jtext:match("[A-Z-a-z]") then
return true
end
return false
end
local function pre_process(msg)


    local hash = 'enlock:'..msg.to.id
    if redis:get(hash) and is_en(msg.text) and not is_momod(msg)then
            delete_msg(msg.id, ok_cb, true)
            return "done"
        end
        return msg
    end




local function run(msg, matches)
    chat_id =  msg.to.id

    if is_momod(msg) and matches[1] == 'lock' then


                    local hash = 'enlock:'..msg.to.id
                    redis:set(hash, true)
                    return "قفل زبان انگلیسی فعال شد"
  elseif is_momod(msg) and matches[1] == 'unlock' then
                    local hash = 'enlock:'..msg.to.id
                    redis:del(hash)
                    return "قفل زبان انگلیسی غیر فعال شد"
end

end

return {
    patterns = {
        '^[/!#](lock) (en)$',
        '^[/!#](unlock) (en)$'
    },
    run = run,
    pre_process = pre_process
}
end
