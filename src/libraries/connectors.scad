module Connect(Ctype) {
	if (Ctype==1) { //iec 14
		translate([0,-14,0]) cube([9,28,20]);
		translate([0,-20,10]) rotate([0,90,0]) cylinder(h=9,r=3/2,$fn=80); 
		translate([0,20,10]) rotate([0,90,0]) cylinder(h=9,r=3/2,$fn=80);
	}   
	if (Ctype==101) { //Snap in rocker switch
		translate([0,-15,0]) cube([9,30,21.8]);
		translate([2.5,-15.75,0]) cube([8,31.5,21.8]);
	}    
}
