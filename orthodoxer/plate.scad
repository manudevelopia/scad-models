include <../common/keyhole.scad>;

rows = 3;
columns = 5;

module plate_top() {
    for (row = [0: rows - 1]) {
        for (column = [0: columns - 1]) {
            key_hole(row, column);
        }
    }
}
