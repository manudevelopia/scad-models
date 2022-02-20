include <../common/keyhole.scad>
include <plate-top.scad>
include <plate-bottom.scad>

$fn = 50;

rows = 2;
columns = 4;
wall_height = 10;
plate_thickness = 2;

case_width = (columns * switch_plate) + (2 * plate_thickness);
case_height = (rows * switch_plate) + (2 * plate_thickness);

module case() {
    plate_top();
    plate_bottom();
}

case();

