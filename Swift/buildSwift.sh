#! /usr/bin/sh

swiftc main.swift -o backupTool &
pid=$!

spinner='-/|\'
i=0

while kill -0 $pid 2>/dev/null; do
    i=$(( (i+1) % 4 ))
    printf "\rRunning the command %s" "${spinner:$i:1}"
    sleep 0.2
done

wait $pid
status=$?

if [ $status -eq 0 ]; then
    printf "\033[1;32mSuccessful!\033[0m\n"
else
    printf "\n\033[1;33mSomething went wrong!\033[0m\n"
fi
