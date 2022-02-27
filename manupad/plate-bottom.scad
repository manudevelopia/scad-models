include <../common/keyhole.scad>
include <plate.scad>

module plate_bottom() {
    difference() {
        linear_extrude(plate_thickness) {
            plate();
        }
        nut_holes();
    }
}


module nut_holes() {
    translate([plate_thickness / 2, plate_thickness / 2, plate_thickness]) nut_hole();
    translate([plate_thickness / 2, case_height - plate_thickness / 2, plate_thickness]) nut_hole();
    translate([case_width + plate_thickness / 2, plate_thickness / 2, plate_thickness]) nut_hole();
    translate([case_width + plate_thickness / 2, case_height - plate_thickness / 2, plate_thickness]) nut_hole();
    translate([case_width + plate_thickness / 2 + case_height + rotatory_space_with_keyholes / 2, (case_height -
        plate_thickness) / 2, plate_thickness]) nut_hole();
}

module nut_hole() {
    translate([0, 0, - 2]) {
        cylinder(d = 4 / 3, h = plate_thickness);
        cylinder(plate_thickness / 2, 0.9, 4 / 6, false);
    }
}