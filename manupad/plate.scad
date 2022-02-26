include <../common/keyhole.scad>

module plate() {
    square([case_width + (case_height / 2) - plate_thickness + rotatory_space_with_keyholes, case_height]);
    translate([(case_width + case_height / 2) + rotatory_space_with_keyholes, case_height / 2, 0]) {
        circle(case_height / 2);
    }
}
