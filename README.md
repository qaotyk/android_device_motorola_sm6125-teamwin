# TWRP Common Device configuration for Motorola SM6125 (trinket) Devices

This repository contains the common device configuration for Team Win Recovery Project (TWRP) on Motorola Snapdragon 665 (SM6125/trinket) devices.

## Supported Devices

| Picture | Product name | Codename | SoC | Frequency | Architecture | GPU | RAM | Storage | Battery | Resolution | Ratio | Shipped Android Version |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| ![motorola](https://fdn2.gsmarena.com/vv/bigpic/motorola-moto-g8-plus.jpg) | Moto G8 Plus | doha | Snapdragon 665 | 2.0 GHz | 64-bit | Adreno 610 | 4 GB | 64 GB | 4000 mAh | 1080x2280 | 19:9 | 9.0 (Pie) |
| ![motorola](https://fdn2.gsmarena.com/vv/bigpic/motorola-moto-g-power.jpg) | Moto G Power (2020) | sofia | Snapdragon 665 | 2.0 GHz | 64-bit | Adreno 610 | 4 GB | 64 GB | 5000 mAh | 1080x2300 | 19:9 | 10 (Q) |
| ![motorola](https://fdn2.gsmarena.com/vv/bigpic/motorola-moto-g-stylus-.jpg) | Moto G Stylus / G Pro | sofiap | Snapdragon 665 | 2.0 GHz | 64-bit | Adreno 610 | 4 GB | 128 GB | 4000 mAh | 1080x2300 | 19:9 | 10 (Q) |
| ![motorola](https://fdn2.gsmarena.com/vv/bigpic/motorola-moto-g-power-r.jpg) | Moto G8 Power | sofiar | Snapdragon 665 | 2.0 GHz | 64-bit | Adreno 610 | 4 GB | 64 GB | 5000 mAh | 1080x2300 | 19:9 | 10 (Q) |
| ![motorola](https://fdn2.gsmarena.com/vv/bigpic/motorola-moto-g8.jpg) | Moto G8 / Moto G Fast | rav | Snapdragon 665 | 2.0 GHz | 64-bit | Adreno 610 | 3/4 GB | 32/64 GB | 4000 mAh | 720x1560 | 19.5:9 | 10 (Q) |

## Compilation Guide 🔧

First, enter your work environment. This is an example to build TWRP using the Minimal TWRP Manifest:
```bash
cd ~/twrp-12.1
```

Then clone this repository into `device/motorola/sm6125-common`:
```bash
git clone https://github.com/qaotyk/android_device_motorola_sm6125-teamwin.git device/motorola/sm6125-common
```

Additionally, ensure you have your device-specific repository cloned (e.g. `device/motorola/doha`).

To compile the recovery image:
```bash
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_<codename>-eng
mka recoveryimage
```

### Test build
To test the compiled recovery without flashing:
```bash
fastboot boot out/target/product/<codename>/recovery.img
```
