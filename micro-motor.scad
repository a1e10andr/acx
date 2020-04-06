$fn = 64;
use <common.scad>

micro_motor_outline();
//micro_motor();

module micro_motor_outline(extra = 0.5) {
    translate([0, (15+extra)/2-extra, 0])
    intersection() {
        rotate([90, 0, 0]) cylinder(r = 6+extra, h = 15+2*extra, center = true);
        cube([12, 15+2*extra, 10+extra], center = true);
    }
    rotate([-90, 0, 0]) 
        cylinder(r = 6.9/2+extra, h = 16.2+extra);

    translate([0, -(10+extra)/2, 0])
        rotate([90, 0, 0]) rcube([12.5, 10+extra, 10+extra], r = 1);
    
   translate([0, -19-extra, 0])
        rotate([-90, 0, 0]) cylinder(r = 1.5, h = 20+extra);
}

module micro_motor() {
    translate([0, 7.5, 0])
    color("grey") intersection() {
        rotate([90, 0, 0]) cylinder(r = 6, h = 20, center = true);
        cube([12, 15, 10], center = true);
    }
    color("red") rotate([-90, 0, 0]) cylinder(r = 6.9/2, h = 16.2);

    difference() {
        union() {
            translate([0, -0.7/2, 0])
                color("red") rotate([90, 0, 0]) rcube([12.5, 10, 0.7], r = 1);//cube([12, 0.7, 10], center = true);
            translate([0, -3.6, 0])
                color("red") rotate([90, 0, 0]) rcube([12.5, 10, 0.7], r = 1);//cube([12, 0.7, 10], center = true);
            translate([0, -8.6, 0])
                color("red") rotate([90, 0, 0]) rcube([12.5, 10, 0.7], r = 1);//cube([12, 0.7, 10], center = true);
            translate([-4, -9, -3])
                color("grey") rotate([-90, 0, 0]) cylinder(r = 1.5, h = 9);
            translate([ 4, -9,  3])
                color("grey") rotate([-90, 0, 0]) cylinder(r = 1.5, h = 9);
        }
        translate([-4.5, -10, 0])
            rotate([-90, 0, 0]) cylinder(r = 1.6/2, h = 16.2);
        translate([ 4.5, -10, 0])
            rotate([-90, 0, 0]) cylinder(r = 1.6/2, h = 16.2);
    }
   color("grey") translate([0, -19, 0])
        rotate([-90, 0, 0]) cylinder(r = 1.5, h = 20);
}