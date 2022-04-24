$fa=4;
$fs=1;
// Units are milimeters

antennia_hole_dia=20.5;
mount_hole_dia=7;
mount_hole_offset=15;
hole_center_len=120;
length=140;
thickness=3;
height=27;
countersink_dia=14;
countersink_dep=1.5;

module bracket() {
	cube([height,length,thickness], true);
	translate([-(height/2)+(thickness/2), 0, height/2-thickness/2])
		cube([thickness,length,height],true);
}

module antennia_hole() {
	cylinder(h=10, r=antennia_hole_dia/2, center=true);
}

module mount_holes() {
	translate([-height/2,hole_center_len/2,(height-mount_hole_offset)-(thickness/2)])
	rotate([0,90,0])
		cylinder(h=10, r=mount_hole_dia/2, center=true);
	
	translate([-height/2,-hole_center_len/2,(height-mount_hole_offset)-(thickness/2)])
	rotate([0,90,0])
		cylinder(h=10, r=mount_hole_dia/2, center=true);
}

module bracket_hole() {
	difference() {
		bracket();
		cylinder(h=10, r=antennia_hole_dia/2, center=true);
	}
}

module countersink() {
	translate([-height/2+countersink_dep,hole_center_len/2,(height-mount_hole_offset)-(thickness/2)])
	rotate([0,-90,0])
		cylinder(h=10, r=countersink_dia/2, center=false);
	translate([-height/2+countersink_dep,-hole_center_len/2,(height-mount_hole_offset)-(thickness/2)])
	rotate([0,-90,0])
		cylinder(h=10, r=countersink_dia/2, center=false);
}

difference() {
	bracket();
	antennia_hole();
	mount_holes();
	countersink();
}
