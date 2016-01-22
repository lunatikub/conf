
clean_cache ()
{
    sudo bash -c '
        echo "--"
        echo "SWAP OFF"
        swapoff -a
        echo "SWAP ON"
        swapon -a
        echo "--"
        free
        sync
        echo 3 > /proc/sys/vm/drop_caches
        echo "--"
        free'
}
