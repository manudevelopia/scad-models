include <../common/keyhole.scad>

module plate() {
    square([case_width + case_height / 2, case_height]);
    translate([case_width + case_height / 2, case_height / 2, 0]) {
        circle(case_height / 2);
    }
}
