local function run()
 local up = io.popen('uptime'):read('*all')
local tr = up:gsub('days','روز')
local t = tr:gsub('up','تا')
local x = t:gsub('load average','بار متوسط')
local uptime = x:gsub('user','تعداد یوزر ها(کاربران)')
return uptime
end
return {
patterns = { '^[/#!]uptime$','^uptime$'},
run = run 
}