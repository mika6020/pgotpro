local function run(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['fosh'] then
                lock_fosh = data[tostring(msg.to.id)]['settings']['fosh']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_fosh == "yes" then
       delete_msg(msg.id, ok_cb, true)
    end
end

return {
  patterns = {

  "کیر",
  "کص",
  "کــــــــــیر",
  "کــــــــــــــــــــــــــــــیر",
  "کـیـــــــــــــــــــــــــــــــــــــــــــــــــــر",
  "کــــــــــیرر",
  "kir",
  "kos",
  "sex",
  "گایید",
  "گاییدی",
  "لاشی",
  "پدرسگ",
  "پدرسک",
  "پریود",
  "جاکش",
  "مادرسگ",
  "شورت",
  "عوضی",
  "داشاق",
	"داشاغ",
  "koskesh",
	"gaidam",
  "پیرسگ",
	"ننه قهوه",

	"مادرتوگاییدم",
	"پدرتوگاییدم",
	"بیابخور",
  "جنده",
  "مادرجنده",
  "حشری",
  "جق",
  "جقی",
  "ساک",
  "فاک",
  "لز",
  "مادرقهبه",
  "حرومزاده",
  "کوس",
  "jende",
  "Jende",
  "sex",
  "SEX",
  "sexy",
  "SEXY",
  "Sexy",
  "kos",
  "KOS",
  "FUK",
  "fuk",
  "fuck",
  "fak",
  "koloft",
  "توله سگ",
  "پورن",
  "کونی",
  "oskol",
  "کسکش",
  "کیرم",
  "کیر",
  "تخمی",
  "گاییدم",
  "کسخلا",
  "ممه",
  "کون",
  "سیکتیر",
  "سیک",
  "گاییدمت",
  "جق",
  "کص",
  "کسکش",
  "حرومزاده",
  "سگ پدر",
  "مادر جنده",
  "جنده",
  "سکسی",
  "سکس",
  "بکنمت",
  "کونی",
  "آب کون",
          "اب کون",
          "چاقال",
          "کونده",
          "اوبی",
          "مادر قهوه",
          "مادرقهوه",
          "کیرم دهنت",
  },
  run = run
}
