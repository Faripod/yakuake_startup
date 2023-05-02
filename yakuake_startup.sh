#!/bin/bash

# Start Yakuake
yakuake &

# Wait for Yakuake to start
while ! pgrep -x "yakuake" > /dev/null; do
  sleep 1
done

# Session 1: split left (Documents), split right (Home)
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.runCommandInTerminal 0 'cd ~/Documents && clear'

qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitSessionLeftRight 0
session_id=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeSessionId)
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.runCommandInTerminal $session_id 'cd ~ && clear'

# Session 2: split left (Home), split right (Documents)
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.runCommandInTerminal 1 'cd ~ && clear'

qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitSessionLeftRight 1
session_id=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeSessionId)
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.runCommandInTerminal $session_id 'cd ~/Documents && clear'
