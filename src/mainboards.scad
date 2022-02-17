module Board(Bx,By,Bz,Btype) {

	BoardW= Btype==2 ? 143:Btype==3 ? 110:Btype==4 ? 110:150;
	DecY=(By-BoardW)/2;
        
	difference () {
		union () {
			translate([0,0,-6])cube([7,By,Bz+12]);
			translate([7,0,-6])cube([33,By,5]);
			if (Btype == 2 ) {// MKS Robin Pro
				translate([7,DecY,-6]) pcb_implentation(84,BoardW,76,135);
			if (FabreP) translate([0, Long/2-40 , Bz+3]) rotate([90,0,-90]) color("white") letter("MKS Robin PRO");
			}
			if (Btype == 0 || Btype== 1) {// MKS Robin 2 V1.0
				translate([7,DecY,-6]) pcb_implentation(100,BoardW,92,142);
			if (FabreP) translate([0, Long/2-40 , Bz+3]) rotate([90,0,-90]) color("white") letter("MKS Robin 2");    
			}
			if (Btype == 3 ) {// MKS Robin nano 2
				translate([7,DecY,-6]) pcb_implentation(84,113,76,102);
			if (FabreP) translate([0, Long/2-40 , Bz+3]) rotate([90,0,-90]) color("white") letter("MKS Robin Nano 2");
			}
			if (Btype == 4 ) {// MKS Robin nano 2
				translate([7,DecY,-6]) pcb_implentation(84,113,76,102);
			if (FabreP) translate([0, Long/2-40 , Bz+3]) rotate([90,0,-90]) color("white") letter("MKS Robin Nano 3");
			}
		}
		if (Btype == 1) {// MKS Robin V2.4
			translate([0,DecY+BoardW,5]) PCB_connect(-32.5,-63.5,-1,-1);
		}
		if (Btype == 2) {// MKS Robin PRO
			translate([0,DecY+BoardW,5]) PCB_connect(-32.5,-69.6);
		}
		if (Btype == 3 ) {// MKS Robin nano 2        
			translate([0,DecY+BoardW,5]) PCB_connect(-33.77,-1,-62.19,-1);
			translate([0,DecY+BoardW,5]) difference () {        
			union() {
				translate([-0.1,-112,0]) cube([20,45,20]);
				translate([-0.1,-112,15]) cube([20,112,25]);
			}
			translate([2,-100,11]) rotate([90,0,90]) hexpattern(200,90, 10);
		}         
    }
	if (Btype ==4 ) {// MKS Robin nano 3        
		translate([0,DecY+BoardW,5]) PCB_connect(-33.77,-1,-62.45,-1,-43.62);
		translate([0,DecY+BoardW,5]) 
		difference () {        
			union() {
				translate([-0.1,-112,0]) cube([20,45,20]);
				translate([-0.1,-112,18]) cube([20,112,22]);
			}
			translate([2,-100,11]) rotate([90,0,90]) hexpattern(200,90, 10);
		}         
    }
    if (Btype == 0 ) {// MKS Robin 2 V1.0        
		translate([0,DecY+BoardW,5]) PCB_connect(-32.5,-63.5,-1,-86);
		translate([0,DecY+BoardW,5]) 
		difference () {        
			union() {
				translate([-0.1,-112,0]) cube([20,22,20]);
				translate([-0.1,-112,15]) cube([20,112,20]);
			}
		translate([2,-100,11]) rotate([90,0,90]) hexpattern(200,60, 10);
		}  
	}
 	translate([55,By/2,-8])cylinder(h=10,d=60,$fn=8);
    translate([10,10,Bz-25]) cylinder(h=25,r=10/2,$fn=80);  
    translate([10,By-10,Bz-25]) cylinder(h=25,r=10/2,$fn=80);
	} 
	translate([6.8,By/2-50,45]) 
	difference () {
		cube([10,100,10]);
		translate([0,-1,0]) rotate([0,45,0]) cube([15,102,15]);
	}
	translate([13.8,By/2-50,55]) cube([3,20,4]);
	translate([13.8,By/2-23.33,55]) cube([3,20,4]);
	translate([13.8,By/2+3.33,55]) cube([3,20,4]);
	translate([13.8,By/2+30,55]) cube([3,20,4]);
}



module PCB_connect(UB,SD=-1,MSD=-1,UA=-1,UAH=-1) {
    if (UB !=-1) translate([-0.1,UB,0]) cube([20,13.5,12]); //usb 
    if (SD !=-1) translate([-0.1,SD,0]) cube([20,29.5,5.5]); //SD
    if (SD !=-1) translate([-0.1,SD+14.7,2.7]) sphere(7);  //SD  
    if (MSD !=-1) translate([-0.1,MSD,0]) cube([20,15,3]); //mSD
    if (MSD !=-1) translate([-0.1,MSD+7.6,2.7]) sphere(7);  //MSD        
    if (UA !=-1) translate([-0.1,UA,0]) cube([20,15.5,7.8]); //SD
    if (UAH !=-1) translate([-0.1,UAH,0]) cube([20,7.8,15.5]); //SD
}