#!/data/data/com.termux/files/usr/bin/bash

# 顯示用法
if [ -z "$1" ]; then
  echo "❌ 請提供 .luac 檔案，例如：./decrypt.sh myscript.luac"
  exit 1
fi

INPUT="$1"
OUTPUT="${INPUT%.luac}.lua"

echo "🔄 正在反編譯 $INPUT -> $OUTPUT"

# 使用 unluac.jar 解碼
java -jar unluac.jar "$INPUT" > "$OUTPUT"

if [ $? -eq 0 ]; then
  echo "✅ 反編譯完成！輸出檔：$OUTPUT"
else
  echo "❌ 解碼失敗，請確認檔案為 Lua 5.1 的 bytecode"
fi
