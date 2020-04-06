$fn = 64;

module ring_24_ws2812(led = true) {
    ring_ws2812(do = 65.6, di = 52.3, n = 24);
}

module ring_16_ws2812(led = true) {
    ring_ws2812(do = 44.5, di = 31.7, n = 16, led = led);
}

module ring_ws2812(do, di, n, led, h = 1.6) {    
    difference() {
        cylinder(d = do, h = h);
        cylinder(d = di, h = 2*h+1, center = true);
    }
    if(led)
        for(a = [0:359/n:359])
            rotate([0, 0, a]) translate([di/2 + (do - di)/4, 0, 2]) cube([5, 5, 2], center = true);
}
