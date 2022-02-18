rows = 4;
columns = 12;
plate_thickness = 2;

plate_bottom();

module plate_bottom() {
    plate_width = (columns * switch_plate);
    plate_height = (rows * switch_plate);
    cube([plate_width, plate_height, plate_thickness]);
}
