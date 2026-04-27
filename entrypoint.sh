#!/bin/sh

set -eu

## See Also https://forums.docker.com/t/udevadm-control-reload-rules/135564
/lib/systemd/systemd-udevd --daemon
udevadm control --reload-rules
udevadm trigger --name-match=kvm

exec gosu ${USERNAME} "$@"
