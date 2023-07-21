# iptables-persistent
How to make iptables persistent after reboot on Linux

# One Click Script 
```
wget https://raw.githubusercontent.com/speedforce-demo/iptables-persistent/main/setup_iptables.sh && chmod +x setup_iptables.sh && sudo ./setup_iptables.sh
```

# Manual Setup

To set up the network rules permanently on an Ubuntu VM, you can use the iptables-persistent package, which allows you to save and restore the iptables rules automatically during system startup and shutdown. Here's how you can install and configure it:

Update the package lists on your Ubuntu VM by running the following command:
```
sudo apt update
```
Install the iptables-persistent package:
```
sudo apt install iptables-persistent
```

During the installation, you'll be prompted to save the current IPv4 and IPv6 iptables rules. Select "Yes" for both prompts.

Once the installation is complete, the iptables rules will be automatically loaded during system startup.

To configure the rules, open the /etc/iptables/rules.v4 file in a text editor with root privileges:

```

sudo nano /etc/iptables/rules.v4
```

Add the following rules to the file:

```
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -j ACCEPT
-A OUTPUT -j ACCEPT
-A FORWARD -j ACCEPT
COMMIT
```

<p>
Save the file and exit the text editor.
If you also want to configure IPv6 rules, open the /etc/iptables/rules.v6 file with root privileges:
</p>

```
sudo nano /etc/iptables/rules.v6
```

Add the following rules to the file:


```
    *filter
    :INPUT ACCEPT [0:0]
    :FORWARD ACCEPT [0:0]
    :OUTPUT ACCEPT [0:0]
    -A INPUT -j ACCEPT
    -A OUTPUT -j ACCEPT
    -A FORWARD -j ACCEPT
    COMMIT
```

    Save the file and exit the text editor.

    After making the changes, you can manually load the rules without restarting the system:

```
sudo iptables-restore < /etc/iptables/rules.v4
```
```
sudo ip6tables-restore < /etc/iptables/rules.v6
```

That's it! The rules will be loaded automatically during system startup, and your network configuration should persist across reboots on your Ubuntu VM.
