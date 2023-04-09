#! /bin/sh
#Pre-requisuite: Make sure you have configured and tested the DHCP servive manually first, so you know the process and commands
#Pre-requisuite: Look at the working dhcpd.conf file you created during the manual set up and note the required text to make this work
#After each of the steps below add the required command(s)

#Step 1: Install DHCP service
sudo apt-get install isc-dhcp-server


#Step 2: change name of the original dhcpd.conf file to be a backup using the mv command
cd /etc/dhcp
sudo mv dhcpd.conf dhcpd\(backup\).conf


#Step 3: create a new empty dhcpd.conf file using the touch or cat command
sudo touch dhcpd.conf
#chmod 777 dhcpd.config


#Step 4: Use the echo or cat command to insert the required text into this new empty dhcpd.conf
#Step 4 Note: the backslash character is used for special characters like speechmarks, semicolons, parenthesis etc
echo 'subnet 172.16.1.0 netmask 255.255.255.0 { 
	range 172.16.1.1 172.16.1.254; 
	option domain-name-servers remote.Jase.com; 
	option domain-name "Jase.com";
	option subnet-mask 255.255.255.0;
	option routers 172.16.1.1;
	option broadcast-address 172.16.1.255;
	default-lease-time 600;
	max-lease-time 7200;
}' | sudo tee dhcpd.conf


#Step 5: Restart dhcp service
sudo systemctl restart isc-dhcp-server.service
sudo systemctl status isc-dhcp-server.service
