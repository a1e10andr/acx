include <library/essential.scad>
// Increase this if your slicer or printer make holes too tight.
extra_radius = 0.1;
/*
// OD = outside diameter, corner to corner.
m3_nut_od = 6.1;
m3_nut_radius = m3_nut_od/2 + 0.2 + extra_radius;
m3_washer_radius = 3.5 + extra_radius;

// Major diameter of metric 3mm thread.
m3_major = 2.85;
m3_radius = m3_major/2 + extra_radius;
m3_wide_radius = m3_major/2 + extra_radius + 0.2;
*/
m3_diam = 3;
m6_diam = 5;
m7_diam = 5.92;

separation = 40;        // Distance between ball joint mounting faces.
offset = 20;            // Same as DELTA_EFFECTOR_OFFSET in Marlin.
hotend_radius = 8.1;   // Hole for the hotend (J-Head diameter is 16mm).
mount_height = 3.75;    // Height of 1 E3D hotend mount ring
push_fit_radius = 6.5;    // Hole for push-fit connector
height = 8;
boss = 1;
cone_r1 = 2.5;
cone_r2 = 14;

mount_radius = 12.5;    // Hotend mounting screws, standard would be 25mm.
e3d_mount_height = 5.9;
e3d_mount_radius = 6.0;

//e3d_v6_complete();

module e3d_v6_complete() {
    e3d_v6_hotend();
    translate([0, 0, 46.85]) e3d_v6_groove_mount();
    translate([0, 0, 61.85]) rotate([180, 0, 0])effector();
}

module e3d_v6_hotend() {
    e3d_v6_hotend_heatblock();
    translate([0, 0, -5]) e3d_v6_hotend_nozzle_0_4();
    translate([0, 0, 6.5]) e3d_v6_hotend_heatbreak();
    translate([0, 0, 56.5]) e3d_v6_hotend_sink();
}

module e3d_v6_hotend_nozzle_0_4() {
    B = 1.00;
    C = 0.80;
    D = 1.5;
    E = 10.5;
    difference() {
        e3d_v6_hotend_nozzle_0_4_body();
        translate([0, 0, -2]) # cylinder(r = 0.2, h = C*2+2);
        translate([0, 0, C]) cylinder(r = D/2, h = C);
        translate([0, 0, 2*C]) cylinder(r = 1, h = 12.5);
    }
}

module e3d_v6_hotend_nozzle_0_4_body() {
    B = 1.00;
    C = 0.80;
    D = 1.5;
    E = 10.5;
    cylinder(r1 = B/2, r2 = tan(55)/B, h = 2);
    translate([0, 0, 2]) cylinder(r = 3.5, h = 3, $fn = 6);
    translate([0, 0, 5]) cylinder(r = 2.5, h = 1.5);
    translate([0, 0, 6.5]) cylinder(r = m6_diam/2+0.5, h = 6);
}

module e3d_v6_hotend_heatblock() {
    translate([-15.5, -8, 0])
    difference() {
        e3d_v6_hotend_heatblock_body();
        translate([15.5, 8, -0.1]) cylinder(r = m6_diam/2, h = 12);
        translate([ 2.5, 8, -0.1]) cylinder(r = m3_radius, h = 12);
        rotate([90, 0, 0]) translate([18, 2, -2]) cylinder(r = 1, h = 2.05);
        rotate([90, 0, 0]) translate([18, 2, -4.5]) cylinder(r = 0.8, h = 4.55);        
        rotate([90, 0, 0]) translate([16.5, 4.8, -3.5]) cylinder(r = m3_radius, h = 3.6);
        rotate([90, 0, 0]) translate([8.5, 4, -16.5]) cylinder(r = 3, h = 17);
        translate([-1, -1, 3.5]) cube([9, 17.5, 1]);
    }
}

module e3d_v6_hotend_heatblock_body() {
    cube([20, 16, 11.5]);
}

module e3d_v6_hotend_heatbreak() {
    difference() {
        e3d_v6_hotend_heatbreak_body();
        cylinder(r = 1, h = 25);
        translate([0, 0, 16.3]) cylinder(r = 2.1, h = 6);
        //translate([-15, -12, -1]) cube([30, 12, 50]);
    }
}

