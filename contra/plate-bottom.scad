include <../common/keyhole.scad>

module plate_bottom() {
    plate_width = (columns * switch_plate);
    plate_height = (rows * switch_plate);
    cube([plate_width, plate_height, plate_thickness]);
}
