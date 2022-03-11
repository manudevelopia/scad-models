key_hole = 14;
switch_plate = key_hole + (2.5 * 2) ;

module key_hole(row, column, plate_thickness = 1) {
    padding = switch_plate / 2;
    translate([column * switch_plate + padding, row * switch_plate + padding, 0]) {
        difference() {
            cube([switch_plate, switch_plate, plate_thickness], true);
            cube([key_hole, key_hole, plate_thickness + 0.1], true);
        }
    }
}