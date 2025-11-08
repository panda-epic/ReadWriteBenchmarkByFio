# ReadWriteBenchmarkByFio

## 📘 ReadWriteBenchmark.sh
A simple yet effective Bash script to benchmark disk read/write performance using [FIO](https://github.com/axboe/fio), with automatic execution, animated progress feedback, and bandwidth conversion to MB/s.

### 🚀 Features
- Automatically runs a 60-second FIO test if no input file is provided
- Displays a fun bouncing animation while benchmarking
- Parses and converts read/write bandwidth from KiB/s and kB/s to MB/s
- Cleans up temporary files after execution
- Minimal dependencies and easy to run

---

### 🛠 Prerequisites
- Linux or Unix-like environment
- `fio` installed  
  You can install it via:
  ```bash
  sudo apt install fio
  ```

---

### 📦 Usage
```bash
./ReadWriteBenchmark.sh fio_output.txt
```

- If `fio_output.txt` does not exist, the script will:
  1. Run the FIO benchmark
  2. Show a bouncing animation while it runs
  3. Re-run itself to parse and display the results

---

### 📊 Sample Output
```
Test Result Bandwidths (MB/s):
----------------------------
READ:
  Binary (KiB/s): 415 → 0.405 MB/s
  Decimal (kB/s): 425 → 0.425 MB/s
WRITE:
  Binary (KiB/s): 433 → 0.423 MB/s
  Decimal (kB/s): 444 → 0.444 MB/s
```

---

### 🧹 Cleanup
The script automatically deletes `fio_output.txt` after parsing to keep your workspace clean.

---

### ❤️ Contributing
Feel free to fork, tweak, or extend this script. Whether you're adding new metrics, improving animations, or adapting it for other platforms — sharing is loving!

---

### 📄 License
This project is open-source and free to use.

---
