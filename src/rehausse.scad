module Rehausse(ParoieX,ParoieY,ParoieZ,texture=0,pieces=0) {
    diam_vis=5.4;
	if (pieces!=0) {
		if (pieces==20) {
			if (texture==2) {translate([-16,10+(ParoieY-40)/2,-ParoieZ/2]) rotate([90,0,90]) hexpattern(ParoieY-40,ParoieZ-12, 6);}
			if (texture==1) {translate([-16,10,6-ParoieZ]) rotate([0,0,90]) brickface(ParoieY-40,ParoieZ-12, 8, 4, 1, 3);}
			if (texture==3) {translate([-19,10,-6]) rotate([270,0,90]) tolelarmes(ParoieY-40,ParoieZ-12,5,2,1.2);}
		}
		if (pieces==100) {translate([-20,10,6-ParoieZ]) Ventil(ParoieX,ParoieY-40,ParoieZ-12,80);}
		if (pieces==300) {translate([-20,10,6-ParoieZ]) Connecteur(ParoieX,ParoieY-40,ParoieZ-12,1);}
		if (pieces==301) {translate([-20,10,6-ParoieZ]) Connecteur(ParoieX,ParoieY-40,ParoieZ-12,2);}
		if (pieces==302) {translate([-20,10,6-ParoieZ]) Connecteur(ParoieX,ParoieY-40,ParoieZ-12,0);}
		if (pieces==341) SSR(ParoieX,ParoieY,ParoieZ,SSRelays);
		if (pieces==351) MKSPWC(ParoieX,ParoieY,ParoieZ,1);
		if (pieces>=400 && pieces<500) {translate([-20,10,6-ParoieZ]) PSUFix(ParoieX,ParoieY-40,ParoieZ-12,pieces-400,texture);}
		if (pieces==500) {translate([-20,10,6-ParoieZ]) Board(ParoieX,ParoieY-40,ParoieZ-12,MBoard);}
		if (pieces==501) {translate([-20,10,6-ParoieZ]) Display(ParoieX,ParoieY-40,ParoieZ-12,Display);}
		if (pieces>=600) {translate([-20,10,6-ParoieZ]) Tiroir(ParoieX,ParoieY-40,ParoieZ-12,texture);}
		difference() {
			union() {
				if (ParoieX==40) {translate([0,0,6-ParoieZ])  rotate([0,0,90])V20x40_6(ParoieZ-12);
				translate([20-1.2,10,-6]) rotate([0,90,0]) wedge(90, 15, 20, 1.2);
				if (plexy) translate([20-1.2,18,0]) rotate([270,0,0]) wedge(90, 8, 6, 12);            
				}    
				translate([-1.2,10,-6]) rotate([0,90,0]) wedge(90, 15, 20, 1.2);
				if (plexy && ParoieX!=40) translate([-1.2,18,0]) rotate([270,0,0]) wedge(90, 8, 6, 12);    
				if (ParoieX==20) translate([-(40-ParoieX)/2,0,6-ParoieZ]) rotate([0,0,90])V20x20_6(ParoieZ-12);
				difference() {
					translate([-20,-10,-6]) cube([ParoieX,40,6]);
					if (ParoieX==40) translate([0,0,-6.5]) cylinder(h=8,d=diam_vis,$fn=80);
				}
				difference () {    
					translate([-20,-10,-ParoieZ]) cube([ParoieX,20,6]);
					if (ParoieX==40) translate([0,0,-1-ParoieZ]) cylinder(h=8,r=10/2,$fn=80);
				}
				if (texture!=0) {
					translate([-20,-10,-ParoieZ]) cube([6,ParoieY,6]);
					if (FabreP) translate([-20, ParoieY-45 , -3]) rotate([90,0,-90]) color("white") letter(str(ParoieY,"x",ParoieZ));
					translate([-20,-10,-6]) cube([6,ParoieY,6]);
					translate([0,ParoieY-30,-6]) rotate([180,90,0]) wedge(90, 15, 20, 1.2);  
					if (ParoieX==40) {translate([0,ParoieY-20,6-ParoieZ]) rotate([0,0,90])V20x40_6(ParoieZ-12);
						translate([20,ParoieY-30,-6]) rotate([180,90,0]) wedge(90, 15, 20, 1.2);
						if (plexy) translate([20-1.2,ParoieY-50,0]) rotate([270,0,0]) wedge(90, 8, 6, 12);        
					}
					if (plexy && ParoieX!=40) translate([-1.2,ParoieY-50,0]) rotate([270,0,0]) wedge(90, 8, 6, 12);        
					if (ParoieX==20) translate([-(40-ParoieX)/2,ParoieY-20,6-ParoieZ]) rotate([0,0,90])V20x20_6(ParoieZ-12);
					difference () {
						translate([-20,ParoieY-50,-6]) cube([ParoieX,40,6]);
						if (ParoieX==40) translate([0,ParoieY-20,-6.5]) cylinder(h=8,d=diam_vis,$fn=80);
					}
					difference () {
					translate([-20,ParoieY-30,-ParoieZ]) cube([ParoieX,20,6]);  
					if (ParoieX==40) translate([0,ParoieY-20,-1-ParoieZ]) cylinder(h=8,r=10/2,$fn=80);  
					}
				}
			}
			union() {
			translate([10,20,-1-ParoieZ]) cylinder(h=ParoieZ+2,d=diam_vis,$fn=80);
			translate([-10,20,-1-ParoieZ]) cylinder(h=ParoieZ+2,d=diam_vis,$fn=80);
			translate([10,ParoieY-40,-1-ParoieZ]) cylinder(h=ParoieZ+2,d=diam_vis,$fn=80);
			translate([-10,ParoieY-40,-1-ParoieZ]) cylinder(h=ParoieZ+2,d=diam_vis,$fn=80);
			}
		}
	}
}
