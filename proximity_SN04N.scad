$fn = 32;

translate([0, 0, 9]) proximity_sensor_sn04();

module proximity_sensor_sn04() {
    difference() {
        union() {
            hull() {
                translate([0, -9, 0]) cube([18, 18, 18], center = true);
                translate([0, 4.5, -2]) cube([18, 1, 14], center = true);
            }
            translate([0, 11.5, -2]) cube([18, 13, 14], center = true);
            translate([0, 3, 0]) cube([5.4, 6, 18], center = true);
        }
        for(x = [-5.5, 5.5]) translate([x, 10.5, 0])
            hull() {
                translate([0, -2.8, 0]) cylinder(r = 2, h = 20, center = true);
                translate([0,  2.8, 0]) cylinder(r = 2, h = 20, center = true);
            }  
    }

    hull() {
        translate([0, 19.2, -9.8/2+1.6]) rotate([90, 0, 0]) cylinder(d = 8.2, h = 1.2);
        translate([0, 18.6, -7]) cube([8.2, 1.2, 4], center = true);
    }

    % translate([0, 25, -9.8/2+1.6]) rotate([90, 0, 0]) cylinder(d = 3.5, h = 7);
}


