# icarus
This tool allows us to unenroll devices with device management interception with a proxy and a Certificate Authority  
Clone this repo with `git clone --recursive`
## New configs what does this mean
These new configs have rolled keys. We are testing the compatibility of these new keys for interception

## Setup and installation instructions
Set up the environment by running the following commands. Make sure to have python3 and python3-venv installed
- `make setup-venv`
- `make enter-venv`
- `make setup-python`
- `make build-packed-data`
- `bash get_original_data.sh`
- `bash make_out.sh myCA.der`

After doing this the output directory will be generated. The output directory that is generated will be used in the shim.
- `bash modify.sh <shim path>`
- Now boot your shim.
- In the terminal of the shim, run `mount /dev/disk/by-label/STATE /mnt/stateful_partition`
- `bash /mnt/stateful_partition/usr/bin/inshim.sh`
- Reboot the device
- Open the network configuration by clicking the lower left button, connecting to wifi, and then change the proxy settings
- Set proxy settings to manual
- Set HTTPS ip to the IP you used to host the proxy server. 
- Resume setup and it will unenroll. 

## Server setup (Only for people hosting servers)
Requirements: npm, node  
run `make start-server`
