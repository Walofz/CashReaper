# CashReaper

A lightweight docker image running multiple passive income applications. Supports ARM and x86 architectures. 

Highlights:
---
- Works on raspberry pi
- Earn small amount of money (beer money) by sharing for your internet bandwidth
- 100% passive income, set and forget
- Only verified services with confirmed payouts
- Automatically claim honeygain lucky pot to maximize passive income.

<br>

# Quick start
1. Make sure docker is installed on your system.

2. git clone

```
git clone https://github.com/Walofz/CashReaper && cd CashReaper
```

3. Edit the `settings.conf` file. Refer the following section for details. For example, to edit using nano:
```
nano settings.conf
```
Save the modified settings file.

4. Build docker image. This can take a few minutes.

```
docker build . -t walofz/cashreaper:latest
```

5. Once image is built, create and run the container.
```
./run.sh
```
<b>Docker Logs: </b>The docker container created by run.sh script will have logs turned off to prevent unnesessary disk activity. You can change this behaviour by editing the run.sh script before executing it. For example, you can delete "```--log-driver none```" from the docker run command in the run.sh script to use the default docker log setting.
<br><br>

<br>

---
# Installed programs

# 1. Honeygain
Register for an account. In the settings file, add your email to `HG_EMAIL` and password to `HG_PASSWORD` and set the `USE_HONEYGAIN` to `y`.
<br><br>Example
```
# Honeygain
USE_HONEYGAIN=y
HG_EMAIL=example@example.com
HG_PASSWORD=MyP@$$W0rd
```
<br><br>
<b>Automatically claim lucky pot</b>
<br>
Honeygain offers additional credits in the form of lucky pot and achievements. Users need to visit their website everyday to claim these credits. You can automate this process by setting `USE_HONEYGAIN_AUTOCLAIM` to `y` in the settings file.

This will run a program every 30 mins to automatically claim any available honeygain lucky pot and unlocked rewards, thus maximizing your earnings while remaining 100% passive.
<br><br>Example
```
USE_HONEYGAIN_AUTOCLAIM=y
```
<br><br>

# 2. Pawns.app
Register for an account. In the settings file, add your email to `PA_EMAIL` and password to `PA_PASSWORD` and set the `USE_PAWNSAPP` to `y`.
<br><br>Example
```
# Pawns.app
USE_PAWNSAPP=y
PA_EMAIL=example@example.com
PA_PASSWORD=MyP@$$W0rd
```
<br><br>

# 3. Earnapp
Register for an account. Set `USE_EARNAPP` to `y` in the `settings.conf` file.

The run.sh script will print a link that you need to paste into your browser to "link" the worker to your account. This needs to be repeated per container instance.
<br><br>
To get this link manually, you can use the following command.

``` 
docker exec -it cashreaper earnapp register | grep -Eo 'https.+'
```
<br>Example
```
# Earnapp
USE_EARNAPP=y
```
<br><b>Storage: </b>Persistent storage is recommend for Earnapp to ensure that you don't have to repeat the worker-account linking process when container is recreated. If you use the run.sh script, a docker volume named vol-cashreaper will be automatically created and used for this purpose.
<br><br>

---
# Accounts

You will need an account for each of the following services.
- [Register Earnapp](https://earnapp.com/i/Dz6Wlsjd)
- [Register Honeygain](https://r.honeygain.me/PAITOB169D)
- [Register Pawns.app](https://pawns.app/?r=1313227)


<br>** Please use these links to support this project at no cost to you. You will receive a setup bonus on some sites for using these referral links.

<br>

---

# Credits
This project uses code from the following open-source projects:

<br>PiCash (https://github.com/chashtag/PiCash)
<br>Honeygain Auto Claim (https://github.com/MrLoLf/HoneygainAutoClaim)