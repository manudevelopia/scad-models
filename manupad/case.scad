include <../common/keyhole.scad>
include <plate-top.scad>
include <plate-bottom.scad>

$fn = 50;

rows = 2;
columns = 4;
wall_height = 10;
plate_thickness = 3;
case_width = columns * switch_plate;
case_height = rows * switch_plate;

module case() {
    plate_top();
    plate_bottom();
}

case();

