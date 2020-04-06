$fn = 32;

arduino_uno_r3(true);

module arduino_mini_pro() {
    difference() {
        square([18, 33]);
        translate([1.38, 2.52]) liney(num = 12) circle(0.5);
        translate([18-1.38, 2.52]) liney(num = 12) circle(0.5);
        translate([1.38+1.27, 1.38]) linex(num = 6) circle(0.5);
    }
}

function arduino_mega_2560_r3_holes() = [
                [13.97,	 2.54],
                [15.24,	50.80],
                [66.04,	35.56],
                [66.04,	 7.62],
                [90.17, 50.80],
                [96.52,  2.54]];

module arduino_mega_2560_r3() {
    outline = [
                [0,	    0],
                [0,	    53.34],
                [96.52,	53.34],
                [99.06,	50.80],
                [99.06,	40.64],
                [101.6,	38.10],
                [101.6,	 3.81],
                [99.06,	 1.27],
                [99.06,	0]
              ];
    holes = [
                [13.97,	 2.54],
                [15.24,	50.80],
                [66.04,	35.56],
                [66.04,	 7.62],
                [90.17, 50.80],
                [96.52,  2.54]
            ];
    
    linear_extrude(height = 2, convexity = 10)
    difference() {
        polygon(points = outline);
        positions(pts = holes) circle(r = 1.5);
    }
}

//arduino_nano_r3();
function arduino_nano_r3_holes() = 
            [
                [1.27,	1.27],
                [1.27, 16.51],
                [41.91, 1.27],
                [41.91, 16.51]
            ];

module arduino_nano_r3() {
    outline = [
                [0,	    0],
                [0,	    17.78],
                [43.18,	17.78],
                [43.18,	0]
              ];
    holes = [
                [1.27,	1.27],
                [1.27, 16.51],
                [41.91, 1.27],
                [41.91, 16.51]
            ];
    
    pin_r1_15 = [3.91,  1.27, 0];
    pin_r2_15 = [3.91, 16.51, 0];
    pin_r1_3  = [41.91,  6.36, 0];
    pin_r2_3  = [39.37,  6.36, 0];
    led = [3, 2, 1];
    
    linear_extrude(height = 1.6, convexity = 10)
    difference() {
        polygon(points = outline);
        positions(pts = arduino_nano_r3_holes()) circle(d = 1.85);
        translate(pin_r1_15) linex(num = 15) circle(r = 0.5);
        translate(pin_r2_15) linex(num = 15) circle(r = 0.5);
        translate(pin_r1_3) liney(num = 3) circle(r = 0.5);
        translate(pin_r2_3) liney(num = 3) circle(r = 0.5);
    }
    color("red") translate([-1.45, 5.05, 1.6]) cube([9.13, 6.35, 3.35]);
    translate([0, 0, -1.6]) translate(pin_r1_15) linex(num = 15) pinX1(d = -1);
    translate([0, 0, -1.6]) translate(pin_r2_15) linex(num = 15) pinX1(d = -1);
    translate([0, 0,  1.6]) translate(pin_r1_3) liney(num = 3)  pinX1(d = 3);
    translate([0, 0,  1.6]) translate(pin_r2_3) liney(num = 3)  pinX1(d = 3);
    color("red") translate([43.18/2, 17.78/2,  1.6]) rotate([0, 0, 45]) 
        cube([8, 8, 2], center = true);
    
    color("green") translate([43.18/2+10, 17.78/2-1.27,  1.6]) 
        cube(led, center = true);
    color("green") translate([43.18/2+10, 17.78/2-3.81,  1.6]) 
        cube(led, center = true);
    color("green") translate([43.18/2+10, 17.78/2+1.27,  1.6]) 
        cube(led, center = true);
    color("green") translate([43.18/2+10, 17.78/2+3.81,  1.6]) 
        cube(led, center = true);
}

function arduino_uno_r3_holes(center = false) = 
            [
            [(center)?(13.97-68.58/2):(13.97), (center)?(2.54-53.34/2):(2.54)],
            [(center)?(15.24-68.58/2):(15.24), (center)?(50.80-53.34/2):(50.80)],
            [(center)?(66.04-68.58/2):(66.04), (center)?(35.56-53.34/2):(35.56)],
            [(center)?(66.04-68.58/2):(66.04), (center)?(7.62-53.34/2):(7.62)]
            ];

module arduino_uno_r3(center = false) {
    outline = [
            [0,     0], 
            [0,	    53.34],
            [64.52,	53.34],
            [66.04,	51.82],
            [66.04,	40.39],
            [68.58,	37.85],
            [68.58,	 5.08],
            [66.04,	 2.54],
            [66.04,	 0]
          ];
    
    holes = arduino_uno_r3_holes();
            
    pin_r1_10 = [18.80,	50.80, 0];
    pin_r2_8  = [45.72,	50.80, 0];
    pin_r3_8  = [27.94,	 2.54, 0];
    pin_r4_6  = [50.80,	 2.54, 0];
    
    dx = (center)?(-68.58/2):(0);
    dy = (center)?(-53.34/2):(0);
    
    translate([dx, dy, 0]) {
        linear_extrude(height = 2, convexity = 10)
        difference() {
            polygon(points = outline);
            positions(pts = holes) circle(r = 1.5);
            translate(pin_r1_10) linex(num = 10) circle(r = 0.5);
            translate(pin_r2_8)  linex(num =  8) circle(r = 0.5);
            translate(pin_r3_8)  linex(num =  8) circle(r = 0.5);
            translate(pin_r4_6)  linex(num =  6) circle(r = 0.5);
        }
        translate([0, 0, 1.6]) {
            translate(pin_r1_10) linex(num = 10) pinX1_socket();
            translate(pin_r2_8)  linex(num =  8) pinX1_socket();
            translate(pin_r3_8)  linex(num =  8) pinX1_socket();
            translate(pin_r4_6)  linex(num =  6) pinX1_socket();
        }
    }
}

module pinX1_socket() {
    color("grey") difference() {
        translate([0, 0, 2.5]) cube([2.54, 2.54, 8], center = true);
        translate([0, 0, 3.0]) cube([1, 1, 8], center = true);
    }
    color("grey") translate([0, 0, -1.5]) cube([0.7, 0.25, 3], center = true);
}

module pinX1(d) {
    color("grey") translate([0, 0, 1.5]) cube([2.54, 2.54, 3], center = true);
    color("grey") translate([0, 0, d]) cylinder(r = 0.5, h = 10, center = true);
}

module line(num, x_step, y_step) {
    for(n = [0:num-1]) translate([n*x_step, n*y_step, 0])
        for(i=[0:$children-1]) children(i);
}

module linex(num, step = 2.54) {
    for(n = [0:num-1]) translate([n*step, 0, 0])
        for(i=[0:$children-1]) children(i);
}

module liney(num, step = 2.54) {
    for(n = [0:num-1]) translate([0, n*step, 0])
        for(i=[0:$children-1]) children(i);
}

module positions(pts) {
    num = len(pts);
    for(n = [0:num-1])
        translate(pts[n])
            for(i=[0:$children-1]) children(i);
}
