dd if=/dev/zero of=/var/swap.file count=2000000 bs=1024
mkswap /var/swap.file
swapon -a /var/swap.file