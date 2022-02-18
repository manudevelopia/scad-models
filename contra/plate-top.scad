rows = 4;
columns = 12;
plate_thickness = 2;
switch_hole = 14;
switch_plate = switch_hole + (2.5 * 2) ;

plate_top();

plate_width = (rows * switch_plate);
plate_height = (columns * switch_plate);

module plate_bottom() {
    color("#cf152b")
        translate([plate_width / 2, plate_height / 2, 0])
            cube([plate_width, plate_height, plate_thickness]);
}
echo("plate_width: ", plate_width, " plate_height: ", plate_height);

module plate_top() {
    for (row = [0: rows - 1]) {
        for (column = [0: columns - 1]) {
            key_hole(row, column);
        }
    }
}

module key_hole(row, column) {
    padding = switch_plate / 2;
    translate([column * switch_plate + padding, row * switch_plate + padding, 0]) {
        difference() {
            cube([switch_plate, switch_plate, plate_thickness], true);
            cube([switch_hole, switch_hole, plate_thickness + 0.1], true);
        }
    }
}
