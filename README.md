# Icarus

**Unenroll Devices with Device Managment Interception Using a Proxy and CA**

**IMPORTANT INFORMATION BEFORE YOU START**

> PLEASE DO NOT USE PUBLIC PROXIES / IP ADDRESSES FOR iCARUS
> ANYTHING GOOGLE CAN REMOTELY PERFORM ON YOUR DEVICE, ICARUS CAN BE USED TO DO. AN EXAMPLE OF THIS CAN BE INSTALLING EXTENSIONS, SPYING, USING YOUR CAMERA, CHROME REMOTE DESKTOP, GET YOUR PASSWORDS, ETC. ONLY USE SELF HOSTED PROXIES.

## WHAT ARE NEW CONFIGS?
"New Configs" have Rolled Keys. The Compatibility for Interception is Still Being Tested On These Keys.

## BUILDING IT YOURSELF
**PLEASE ONLY USE LINUX. WSL IS UNSUPPORTED AS OF NOW!**

Clone the repo using ``git clone --recursive https://github.com/MunyDev/icarus/``

Run ``cd ~/icarus`` (or where u saved the files)

Setup The Environment: 

(Make sure you have python3, python3-venv, protobuf, and google-chrome installed beforehand)

- `make setup-venv`
- `make enter-venv`
- `make setup-python`
- `make build-packed-data`


**BEFORE CONTINUING OPEN CHROME ON THE SAME DEVICE YOU ARE BUILDING ON**

- `Go to chrome://components`
- `Press Control + F`
- `Search for PKIMetadata`
- `Once found, click check for updates`
- `Make sure that is is up to date and the version is below 2000`

**ONCE DONE RUN:**

- `bash get_original_data.sh`
- `bash make_out.sh myCA.der`

**After doing this the output directory (from here on reffered to as PKIMetadata) will be generated, which is the custom Certificate Authority.**

Now, modify the shim with the generated PKIMetadata:

- `bash modify.sh <shim path>`

Now flash the shim into a USB using rufus or Chromebook Recovery Utility. Boot the shim in dev mode, and ICARUS will attempt to modify your stateful partition.

## SERVER SETUP

Requirements: npm, node  

Cd into the directory where your Icarus files are saved. Then run `make start-server` to start your proxy, then continue with the instructions below.

Do not use WSL to host a server!

Reboot the device. You'll boot into verified mode. Once you have your server running, open the network configuration by clicking the lower right button (it will show the date), connecting to wifi, and then change the proxy settings accordingly.

- Set proxy settings to manual.
- Set HTTPS IP to the IP you used to host the proxy server. 
- Resume setup and your device will unenroll. 

## USING PREBUILTS
Requirments:
A USB or Micro SD card.
A personal laptop or pc to flash the image onto your USB.
Something to run the server on.

- Go to https://dl.darkn.bio/Icarus
- Grab a shim for your board
- Flash it onto your USB using CRU or Rufus
- Once flashed, get your chromebook.
- Esc Refresh Power, Control D, Enter, then Esc Refresh Power again, Plug In your USB, and let Icarus modify your stateful partition.
- Once done follow Server Setup instructions

## Troubleshooting

<details>
  <summary>During building, everything starting from root was copied into original!</summary>

  Please run ``git pull`` on your local copy. This bug has been fixed.
</details>

<details>
  <summary>My device says "Can't reach Google"!</summary>
  
  - Make sure your device and the server are connected to the same network
  - If that didn't work, powerwash your device and re-run the modified shim, and keep the server running.
</details>

## Credits
- [MunyDev](https://github.com/MunyDev) - Creating this exploit
- [Archimax](https://github.com/EnterTheVoid-x86) - Cleaning up get_original_data.sh and inshim.sh + README changes
- [r58Playz](https://github.com/r58Playz) - General bash script improvements
- [Akane](https://github.com/genericness) - Help with SSL, general advice, and README changes
