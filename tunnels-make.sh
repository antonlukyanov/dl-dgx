#!/usr/bin/env bash

config=$1
if [ -z "$config" ]; then
    config='config-tf1x.sh'
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
else
    echo "[info]: $jl_tun tunnel exists"
fi

if [[ ! -S "$ssh_sock" ]]; then
    ssh -M -S $ssh_sock -fNL $ssh_tun dgx
else
    echo "[info]: $ssh_tun tunnel exists"
fi

if [[ ! -S "$tb_sock" ]]; then
    ssh -M -S $tb_sock -fNL $tb_tun dgx
else
    echo "[info]: $tb_tun tunnel exists"
fi
