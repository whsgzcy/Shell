#!/system/bin/sh
ulimit -Sn 8196

# If you're implementing this in a custom kernel/firmware,
# I suggest you use a different script name, and add a service
# to launch it from init.rc

# Launches SuperSU in daemon mode only on Android 4.3+.
# Nothing will happen on 4.2.x or older, unless SELinux+Enforcing.
# If you want to force loading the daemon, use "--daemon" instead

cp /system/xbin/xu /subin/su
chmod 755 /subin/su

cp /system/xbin/daemonxu /subin/daemonsu
ulimit -Sn 8196
chmod 755 /subin/daemonsu

ulimit -Sn 8196

/subin/daemonsu --auto-daemon &

