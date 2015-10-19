#!/bin/tcsh
set count = `/usr/libexec/PlistBuddy -c "Print PreferenceSpecifiers:" $1 | grep "Dict" | wc -l`
set cm1 = `expr $count - 1`
foreach i (`seq 0 $cm1`)
    set key = `/usr/libexec/PlistBuddy -c "Print PreferenceSpecifiers:${i}:Key" $1`
    if ($key == "app_version") then
        set upd = $2-$3
        /usr/libexec/PlistBuddy -c "Set PreferenceSpecifiers:${i}:DefaultValue $upd" $1
        set version = `/usr/libexec/PlistBuddy -c "Print PreferenceSpecifiers:${i}:DefaultValue" $1`
        echo 'Set version '$version
    endif
end