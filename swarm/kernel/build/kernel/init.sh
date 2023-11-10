#!/bin/bash

cd "/var/mikbill/kernel" && php "mikbill.php" --noroot

touch "${MIKBILL_KERNEL_LOG}"
tail -f "${MIKBILL_KERNEL_LOG}"