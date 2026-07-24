## Network & IP Adresses

Core Standard = 10.<LOCATION>.<VLAN>.<HOST>

10.20.2.15
│  │  │ │
│  │  │ └── Host
│  │  └──── VLAN
│  └─────── Location
└────────── MedCare private network

Amsterdam     10.20.0.0/16
Rotterdam     10.10.0.0/16
Utrecht       10.30.0.0/16
The Hague     10.70.0.0/16
Groningen     10.50.0.0/16
Arnhem        10.26.0.0/16
Maastricht    10.43.0.0/16

## VLAN Standard
| VLAN | Purpose                         |
| ---- | ------------------------------- |
| 2    | Patient Room Alarm Devices      |
| 7    | Smart Sensors / Camera Systems  |
| 8    | Galaxias / Voice                |
| 15   | NenCloud Fire & Smoke Detection |
| 99   | Network Management              |

## Amsterdam
10.20.0.0/16

10.20.2.0/24     VLAN 2     Patient Room Alarms
10.20.7.0/24     VLAN 7     Smart Sensors / Cameras
10.20.8.0/24     VLAN 8     Galaxias / Voice
10.20.15.0/24    VLAN 15    NenCloud
10.20.99.0/24    VLAN 99    Management

## Rotterdam
10.10.0.0/16

10.10.2.0/24     VLAN 2     Patient Room Alarms
10.10.7.0/24     VLAN 7     Smart Sensors / Cameras
10.10.8.0/24     VLAN 8     Galaxias / Voice
10.10.15.0/24    VLAN 15    NenCloud
10.10.99.0/24    VLAN 99    Management

