#!/system/bin/sh
# 请不要硬编码 /magisk/modname/... ; 请使用 $MODDIR/...
# 这将使你的脚本更加兼容，即使Magisk在未来改变了它的挂载点

MODDIR=${0%/*}

(
until [ $(getprop sys.boot_completed) -eq 1 ] ; do
  sleep 5
done

# 这个脚本将以 late_start service 模式执行
# 更多信息请访问 Magisk 主题

mkdir -p /data/local/tmp/frp

# 如果 $MODDIR 下有 frpc 和 frpc.toml 文件，复制到目标目录
if [ -f "${MODDIR}/frpc" ]; then
  cp ${MODDIR}/frpc /data/local/tmp/frp
fi

if [ -f "${MODDIR}/frpc.toml" ]; then
  cp ${MODDIR}/frpc.toml /data/local/tmp/frp
fi

cd /data/local/tmp/frp
chmod +x frpc
./frpc -c ./frpc.toml

)&
