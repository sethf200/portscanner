# Portscanner

This is just a bash script I made for a lab in CSEC 102, the challenge is to find ONE open port on a server that is protected by a firewall.

## My problem:
There is a server on the internet that has ONE port open, however it is protected by a firewall that only allows an IP to scan five ports per minute, once that threshold is crossed, the firewall starts to completely ignore all traffic from your machine for 10 mins. Scanning all 65,535 ports with one machine at 5 ports a minute would take far too long!

## My solution:
### Split up the workload!
- Spin up 15 different machines in the cloud, give each of them a port range to scan.
- Wait til the next morning and see the results.

This bash script grabs the hostname of all machines, I named them Server1-15. Depending on the server name, each machine will get a different port range assigned to them. The workload is split evenly between all 15 machines, 4,369 ports each.

Each machine will output their nmap scans to the scans directory where I can grep for open ports later...
