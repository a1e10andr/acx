// Increase this if your slicer or printer make holes too tight.
extra_radius = 0.1;

/* M3 Nuts & Screw */
// OD = outside diameter, corner to corner.
m3_nut_od = 6.1;
m3_nut_radius = m3_nut_od/2 + 0.2 + extra_radius;
m3_washer_radius = 3.5 + extra_radius;

// Major diameter of metric 3mm thread.
m3_major = 2.85;
m3_radius = m3_major/2 + extra_radius;
m3_wide_radius = m3_major/2 + extra_radius + 0.2;
m3_head_radius = 5.7/2 + extra_radius;

// M2.5 Washer DIN 125 Form A
// h  (Hoehe): 0,5mm
// d  (Innendurchmesser): 2,7mm
// d1 (Aussendurchmesser): 6,5mm 
m25_washer_radius = 6.5/2 + extra_radius;
m25_washer_height = 0.5;

// M2.5 Sechskantmuttern DIN 934
// m (Hhe): 2mm
// d (Innendurchmesser): M2,5
// e: 5,45mm (corner-to-corner)
// s: 5mm (side-to-side)
m25_nut_od = 5.45;
m25_nut_radius = m25_nut_od/2 + extra_radius;

// M2.5 Sechskantschrauben DIN 912
// dk (Kopfdurchmesser):  4.85
// k  (Kopfkohe)       :  2.5
// s  (Antrieb)        :  2.0
// b  (Gewindelnge)   : 17.0
m25_major = 2.0;
m25_radius = m25_major/2 + extra_radius;
m25_wide_radius = m25_major/2 + extra_radius + 0.2;
m25_head_radius = 4.85/2 + extra_radius;
