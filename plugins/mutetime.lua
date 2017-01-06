local function mute_time(chid)
  local secs
  local mstarth = 'mstarth:'..chid
  local mstartm = 'mstartm:'..chid
  local mendh = 'mendh:'..chid
  local mendm = 'mendm:'..chid
  if redis:get(mstarth) and redis:get(mstartm) and redis:get(mendh) and redis:get(mendm) then
  local sh = tonumber(redis:get(mstarth))
  local sm = tonumber(redis:get(mstartm))
  local eh = tonumber(redis:get(mendh))
  local em = tonumber(redis:get(mendm))
  if sh == eh then
  if em >= sm then
  secs = (em - sm) * 60
elseif em < sm then
  secs = 24 * 3600 + em - sm
end
elseif sh < eh then
secs = 3600 * eh + 60 * em - 3600 * sh - 60 * sm
elseif eh < sh then
secs = 24 * 3600  + 3600 * eh + 60 * em - 3600 * sh - 60 * sm
end
else
return nil
end
return secs
end
local function is_mtime(chid)
  local secs
  local mstarth = 'mstarth:'..chid
  local mstartm = 'mstartm:'..chid
  local mendh = 'mendh:'..chid
  local mendm = 'mendm:'..chid
  if redis:get(mstarth) and redis:get(mstartm) and redis:get(mendh) and redis:get(mendm) then
  local sh = tonumber(redis:get(mstarth))
  local sm = tonumber(redis:get(mstartm))
  local eh = tonumber(redis:get(mendh))
  local em = tonumber(redis:get(mendm))
  local nm = tonumber(os.date("%M", os.time()))  
  local nh = tonumber(os.date("%H", os.time()))
  if sh == eh then
  if not nh == sh then
  return false
  end
  if em >= sm then
  if em >= nm and nm >= sm then
  return true
  end
 elseif em < sm then
  if em<nm<sm then
    return false
  end
  return true
end
elseif sh < eh then
if sh <= nh <=nh then
  if sh == nh then
    if nm >= sm then
      return true
    end
    return false
  end
    if eh == nh then
    if em >= nm then
      return true
    end
    return false
  end
end
  return true
elseif eh < sh then
  if (nh >= sh and nm >= sm ) or (nh <= eh and nm <= em) then
    return true
    end
end
else
return false
end
return false
end
local function getnewtime(hour,minute,stm)
  local secs = tonumber(3600 * hour + 60 * minute)
  local nsecs
  if (secs - stm) < 0 then
  nsecs = 24 * 3600 + tonumber(secs) - tonumber(stm)
else
  nsecs = tonumber(secs - stm)
end
local nhour = math.floor(nsecs/3600)
local nminute = math.floor((nsecs - nhour * 3600)/60)
return nhour ,nminute
end
local function get_latlong(area)
  local api      = "https://maps.googleapis.com/maps/api/geocode/json?"
  local parameters = "address="..area
  -- Do the request
  local res, code = https.request(api..parameters)
  if code ~=200 then return nil  end
  local data = json:decode(res)
 
  if (data.status == "ZERO_RESULTS") then
    return nil
  end
  if (data.status == "OK") then
    -- Get the data
    local lat  = data.results[1].geometry.location.lat
    local lng  = data.results[1].geometry.location.lng
    local acc  = data.results[1].geometry.location_type
    local types= data.results[1].types
    return lat,lng,acc,types
  end
end
local function get_time(lat,lng)
  local api  = "https://maps.googleapis.com/maps/api/timezone/json?"

  -- Get a timestamp (server time is relevant here)
  local parameters = "location="..URL.escape(lat)..","..URL.escape(lng).."&timestamp=0"

  local res,code = https.request(api..parameters)
  if code ~= 200 then return nil end
  local data = json:decode(res)
  
  if (data.status == "ZERO_RESULTS") then
    return nil
  end
  
    local localTime = data.rawOffset + data.dstOffset
    return localTime

end
local function cron()
for v,chat in pairs(_chats.chats) do
  local hash = 'muteall:'..chat[1]
  if not redis:get(hash) and is_mtime(chat[1]) then
    redis:setex(hash, mute_time(chat[1]), true)
   send_msg('chat#id'..chat[1], 'ℹ️ چت شما هر روز در این ساعت تا وقت مقرر بسته است', ok_cb, false)
  send_msg('channel#id'..chat[1], 'ℹ️ چت شما هر روز در این ساعت تا وقت مقرر بسته است', ok_cb, false)
    end
end
end
local function run(msg, matches)
    local lat,lng,acc
  if matches[6] then
  lat,lng,acc = get_latlong(matches[6])
  else
  lat,lng,acc = get_latlong('iran')
end
  if lat == nil and lng == nil then
    return 'هیچ نتیجه ای برای  "'..area..'" موجود نیست لطفا با دقت بیشتری منطقه وارد نمایید.'
  end
  local localTime = get_time(lat,lng)
  local hou , minu = getnewtime(tonumber(matches[2]),tonumber(matches[3]),localTime)
  local houe , minue = getnewtime(tonumber(matches[4]),tonumber(matches[5]),localTime)
  local mstarth = 'mstarth:'..msg.to.id
  redis:set(mstarth, hou)
  local mstartm = 'mstartm:'..msg.to.id
  redis:set(mstartm, minu)
  local mendh = 'mendh:'..msg.to.id
  redis:set(mendh,houe)
  local mendm = 'mendm:'..msg.to.id
  redis:set(mstartm,minue)
return 'ℹ️ چت شما هر روز در ساعت'..matches[2]..':'..matches[3]..'تا ساعت '..matches[4]..':'..matches[5]..' به وقت محلی بسته است'
end
return {
  description = "Muteall chat users to time",
  usage = {
    "tmte date1 date2"
  },
  patterns = {
    "^[!/#](tmuteall) (%d+):(%d+) , (%d+):(%d+) (.*)$",
    "^[!/#](tmuteall) (%d+):(%d+) , (%d+):(%d+)$"
  },
  cron=cron,
  run = run
}