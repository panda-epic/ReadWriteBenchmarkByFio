# ReadWriteBenchmarkByFio

## 📘 ReadWriteBenchmark.sh
A simple yet effective Bash script to benchmark disk read/write performance using [FIO](https://github.com/axboe/fio), with automated, one command execution and bandwidth conversion to MB/s.

### 🚀 Features
- Automatically runs a 60-second FIO test if no input file is provided
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
---



### 🛠️ Initial Setup
Perfect — here’s a step-by-step guide to test your `ReadWriteBenchmark.sh` script from scratch:
---

#### 🧰 1. **Install Prerequisites**
Make sure your system has Git and FIO, else skip command
```bash
sudo apt update
sudo apt install git fio -y
```
---

#### 📦 2. **Clone Your GitHub Repository**
```bash
git clone https://github.com/panda-epic/ReadWriteBenchmarkByFio.git &&
cd ./ReadWriteBenchmarkByFio
```

---
#### 🔐 3. **Make the Script Executable**
```bash
chmod +x ReadWriteBenchmark.sh
```
---

#### 🚀 4. **Run the Script**
```bash
./ReadWriteBenchmark.sh fio_output.log
```

- If `fio_output.txt` doesn’t exist, the script will:
  - Run the FIO benchmark
  - Re-run itself to parse and display the results
  - Clean up the output file
---



### 📊 Sample Output
```
Test Result Bandwidths (MB/s):
----------------------------
read:
  Binary (KiB/s): 415 → 0.405 MB/s
  Decimal (kB/s): 425 → 0.425 MB/s
write:
  Binary (KiB/s): 433 → 0.423 MB/s
  Decimal (kB/s): 444 → 0.444 MB/s
```
---



### 🧹 Cleanup
The script automatically deletes `fio_output.txt` after parsing to keep your workspace clean.

Delete the whole repo folder.
```bash
rm -rf ReadWriteBenchmarkByFio
```

Unistall Fio.
```bash
sudo apt remove fio
```
---



### ❤️ Contributing
Feel free to fork, tweak, or extend this script. Whether you're adding new metrics, improving animations, or adapting it for other platforms — sharing is loving!
---



### 📄 License
This project is open-source and free to use.
---
