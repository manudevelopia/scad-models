include <../common/keyhole.scad>;
include <plate-bottom.scad>;

rounding_tip = 2;
rotatory_encoder_hole = 3.8;

module plate_top() {
    rotatory_encoder();
    key_grid();
    key_case();
}

module rotatory_encoder() {
    translate([case_width + rotatory_space_with_keyholes, 0, wall_height - plate_thickness]) {
        linear_extrude(plate_thickness) {
            difference() {
                union() {
                    translate([case_height / 2, case_height / 2]) {
                        circle(case_height / 2);
                        circle(case_height / 2);
                    }
                    translate([- rotatory_space_with_keyholes, 0])
                        square([case_height / 2 + rotatory_space_with_keyholes, case_height]);
                }
                translate([case_height / 2, case_height / 2]) {
                    circle(rotatory_encoder_hole);
                }
            }
        }
        translate([case_height / 2, case_height / 2, - plate_thickness]) {
            difference() {
                cylinder(plate_thickness, 8, 8);
                cylinder(rotatory_encoder_hole, rotatory_encoder_hole, rotatory_encoder_hole);
            }
        }
    }
}

module key_grid() {
    translate([0, 0, wall_height - (plate_thickness / 2)]) {
        for (row = [0: rows - 1]) {
            for (column = [0: columns - 1]) {
                key_hole(row, column, plate_thickness);
            }
        }
    }
}

module key_case() {
    difference() {
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
        microusb_connectot_hole();
    }
    nut_stands();
}

module nut_stands() {
    padding = nut_hole / 4;
    translate([plate_thickness + padding / 2, plate_thickness + padding / 2, plate_thickness]) nut_support();
    translate([case_width + plate_thickness, plate_thickness + padding / 2, plate_thickness]) nut_support();

    translate([plate_thickness + padding / 2, case_height - (plate_thickness + nut_hole - 1) / 2, plate_thickness])
        nut_support();
    translate([case_width + plate_thickness, case_height - (plate_thickness + nut_hole - 1) / 2, plate_thickness])
        nut_support();

    translate([case_width + case_height + plate_thickness, case_height / 2, plate_thickness]) nut_support();
}

module nut_support() {
    diameter = nut_hole * 2;
    difference() {
        cylinder(d = diameter, h = wall_height / 2);
        cylinder(d = diameter / 3, h = wall_height / 2);
    }
}

module microusb_connectot_hole() {
    usb_x = 6.5;
    usb_y = 2;
    translate([- plate_thickness, (case_height - usb_x) / 2, 4.4])
        minkowski() {
            cube([usb_y, usb_x, 1]);
            sphere(r = 0.9, $fn = 100);
        }
}