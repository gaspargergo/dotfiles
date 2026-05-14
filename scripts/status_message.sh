#!/bin/bash
echo -e "Battery:"$(acpi -b | cut -d',' -f2)"\n"$(date "+%Y.%m.%d. (%a) %H:%M") | xmessage -default okay -font '-*-Helvetica-*-r-normal-*-18-*-*-*-*-*-*-*' -timeout 5 -file -
