$fn = 64;

// Increase this if your slicer or printer make holes too tight.
extra_radius = 0.1;

// OD = outside diameter, corner to corner.
m3_nut_od = 6.1;
m3_nut_radius = m3_nut_od/2 + 0.1 + extra_radius;
m3_washer_radius = 3.5 + extra_radius;
m3_inbus_head_od = 5.5;

// Major diameter of metric 3mm thread.
m3_major = 2.85;
m3_radius = m3_major/2 + extra_radius;
m3_wide_radius = m3_major/2 + extra_radius + 0.2;

//hxt900(true, true);
//color("green") hxt900_outline(true);
//% hxt900_axis(true) cylinder(r = 2.35, h = 60, center = true);
//% hxt900_screw_position(true) cylinder(r = 1, h = 40, center = true);

module hxt900_cross() {
    d = 6.1;
    translate([-d, 0, 0]) hxt900_outline(true);
    rotate([-90, 0, 0]) translate([d, 0, 0]) hxt900_outline(true);
}

module hxt900_outline(center = false, cabel = false, extra = 0.1) { 
    h = 2.26+extra;
    dy = (center)?(5.5):(0.0);
    dz = (center)?(4.5):(0.0);
    cabel_r0 = 1;
    cabel_d = 1;
    
    translate([0, dy, dz]) 
    {
        translate([0, -5.5, 0]) { 
            translate([0, 0, h/2]) cube([12+extra, 32.4+extra, h], center = true);
            translate([0, 0, -4.5]) cube([12+extra, 23+extra, 23+extra], center = true);
        }
        cylinder(r = 5.8+extra/2, h = 11.2+extra);
        cylinder(r = 2.35, h = 13.6);
        
        translate([0, -6.11, 0]) 
            hull() {
                cylinder(r = 2.8+extra/2, h = 11.2+extra);
                translate([0, 2, 0]) cylinder(r = 2.8+extra/2, h = 11.2+extra);
            }
        
        if(cabel)    
            translate([0, -dy, -dz-6.6]) rotate([90, 0, 0]) 
                hull() {
                    for(x = [-cabel_d, cabel_d])
                        for(y = [-cabel_d*2, cabel_d*2])
                            translate([x, y, 0]) cylinder(r = cabel_r0, h = 32, center = true);
                }
    }
}

module hxt900(center = false, dual = true) {
    if(center == true) {
        translate([0, 0, 4.5]) color("red") 
            import("files/hextronic-hxt900.STL", convexity=10);
        % hxt900_axis(center, dual) cylinder(r = 2.35, h = 60, center = true);
        % hxt900_screw_position(center) cylinder(r = 1, h = 40, center = true);
    }
    else
    {
        translate([0, -5.5, 0]) color("red") 
            import("files/hextronic-hxt900.STL", convexity=10);
        % hxt900_axis(center, dual) cylinder(r = 2.35, h = 60, center = true);
        % hxt900_screw_position() cylinder(r = 1, h = 40, center = true);
    }
}

module hxt900_axis(center = false, dual = false) { 
    if($children != -1)
        if(center == true)
        {
            translate([0, 5.5, 0]) for(i=[0:$children-1]) children(i);
            translate([0, 5.5-11, 0]) for(i=[0:$children-1]) children(i);
        }
        else
        {
            for(i=[0:$children-1]) children(i);
            translate([0, -11, 0]) for(i=[0:$children-1]) children(i);
        }
}

module hxt900_screw_position(center = false) { 
    d = (center)?(0):(5.5);    
    if($children != -1)
        for(dy = [13.8, -13.8])
            translate([0, dy-d, 0]) for(i=[0:$children-1]) children(i);
}

module hxt900_servo_arm(angle = 180) {
    translate([0, 0,  11.5]) hxt900_axis() rotate([0, 0, angle]) hxt900_arm();
    translate([0, 0, -18.0]) hxt900_axis() rotate([0, 180, angle]) hxt900_arm();
}

module hxt900_arm_outline(d = 13.9, extra = 0) {
    cylinder(r = 3.8+extra, h = 4.25);
    hull() {
        cylinder(r = 3.2+extra, h = 1.6+extra);
        translate([0, d+extra, 0]) cylinder(r = 2.15+extra, h = 1.6+extra);
    }
}

module hxt900_arm(extra = 0) {
    difference() {
        hxt900_arm_outline(extra = extra);
        cylinder(r = 0.5, h = 10, center = true);
        translate([0, 0, 2]) cylinder(r = 2, h = 10);
        for(y = [6, 10, 14]) translate([0, y, 2]) cylinder(r = 0.5, h = 10, center = true);
    }
}

module hxt900_arm_test() {
    difference() {
        color("green") import("library/FPV/Tilt_Mount_left.stl", convexity=10);
        cube([21, 60, 40], center = true);    
    }
    color("red") translate([-12.5, -16.75, 7.25])rotate([0, 90 ,0]) hxt900_arm(extra = 0);
}
