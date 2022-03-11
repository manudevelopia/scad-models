key_hole = 14.5;
key_holder = key_hole + (2.5 * 2) ;

module key_hole(row, column, plate_thickness = 2) {
    padding = key_holder / 2;
    translate([column * key_holder + padding, row * key_holder + padding, 0]) {
        difference() {
            cube([key_holder, key_holder, plate_thickness], true);
            cube([key_hole, key_hole, plate_thickness + 0.1], true);
        }
    }
}