# Battalion: Legacy Deployer (BLD)
*This has been tested on **Debian 11** & **Ubuntu 21.04***

Note: I first tested this on **Ubuntu 22.04** and ran into issues when launching with `libssl`. This appears to only be an issue in **22.04**

![Result](https://i.imgur.com/hwHU8Kq.png)

## Overview
As of **16/08/2021** Battalion:1944 was re-launched as **Battalion: Legacy** with Matchmaking elements **removed** thus relying on the community to host their **own** servers for the players. 

This project has been made *(in one evening)* with the hopes to make this process as simple as possible.

This can either be done **locally** on your **own** Linux machine but **will** assume that you are going to be running this on some form of cloud infrastructure like **Linode**, **Digital Ocean** or **OVH** etc.

## Installation

### Creating a new 'steam' user
Assuming you're running as `root` execute
the following commands. If you **already** have a **non-root** user then feel free to **skip** these and move straight onto the **install**.

```
apt -y update && apt -y install git
adduser steam
usermod -aG sudo steam
su - steam
```

You should now be sat in a shell as the `steam` user.
```
steam@localhost:~$
```

### Deploying a Server
Execute the following commands to download the repository to your system and run the supplied install script.
```
git clone https://github.com/STBRR/BLD.git && cd BLD/
chmod +x launch.sh && chmod +x install.sh
./install.sh
./launch.sh
```

#### Passing Additional Arguments - *Thanks frostyNinja!*
```
./launch.sh -AdminPassword=Passw0rd -QueryPort=1337
```

## Further Development
If you feel that something can be done better or could add some functionaity.
Feel free to submit a PR.
