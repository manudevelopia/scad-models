include <../common/keyhole.scad>;

module plate_top() {
    for (row = [0: rows - 1]) {
        for (column = [0: columns - 1]) {
            key_hole(row, column);
        }
    }
}
