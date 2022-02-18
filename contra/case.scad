include <../common/keyhole.scad>;
include <plate-top.scad>;

rows = 4;
columns = 12;
wall_height = 10;

plate_width = (columns * switch_plate) + (2 * plate_thickness);
plate_height = (rows * switch_plate) + (2 * plate_thickness);

translate([- plate_thickness, - plate_thickness, - (wall_height -1)])
    difference() {
        cube([plate_width, plate_height, wall_height]);
        translate([plate_thickness, plate_thickness, plate_thickness]) {
            cube([plate_width - (2 * plate_thickness), plate_height - (2 * plate_thickness), wall_height]);
        }
    }

plate_top();
