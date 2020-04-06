
module sqrt_position(dim) {
    for(x = [-dim[0], dim[0]])
        for(y = [-dim[1], dim[1]])
            translate([x, y, 0]) for(i=[0:$children-1]) children(i);
}

module line(num, x_step, y_step) {
    for(n = [0:num-1]) translate([n*x_step, n*y_step, 0])
        for(i=[0:$children-1]) children(i);
}

module rcube(dim, r) {
    for(x = [-dim[0]/2+r, dim[0]/2-r])
        for(y = [-dim[1]/2+r, dim[1]/2-r])
            translate([x, y, 0]) cylinder(r = r, h = dim[2], center = true);
    cube([dim[0]-2*r, dim[1],     dim[2]], center = true);
    cube([dim[0],     dim[1]-2*r, dim[2]], center = true);
}

module rsquare(dim, r) {
    for(x = [-dim[0]/2+r, dim[0]/2-r])
        for(y = [-dim[1]/2+r, dim[1]/2-r])
            translate([x, y]) circle(r = r);
    square([dim[0]-2*r, dim[1]], center = true);
    square([dim[0], dim[1]-2*r], center = true);
}

module rect(dim) {
    for(x = [-dim[0]/2, dim[0]/2])
        for(y = [-dim[1]/2, dim[1]/2])        
            translate([x, y, 0]) for(i=[0:$children-1]) children(i);
}

module points(pts) {
    num = len(pts);
    for(n = [0:num-1]) translate(pts[i]) 
        for(i=[0:$children-1]) children(i);
}

module arc(r1, r2, angle_begin, angle_end) {
    r0 = (r1 - r2)/2+r2;
    polygon(points = a_arc(r1 = r1, r2 = r2, angle_begin = angle_begin, angle_end = angle_end));
    for(a = [angle_begin, angle_end])
        rotate([0, 0, a]) translate([r0, 0]) circle(r = (r1 - r2)/2);
}

module pie(r1, r2, d, angle_begin, angle_end) {
    r0 = (r1 - r2)/2+r2;
    polygon(points = a_arc(r1 = r1, r2 = r2, angle_begin = angle_begin, angle_end = angle_end));
    hull() {
        for(a = [angle_begin, angle_end])
            rotate([0, 0, a]) translate([r0, 0]) circle(r = (r1 - r2)/2);
        translate([r0-d+(r1 - r2), 0]) circle(r = (r1 - r2)/2);
    }
}

function a_arc(r1, r2, angle_begin, angle_end) = 
    concat(a_pie(r = r1, angle_begin = angle_begin, angle_end = angle_end), 
           a_pie(r = r2, angle_begin = angle_end, angle_end = angle_begin));

function a_pie(r, angle_begin, angle_end, step = 0.1) = [
    for(angle = [angle_begin : (angle_begin < angle_end)?(step):(-step) : angle_end]) 
        a_point(r, angle)
];

function a_point(r, angle) = 
[
	r * cos(angle), 
	r * sin(angle)
];
