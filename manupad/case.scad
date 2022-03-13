include <../common/keyhole.scad>
include <plate-top.scad>
include <plate-bottom.scad>

$fn = 100;

rows = 2;
columns = 4;
wall_height = 16;
plate_thickness = 2;

rotatory_space_with_keyholes = 4;
nut_hole = 3.4;

case_width = columns * key_holder;
case_height = rows * key_holder;

module case() {
    plate_top();
    plate_bottom();
}

case();
