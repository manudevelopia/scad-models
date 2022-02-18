rows = 4;
columns = 12;
plate_thickness = 2;
switch_hole = 14;
switch_plate = switch_hole + (2.5 * 2) ;

plate_width = (columns * switch_plate);
plate_height = (rows * switch_plate);

plate_bottom();

module plate_bottom() {
    cube([plate_width, plate_height, plate_thickness]);
}
