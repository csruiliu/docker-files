#!/usr/bin/expect

spawn passwd
expect "*password:"
send "123\r"
expect "*password:"
send "123\r"

expect eof
