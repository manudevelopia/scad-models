board_width = 19.5;
board_heigh = 34.5;
board_thickness = 0.5;
enclose_thickness = 1;
enclose_width = board_width + enclose_thickness;
usb_enclose_thickness = 0.5;
usb_enclose_height = 3;

module base() {
    translate([enclose_thickness, 0, 0])
        cube([board_width, board_heigh, usb_enclose_thickness]);
}

module laterals() {
    cube([enclose_thickness, board_heigh, usb_enclose_height]);
    translate([board_width, 0, 0])
        cube([enclose_thickness, board_heigh, usb_enclose_height]);
}

module lid(enclose_lid_widht = board_width / 2) {
    translate([0, board_heigh, 0]) {
        cube([enclose_width, enclose_thickness, usb_enclose_height]);
        translate([(board_width - enclose_lid_widht) / 2, - enclose_thickness * 1, usb_enclose_height - enclose_thickness])
            cube([enclose_lid_widht, enclose_thickness * 2, enclose_thickness]);
    }
}

module usb_hole(usb_x = 6, usb_y = 2) {
    difference() {
        cube([enclose_width, 1, usb_enclose_height * 2]);
        translate([(enclose_width - usb_x) / 2, 0, 3.1])
            minkowski() {
                cube([usb_x, usb_y, enclose_thickness]);
                sphere(r = 0.9, $fn = 100);
            }
    }
}

module promicro() {
    base();
    laterals();
    lid();
    usb_hole();
}
