# TODO

- It seems that there's a log directory that Oracle would like to use.
  Perhaps we should create it (or not, if there's a downside...):

    ```
    [vagrant@localhost ~]$ cat oradiag_vagrant/diag/clients/user_vagrant/host_61728193_80/trace/sqlnet.log
    Thu Apr 16 20:59:58 2015
    Create Relation ADR_CONTROL
    Create Relation ADR_INVALIDATION
    Create Relation INC_METER_IMPT_DEF
    Create Relation INC_METER_PK_IMPTS
    Directory does not exist for read/write [/u01/app/oracle/product/11.2.0/xe/log] [/u01/app/oracle/product/11.2.0/xe/log/diag/clients]
    ```

- Fix the firewall.

  The original version of this project dropped the firewall entirely
  but didn't save the changes.  This meant that Oracle worked until
  the box was shutdown and restarted, at which point the firewall
  blocked port 1521 and sadness ensued.

  I've changed it so that when it provisions instead of dropping the
  firewall it opens port 1521 and then saves the changes.  That way
  things work on reboot.

  I think it's worth keeping the firewall in place, that way one
  *knows* what ports one is using.

  My quick hack has an aesthetic problem, each time you reprovision
  the machine, it duplicates the port 1521 rule.

  Better would be to use one of the
  [ansible ferm](https://www.google.com/search?q=ansible+ferm&oq=ansible+ferm)
  roles or other
  [ansible iptables](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=ansible%20iptables)
  packages to mange the table properly.

- Better Oracle setup.  The Oracle setup is pretty bare bones.  There
  are various Vagrant projects that are fancier (but that don't use
  Centos) and there are various ansible roles that one could leverage.
  Someone should look into this....