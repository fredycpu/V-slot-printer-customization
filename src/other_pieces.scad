module apieces() {
	if (Pres  <1 && Pieces ==0) {
		if (APieces==1) jonction();
		if (APieces==2) jonction_cable();
		if (APieces==10) Zmotor();
		if (APieces==100) endstopY();
		if (APieces==200) support_plexy();
		if (APieces==201) verrou_cables();
		if (APieces==400) outil_verrou();
		if (APieces==601) Drawer();
		if (APieces==602) poignee(1);
		if (APieces==603) poignee(0);
		if (APieces==900) aide_verrou_cable();
	} else { // show parts on full setup with or without printer
		if (Pieces ==0 || Pres  >1 ) {
			if (APieces==10 || Pres  >=2) translate(Position_zmotor[Prin]) rotate([-180, 0,0 ]) Zmotor();
			if (APieces==100 || Pres  >=2) translate(Position_yendstop[Prin]) rotate([-90, 90,0 ]) endstopY();
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


module jonction() {//junction between v-slots
	roundedcube([56.4,10.5,6.7], true, 1.5, "all");
}

module jonction_cable() {//junction between v-slots for cables
	difference () {
	roundedcube([56.4,50.5,6.7], true, 1.5, "all");
	translate([13,18,-4]) cylinder(d = 18, h = 20, $fn = 48);
	}
}


module Drawer() {
	difference() {
		union () {
			translate([0,1,0]) roundedcube([70,10,58], true, 2, "all");
			translate([0,0,0]) rotate([0,90,0]) cylinder(d = 12, h = 43, $fn = 48,center=true);
			}
			poignee(0);
	}
	poignee(1);
}


module poignee(x) {
	if (x==1) { //piece to print
    difference() {
	rotate([0,90,00]) cylinder(d = 8, h = 60, $fn = 48,center=true);
	translate([15,0,0])
	difference () {
	rotate([0,45,00]) cube ([5,25,25],center=true);
	rotate([0,90,00]) cylinder(d = 5, h = 60, $fn = 48,center=true);
	}
	translate([-15,0,0])
	difference () {
	rotate([0,-45,00]) cube ([5,25,25],center=true);
	rotate([0,90,00]) cylinder(d = 5, h = 60, $fn = 48,center=true);
	}
	}
	translate([-26,0,-12.5])
		 cube ([8,8,25],center=true);
	translate([26,0,-12.5])
		 cube ([8,8,25],center=true);
	translate([0,0,-25])
	rotate([0,90,0]) cylinder(d = 8, h = 60, $fn = 48,center=true);		 
	poigne_meca();
	poignee_supports();
	rotate([0,0,180]) poignee_supports();

	}	else {// space for the piece
	
	translate([0,0,-0.3])rotate([0,90,0]) cylinder(d = 8.8, h = 61, $fn = 80,center=true);
	
	//poigne_meca();

	translate([0,-5.5,-27]) rotate([0,90,00])cylinder(d = 20, h = 61, $fn = 48,center=true); 
	translate([20,0,8]) rotate([0,90,00]) cylinder(d = 7, h = 30, $fn = 48,center=true);
	hull () {
	translate([15,0.2]) rotate([0,0,00]) cylinder(d = 6, h = 7, $fn = 48,center=true);	
	translate([19,0,6.2]) rotate([0,0,00]) cylinder(d = 6, h = 7, $fn = 48,center=true);	
	}
	translate([-20,0,8]) rotate([0,90,00]) cylinder(d = 7, h = 30, $fn = 48,center=true);		
	hull () {
	translate([-15,0.2]) rotate([0,0,00]) cylinder(d = 6, h = 7, $fn = 48,center=true);	
	translate([-19,0,6.2]) rotate([0,0,00]) cylinder(d = 6, h = 7, $fn = 48,center=true);	
	}
	translate([-26,0,-10])
		 cube ([9,9,28],center=true);
	translate([26,0,-10])
		 cube ([9,9,28],center=true);
	translate([0,0,-25]) rotate([0,90,00]) cylinder(d = 8.6, h = 61, $fn = 48,center=true);
	}
	
}
module poigne_meca() {
	translate([26.5,0,8]) rotate([0,90,00]) cylinder(d = 6, h = 28, $fn = 48,center=true);	
	translate([18.5,0,5.6]) rotate([0,0,00]) cylinder(d = 5.4, h = 6, $fn = 48,center=true);	
	translate([-26.5,0,8]) rotate([0,90,00]) cylinder(d = 6, h = 28, $fn = 48,center=true);	
	translate([-18.5,0,5.6]) rotate([0,0,00]) cylinder(d = 5.4, h = 6, $fn = 48,center=true);	
	}

module poignee_supports(){
	translate([7.4,0,-10])cylinder(d = .4, h = 15, $fn = 48,center=true);
	translate([15.9,0,5])cylinder(d = .4, h = 10, $fn = 48,center=true);
	translate([18.4,2.5,4])cylinder(d = .4, h = 10, $fn = 48,center=true);
	translate([18.4,-2.5,4])cylinder(d = .4, h = 10, $fn = 48,center=true);
	translate([14.8,0,-4])cylinder(d = .4, h = 10, $fn = 48,center=true);
	translate([21,0,5])cylinder(d = .4, h = 10, $fn = 48,center=true);
	translate([11.5,0,5])cylinder(d = .4, h = 10, $fn = 48,center=true);
	translate([21.4,0,-4]) cylinder(d = .4, h = 50, $fn = 48,center=true);
	translate([29.8,0,-4]) cylinder(d = .4, h = 50, $fn = 48,center=true);
}

module support_plexy() {
	difference () {
		union() {
			translate([0,0,10]) cube([40,Long,20],center=true);
			cube ([60,Long,5],center=true);
		
		}
		translate([0,0,4.9]) cube([30,Long+1,15],center=true);
		translate([-13,-Long/2-0.1,0]) rotate ([-90,-180,00]) wedge(90, 5, 5, ,Long+1);
		translate([13,Long/2+.1,0]) rotate ([-90,-180,180]) wedge(90, 5, 5, ,Long+1);	
		
		//holes
		translate([10,-Long*.4,0]) cylinder(d = 5.2, h = 50, $fn = 48,center=true);
		translate([-10,-Long*.4,0]) cylinder(d = 5.2, h = 50, $fn = 48,center=true);
		translate([10,Long*.4,0]) cylinder(d = 5.2, h = 50, $fn = 48,center=true);
		translate([-10,Long*.4,0]) cylinder(d = 5.2, h = 50, $fn = 48,center=true);
	}
}

module aide_verrou_cable (){
	color ("green") support_plexy();
	translate([0,0,3]) rotate ([0,0,90]) verrou_cables();
	color("red") translate([0,0,-5]) rotate ([0,0,45]) outil_verrou();

}


module verrou_cables() {
	difference () {
		intersection() {
			hull () {
				cylinder(d = 28.2, h = 2, $fn = 48,center=true);
				translate([0,0,-3]) cylinder(d = 35.7, h = 0.1, $fn = 48,center=true);
			}
			translate([0,0,0]) cube([29.5,60,10],center=true);
		}
		translate([0,-10,-3]) cylinder(d = 10, h = 20, $fn = 48,center=true);
		translate([0,10,-3]) cylinder(d = 10, h = 20, $fn = 48,center=true);
	}
}

module outil_verrou() {
	rotate ([0,0,45])
	union () {
		translate([0,0,4]) cylinder(d = 29.5, h = 3, $fn = 48,center=true);
		translate([0,0,0]) cylinder(d = 40, h = 5, $fn = 48,center=true);
		translate([0,-10,5]) cylinder(d = 8.5, h = 8, $fn = 48,center=true);
		translate([0,10,5]) cylinder(d = 8.5, h = 8, $fn = 48,center=true);
	}
	translate([40,0,0]) roundedcube([60,14.5,5], true, 1.5, "all");
}