module e3d_v6_hotend_heatbreak_body() {
    cylinder(r1 = m6_diam/2-0.5, r2 = m6_diam/2, h = 0.3);
    translate([0, 0,  0.3]) cylinder(r = m6_diam/2, h = 4.7);
    cylinder(r = 1.4, h = 7.1);
    translate([0, 0,  7.1]) cylinder(r = m7_diam/2, h = 14.8);
    translate([0, 0, 21.9]) cylinder(r1 = m7_diam/2, r2 = m7_diam/2-1, h = 0.3);
}


module e3d_v6_hotend_sink() {
    rotate([180, 0, 0])
    difference() {
        e3d_v6_hotend_sink_body();
        cylinder(r = 4, h = 6.7);
        translate([0, 0, 6.7]) cylinder(r1 = 4, r2 = 2.1, h = 1.5);
        translate([0, 0, 8.2]) cylinder(r = 2.1, h = 36);
        translate([0, 0, 27.9]) cylinder(r = m7_diam/2, h = 14.8);        
        //translate([-15, -12, -1]) cube([30, 12, 50]);
    }
}

module e3d_v6_hotend_sink_body() {
    cylinder(r = 8, h = 3.7);
    translate([0, 0,  3.7]) cylinder(r = 6, h = 6);
    translate([0, 0,  9.7]) cylinder(r = 8, h = 3);
    translate([0, 0, 14.2]) cylinder(r = 8, h = 1);
    for(h =[0:2.5:26])
        translate([0, 0, 16.7+h]) cylinder(r = 11.15, h = 1);
    translate([0, 0, 12.7]) cylinder(r = 6, h = 4);
    translate([0, 0, 16.7]) cylinder(r1 = 6, r2 = 8, h = 26);
}

module e3d_v6_groove_mount() {   
    difference() {
        cylinder(r = 17, h = e3d_mount_height);
        
        effector_mount() cylinder(r=m3_radius, h=e3d_mount_height*2+1, center = true);
        translate([0, 0, e3d_mount_height/2]) hull() {
            cylinder(r=e3d_mount_radius, h=e3d_mount_height+0.1, center = true);
            translate([0, 17, 0]) cylinder(r=e3d_mount_radius, h=e3d_mount_height+0.1, center = true);
        }        
        translate([-17, 13, -1])
           cube([40, 5, e3d_mount_height+2]);
    }
}

module effector(boss = 1) {
    difference() {
        translate([0, 0, height/2]) effector_body(boss);
        translate([0, 0, height + boss - mount_height-0.1])
            cylinder(r=hotend_radius, h=mount_height+1);
        translate([0, 0, -0.1]) cylinder(r=push_fit_radius, h=height+boss+1.1);
        effector_mount() cylinder(r=1.5, h=height*2+boss*2+1, center = true);
    }
}

module effector_body(boss = 1) {
    translate([0,0,boss/2])
        cylinder(r=offset-3, h=height+boss, center = true, $fn=60);
    for (a = [60:120:359]) rotate([0, 0, a]) {
        rotate([0, 0, 30]) translate([offset-2, 0, 0])
            cube([10, 13, height], center=true);
        for (s = [-1, 1]) scale([s, 1, 1]) {
            translate([0, offset, 0]) difference() {
                intersection() {
                    cube([separation, 40, height], center=true);
                    translate([0, -4, 0]) rotate([0, 90, 0])
                        cylinder(r=10, h=separation, center=true);
                    translate([separation/2-7, 0, 0]) rotate([0, 90, 0])
                    cylinder(r1=cone_r2, r2=cone_r1, h=14, center=true, $fn=24);
                }
                rotate([0, 270, 0])
                    cylinder(r=m3_radius, h=separation+1, center=true, $fn=12);
                rotate([90, 0, 90])
                    cylinder(r=m3_nut_radius, h=separation-24, center=true, $fn=6);
            }
        }
    }
}

module effector_mount() {
    for (a = [0:60:359]) rotate([0, 0, a])
        translate([0, mount_radius, 0]) for(i=[0:$children-1]) children(i);
}