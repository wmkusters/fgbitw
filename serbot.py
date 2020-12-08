from __future__ import print_function
# tag::play_against_your_bot[]
from dlgo import agent
from dlgo import goboard_fast as goboard
from dlgo import gotypes
from dlgo import mcts
from dlgo.utils import print_board, print_move, point_from_coords, COLS
from six.moves import input

import serial.tools.list_ports
import time

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

BOARD_SIZE = 9


# tag::naive-board-heuristic[]
def capture_diff(game_state):
    black_stones = 0
    white_stones = 0
    for r in range(1, game_state.board.num_rows + 1):
        for c in range(1, game_state.board.num_cols + 1):
            p = gotypes.Point(r, c)
            color = game_state.board.get(p)
            if color == gotypes.Player.black:
                black_stones += 1
            elif color == gotypes.Player.white:
                white_stones += 1
    diff = black_stones - white_stones
    if game_state.next_player == gotypes.Player.black:
        return diff
    return -1 * diff

# end::naive-board-heuristic[]


# s = get_usb_port()  #grab a port
# print("USB Port: "+str(s)) #print it if you got
# if s:
#     ser = serial.Serial(port = s,
#         baudrate=9600,
#         parity=serial.PARITY_NONE,
#         stopbits=serial.STOPBITS_ONE,
#         bytesize=serial.EIGHTBITS,
#         timeout=0.01) #auto-connects already I guess?
#     print("Serial Connected!")
#     if ser.isOpen():
#          print(ser.name + ' is open...')
# else:
#     print("No Serial Device :/ Check USB cable connections/device!")
#     exit()

# try:
#     print("Reading...")
#     turn = True
#     while True:
#         if not turn:
#             read_data = ser.read(1) #read the buffer (99/100 timeout will hit)
#             if read_data != b'':  #if not nothing there.
#                 print("RXd: ")
#                 print(bin(int(read_data, base=16)))
#                 turn = not turn
#         else:
#             move = input("move: ")
#             high_nibble = move[0]
#             low_nibble = move[1]
#             write_data = (int(high_nibble)*16 + int(low_nibble)).to_bytes(1, byteorder="big")
#             ser.write(write_data)
#             turn = not turn

# except Exception as e:
#     print(e)




def main():
    game = goboard.GameState.new_game(BOARD_SIZE)
    bot = mcts.MCTSAgent(500, temperature=1.4)

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
        print_board(game.board)
        if game.next_player == gotypes.Player.black: 
            while True:
                # human_move = input('-- ')
                read_data = ser.read(1) #read the buffer (99/100 timeout will hit)
                if read_data != b'':  #if not nothing there.
                    fpga_move = read_data.hex()
                    if fpga_move == "ff":
                        move = goboard.Move.pass_turn()
                        fpga_passed = True
                        break
                    else:
                        fpga_passed = False
                    fpga_row = 10 - (int(fpga_move[0], base=16) + 1)
                    fpga_col = int(fpga_move[1], base=16)
                    col = COLS[fpga_col]
                    print(col, fpga_row)
                    print("RXd: ")
                    print(fpga_move)
                    point = point_from_coords(col + str(fpga_row))
                    move = goboard.Move.play(point)
                    fpga_move = move
                    break
        else:
            move = bot.select_move(game)
            if move.is_pass:
                low_nibble = 15
                high_nibble = 15
            else:
                low_nibble = move.point.col-1
                high_nibble = move.point.row 
            time.sleep(.5               )
            if fpga_passed:
                move = goboard.Move.pass_turn()
            if move.is_pass:
                write_data = (255).to_bytes(1, byteorder="big")
            else:
                write_data = (abs((int(high_nibble)-9))*16 + (int(low_nibble))).to_bytes(1, byteorder="big")
            print(write_data)
            ser.write(write_data)
 
        print_move(game.next_player, move)
        game = game.apply_move(move)


if __name__ == '__main__':
    main()
# end::play_against_your_bot[]
