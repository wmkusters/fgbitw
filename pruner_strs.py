def prune_str(i,j):
	return "pruned_board[" + str(i) + "][" + str(j) + "] = (prune_color == board_in[" + str(i) + "][" + str(j) + "]) ? (or_wires[" + str(i) + "][" + str(j) + "] ? board_in[" + str(i) + "][" + str(j) + "] : e) : (board_in[" + str(i) + "][" + str(j) + "]);"

def or_wire_str(i,j):
	lines = []
	wires = []
	if i != 0:
		wires.append("wire_" + str(i-1) + str(j) + "_" + str(i) + str(j))
	if i != 8:
		wires.append("wire_" + str(i) + str(j) + "_" + str(i+1) + str(j))
	if j != 0:
		wires.append("wire_" + str(i) + str(j-1) + "_" + str(i) + str(j))
	if j != 8:
		wires.append("wire_" + str(i) + str(j) + "_" + str(i) + str(j+1))
	line = "or_wires[" + str(i) + "][" + str(j) + "] = ("
	for wire in wires:
		line += wire + " | "	
	line = line[:-3]
	line += ");"
	return line
if __name__ == "__main__":
	# for i in range(9):
	# 	for j in range(9):
	# 		print(prune_str(i,j))
	for i in range(9):
		for j in range(9):
			print("logic wire_" + str(i) + str(j) + "_" + str(i+1) + str(j) + ";")
			print("logic wire_" + str(i) + str(j) + "_" + str(i) + str(j+1) + ";")