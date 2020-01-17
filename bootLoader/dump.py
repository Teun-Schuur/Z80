from sys import argv
from eeprom_programer import EEPROM

settings = {
    "dataPins": [2, 3, 4, 17, 27, 22, 10, 25],
    "addressPins": [11, 5, 6, 13, 19, 26, 21, 20, 16, 12, 7],
    "writePin": 14,
    "readPin": 15,
    "writeTime": 1/1000
}


def main():
    e = EEPROM(settings)
    e.dump(0, int(argv[1], 16), int(argv[2], 16))


if __name__ == '__main__':
    main()
