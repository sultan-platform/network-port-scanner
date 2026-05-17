# Network Reachability and Port Scanner - Alpha Team

## Project Description

This project is a Bash command-line tool that discovers live devices on a local network, scans common open ports, and performs a safe vulnerability demonstration in a lab-controlled environment.

The demonstrated vulnerability is HTTP Directory Listing, where files may be visible through a web server if directory browsing is enabled.

This tool is for educational and authorized lab use only.

---

## Repository Path

ITAP/COSC-3411/Alpha

---

## Files Included

- scanner.sh
- lab_vulnerable_server.sh
- README.md

---

## Requirements

Make sure the following tools are installed:

- Bash
- ping
- netcat (nc)
- curl
- Python 3

Check installed tools:

```bash
which bash
which ping
which nc
which curl
python3 --version
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/sultan-platform/network-port-scanner.git
```

Move into the project folder:

```bash
cd network-port-scanner
```

Give execute permission:

```bash
chmod +x scanner.sh
chmod +x lab_vulnerable_server.sh
```

---

## How to Run

### Step 1: Start the vulnerable lab server

```bash
./lab_vulnerable_server.sh
```

### Step 2: Open another terminal and run the scanner

```bash
./scanner.sh
```

### Step 3: Enter the network prefix

```text
127.0.0
```

---

## Usage Example

Run:

```bash
./scanner.sh
```

Example input:

```text
Enter network prefix, example 192.168.1 or 127.0.0: 127.0.0
```

---

## Example Output

```text
Network Reachability and Port Scanner - Alpha Team
Authorized lab use only.
--------------------------------------------------

[1] Discovering alive hosts...

127.0.0.1 is alive
Scanning common ports on 127.0.0.1...
  Port 8080 is open
  [!] Lab vulnerability found on 127.0.0.1:8080
      HTTP Directory Listing is enabled.
      Safe lab demo: files in this folder may be visible through the browser.

Scan finished.
```

---

## Design Choices

This project was implemented in Bash because it is lightweight, simple, and suitable for command-line networking tasks.

Tools used:

- `ping` to discover live hosts
- `nc` to scan open ports
- `curl` to inspect HTTP responses
- `grep` to detect vulnerability text
- `python3 -m http.server` to create the lab-controlled vulnerable service

---

## Safety Note

This tool must only be used in authorized lab environments.

Do not use it on public or unauthorized systems.

---

## Team

Alpha Team
