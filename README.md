## Battalion: Legacy Deployer
*Feel free to reach out on Discord: LIAM#9934, I will respond when I am not busy*

*This has been tested on Debian 11 & Ubuntu 21.04*
*Do **not** use on Ubuntu 22.04, `libssl` errors will drive you crazy. I'll get around to fixing it though.*

### Project Aim
This repo will aim to provide a quick and straight-forward setup for self-hosting a Battalion: Legacy server within a Linux environment. This can either be done locally on your own Linux machine but will assume that you're going to be running this on some cloud infrastructure like Linode, Digital Ocean or OVH etc. As of 16/08/2021 Battalion:1944 was re-launched as Battalion: Legacy with Matchmaking elements removed thus relying on the community to host their own servers for the players. This project has been made (in one night) with the hopes to make this process as simple as possible.

### Installation Steps
This will help you get up and running with your own Battalion: Legacy server in just a few minutes.

#### Pre-Install Creating a new 'steam' user
Assuming you're running as `root` as you've just fired up a Linode or Digital Ocean Droplet execute
the following commands. If you already have a non-root user then feel free to skip these and move straight onto the install.

```
adduser steam
usermod -aG sudo steam
su - steam
```

You should now be sat in a shell as the `steam` user.
```
steam@localhost:~$
```

#### Getting up and running.
Execute the following commands to download the repository to your system and run the supplied install script.
1. `git clone https://github.com/STBRR/Battalion.git`
2. `cd Battalion`
3. `chmod +x install-server.sh && ./install-server.sh`

Finally launch the server with the following command(s):
4. `bash launch-server.sh` or `chmod +x launch-server.sh && ./launch-server.sh`
5. Search for '`STBRR`' or whichever name you set within `launch-server.sh`

#### Successful Deployment!
![Result](https://i.imgur.com/hwHU8Kq.png)
