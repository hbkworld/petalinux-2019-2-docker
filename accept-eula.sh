#!/usr/bin/expect

# Based on https://github.com/silenc3502/PetaLinux-2019-2/blob/master/accept-eula.sh

set timeout -1
set install_dir [lindex $argv 1]
set installer [lindex $argv 0]

spawn $installer $install_dir
expect "Press Enter to display the license agreements"
send "\r"
set timeout 2

expect {
    "* >*" {send "y\r"}
    timeout { send "q"; sleep 1; exp_continue }
}
expect {
    "* >*" {send "y\r"}
    timeout { send "q"; sleep 1; exp_continue }
}
expect {
    "* >*" {send "y\r"}
    timeout { send "q"; sleep 1; exp_continue }
}

set timeout -1
expect "INFO: PetaLinux SDK has been installed"
