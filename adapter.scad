// Parameters
width = 200;                 // Backplane width
height = 220;                // Backplane height
thickness = 2;               // Backplane and tube wall thickness
hole_radius = 135 / 2;       // Central hole radius
screw_hole_radius = 5 / 2;   // Screw hole radius
screw_hole_margin = 10;      // Distance from edges to screw holes
tube_height = 50;            // Height of the tube
cut_width = 15;              // Width of rectangular cutout
cut_height = 15;             // Height of rectangular cutout

// Backplane with cutouts
difference() {
    cube([width, height, thickness], center = true);  // Main backplane

    cylinder(r = hole_radius, h = thickness + 0.1, center = true);  // Central hole

    // Screw holes in corners
    for (x = [-width/2 + screw_hole_margin, width/2 - screw_hole_margin],
         y = [-height/2 + screw_hole_margin, height/2 - screw_hole_margin]) {
        translate([x, y, 0])
            cylinder(r = screw_hole_radius, h = thickness + 0.1, center = true);
    }

    // Rectangular cutout near top edge
    translate([0, height/2 - cut_height / 2, 0])
        cube([cut_width, cut_height + 0.1, thickness + 0.1], center = true);
}

// Hollow tube aligned with central hole
difference() {
    // Outer tube
    translate([0, 0, tube_height / 2 + thickness / 2])
        cylinder(r = hole_radius, h = tube_height, center = true);

    // Inner hollow
    translate([0, 0, tube_height / 2 + thickness / 2])
        cylinder(r = hole_radius - thickness, h = tube_height + 0.1, center = true);
}
