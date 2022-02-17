module apieces() {
	if (Pres  <1 && Pieces ==0) {
		if (APieces==1) endstopY();
		if (APieces==10) Zmotor();
	} else { // show parts on full setup with or without printer
		if (Pieces ==0) {
			if (APieces==1 || Pres  >=2) translate(Position_yendstop[Prin]) rotate([-90, 90,0 ]) endstopY();
			if (APieces==10 || Pres  >=2) translate(Position_zmotor[Prin]) rotate([-180, 0,0 ]) Zmotor();
		}
	}
}

module endstopY() {
	difference() {
		union() {
			color("red")
			roundedcube([46,46,36], true, 5, "zmin");
		}
		translate([0, 0, 5]) roundedcube([39,39,30], true, 2, "zmin");
		//translate([-100, -100, -16.5]) cube([200, 200, 4]);
		translate([-11, -29.7, -10]) cube([22, 40,  29]);
		translate([-7.5, -29.7, 2.1]) cube([22, 40,  16]);
		//translate([-14, 0, -15]) rotate([0, 0, 60]) resize([5, 5, 600]) cylinder(r = 4 / 2, h = 2, $fn = 48);
		//translate([14, 0, -15]) rotate([0, 0, 60]) resize([5, 5, 600]) cylinder(r = 4 / 2, h = 2, $fn = 48);
		// lamage
		translate([-15.5,15.5, -18]) rotate([0,0,90]) 
		cylinder(r = 5.6 / 2, h = 9, $fn = 48);   
		translate([15.5,-15.5, -18]) rotate([0,0,90]) 
		cylinder(r = 5.6 / 2, h = 9, $fn = 48);   
		// fix fdc
		translate([5,-16, -15]) rotate([0,0,90]) 
		cylinder(r = 3.4 / 2, h = 8, $fn = 48); 
		translate([-5,-16, -15]) rotate([0,0,90]) 
		cylinder(r = 3.4 / 2, h = 8, $fn = 48); 
		translate([5,-16, -18]) rotate([0,0,90]) 
		cylinder(r = 5.6 / 2, h = 4, $fn = 48); 
		translate([-5,-16, -18]) rotate([0,0,90]) 
		cylinder(r = 5.6 / 2, h = 4, $fn = 48); 
		//cable
		hull() {
			translate([-6,0, -6]) rotate([270,0,0]) 
			cylinder(r = 8 / 2, h = 55, $fn = 48); 
			translate([6,0, -6]) rotate([270,0,0]) 
			cylinder(r = 8 / 2, h = 55, $fn = 48); 
		}
	}
	translate([-15.5,15.5, -13]) rotate([0,0,90]) supports(15);
	translate([15.5,-15.5, -13]) rotate([0,0,90]) supports(15);
}

module supports(SupL) {
    difference() {
		union() {
			color("red")
			cylinder(r = 9 / 2, h = SupL, $fn = 48);   
		}
		translate([0,0, -0.5])
		cylinder(r = 3.4 / 2, h = SupL+1, $fn = 48);   
	}
}
