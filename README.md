# TWRP Device configuration for Motorola Moto G8 Plus

## Device specification

Basic   | Spec Sheet
-------:|:------------------------
CPU     | Octa-core 2.0 GHz Kryo 260
CHIPSET | Qualcomm SM6125 Snapdragon 665
GPU     | Adreno 610
Memory  | 4 GB LPDDR4X
Shipped Android Version | 9.0 (Pie)
Storage | 64 GB eMMC 5.1
Battery | 4000 mAh
Dimensions | 158.4 x 75.8 x 9.1 mm
Display | 1080 x 2280 pixels, 19:9 ratio
Rear Camera  | 48 MP, f/1.7, PDAF, Laser AF, 16 MP UltraWide, f/2.2 + Action Cam, 5 MP depth sensor, f/2.2
Front Camera | 12 MP, 1.25µm

![Device Picture](https://cdn2.gsmarena.com/vv/pics/motorola/motorola-moto-g8-plus-1.jpg)

### Kernel Source
Check here: https://github.com

### How to compile

```
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch omni_doha-eng
mka clean && mka recoveryimage
```

### Test build

```
cd out/target/product/doha
fastboot boot recovery.img
```
NOTE: TWRP test. I not sure if everything works fine. Maybe test this in local repo :)
