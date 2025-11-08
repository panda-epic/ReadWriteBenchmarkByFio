#!/bin/bash

# Usage: ./ReadWriteBenchmark.sh fio_output.log

INPUT_FILE="$1"

if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Debug: Running the Fio to create the input file."

    if ! command -v fio &> /dev/null; then
      echo "Error: Fio is not installed. Run 'sudo apt install fio' to install it."
      exit 1
    else
        fio --name=randrw --rw=randrw --size=512M --direct=1 --bs=4k --numjobs=4 --time_based --runtime=60 --group_reporting >> fio_output.log &
        fio_pid=$!
        # Bounce animation
        frames=(    " o             "
                    "  .            "
                    "   °           "
                    "    '          "
                    "     o         "
                    "      .        "
                    "       °       "
                    "        '      "
                    "         o     "
                    "          .    "
                    "           °   "
                    "            '  "
                    "             o "
                    "              ."
                    "             o "
                    "            '  "
                    "           °   "
                    "          .    "
                    "         o     "
                    "        '      "
                    "       °       "
                    "      .        "
                    "     o         "
                    "    '          "
                    "   °           "
                    "  .            "   )
        while kill -0 $fio_pid 2>/dev/null; do
            for frame in "${frames[@]}"; do
                printf "\rRunning Benchmark... [$frame]"
            sleep 0.1
            done
        done
        echo -e "\rFIO Benchmark Complete!"
    exec "$0" "$INPUT_FILE"
    fi
fi

echo "Test Result Bandwidths (MB/s):"
echo "----------------------------"

# Extract and convert read and write bandwidths
grep -E '^\s+(read|write): IOPS=' "$INPUT_FILE" | while read -r line; do
  op=$(echo "$line" | awk -F':' '{print $1}' | xargs)

  # Try to extract MB/s directly (newer FIO versions)
  mib=$(echo "$line" | grep -oP 'BW=\K[0-9.]+(?=MiB/s)')
  mb=$(echo "$line" | grep -oP '\(\K[0-9.]+(?=MB/s)')

  # Fallback to KiB/s and kB/s (older FIO versions)
  if [[ -z "$mib" ]]; then
    kib=$(echo "$line" | grep -oP 'BW=\K[0-9]+(?=KiB/s)')
    mib=$(awk "BEGIN {printf \"%.3f\", $kib / 1024}")
  fi

  if [[ -z "$mb" ]]; then
    kb=$(echo "$line" | grep -oP '\(\K[0-9]+(?=kB/s)')
    mb=$(awk "BEGIN {printf \"%.3f\", $kb / 1000}")
  fi

  echo "$op:"
  echo "  Binary (MiB/s): $mib MB/s"
  echo "  Decimal (MB/s): $mb MB/s"
done

# Clean-up previous test file.
rm ./fio_output.log
