use <RoundedRectangle.scad>;

module DisplaySpeakerMounter() {
    RESOLUTION = 50;
    x_baseplate_front = 50;
    x_baseplate_back = 32;
    y_baseplate = 84;
    z_baseplate = 3;
    y_display = 35;
    z_rear_panel = 40;
    
    // base plate
    hull() {
        RoundedRectangle(x=x_baseplate_front, y=y_display+2, thickness=z_baseplate, r=2, $fn=RESOLUTION);
        translate([(x_baseplate_front-x_baseplate_back)/2, y_baseplate-2, 0])
            RoundedRectangle(x=x_baseplate_back, y=2, thickness=3, r=2, $fn=RESOLUTION);
    }
    
    // front panel
    rotate([90, 0, 0])
        RoundedRectangle(x=x_baseplate_front, y=3+7, thickness=2, r=2, $fn=RESOLUTION);
    difference() {
        translate([0, -2, 0])
            cube([x_baseplate_front, 4, z_baseplate+2]);
        
        translate([0, 2, z_baseplate+2])
            rotate([0, 90, 0])
                cylinder(r=2, h=x_baseplate_front, $fn=RESOLUTION);
    }
    translate([0, -2, -(17+3)]) {
        cube([x_baseplate_front, 2, 17+3]);
        RoundedRectangle(x=x_baseplate_front, y=2+3, thickness=3, r=1, $fn=RESOLUTION);
    }
    
    // raer panel
    translate([0, y_display, -z_rear_panel]) {
        cube([x_baseplate_front, 2, z_rear_panel+z_baseplate]);

        translate([0, 0, z_rear_panel])
            difference() {
                translate([0, 0, -2])
                    cube([x_baseplate_front, 4, z_baseplate+2]);
                
                translate([0, 4, -2])
                    rotate([0, 90, 0])
                        cylinder(r=2, h=x_baseplate_front, $fn=RESOLUTION);
            }
    }
    
    // side panel
    translate([0, y_display, -z_rear_panel])
        difference() {
            hull() {
                RoundedRectangle(x=x_baseplate_front, y=2, thickness=z_rear_panel+z_baseplate, r=2, $fn=RESOLUTION);
                translate([(x_baseplate_front-x_baseplate_back)/2, y_baseplate-y_display-2, z_rear_panel])
                    RoundedRectangle(x=x_baseplate_back, y=2, thickness=z_baseplate, r=2, $fn=RESOLUTION);
            }
            
            hull() {
                translate([2, 0, -2])
                    cube([x_baseplate_front-4, 2, z_rear_panel+z_baseplate+2]);
                translate([(x_baseplate_front-x_baseplate_back)/2+2, y_baseplate-y_display, z_rear_panel-2])
                    cube([x_baseplate_back-4, 2, z_baseplate+2]);
            }
            
            translate([0, -2, 0])
                cube([x_baseplate_front, 4, z_rear_panel]);
            
        }
}

DisplaySpeakerMounter();