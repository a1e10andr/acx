$fn = 64;

fan40x40_radial(10);

module fan_outline(size, height) {
    r = 2;
    linear_extrude(height = height, convexity = 10) {
        translate([-size/2+r, -size/2]) square([size-2*r, size]);
        translate([-size/2, -size/2+r]) square([size, size-2*r]);
        for(x = [-size/2+r, size/2-r]) for(y = [-size/2+r, size/2-r])
            translate([x, y]) circle(r = r);
    }
}

module fan_holes(d) {   
    for(x = [-d, d]) for(y = [-d, d])
        translate([x, y]) for(i=[0:$children-1]) children(i); 
}

module fan40x40_radial_outline(height, extra = 0) {
    fan_outline(40+extra, height = height);
}

module fan40x40_radial(height, extra = 0) {
    difference() {
        fan_outline(40+extra, height = height);
        fan_holes(18) cylinder(d = 2.2+extra, h = height*2+1, center = true);
        translate([-3, 0, 0])cylinder(r = 15, h = height*2+1, center = true);
    }
}

module fan40x40_outline(height, extra = 0) {
    fan_outline(40+extra, height = height);
}

module fan40x40(height, extra = 0) {
    difference() {
        fan_outline(40+extra, height = height);
        fan_holes(16) cylinder(r = 2.15+extra, h = height*2+1, center = true);
        cylinder(r = 19, h = height*2+1, center = true);
    }
}

module fan30x30_outline(height, extra = 0) {
    fan_outline(30+extra, height = height);
}
   
module fan30x30(height, extra = 0) {
    difference() {
        fan_outline(30+extra, height = height);
        fan_holes(12) cylinder(r = 1.6+extra, h = height*2+1, center = true);
        cylinder(r = 14, h = height*2+1, center = true);
    }
}
