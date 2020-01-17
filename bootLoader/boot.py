from eeprom_programer import EEPROM
import binascii
from sys import argv

try:
    argv[1] = int(argv[1], 16)
except IndexError:
    argv.append(0)

print("argv:", argv[1])


# settings for the eeprom pins and eeprom write time
settings = {
    "dataPins": [2, 3, 4, 17, 27, 22, 10, 25],
    "addressPins": [11, 5, 6, 13, 19, 26, 21, 20, 16, 12, 7],
    "writePin": 14,
    "readPin": 15,
    "writeTime": 2/1000
}


def main():
    e = EEPROM(settings)
    with open("/home/pi/Desktop/Z80/programs/a.out", "rb") as f:
        data = f.read()

    data = str(binascii.hexlify(data))[2:]
    data = data[:-1]
    buf = []
    for i in range(0, len(data), 2):
        buf.append(data[i]+data[i+1])
    data = remove_zeros(buf)
    e.write_arr(data, argv[1])
    print(e)
    print(len(e))
    exit()


def remove_zeros(arr):
    new_arr = []
    zero = True
    for item in arr:
        if zero and item != "00":
            zero = False
        if not zero:
            new_arr.append(item)
    return new_arr


if __name__ == '__main__':
    main()
