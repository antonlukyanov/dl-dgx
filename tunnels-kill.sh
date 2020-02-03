#!/usr/bin/env bash

config=$1
if [ -z "$config" ]; then
    config='config-tf2.sh'
fi

source "$config"

jl_sock=.tunnel-$jl_port-jl
ssh_sock=.tunnel-$ssh_port-ssh
tb_sock=.tunnel-$tb_port-tb

ssh -S $jl_sock -O exit dgx
ssh -S $ssh_sock -O exit dgx
ssh -S $tb_sock -O exit dgx
