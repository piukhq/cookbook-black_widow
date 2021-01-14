---
page_title: "Black Widow"
---

[![Build Status](https://git.bink.com/DevOps/Cookbooks/black_widow/badges/master/pipeline.svg)](https://git.bink.com/DevOps/Cookbooks/black_widow)

The Black Widow cookbook deploys journalbeat and auditbeat, and configures them to stream messages to Elasticsearch.

Journalbeat reads from the systemd journal. Auditbeat is a replacement for auditd, it will load audit rules into the kernel via netlink and then stream usable JSON messages instead of the multiple messages per event that auditd would emit.

## TODO

* Add auditbeat
* Possibly add filebeat

