EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR0101
U 1 1 5E1A49E1
P 3900 5100
F 0 "#PWR0101" H 3900 4850 50  0001 C CNN
F 1 "GND" H 3905 4927 50  0000 C CNN
F 2 "" H 3900 5100 50  0001 C CNN
F 3 "" H 3900 5100 50  0001 C CNN
	1    3900 5100
	1    0    0    -1  
$EndComp
Entry Wire Line
	4600 2400 4700 2500
Entry Wire Line
	4600 2500 4700 2600
Entry Wire Line
	4600 2600 4700 2700
Entry Wire Line
	4600 2700 4700 2800
Entry Wire Line
	4600 2800 4700 2900
Entry Wire Line
	4600 2900 4700 3000
Entry Wire Line
	4600 3000 4700 3100
Entry Wire Line
	4600 3100 4700 3200
Entry Wire Line
	4600 3200 4700 3300
Entry Wire Line
	4600 3300 4700 3400
Entry Wire Line
	4600 3500 4700 3600
Entry Wire Line
	4600 3400 4700 3500
Entry Wire Line
	4600 3600 4700 3700
Entry Wire Line
	4600 3700 4700 3800
Entry Wire Line
	4600 3800 4700 3900
Entry Wire Line
	4600 3900 4700 4000
Entry Wire Line
	4600 4100 4700 4200
Entry Wire Line
	4600 4200 4700 4300
Entry Wire Line
	4600 4300 4700 4400
Entry Wire Line
	4600 4400 4700 4500
Entry Wire Line
	4600 4500 4700 4600
Entry Wire Line
	4600 4600 4700 4700
Entry Wire Line
	4600 4700 4700 4800
Entry Wire Line
	4600 4800 4700 4900
$Comp
L power:+5V #PWR0102
U 1 1 5E1A3FDA
P 3900 2100
F 0 "#PWR0102" H 3900 1950 50  0001 C CNN
F 1 "+5V" H 3915 2273 50  0000 C CNN
F 2 "" H 3900 2100 50  0001 C CNN
F 3 "" H 3900 2100 50  0001 C CNN
	1    3900 2100
	1    0    0    -1  
$EndComp
$Comp
L CPU:Z80CPU Z80
U 1 1 5E19E594
P 3900 3600
F 0 "Z80" H 3900 5281 50  0001 C CNN
F 1 "Z80CPU" H 3900 5190 50  0000 R CNN
F 2 "" H 3900 4000 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 3900 4000 50  0001 C CNN
	1    3900 3600
	1    0    0    -1  
$EndComp
Text Notes 7400 7250 0    50   ~ 0
Main
Text Notes 7350 7500 0    79   ~ 0
Z80 cpu project\n
Wire Bus Line
	4700 4200 4700 4900
Wire Bus Line
	4700 2500 4700 4000
$EndSCHEMATC
