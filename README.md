# vagrant_barbican
Vagrant environment for a simple devstack install with barbican

# Usage
1.  To  Setup the vagrant environment, just call
    ```
    vagrant up
    ```

    This will start the vm, clone the devstack repository and install a localrc
    file for it.

2.  After the installation has finished, log into the vm and call stack.sh to
    install and start devstack.
    ```
    vagrant ssh
    ./devstack/stack.sh
    ```

3.  When devstack is running you can use
    ```
    source ~/devstack/openrc
    ```

    to load the devstack credentials into your environment. Alternatively, you
    can
    ```
    source ~/identityv3rc
    ```

    to use identity v3 and load admin credentials.
