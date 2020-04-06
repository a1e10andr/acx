
screw_iso7380(20, extra = 0.1, outline = true);

module screw_iso7380(length, outline = false, extra = 0) {
    screw_iso7380_base(head_r = 5.7/2+extra, head_h = 1.65+extra, 
        screw_r = 3/2+extra, length = length+extra, outline = outline);
}

module screw_iso7380_base(head_r, head_h, screw_r, length, outline) {
    difference() {
        union() {
            cylinder(r1 = screw_r, r2 = head_r, h = head_h-0.5);
            translate([0, 0, head_h-0.5]) cylinder(r = head_r, h = 0.5);
            cylinder(r = screw_r, h = head_h + length);
        }
        if(!outline)
        {
            translate([0, 0, -0.1]) cylinder(r = screw_r-0.5, h = 1, $fn = 6);
        }
    }
}

module screw_din912(type, length, extra_raduis = 0.1, outline = false) {
    if(type == "m3") 
    {
        screw_din912_base(head_r  = m3_head_radius, head_h = 3.1, 
                   screw_r = m3_radius, length = length, outline = outline);
    } else if(type == "m2.5") 
    {
        screw_din912_base(head_r  = 4.85/2 + extra_raduis, head_h = 2.5, 
                   screw_r = 2.5/2 + extra_raduis, length = length, outline = outline);
    } else if(type == "m2") 
    {
        screw_din912_base(head_r  = 3.8/2 + extra_raduis, head_h = 2, 
                   screw_r = 2/2 + extra_raduis, length = length, outline = outline);
    }
}

module screw_din912_base(head_r, head_h, screw_r, length, outline) {
    difference() {
        union() {
            cylinder(r = head_r, h = head_h);
            cylinder(r = screw_r, h = head_h + length);
        }
        if(!outline)
        {
            translate([0, 0, -0.1]) cylinder(r = screw_r, h = 1, $fn = 6);
        }
    }
}
