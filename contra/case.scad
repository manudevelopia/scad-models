include <../common/keyhole.scad>
include <plate-top.scad>

rows = 4;
columns = 12;
wall_height = 9;
plate_thickness = 2;

margin_play = 0.4;
case_width = (columns * key_holder) + (2 * plate_thickness) + margin_play;
case_height = (rows * key_holder) + (2 * plate_thickness) + margin_play;

module case() {
    translate([- plate_thickness - margin_play / 2, - plate_thickness - margin_play / 2, - (wall_height - 1)])
        difference() {
            cube([case_width, case_height, wall_height]);
            translate([plate_thickness, plate_thickness, plate_thickness]) {
                cube([case_width - (2 * plate_thickness), case_height - (2 * plate_thickness), wall_height]);
            }
        }
}
plate_top();
case();