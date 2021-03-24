# Hive OS AMD driver installer

## Clone

```
git clone https://github.com/eovares/hiveos-amd-driver-installer.git
```

## Install drivers

```
cd /home/user

wget https://raw.githubusercontent.com/eovares/hiveos-amd-driver-installer/main/amd-installer.sh

chmod +x ./amd-installer.sh

./amd-installer.sh
```

## Reference

```
https://devtalk.blender.org/t/guide-install-amd-opencl-on-pop-os-ubuntu-some-derivates/13458

https://amdgpu-install.readthedocs.io/en/latest/install-installing.html#opengl-default-component

https://www.reddit.com/r/cudominer/comments/ly5hv6/using_amd_radion_on_ubuntu/

https://forum.hiveos.farm/t/auto-installation-of-amd-drivers-on-hiveos-ubuntu/11664/75

https://github.com/CryptoLuigi/AMD_Installer/blob/master/amd_install.sh
```



## Create a new repository on the command line

```

echo "# hiveos-amd-driver-installer" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/eovares/hiveos-amd-driver-installer.git
git push -u origin main

```
