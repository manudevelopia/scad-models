include <../common/keyhole.scad>

module plate(marging = 0) {
    translate([marging, marging, 0])
        square([case_width + (case_height / 2) - plate_thickness + rotatory_space_with_keyholes, case_height - (2 *
            marging)]);
    translate([(case_width + case_height / 2) + rotatory_space_with_keyholes, case_height / 2, 0]) {
        circle((case_height - (2 * marging)) / 2);
    }
}
