include <../common/keyhole.scad>;
include <plate-bottom.scad>;

rounding_tip = 2;

module plate_top() {
    rotatory_encoder();
    key_grid();
    key_case();
}

module rotatory_encoder() {
    translate([case_width, 0, wall_height - plate_thickness])
        linear_extrude(plate_thickness) {
            translate([case_height / 2, case_height / 2])
                circle(case_height / 2);
            square([case_height / 2, case_height]);
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

    translate([0, 0, 5]) {

        //        //        minkowski() {
        ////            offset(1)
        //                {
        //                linear_extrude(wall_height) plate();
        //            }
        //            linear_extrude(wall_height) plate();
        //        }
        //            union() {
        //                difference() {
        //                    cube([case_width, case_height, wall_height]);
        //                    translate([plate_thickness, plate_thickness, 0]) {
        //                        cube([case_width - (2 * plate_thickness), case_height - (2 * plate_thickness), wall_height]);
        //                    }
        //                }
        //                translate([case_width + case_height / 2, case_height / 2, 0]) {
        //                    linear_extrude(wall_height) {
        //                        circle(case_height / 2);
        //                    }
        //                }
        //            }
        //            sphere(2);
        //        }
    }
}
