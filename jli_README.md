### init
https://zmk.dev/docs/development/local-toolchain/setup/container

* zmk config

`docker volume create --driver local -o o=bind -o type=none \
  -o device="/absolute/path/to/zmk-config/" zmk-config`

* modules

`docker volume create --driver local -o o=bind -o type=none \
  -o device="/absolute/path/to/zmk-modules/parent/" zmk-modules`

* west init first time
west init -l app/
west update
west zephyr-export
pip3 install --user -r zephyr/scripts/requirements.txt

* hidergo addition
git clone git@github.com:osmakari/hdl-core.git hidergo-hdl-core


### build
https://zmk.dev/docs/development/local-toolchain/build-flash

1. `west update`
2. make changes `app/boards/arm/hidergo_split/hidergo_split.keymap`

cd app

west build -d build/hidergo_split_left --board=hidergo_split_left
west build -d build/hidergo_split_right --board=hidergo_split_right

./build/hidergo_split_left/zephyr/zmk.uf2
./build/hidergo_split_right/zephyr/zmk.uf2

cp ./build/hidergo_split_left/zephyr/zmk.uf2 ../left.uf2
cp ./build/hidergo_split_right/zephyr/zmk.uf2 ../right.uf2


### Build and prep
west build -d build/hidergo_split_left --board=hidergo_split_left && \
cp ./build/hidergo_split_left/zephyr/zmk.uf2 ../left.uf2 && \
west build -d build/hidergo_split_right --board=hidergo_split_right && \
cp ./build/hidergo_split_right/zephyr/zmk.uf2 ../right.uf2