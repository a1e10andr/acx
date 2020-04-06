$fn = 64;
outline_extra = 0.1;

//akku_aa(outline = false);

module akku_aaaa(outline) {
    battery(d = 8.3, d2 = 2, l = 42.5, outline = outline, extra = 0);
}

module akku_aaa(outline) {
    battery(d = 10.5, d2 = 3, l = 44.5, outline = outline, extra = 0);
}

module akku_aa(outline) {
    battery(d = 14.5, d2 = 4, l = 50.5, outline = outline, extra = 0);
}

module akku_c(outline) {
    battery(d = 26.2, d2 = 5, l = 50, outline = outline, extra = 0);
}

module akku_d(outline) {
    battery(d = 34.2, d2 = 6, l = 61.5, outline = outline, extra = 0);
}

module akku_14500(outline, protection = 5) {
    battery(d = 14, d2 = 6, l = 50, outline = outline, extra = protection);
}

module akku_17500(outline, protection = 5) {
    battery(d = 17.3, d2 = 6, l = 50, outline = outline, extra = protection);
}

module akku_18500(outline, protection = 5) {
    battery(d = 18.3, d2 = 6, l = 49.8, outline = outline, extra = protection);
}

module akku_18650(outline, protection) {
    battery(d = 18.6, d2 = 6, l = 65.2, outline = outline, extra = protection);
}

module battery(d, l, d2, extra = 0, outline = false)
{
    if(outline)
    {
        battery_outline(d = d + outline_extra, l = l + outline_extra, extra = extra);
    }
    else
    {
        rcylinder(d = d, l = 5);
        translate([0, 0, 5]) rcylinder(d = d, l = l - 6);
        if(extra != 0)
        {
            translate([0, 0, l-1]) rcylinder(d = d, l = extra);
        }
        cylinder(d = d2, h = l + extra);
    }
}

module battery_outline(d, l, extra = 0)
{
    rcylinder(d = d, l = l + extra);
}

module rcylinder(d, l, dl = 1)
{
    cylinder(d1 = d - dl, d2 = d, h = 1);
    translate([0, 0, dl]) cylinder(d = d, h = l - 2*dl);
    translate([0, 0, l-dl]) cylinder(d2 = d - dl, d1 = d, h = dl);
}
