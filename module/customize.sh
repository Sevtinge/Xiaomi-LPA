ui_print '- This is a beta version and may contain unstable content. Please use with caution and do not use this version for important operations. Any problems that arise are the responsibility of the user.'

device=$(getprop ro.product.device)

if grep -Fxq "$device" "$MODPATH/device_blacklist"; then
    ui_print "! This device ($device) is in the blacklist. Do not try to bypass the restrictions, which is dangerous."
    abort 1
fi

if $BOOTMODE; then
    ui_print "- Installing from Magisk/KernelSU app"
  else
    ui_print "*********************************************************"
    ui_print "! Install from recovery is NOT supported"
    ui_print "! Please install from Magisk/KernelSU app"
    abort "*********************************************************"
  fi

pm install "$MODPATH/system/system_ext/priv-app/EsimLPA/EsimLPA.apk" > /dev/null 2>&1 || { echo "! Failed to install com.miui.euicc. Please check your CorePatch."; abort 1; } && echo "- Install com.miui.euicc success."
pm install "$MODPATH/system/system_ext/priv-app/EuiccGoogle/EuiccGoogle.apk" > /dev/null 2>&1 || { echo "! Failed to install com.google.android.euicc."; abort 1; } && echo "- Install com.google.android.euicc success."

appops set com.miui.euicc android:read_device_identifiers allow
appops set com.google.android.euicc android:read_device_identifiers allow

ui_print '- Please reboot before open LPA App!'
