include <plate.scad>;

$fn = 50;
heigh = 15;


rows = 3;
cols = 5;

rows_command = 2;
cols_command = 3;


minkowski()
{
    cube([ cols * 14, rows * 14, heigh ]);
    cylinder(r = 2, h = 1);
}

minkowski()
{
    cylinder(r = 2, h = 1);
    translate([ cols * 20, 0, 0 ]) rotate([ 0, 0, 146 ]) cube([ cols_command * 14, rows_command * 14, heigh ]);
}