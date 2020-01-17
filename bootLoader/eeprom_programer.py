import RPi.GPIO as GPIO
from time import sleep


"""
expects an dictionary with the next things:
    - array -> dataPins (least significand bit first)
    - array -> addressPins (least signified bit first)
    - int   -> writePin
    - int   -> readPin
    - float -> write_time (in seconds)

The library has a few functions:
    -
"""


class EEPROM:
    def __init__(self, bcm_pins):
        self.dataPins = bcm_pins["dataPins"]
        self.addressPins = bcm_pins["addressPins"]
        self.writePin = bcm_pins["writePin"]
        self.readPin = bcm_pins["readPin"]
        self.writeTime = bcm_pins["writeTime"]
        self.newLine = 16
        self.allData = [0 for _ in range(int("7ff", 16))]
        print(hex(len(self.allData)))

        GPIO.setwarnings(False)
        GPIO.cleanup()
        GPIO.setmode(GPIO.BCM)
        sleep(0.01)
        for data_pin in self.dataPins:
            GPIO.setup(data_pin, GPIO.OUT)
        for address_pin in self.addressPins:
            GPIO.setup(address_pin, GPIO.OUT)
        GPIO.setup(self.writePin, GPIO.OUT)
        GPIO.setup(self.readPin, GPIO.OUT)

    def _set_io(self, output=True):  # True=output   False=input
        for data_pin in self.dataPins:
            GPIO.setup(data_pin, GPIO.OUT if output else GPIO.IN)

    def _select_bit(self, bit, byte):
        return (byte & (1 << bit)) >> bit

    def _set_address(self, address):
        for index in range(len(self.addressPins)):
            GPIO.output(self.addressPins[index], self._select_bit(index, address))

    def _pulse_write(self):
        GPIO.output(self.writePin, False)
        sleep(self.writeTime)
        GPIO.output(self.writePin, True)
        sleep(self.writeTime)

    def read_byte(self, address):
        self._set_address(address)
        self._set_io(False)
        GPIO.output(self.readPin, False)
        sleep(self.writeTime/100)
        byte = 0
        for index in range(len(self.dataPins)):
            byte += GPIO.input(self.dataPins[index]) * 2 ** index
        GPIO.output(self.readPin, True)
        sleep(self.writeTime/100)
        return byte

    def print_content(self, begin, end):
        data_text = "  \t0 \t1 \t2 \t3 \t4 \t5 \t6 \t7 \t8 \t9 \ta \tb \tc \td \te \tf \n"
        for i in range(begin, end, 16):
            data_text += str(hex(i)[2:]) + "\t"
            for j in range(16):
                data_text += str(hex(self.read_byte(i + j))[2:].zfill(2)) + "\t"
            data_text += "\n"
        print(data_text)

    def write_byte(self, address, data):
        self.allData[int(address)] = data
        times = 0
        done = False
        while not done:
            self._set_address(address)
            self._set_io()
            for index in range(len(self.dataPins)):
                GPIO.output(self.dataPins[index], self._select_bit(index, data))
            self._pulse_write()
            times += 1
            done = self.read_byte(address) == data
            if times > 15:
                raise Exception("to many times try's to write to address {} and data {}".format(address, data))
        print("ERROR at ", address, " with the data: ", data) if done > 4 else None

    def write_arr(self, arr, begin_address=0):
        """"
        :argument
            arr: string items with hex numbers in it.
            begin_address: a integer what's indicates where to begin with writing the data.
        """
        for address, data in enumerate(arr):
            try:
                self.write_byte(begin_address + address, int(data, 16))
            except IndexError:
                raise IndexError(address, begin_address)

    def dump(self, begin, end, data):
        print("dumping {:X} from address {:x} to {:x}\n".format(data, begin, end))
        for i in range(begin, end):
            self.write_byte(i, data)
            if i % 20 == 0:
                print(".", end="")
        print()

    def __str__(self):
        data_text = "  \t0 \t1 \t2 \t3 \t4 \t5 \t6 \t7 \t8 \t9 \ta \tb \tc \td \te \tf \n"
        if len(self) > len(self.allData) - 16:
            for i in range(0, len(self), 16):
                data_text += str(hex(i)[2:]) + "\t"
                for j in range(16):
                    # data_text += str(hex(self.allData[j+i])) + "\t"
                    data_text += str(hex(self.read_byte(i + j))[2:]).zfill(2) + "\t"
                data_text += "\n"
        else:
            for i in range(0, len(self)+16, 16):
                data_text += str(hex(i)[2:]) + "\t"
                for j in range(16):
                    # data_text += str(hex(self.allData[j+i])) + "\t"
                    data_text += str(hex(self.read_byte(i + j))[2:]).zfill(2) + "\t"
                data_text += "\n"
        return data_text

    def __len__(self):
        ln = 0
        for x in self.allData:
            if x != 0: ln += 1
        return ln
"""

"""
