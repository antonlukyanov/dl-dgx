#!/usr/bin/env bash

# Чтобы узнать порт, внутри консоли PyCharm: import os; os.getenv('PYCHARM_MATPLOTLIB_PORT')
ssh -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    -o LogLevel=ERROR \
    -o PreferredAuthentications=password \
    -M -S .tunnel-mpl -fNR $1:localhost:$1 master@localhost -p 9002
