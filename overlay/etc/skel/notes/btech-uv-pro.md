# BTECH UV Pro Bluetooth TNC Notes

## Linux Packet Configuration

Edit `/etc/ax25/axports` has root and add the following line.

```
PKT1200 KT7RUN 1200 255 2 145.710
```

## Radio Configuration

* KISS TNC > Enable KISS TNC = checked

## Pair Radio and Computer

1. On the radio, start the pairing process by navigating to 
   Menu > Pairing.

2. 
 
3. On the computer, run `bluetoothctl`

```
> power on
> scan on
> pair 38:D2:00:00:ED:C8
> trust 38:D2:00:00:ED:C8
> quit
```

## If you're already paired

1. Kill any instances of rfcomm if they are running

```
sudo killall rfcomm
```

2. 

```
$ sudo rfcomm connect /dev/rfcomm0 38:D2:00:00:ED:C8
Connected /dev/rfcomm0 to 38:D2:00:00:ED:C8 on channel 1
Press CTRL-C for hangup
```

3. In another window, check that you are connected.

```
bluetoothctl info 38:D2:00:00:ED:C8 | grep Connected | awk '{print $2}'
```

4. Kill any instances of kissattach if they are running.

```
sudo killall kissattach
```

5. Attach to the desired AX.25 port.

```
$ sudo kissattach /dev/rfcomm0 PKT1200
AX.25 port PKT1200 bound to device ax0
```

6. Connect to the BBS

```
axcall PKT1200 TTPBBS
```

Listen to incoming and outgoing packets and capture the time
stamps for the traffic.

```
$ sudo axlisten -a -t
```

## Troubleshooting

1. systemctl status  bluetooth
