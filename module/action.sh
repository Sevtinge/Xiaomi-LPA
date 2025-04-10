if am start -n com.miui.euicc/com.miui.euicc.ui.main.MainActivity | grep -q "cmp=com.miui.euicc/.ui.main.MainActivity"; then
    ui_print "- Start com.miui.euicc.ui.main.MainActivity succeed."
else
    ui_print "- Start com.miui.euicc.ui.main.MainActivity failed."
fi