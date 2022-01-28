#!/bin/sh

kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Lineitem --time -1
kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Orders --time -1
kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Customer --time -1
kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Part --time -1
kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Supplier --time -1
kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic PartSupp --time -1
kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Nation --time -1
kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Region --time -1

#bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Customer-Large --time -1
#bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Part-Large --time -1
#bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Supplier-Large --time -1
#bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic PartSupp-Large --time -1
#bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Orders-Large --time -1
#bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic Lineitem-Large --time -1


