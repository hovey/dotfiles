# HPWS

2025-11-12

https://wiki.sandia.gov/pages/viewpage.action?spaceKey=CEE9&title=SRN+CEE+Engineering+Workspace

Engineering Workspace (hpws)
Network (non-local) storage to /home, /porjects, /fgs
16 CPU, 64 MB RAM
(vs Mac M4 with 36 GB RAM)

Subscribe to CEE Engineering Workspace in Nile CEE's subscription portal
Confirmed done:  CEE Homespace 100 GB storage (as well as SRN comput servers and SRN Engineering Workspace)

Accessing CEE Resources
https://wiki.sandia.gov/display/CEE9/SRN+Remote+Computing%3A+Accessing+CEE+Resources

macOS
avoid Leostream - this is for full-screen graphical session
non-graphical session via command line
* open a terminal window
* ssh to your workstation at the command line, such as "ssh ceews####"
* enter 'yes' at the security authentication warning
* enter Yubikey PIN and OTP output (touch the prongs)
* issue 'exit' at the command prompt to disconnet from server

## Getting Started with HPWS

2025-11-18
With Andrew, Paul, and Will

* In Nile and WebCARS, need to request a machine.
* 64 GB RAM, good for software development.
* Persistent machine name as long as the use doesn't go to zero.

From Andrew:

Wanted to let you know I was able to get vscode remote working correctly when I used an engineering workspace, which is a dedicated set of resources for me. To figure out the name of my machine and enable the linux connection, I installed the Mac version of NoMachine and the zcentral package (ZcentralBoost) found here: https://cee-software.sandia.gov/software/. Then I signed in here: https://leocb.sandia.gov to launch the engineering workspace machine (HPWS) which gave me my machine name (apolon@hpws0128), which I then ssh into.
 
After some wrangling I was able to get vscode extensions installed too, so its like running it directly on my local for the most part. This process does not seem to work on login nodes for the HPC servers. Another upside of the workspace version is that you can add your own ssh key to avoid the yubikey stuff entirely with the following command:
 
ssh-copy-id remote_username@server_ip_address

In VS Code, with VPN on, connect to remote.

ssh hpws0128 (Andrew's machine)

### Chad's workflow

* https://webcars.sandia.gov, WebCARS
  * SRN Capacity Clusters
* https://nile.sandia.gov/
  * SRN Compute Servers
  * SRN Engineering Workspace
  * SRN Linux Terminal Server
* From https://cee-software.sandia.gov/software/
  * Download and install
    * NoMachine
      * https://cee-software.sandia.gov/software/NoMachine/OSX/
      * nomachine-enterprise-client_9.1.24_6.dmg
    * ZcentralBoost
      * https://cee-software.sandia.gov/software/zcentral/Mac/
      * ZcentralBoost22.1.2.pkg
      * (do not need to install Receiver.pkg)
  * Macs do NOT need Leostream
* https://leocb.sandia.gov 
  * Sign into Leostream https://leocb.sandia.gov 
  * Use HPWS (not need to use the Linux Terminal Server)
    * Double-slice the rocket to launch, downloads a Leostream.rgreceiver, open this will ZcentralBoost
    * Always accepts
  * Shows hpws0275.sandia.gov
    * Username: chovey@sandia.gov
    * Password: one-time-password
* Terminal
  * ssh chovey@hpws0275.sandia.gov
* Yubikey setup
  * https://wiki.sandia.gov/pages/viewpage.action?spaceKey=HOK&title=Reset+Yubikey+OTP+pin+with+HSPD12+or+PIV-D+or+PIV-C+on+the+Yubikey
  * https://password-tools.sandia.gov/yubikeys/change_pin
* VSCode
  * Connect to server
    * ssh chovey@hpws0275.sandia.gov

### 2025-12-11

* Contacted Clint Stimpson (cjstimp@sandia.gov), who is also accessing hpws0275.sandia.gov, submitted a ticket.
