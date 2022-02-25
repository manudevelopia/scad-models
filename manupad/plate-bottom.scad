include <../common/keyhole.scad>
include <plate.scad>

module plate_bottom() {
    linear_extrude(plate_thickness) {
        plate();
    }
}
