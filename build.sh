#!/bin/bash

pushd app

west build -d build/hidergo_split_left --board=hidergo_split_left && \
cp ./build/hidergo_split_left/zephyr/zmk.uf2 ../left.uf2 && \
west build -d build/hidergo_split_right --board=hidergo_split_right && \
cp ./build/hidergo_split_right/zephyr/zmk.uf2 ../right.uf2

popd