import binascii

FILE_PATH = "/home/pi/Desktop/Z80/programs/a.out"

with open(FILE_PATH, "rb") as f:
    data = f.read()

data = str(binascii.hexlify(data))
buf = []
for i in range(2, len(data) - 1, 2):
    print(bin(i-2)[2:].zfill(10), "\t", bin(int(data[i] + data[i + 1], 16))[2:].zfill(8), "\t", data[i] + data[i + 1])

