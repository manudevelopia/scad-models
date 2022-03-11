include <../common/keyhole.scad>
include <../common/promicro.scad>
include <plate.scad>

open_margin = 0.1;

module plate_bottom() {
    difference() {
        linear_extrude(plate_thickness) {
            plate(open_margin);
        }
        nut_holes();
    }
    rotate(270)
        translate([- (enclose_width / 2 + case_height / 2 + 0.1), open_margin, plate_thickness -
            usb_enclose_thickness])
            promicro();
}

module nut_holes() {
    padding = nut_hole / 4;
    translate([plate_thickness + padding / 2, plate_thickness + padding / 2, plate_thickness]) hole();
    translate([case_width + plate_thickness, plate_thickness + padding / 2, plate_thickness]) hole();
    translate([plate_thickness + padding / 2, case_height - (plate_thickness + nut_hole - 1) / 2, plate_thickness]) hole
    ();
    translate([case_width + plate_thickness, case_height - (plate_thickness + nut_hole - 1) / 2, plate_thickness]) hole(
    );
    translate([case_width + case_height, case_height / 2, plate_thickness]) hole();
}

module hole() {
    diameter = nut_hole / 2;
    translate([0, 0, - 2]) {
        cylinder(d = diameter, h = plate_thickness);
        cylinder(plate_thickness, 0.9, 4 / 6, false);
        cylinder(diameter / 4, diameter);
    }
}