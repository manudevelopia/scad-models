include <../common/keyhole.scad>;

rounding_tip = 2;

module plate_top() {
    key_grid();
    key_case();
}

module key_grid() {
    translate([plate_thickness, plate_thickness, wall_height + (2 * rounding_tip + 1) - plate_thickness]) {
        for (row = [0: rows - 1]) {
            for (column = [0: columns - 1]) {
                key_hole(row, column);
            }
        }
    }
}

module key_case() {
    translate([0, 0, rounding_tip]) {
        minkowski() {
            difference() {
                cube([case_width, case_height, wall_height]);
                translate([plate_thickness, plate_thickness, 0]) {
                    cube([case_width - (2 * plate_thickness), case_height - (2 * plate_thickness), wall_height]);
                }
            }
            sphere(2);
        }
    }
}