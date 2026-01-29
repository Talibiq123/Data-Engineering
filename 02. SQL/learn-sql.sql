-- Concatination - joining multiple string into a single string
CONCAT(str1, str2, str3, ...)
Note- If any argument is Null then concat() return null. 


-- CONCAT_WS() - concatinate with saperater
CONCAT_WS(separator, str1, str2, str3, ...)

RULES TO NEVER GET IT WRONG 🧠

✅ Use CONCAT() for simple joins
✅ Use CONCAT_WS() when a separator is needed
❌ Never use + or || in MySQL
⚠️ Always handle NULL values
🔥 Prefer CONCAT_WS() in real projects
