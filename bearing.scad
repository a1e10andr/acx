$fn = 64;

//bearing(type = "623");
bearing(type = "F623");
//MF63: 3x6x2.5(0.6), MF 63 ZZ ()
//MR63: 3x6x2.5, MR 63 ZZ
//bearing_base(base = [10, 3, 4]);
//bearing_base(base = [10, 3, 4], flansh = [11, 1]);
        
module bearing_outline(type, extra = 0) {
    if(type == "623")
        bearing_base_outline(base = [10, 3, 4], extra = extra);
    if(type == "F623")
        bearing_base_outline(base = [10, 3, 4], flansh = [11, 1], extra = extra);
    if(type == "MF63")
        bearing_base_outline(base = [6, 3, 2.5], flansh = [6.2, 0.6], extra = extra);
    if(type == "MR63")
        bearing_base_outline(base = [6, 3, 2.5], extra = extra);
}

module bearing(type) {
    if(type == "623")
        bearing_base(base = [10, 3, 4]);
    if(type == "F623")
        bearing_base(base = [10, 3, 4], flansh = [11, 1]);
    if(type == "MF63")
        bearing_base(base = [6, 3, 2.5], flansh = [6.2, 0.6]);
    if(type == "MR63")
        bearing_base(base = [6, 3, 2.5]);
}

// base[od, id, h]
// flansh[od, h]
module bearing_base_outline(base, flansh = [0, 0], extra = 0) {
    cylinder(d = base[0]+extra, h = base[2]+extra);
    if(flansh[0] != 0) cylinder(d = flansh[0]+extra, h = flansh[2]+extra);
}

// base[od, id, h]
// flansh[od, h]
module bearing_base(base, flansh = [0, 0]) {
    difference() {
        bearing_base_outline(base = base, flansh = flansh, extra = 0);
        cylinder(d = base[1], h = base[2]*2+1, center = true);
    }
}
