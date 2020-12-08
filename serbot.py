from __future__ import print_function
# tag::play_against_your_bot[]
from dlgo import agent
from dlgo import goboard_slow as goboard
from dlgo import gotypes
from dlgo.utils import print_board, print_move, point_from_coords
from six.moves import input

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
                print(bin(int(read_data, base=16)))
                turn = not turn
        else:
            move = input("move: ")
            high_nibble = move[0]
            low_nibble = move[1]
            write_data = (int(high_nibble)*16 + int(low_nibble)).to_bytes(1, byteorder="big")
            ser.write(write_data)
            turn = not turn

except Exception as e:
    print(e)




def main():
    board_size = 9
    game = goboard.GameState.new_game(board_size)
    bot = agent.RandomBot()

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


    while not game.is_over():
        print(chr(27) + "[2J")
        # print_board(game.board)
        if game.next_player == gotypes.Player.black: 
            while True:
            # human_move = input('-- ')
            read_data = ser.read(1) #read the buffer (99/100 timeout will hit)
            if read_data != b'':  #if not nothing there.
                fpga_move = bin(int(read_data, base=16))
                print("RXd: ")
                print(fpga_move)
                break
            point = point_from_coords(human_move.strip())
            move = goboard.Move.play(point)
        else:
            move = bot.select_move(game)
        print_move(game.next_player, move)
        game = game.apply_move(move)


if __name__ == '__main__':
    main()
# end::play_against_your_bot[]
