/*
          P3  
        / | \
       /  |  \
      /   |   \
     P1 - P0 - P2 
      \   |   /
       \  |  /
        \ | /
          P4

h - высота треугольника P1P3P2 (расстояние между точками P3 и P0)
a - расстояние между точками P1 и P0
b - расстояние между точками P2 и P0
d = a + b; - расстояние между точками P1 и P2 (центрами)

P1 - центр окружности 1
P2 - центр окружности 2
P3, P4 - точки пересечения окружностей

d = sqrt((P2x - P1x)^2 + (P2y - P1y)^2)
b = (R2^2-R1^2+d^2)/(2*d)
a = d - b
h = sqrt(a^2 - R1^2)
P0 = P1 + a/d*(P2 - P1)

P0x = P1x + a/d*(P2x - P1x)
P0y = P1y + a/d*(P2y - P1y)

P3x = P0x + (P2Y - P1Y)/d * h
P3y = P0y - (P2X - P1X)/d * h

P4x = P0x - (P2Y - P1Y)/d * h
P4y = P0y + (P2X - P1X)/d * h
*/

module test_circle_intersection() {
    pt1 = [10, 0];
    pt2 = [50, 0];
    R1o = 10;
    R2o = 20;
    R = 40;
    
    pts = a_circle_intersection(P1, R1o, P2, R2o, R);
    translate([P1[0], P1[1], 0]) circle(R1o);
    translate([P2[0], P2[1], 0]) circle(R2o);
    
    # translate([pts[0][0], pts[0][1], 0]) circle(R);
    # translate([pts[1][0], pts[1][1], 0]) circle(R);
}

/*
 * P1  : center point (x, y) of 1st circle
 * R1o : radius of 1st circle
 * P2  : center point (x, y) of 2nd circle
 * R2o : radius of 2nd circle
 * R   : radius
 */
function a_circle_intersection(P1, R1o, P2, R2o, R) = [
    a_P3(P1, R1o, P2, R2o, R),
    a_P4(P1, R1o, P2, R2o, R)];

function a_distance(P1, P2) = 
    sqrt((P2[0] - P1[0])*(P2[0] - P1[0]) + (P2[1] - P1[1])*(P2[1] - P1[1]));

function a_b(P1, R1, P2, R2) = 
    (R2*R2-R1*R1+a_distance(P1, P2)*a_distance(P1, P2))/(2*a_distance(P1, P2));

function a_a(P1, R1, P2, R2) = 
    a_distance(P1, P2) - a_b(P1, R1, P2, R2);

function a_h(P1, R1, P2, R2) = 
    sqrt(abs((a_a(P1, R1, P2, R2)*a_a(P1, R1, P2, R2)) - (R1*R1)));

function a_P0(P1, R1, P2, R2) = [
    P1[0] + a_a(P1, R1, P2, R2)/a_distance(P1, P2)*(P2[0] - P1[0]),
    P1[1] + a_a(P1, R1, P2, R2)/a_distance(P1, P2)*(P2[1] - P1[1])    
];

function a_P3(P1, R1, P2, R2, R) = [
    a_P0(P1, R1+R, P2, R2+R)[0] + (P2[1] - P1[1])/a_distance(P1, P2) * a_h(P1, R1+R, P2, R2+R),
    a_P0(P1, R1+R, P2, R2+R)[1] - (P2[0] - P1[0])/a_distance(P1, P2) * a_h(P1, R1+R, P2, R2+R)
];

function a_P4(P1, R1, P2, R2, R) = [
    a_P0(P1, R1+R, P2, R2+R)[0] - (P2[1] - P1[1])/a_distance(P1, P2) * a_h(P1, R1+R, P2, R2+R),
    a_P0(P1, R1+R, P2, R2+R)[1] + (P2[0] - P1[0])/a_distance(P1, P2) * a_h(P1, R1+R, P2, R2+R)
];

function a_point(r, angle) = [
	r * cos(angle), 
	r * sin(angle)
];

/*
 * P1  : center point (x, y) of 1st circle
 * R1o : radius of 1st circle
 * P2  : center point (x, y) of 2nd circle
 * R2o : radius of 2nd circle
 * R   : radius
 */
function a_circle_intersection(P1, R1o, P2, R2o, R) = [
    a_P3(P1, R1o, P2, R2o, R),
    a_P4(P1, R1o, P2, R2o, R)];

module test_circle_intersection(P1, R1o, P2, R2o, R) {
    pts = a_circle_intersection(P1, R1o, P2, R2o, R);
    difference() {
        union() {
            translate([P1[0], P1[1], 0]) circle(R1o);
            translate([P2[0], P2[1], 0]) circle(R2o);
            hull() {
                translate([P1[0], P1[1], 0]) circle(R1o-1);
                translate([P2[0], P2[1], 0]) circle(R2o-1);
            }
        }
        # translate([pts[0][0], pts[0][1], 0]) circle(R);
        # translate([pts[1][0], pts[1][1], 0]) circle(R);
    }
}
