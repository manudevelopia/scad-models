include <../common/keyhole.scad>;

$fn = 50;
heigh = 4;

rows = 4;
cols = 12;

difference()
{
    minkowski()
    {
        cube([ cols * key_holder, rows * key_holder, heigh ]);
        cylinder(r = 2, h = 1);
    }
    cube([ cols * key_holder, rows * key_holder, heigh + 10 ]);
}