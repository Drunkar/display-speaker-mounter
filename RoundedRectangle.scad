// Copied from: https://github.com/Drunkar/openscad_modules/blob/master/modules/RoundedRectangle.scad
// parameters
X = 50;
Y = 30;
THICKNESS = 2;
R = 2;
RESOLUTION = 50;

module RoundedRectangle(x, y, thickness, r, $fn=0) {

    translate([0, r, 0])
        cube([x, y-2*r, thickness]);
    translate([r, 0, 0])
        cube([x-2*r, y, thickness]);

    translate([r, r, 0])
        cylinder(r=r, h=thickness, $fn=$fn);
    translate([x-r, r, 0])
        cylinder(r=r, h=thickness, $fn=$fn);
    translate([r, y-r, 0])
        cylinder(r=r, h=thickness, $fn=$fn);
    translate([x-r, y-r, 0])
        cylinder(r=r, h=thickness, $fn=$fn);

}

// main
RoundedRectangle(x=X, y=Y, thickness=THICKNESS, r=R, $fn=RESOLUTION);