# Networking for SOC Analysts: Lesson 1
## Topic: The OSI Model & TCP/IP in Action

As a SOC Analyst, you don't just "know" the OSI model; you live in it. Every alert in Wazuh or any SIEM is tied directly to these layers.

### 1. The Core Focus (Layers 2, 3, and 4)
While there are 7 layers, the "Security Triad" of networking layers you'll see in 90% of your logs are:

| Layer | Name | Data Unit | Security Relevance |
|---|---|---|---|
| **Layer 4** | **Transport** | Segments | Ports (TCP/UDP). Is someone scanning port 445 (SMB) or 22 (SSH)? |
| **Layer 3** | **Network** | Packets | IP Addresses. Is the traffic coming from a known malicious IP? |
| **Layer 2** | **Data Link** | Frames | MAC Addresses. Is there a spoofed device on the local network? |

---

### 2. Why this matters for your Wazuh Lab
In our last project, when we saw a "Brute Force" alert, the log contained:
- `src_ip`: (Layer 3)
- `dst_port`: (Layer 4)
- `protocol`: (Layers 3 & 4)

**The Analyst's Thought Process:**
> "I see a Layer 3 packet from `192.168.1.50` trying to hit Layer 4 Port `22` using TCP. This is an SSH login attempt."

---

### 3. OSI vs. TCP/IP (The Simplified Version)
The OSI is the theoretical model, but **TCP/IP** is the actual model the internet uses.

| OSI (Theory) | TCP/IP (Reality) | Examples |
|---|---|---|
| Layers 5, 6, 7 | **Application** | HTTP, DNS, SMTP, SSH |
| Layer 4 | **Transport** | TCP, UDP |
| Layer 3 | **Internet** | IP, ICMP |
| Layers 1, 2 | **Network Access** | Ethernet, Wi-Fi |

---

### 📝 Practical Task (Refresher)
Think about your Wazuh lab:
1. When you configured the Wazuh Agent on your Windows machine, it had to talk back to the Wazuh Manager.
2. What **Layer 4** port does the agent use to communicate? (Hint: It's usually 1514 or 1515).
3. If a firewall blocks that port at **Layer 4**, will the **Layer 7** application (Wazuh) work?

**Next Lesson:** Deep dive into TCP Three-Way Handshakes (and how to detect a SYN Scan).
