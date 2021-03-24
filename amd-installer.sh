#!/usr/bin/env bash

# variables
USER_FOLDER='/home/user'
DRIVER_FOLDER='/home/user/amd-drivers'

function update_hiveos() {
    echo "Updating HiveOS"
    apt-get update -y && apt-get upgrade -y
}

function remove_folder() {
    echo "Removing drivers folder"
    rm -Rf $DRIVER_FOLDER
}

function create_folder() {
    echo "Creating drivers folder"
    mkdir $DRIVER_FOLDER
}

function uninstall_drivers() {
    echo "Uninstalling drivers"
    # Use this for All-Open components
    amdgpu-uninstall -y
    
    # Use this for Pro components
    amdgpu-pro-uninstall -y
    
    apt-get remove vulkan-amdgpu-pro*
}

function install_dependencies() {
    echo "Installing dependencies"
    apt-get install wget -y
}

function stop_services() {
    echo "Stoppig services"
    systemctl stop hivex
    miner stop
}

function download_drivers() {
    echo "Downloading drivers"
    
    cd $DRIVER_FOLDER
    
    wget –c --referer=http://support.amd.com/ https://drivers.amd.com/drivers/linux/amdgpu-pro-20.50-1234663-ubuntu-18.04.tar.xz
}

function extract_drivers () {
    echo "Extracting drivers"
    
    tar -Jxvf amdgpu-pro-20.50-1234663-ubuntu-18.04.tar.xz
    
    cd amdgpu-pro-20.50-1234663-ubuntu-18.04
}

function grant_permissions() {
    echo "Setting permissions"
    chmod +x amdgpu-install
    
    chmod +x amdgpu-pro-install
    
    chmod +x *.deb
}

function install_drivers() {
    echo "Installing drivers"
    
    apt-get -f install
    
    # ./amdgpu-pro-install --opencl=legacy -y
    
    ./amdgpu-pro-install -y --opencl=pal,legacy --headless
    
    dpkg -l amdgpu-pro
}

function setup() {
    stop_services
    uninstall_drivers
    remove_folder
    create_folder
    update_hiveos
    install_dependencies
}

function main () {
    echo "HIVEOS AMD drivers"
    #sudo -s
    setup
    download_drivers
    extract_drivers
    grant_permissions
    install_drivers
    
    cd $USER_FOLDER
    
    remove_folder
    
    echo "HIVEOS AMD drivers installed successfully"
    
    reboot
}

main


