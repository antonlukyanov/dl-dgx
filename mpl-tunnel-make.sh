#!/usr/bin/env bash

# Чтобы узнать порт, внутри консоли PyCharm: import os; os.getenv('PYCHARM_MATPLOTLIB_PORT')
ssh -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    -o LogLevel=ERROR \
    -M -S .tunnel-mpl -fNR $1:localhost:$1 anton@localhost -p 8890
