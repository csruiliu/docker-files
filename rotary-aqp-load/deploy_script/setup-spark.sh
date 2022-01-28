#!/usr/bin/expect

spawn $::env(SPARK_HOME)/sbin/start-all.sh
expect "*password:"
send "123\r"

expect eof