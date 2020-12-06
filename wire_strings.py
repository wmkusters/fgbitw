def horiz_wire(i,j):
    lines = []
    if j == 0:
        jm1 = "cold"
    else:
        jm1 = j-1
    if i == 0:
        im1 = "cold"
    else:
        im1 = i-1
    if j == 8:
        jp1 = "cold"
    else:
        jp1 = j+1
    if j == 7:
        jp2 = "cold"
    else:
        jp2 = j+2
    if i == 8:
        ip1 = "cold"
    else:
        ip1 = i+1
    lines.append("wire_calc calc_" + str(i) + str(j) + "_" + str(i) + str(j+1) + "(.tile1(own_board[" + str(i) + "][" + str(j) + "]),")
    lines.append("                     .tile2(own_board[" + str(i) + "][" + str(j+1) + "]),")
    if im1 == "cold":
        lines.append("                     .neighbor1(cold),")
        lines.append("                     .neighbor2(cold),")
    else:
        lines.append("                     .neighbor1(wire_" + str(im1) + str(j) + "_" + str(i) + str(j) + "mem),")
        lines.append("                     .neighbor2(wire_" + str(im1) + str(jp1) + "_" + str(i) + str(jp1) + "mem),")
    if jm1 == "cold":
        lines.append("                     .neighbor3(cold),") 
    else:
        lines.append("                     .neighbor3(wire_" + str(i) + str(jm1) + "_" + str(i) + str(j) + "mem),")
    if jp2 == "cold":
        lines.append("                     .neighbor4(cold),")
    else:
        lines.append("                     .neighbor4(wire_" + str(i) + str(jp1) + "_" + str(i) + str(j+2) + "mem),")
    if ip1 == "cold":
        lines.append("                     .neighbor5(cold),")
        lines.append("                     .neighbor6(cold),")
    else:
        lines.append("                     .neighbor5(wire_" + str(i) + str(j) + "_" + str(ip1) + str(j) + "mem),")
        lines.append("                     .neighbor6(wire_" + str(i) + str(jp1) + "_" + str(ip1) + str(jp1) + "mem),")
    lines.append("                     .wire_out(wire_" + str(i) + str(j) + "_" + str(i) + str(j+1) + ")")
    lines.append(");")
    return "\n".join(lines) 

def vert_wire(i,j):
    lines = []
    cold = "cold"
    if i == 0:
        n2 = cold
    else:
        n2 = "wire_" + str(i-1) + str(j) + "_" + str(i) + str(j) + "mem"
    if j == 0:
        n1 = cold
        n4 = cold
    else:
        n1 = "wire_" + str(i) + str(j-1) + "_" + str(i) + str(j) + "mem"
        n4 = "wire_" + str(i+1) + str(j-1) + "_" + str(i+1) + str(j) + "mem"
    if j == 8:
        n3 = cold
        n6 = cold
    else:
        n3 = "wire_" + str(i) + str(j) + "_" + str(i) + str(j+1) + "mem"
        n6 = "wire_" + str(i+1) + str(j) + "_" + str(i+1) + str(j+1) + "mem"
    if i == 7:
        n5 = cold
    else:
        n5 = "wire_" + str(i+1) + str(j) + "_" + str(i+2) + str(j) + "mem"

    neighbors = [n1, n2, n3, n4, n5, n6]
    nlines = []
    for idx in range(len(neighbors)):
        nlines.append("                     .neighbor" + str(idx + 1) + "(" + neighbors[idx] + "),") 
    lines.append("wire_calc calc_" + str(i) + str(j) + "_" + str(i+1) + str(j) + "(.tile1(own_board[" + str(i) + "][" + str(j) + "]),")
    lines.append("                     .tile2(own_board[" + str(i+1) + "][" + str(j) + "]),")
    lines += nlines
    lines.append("                     .wire_out(wire_" + str(i) + str(j) + "_" + str(i+1) + str(j) + ")")
    lines.append(");")
    return "\n".join(lines)

if __name__ == "__main__":
    for i in range(0,8):
        for j in range(0,9):
            print(vert_wire(i,j))
    for i in range(9):
        for j in range(8):
            print(horiz_wire(i,j))