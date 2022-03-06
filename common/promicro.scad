board_width = 20;
board_heigh = 35;
board_thickness = 0.5;
enclose_thickness = 1;
enclose_width = board_width + enclose_thickness;
base_thickness = 0.5;
wall_height = 3;

//base
translate([enclose_thickness, 0, 0])
    cube([board_width, board_heigh, base_thickness]);

//translate([0, 0, wall_height - board_thickness])
//    cube([enclose_thickness * 3, enclose_thickness * 2, enclose_thickness]);

//translate([board_width - enclose_thickness * 2, 0, wall_height - board_thickness])
//    cube([enclose_thickness * 3, enclose_thickness * 2, enclose_thickness]);

//laterals
cube([enclose_thickness, board_heigh, wall_height]);
translate([board_width, 0, 0])
    cube([enclose_thickness, board_heigh, wall_height]);


//lid
enclose_lid_widht = 10;
//translate([(board_width - enclose_lid_widht) / 2, board_heigh, 0])
translate([0, board_heigh, 0]) {
    cube([enclose_width, enclose_thickness, wall_height]);
    translate([(board_width - enclose_lid_widht) / 2, - enclose_thickness * 1.5, wall_height - board_thickness])
        cube([enclose_lid_widht, enclose_thickness * 2.5, enclose_thickness]);
}

module usb_hole() {
    usb_x = 6;
    usb_y = 2;
    difference() {
        cube([enclose_width, 1, wall_height * 2]);
        translate([(enclose_width - usb_x) / 2, 0, 3])
            minkowski() {
                cube([usb_x, usb_y, enclose_thickness]);
                sphere(r = 0.8, $fn = 90);
            }
    }
}

module promicro() {
    usb_hole();
}

promicro();