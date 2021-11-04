Example plugin for [Cuberite](https://cuberite.org/) - **WIP**
==============================================================

**This repository isn't official. Please, visit https://api.cuberite.org/ to get full information about API etc.**

Currently, this repository has only brief information and some scripts for Linux to help you use and install all necessary stuff to develop [Cuberite plugins](https://api.cuberite.org/Writing-a-Cuberite-plugin.html).

Installation
------------

Install [ZeroBrane Studio](https://studio.zerobrane.com/) (optional) and [Cuberite] [manually](https://api.cuberite.org/SettingUpZeroBrane.html) or using scripts below.

Scripts for Linux
-----------------

Open a Linux terminal (Ctrl+Alt+T) and then use the commands below.

```sh
# Install ZBS (ZeroBrane Studio) v1.90
# https://studio.zerobrane.com/doc-installation#linux
# NOTE: uninstall is `zbstudio-uninstall`
curl https://download.zerobrane.com/ZeroBraneStudioEduPack-1.90-linux.sh -o zerobrane.sh &&\
	chmod +x zerobrane.sh &&\
	./zerobrane.sh &&\
	rm zerobrane.sh

# Download cuberite.lua into ZBS
curl -L https://raw.githubusercontent.com/pkulchenko/ZeroBranePackage/master/cuberite.lua > /opt/zbstudio/packages/cuberite.lua
```

```sh
# Install Cuberite
mkdir -p cuberite &&\
	cd cuberite &&\
	curl -sSfL https://download.cuberite.org | sh &&\
	./cuberite
```

After Cuberite loaded your server, use the commands below one by one to get API files & .luacheckrc

* load APIDump
* api
* apicheck
* stop

```sh
# Copy the API into ZBS
cp -f cuberite_api.lua /opt/zbstudio/api/lua/cuberite_api.lua

# Launch ZBS
zbstudio
```

After ZBS opened, select `Project` -> `Lua Interpreter submenu`: `Cuberite - release mode`
```fix
Restart ZBS if you don't see "Cuberite - release mode"
```

You're ready to use [ZeroBrane Studio](https://studio.zerobrane.com/) for [Cuberite].

[Cuberite]: https://cuberite.org/