# OVH Object Storage - Windows File Backup

This is a quick write up to show 2 ways to use OVH Public Cloud Object storage to backup data on Windows. The first method is suitable for any Windows installation using an Open Source bit of software called Duplicati. The second uses duplicity via the Linux Subsystem for Windows 10.


## Prerequisites

Before starting either of the methods below you will need an OVH Public Cloud and the open stack configuration file from the Public Could Web Control Panel. To get your config file:

1. Click on the OpenStack menu in the Public Cloud Project.
2. Click &quot;Add User&quot; button.
3. Click &quot;Downloading an Open…&quot;
4. Select the region you want your backups to be in.
5. Click &quot;Confirm&quot;

[Image of Steps](https://i.gyazo.com/92205ec88bf4c5b5345fb19f7147816a.png)

Keep this file as you will need it later.


## Method 1 – Duplicati

This method uses an Open Source software call Duplicati, more information can be found [here](https://www.duplicati.com/). This method is the preferred as it allows for scheduling and multiple versions of backups.

1. [Download](https://www.duplicati.com/download) and install Duplicati.
2. Open Duplicati.
3. Click &quot;Add Backup&quot; on the side menu.
4. Select &quot;Configure a new backup&quot; and click &quot;Next&quot;.
5. Give the backup a name and passphrase (keep this safe) and click &quot;Next&quot;.
6. Fill the form as shown here: [Form Image](https://i.gyazo.com/af611a901133137b6bbad621d8deca57.png), then click &quot;Next&quot;.
7. Select your Source Data and fill out and Filters and Exclusions.
8. Fill out your schedule as required.
9. Fill out any remaining options you require and click &quot;Save&quot;.

The back is now setup and will continue to backup so long as Duplicati is left running. To restore a backup, click &quot;Restore&quot; on the side menu and follow the wizard.


## Method 2 – Duplicity

This method uses 2 batch files alongside 2 bash files for the Windows 10 Linux Subsystem. You will need new bash files for each new backup job you wish to create.

1. Install Linux Subsystem for Windows 10 – more info [here](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide).
2. Add duplicity repo, update and install it.
```
sudo add-apt-repository ppa:duplicity-team/ppa

sudo apt-get update &amp;&amp; sudo apt-get install duplicity
```
3. Install Swift
```
sudo apt-get install python-pip

sudo pip install python-swiftclient python-keystoneclient
```
4. Edit the bash (backup.sh &amp; restore.sh) files to your needs – you will need the info from the OpenStack config file where:
  - SWIFT\_USERNAME  -->  OS\_USERNAME
  - SWIFT\_PASSWORD  -->  Your OpenStack Password
  - SWIFT\_AUTHURL  -->  &quot;https://auth.cloud.ovh.net/v2.0/&quot;
  - SWIFT\_AUTHVERSION  -->  &quot;2&quot;
  - SWIFT\_TENANTNAME  -->  OS\_TENNANT\_NAME
  - SWIFT\_REGIONNAME  -->  OS\_REGION\_NAME

5. When you need to backup, run the backup.bat file.
6. When you need to restore, run the restore.bat file.
