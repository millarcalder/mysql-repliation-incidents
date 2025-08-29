# Restore Subset of Tables from Backup

> This document assumes you are using [mydumper](https://mydumper.github.io/mydumper/docs/html/index.html#)

First of all this is typically only recommended in certain situations, it's usually safer to restore the entire database. Only do this if:
 - you are certain these are the only table(s) that need to be restored
 - you need to minimise data loss
 - the database is large and would take a long time to restore entirely

You need to be particularly careful of foreign keys. If no other tables have foreign keys referencing this table then you don't need to worry about this, but if there are then read on. Mydumper disables [FOREIGN_KEY_CHECKS](https://dev.mysql.com/doc/refman/8.4/en/server-system-variables.html#sysvar_foreign_key_checks), this allows mydumper to drop the table and restore from backup without errors. *The side effect is that if any records in other tables reference new records added to this table (after the backup was taken), restoring from backup could leave those references orphaned!*

Warnings aside, you've decided to go ahead with this! Below are example mydumper commands to do this.

```bash
# Take a backup - recommended to use a replica!
mydumper --host=db3 --user=root --password=secret --database=library --tables-list=books --ssl --kill-long-queries

# Restore backup
myloader --host=db1 --user=root --password=secret --source-db=library --overwrite-tables --ssl --directory=/export...
```

You can play around with modifying the data after the backup is taken to see the side affects you might encounter.
