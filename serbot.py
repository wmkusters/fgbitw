import serial.tools.list_ports

def get_usb_port():
    usb_port = list(serial.tools.list_ports.grep("Leon"))
    if len(usb_port) == 1:
        print("Automatically found USB-Serial Controller: {}".format(usb_port[0].description))
        return usb_port[0].device
    else:
        ports = list(serial.tools.list_ports.comports())
        port_dict = {i:[ports[i],ports[i].vid] for i in range(len(ports))}
        usb_id=None
        for p in port_dict:
            #print("{}:   {} (Vendor ID: {})".format(p,port_dict[p][0],port_dict[p][1]))
            #print(port_dict[p][0],"UART")
            print("UART" in str(port_dict[p][0]))
            if port_dict[p][1]==9025: #for arduino/arduion/clone
                usb_id = p
        if usb_id== None:
            return False
        else:
            print("Found it")
            print("USB-Serial Controller: Device {}".format(p))
            return port_dict[usb_id][0].device

s = get_usb_port()  #grab a port
print("USB Port: "+str(s)) #print it if you got
if s:
    ser = serial.Serial(port = s,
        baudrate=9600,
        parity=serial.PARITY_NONE,
        stopbits=serial.STOPBITS_ONE,
        bytesize=serial.EIGHTBITS,
        timeout=0.01) #auto-connects already I guess?
    print("Serial Connected!")
    if ser.isOpen():
         print(ser.name + ' is open...')
else:
    print("No Serial Device :/ Check USB cable connections/device!")
    exit()

try:
    print("Reading...")
    turn = True
    while True:
        if not turn:
            read_data = ser.read(1) #read the buffer (99/100 timeout will hit)
            if read_data != b'':  #if not nothing there.
                print("RXd: ")
                print(read_data)
        else:
            # write_data = int(input("write: ")).to_bytes(1, byteorder="big")
            move = input("move: ")
            high_nibble = move[0]
            low_nibble = move[1]
            write_data = (int(high_nibble)*16 + int(low_nibble)).to_bytes(1, byteorder="big")
            ser.write(write_data)
        turn = not turn

except Exception as e:
    print(e)