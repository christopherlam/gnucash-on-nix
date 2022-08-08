# gnucash-on-nix

Developing and Building GnuCash on a new Linux distribution can be be
difficult. There are numerous dependencies to install into the current
environment, which is not necessarily what you may want into your
Linux profile.

Luckily the Nix ecosystem provides a way to temporarily load
dependencies (guile, boost, glib etc) for building, allow building,
then exit the Nix environment and still run the freshly built GnuCash.

# Method

1. Install Nix - guidance available at
https://nixos.org/download.html#nix-install-linux

2. Install git. This is a must-have nowadays. And any text editor of
your choice.

3. Clone the gnucash repository.

    $ git clone https://github.com/Gnucash/gnucash/

4. Copy `shell.nix` into the current folder.

5. Run `nix-shell` which loads the packages specified in `shell.nix`
and creates a child shell with all the required tooling available. The
first launch will download all dependencies into `/nix/store/`. The
space used may be purged with `nix-store --gc`. It is not necessary to
purge the store.

6. Build as required. My build scripts are as follows.

7. After building and installing, you can `exit` the Nix shell, and
all dependencies are no longer available.

# Build scripts

rebuild.sh:
```
rm -rf ./{build,install}
mkdir build
cd build
cmake -GNinja -DWITH_AQBANKING=OFF -DWITH_SQL=ON -DWITH_PYTHON=ON -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../install ../gnucash
```

and run.sh:
```
cd build
ninja
ninja install > /dev/null
cd ../install/bin
./gnucash --extra --logto stdout
```

