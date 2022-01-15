#!/usr/bin/expect

spawn $::env(HADOOP_HOME)/sbin/start-dfs.sh
expect "*yes/no*"
send "yes\r"
expect "*password:"
send "123\r"
expect "*password:"
send "123\r"
expect "*password:"
send "123\r"

expect eof