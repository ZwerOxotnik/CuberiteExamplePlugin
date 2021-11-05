**[Lua](#lua)** |
**[Notes](#notes)** |
**[License](#license)**

Example plugin for [Cuberite](https://cuberite.org/) - **WIP**
==============================================================

**This repository isn't official. Please, visit https://api.cuberite.org/ to get full information about API etc.**

Also, you can get more info on [Cuberite Discord](https://discord.gg/76w5J6M) and on [Cuberite forum](https://forum.cuberite.org/).

Currently, this repository has only brief information and some scripts for Linux to help you use and install all necessary stuff to develop [Cuberite plugins](https://api.cuberite.org/Writing-a-Cuberite-plugin.html).

Installation & configuration
----------------------------

Install [ZeroBrane Studio](https://studio.zerobrane.com/) (optional) and [Cuberite] [manually](https://api.cuberite.org/SettingUpZeroBrane.html) or using Linux scripts below.

Open a Linux terminal (Ctrl+Alt+T) and then use the commands below.

Installation of dependencies on Debian and Ubuntu:

```sh
sudo apt-get install git curl -y
```

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
mkdir -p Cuberite &&\
	cd Cuberite &&\
	curl -sSfL https://download.cuberite.org | sh &&\
	./Cuberite

# Download important plugins for developing
cd Plugins
git clone https://github.com/Rorkh/HotReload || cd HotReload && git pull && cd ..
git clone https://github.com/madmaxoft/PluginMemory || cd PluginMemory && git pull && cd ..
git clone https://github.com/cuberite/APIFuzzing || cd APIFuzzing && git pull && cd ..
git clone https://github.com/cuberite/PerfPages || cd PerfPages && git pull && cd ..
cd ..
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

After ZBS opened, select `Project` -> `Lua Interpreter submenu`: `Cuberite - release mode`\
If you don't see `Cuberite - release mode`, Restart ZBS.

You're ready to use [ZeroBrane Studio](https://studio.zerobrane.com/) for [Cuberite].

Let's load plugins, but first we need to set username, password in `webadmin.ini`.\
Uncomment 5th and 6th lines in `webadmin.ini`. Remember, default password is's not [safe](https://its.lafayette.edu/policies/strongpasswords/) etc.
```
[User:admin]
Password=admin
```

Open your browser and type this [localhost:8080](localhost:8080) as url to open WebAadmin. As the site loaded, press `Log in`, enter the username and password, then click `Sign in`.\
After you signed in, press `Plugins` and find `HotReload`, `PluginMemory`, `PerfPages`, `APIFuzzing` and press `Enable` button for the plugins. (Btw, APIFuzzing will prevent loading if there are some mistakes in plugins)\
Now press `Reload now` button and you're ready to use plugins and the server.

Important info
--------------

Plugin name and folder name should be identical, otherwise it may cause some problems with other plugins.\
Please, keep plugins on GitHub, because it gives you a possibility to show them on https://plugins.cuberite.org/.

Lua
---

[Cuberite] plugins uses [lua 5.1], if you want to use external lua tools or other IDEs then read it, otherwise skip to section [Notes](#notes).

I recommend to install [luaver] for managing versions of Lua and [luarocks].

Installation of dependencies on Debian and Ubuntu:

```shell
sudo apt-get install linux-headers-generic libreadline-dev build-essential git dkms -y
```

Installation of [luaver] in a folder:

```shell
git clone https://github.com/DhavalKapil/luaver
cd luaver
. ./install.sh
. ~/.bashrc
```

Manage versions in a Linux terminal:

```shell
luaver install 5.1
luaver use 5.1
luaver set-default 5.1
luaver install-luarocks 3.7.0
luaver use-luarocks 3.7.0
luaver set-default-luarocks 3.7.0
```

You can now use it with other IDEs and download and use tools like: [luacheck], [LuaFormatter] etc.

Notes
-----

* [.scripts](./.scripts) folder isn't necessary, but those scripts might be useful for you.
* [.vscode](./.vscode) folder uses for [Visual Studio Code](https://code.visualstudio.com/), and it's not necessary for any other editor
* [.editorconfig](./.editorconfig) file isn't necessary for Zero Brain Studio, because it doesn't support it. Nonetheless, it may be useful for other editors. More information on https://editorconfig.org/
* [lint.yml](./github/workflows/lint.yml) uses as a [GitHub action](https://github.com/features/actions) for linting. Example: https://github.com/ZwerOxotnik/CuberiteExamplePlugin/runs/4114814565
* Perhaps, [EmmyLua](https://github.com/sumneko/lua-language-server/wiki/EmmyLua-Annotations) might be useful.
* Optimization tips: https://stigmax.gitbook.io/lua-guide/auxiliary/optimizations & http://lua-users.org/wiki/OptimisationTips & https://springrts.com/wiki/Lua_Performance & https://www.lua.org/gems/sample.pdf & [tips](https://stackoverflow.com/questions/154672/what-can-i-do-to-increase-the-performance-of-a-lua-program) (please, notice that Cuberite plugins uses [lua 5.1], so some tips might be **irrelevant!**) & [Performance Comparison](https://eklausmeier.wordpress.com/2020/05/14/performance-comparison-pallene-vs-lua-5-1-5-2-5-3-5-4-vs-c/) & https://gitspartv.github.io/LuaJIT-Benchmarks/
* I should add more examples and info

License
-------

I'm interested in distributing code as freely as possible.

Copyright (c) 2021 ZwerOxotnik <zweroxotnik@gmail.com>

Licensed under the [MIT licence](https://tldrlegal.com/license/mit-license).

```txt
The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

[Cuberite]: https://cuberite.org/
[luaver]: https://github.com/DhavalKapil/luaver
[luarocks]: https://luarocks.org/
[lua 5.1]: https://www.lua.org/manual/5.1/
[luacheck]: https://github.com/mpeterv/luacheck
[LuaFormatter]: https://github.com/Koihik/LuaFormatter
