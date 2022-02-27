include <../common/keyhole.scad>;
include <plate-bottom.scad>;

rounding_tip = 2;

module plate_top() {
    rotatory_encoder();
    key_grid();
    key_case();
}

module rotatory_encoder() {
    translate([case_width + rotatory_space_with_keyholes, 0, wall_height - plate_thickness])
        linear_extrude(plate_thickness) {
            difference() {
                union() {
                    translate([case_height / 2, case_height / 2]) {
                        circle(case_height / 2);
                    }
                    translate([- rotatory_space_with_keyholes, 0])
                        square([case_height / 2 + rotatory_space_with_keyholes, case_height]);
                }
                translate([case_height / 2, case_height / 2]) {
                    circle(7 / 2);
                }
            }
        }
}

module key_grid() {
    translate([0, 0, wall_height - (plate_thickness / 2)]) {
        for (row = [0: rows - 1]) {
            for (column = [0: columns - 1]) {
                key_hole(row, column);
            }
        }
    }
}

module key_case() {
    linear_extrude(wall_height) {
        difference() {
            offset(delta = plate_thickness) {
                plate();
            }
            offset(delta = 0) {
                plate();
            }
        }
    }
    nut_stands();
}

module nut_stands() {
    translate([plate_thickness / 2, plate_thickness / 2, plate_thickness]) nut_support();
    translate([plate_thickness / 2, case_height - plate_thickness / 2, plate_thickness]) nut_support();
    translate([case_width + plate_thickness / 2, plate_thickness / 2, plate_thickness]) nut_support();
    translate([case_width + plate_thickness / 2, case_height - plate_thickness / 2, plate_thickness]) nut_support();
    translate([case_width + plate_thickness / 2 + case_height + rotatory_space_with_keyholes/2, (case_height - plate_thickness) / 2, plate_thickness]) nut_support();
}

module nut_support() {
    difference() {
        cylinder(d = 4, h = wall_height / 2 - plate_thickness);
        translate([0, 0, 0]) {
            cylinder(d = 4 / 3, h = wall_height / 2 - plate_thickness);
        }
    }
}