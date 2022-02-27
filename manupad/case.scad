include <../common/keyhole.scad>
include <plate-top.scad>
include <plate-bottom.scad>

$fn = 75;

rows = 2;
columns = 4;
wall_height = 16;
plate_thickness = 2;
rotatory_space_with_keyholes = 4;

case_width = columns * switch_plate;
case_height = rows * switch_plate;

module case() {
    plate_top();
//    plate_bottom();
}

case();

