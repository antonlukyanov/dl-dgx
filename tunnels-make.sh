#!/usr/bin/env bash

config=$1
if [ -z "$config" ]; then
    config='config-tf2.sh'
fi

source "$config"

jl_tun=$jl_port:localhost:$jl_port
jl_sock=.tunnel-$jl_port-jl

ssh_tun=$ssh_port:localhost:$ssh_port
ssh_sock=.tunnel-$ssh_port-ssh

tb_tun=$tb_port:localhost:$tb_port
tb_sock=.tunnel-$tb_port-tb

if [[ ! -S "$jl_sock" ]]; then
    ssh -M -S $jl_sock -fNL $jl_tun dgx
    echo "[info]: $jl_sock created"
else
    echo "[warning]: $jl_sock exists"
fi

if [[ ! -S "$ssh_sock" ]]; then
    ssh -M -S $ssh_sock -fNL $ssh_tun dgx
    echo "[info]: $ssh_sock created"
else
    echo "[warning]: $ssh_sock exists"
fi

if [[ ! -S "$tb_sock" ]]; then
    ssh -M -S $tb_sock -fNL $tb_tun dgx
    echo "[info]: $tb_sock created"
else
    echo "[warning]: $tb_sock exists"
fi
