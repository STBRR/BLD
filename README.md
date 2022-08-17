# Battalion
Quick &amp; Easy Deployment for Battalion: Legacy

## Installation Steps
This will help you get up and running with your own Battalion: Legacy server in just a few minutes.

### Creating a new 'steam' user
Assuming you're running as `root` as you've just fired up a Linode or Digital Ocean Droplet execute
the following commands.

```
adduser steam
usermod -aG sudo steam
su - steam
```

You should now be sat in a shell as the `steam` user.
```
steam@localhost:~$
```

### Downloading the Repo
Execute the following commands to download the repository to your system and run the supplied install script.
1. `git clone https://github.com/STBRR/Battalion.git`
2. `cd Battalion`
3. `chmod +x install-server.sh && ./install-server.sh`
