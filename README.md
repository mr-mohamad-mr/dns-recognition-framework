# DNS Recon Framework

A bash-based DNS analysis toolchain that runs the best recon tools on a target domain.

## Tools Used
- Amass
- Dnsrecon
- Subfinder
- Dnsenum
- Fierce
- Dnsmap
- Dig
- Host
- Nslookup

## Usage

```bash
chmod +x recon.sh
./recon.sh example.com
```

Results will be saved in the `output/example.com` directory.

## Requirements

Install the tools before use:
```bash
sudo apt install dnsenum dnsrecon fierce dnsmap whois dig
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/owasp-amass/amass/v4/...@latest
```
