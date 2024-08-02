# 注意 这不是占位符！！这个代码的作用是将模块里的东西全部塞系统里，然后挂上默认权限
SKIPUNZIP=0
# Extract libs
ui_print "- Extracting module files"

unzip -o "$ZIPFILE" 'module.prop' -d "$MODPATH"
unzip -o "$ZIPFILE" 'frpc' -d "$MODPATH"
unzip -o "$ZIPFILE" 'frpc.toml' -d "$MODPATH"
unzip -o "$ZIPFILE" 'service.sh' -d "$MODPATH"
unzip -o "$ZIPFILE" 'system.prop' -d "$MODPATH"