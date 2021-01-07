---
page_title: "Black Widow"
---

[![Build Status](https://git.bink.com/DevOps/Cookbooks/black_widow/badges/master/pipeline.svg)](https://git.bink.com/DevOps/Cookbooks/black_widow)

The Black Widow cookbook deploys journalbeat and auditbeat, and configures them to stream messages to Azure EventHub.

Journalbeat reads from the systemd journal. Auditbeat is a replacement for auditd, it will load audit rules into the kernel via netlink and then stream usable JSON messages instead of the multiple messages per event that auditd would emit.

# Test prerequirements

Uses an eventhub in the `DevOps - Terry Cain` subscription. Eventhub namespace has an eventhub called `oslogs` and a policy inside that eventhub called `oslogs` with `Send` privileges.
Connection string here `Endpoint=sb://bink-blackwidow-oslogs.servicebus.windows.net/;SharedAccessKeyName=oslogs;SharedAccessKey=qw9qQyzhWypzl/9fIcrP1BsY4GsKHcTQ/SajGgveaDA=;EntityPath=oslogs`


## TODO

* Add auditbeat
* Possibly add filebeat

