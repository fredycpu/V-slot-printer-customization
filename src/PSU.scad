module Connecteur(Cx,Cy,Cz,Ctype) { //psu connectors
if (Ctype==1) {
  difference () {

    translate([0,0,-6])cube([7.5,Cy,Cz+12]);
    translate([10,10,Cz-25]) cylinder(h=25,r=10/2,$fn=80);  
    translate([10,Cy-10,Cz-25]) cylinder(h=25,r=10/2,$fn=80); 
  
    translate([-.5,Cy/2,Cz-55]) Connect(1);//iec 1
    translate([-.5,Cy/2,Cz-25]) Connect(101);//inter snap in 
    } 
  
  }
  if (Ctype==2) {
     // if (Long >= 160) Long = 160;
  translate([0, Cy/2-25 , Cz-30]) rotate([90,0,-90]) color("white") letter("UPS");
  translate([0, Cy/2+25 , Cz-30]) rotate([90,0,-90]) color("white") letter("BED");
    
    difference () {
    translate([0,0,-6])cube([7.5,Cy,Cz+12]);
    translate([10,10,Cz-25]) cylinder(h=25,r=10/2,$fn=80);  
    translate([10,Cy-10,Cz-25]) cylinder(h=25,r=10/2,$fn=80); 
    translate([-.5,Cy/2,Cz-25]) Connect(101);//inter snap in   
    translate([-.5,Cy/2-25,Cz-55]) Connect(1);//iec 1
    translate([-.5,Cy/2+25,Cz-55]) Connect(1);//iec 2  
    } 
  }
 if (Ctype==3) {
    difference () { //marche pas
    translate([0,0,-6])cube([7.5,Cy,Cz+12]);
    translate([10,10,Cz-25]) cylinder(h=25,r=10/2,$fn=80);  
    translate([10,Cy-10,Cz-25]) cylinder(h=25,r=10/2,$fn=80); 
    translate([-.5,Cy/2-15,Cz-60]) cube([9,28,61.5]);
    translate([3,Cy/2-15,Cz-60]) cube([9,28,63]);
    } 
  }
}

module SSR(Cx,Cy,Cz,Rtype) { //Solid State Relays
	if (Rtype==0)  alert(5,"SSR");
	translate([-19,10,-6]) rotate([270,0,90]) tolelarmes(Cy-40,Cz-12,5,2,1.2);
	if (Rtype==1||Rtype==3) {
		union () {
			ssrfix(-16,Cy*.5-10,-Cz*.5+22.5);
			ssrfix(-16,Cy*.5-10,-Cz*.5-22.5);  
			if (Rtype==3) {
				ssrfix(-16,Cy*.5-10+45,-Cz*.5+22.5);
				ssrfix(-16,Cy*.5-10+45,-Cz*.5-22.5);
				ssrfix(-16,Cy*.5-10-45,-Cz*.5+22.5);
				ssrfix(-16,Cy*.5-10-45,-Cz*.5-22.5);
				if (FabreP) translate([-19.8, 30 , Cz-73]) rotate([90,0,-90]) color("white") letter("SSR x 3");
			} else
			if (FabreP) translate([-19.8, 30 , Cz-73]) rotate([90,0,-90]) color("white") letter("SSR x 1");
		}
	}
	if (Rtype==2||Rtype==4) {
		union () {
			ssrfix(-16,Cy*.5-10+23,-Cz*.5+22.5);
			ssrfix(-16,Cy*.5-10+23,-Cz*.5-22.5);
			ssrfix(-16,Cy*.5-10-23,-Cz*.5+22.5);
			ssrfix(-16,Cy*.5-10-23,-Cz*.5-22.5);
			if (Rtype==4) {
				if (Long<200) alert(1,"SSR"); else {//alert for inssuficient lenght
					ssrfix(-16,Cy*.5-10+69,-Cz*.5+22.5);
					ssrfix(-16,Cy*.5-10+69,-Cz*.5-22.5);
					ssrfix(-16,Cy*.5-10-69,-Cz*.5+22.5);
					ssrfix(-16,Cy*.5-10-69,-Cz*.5-22.5);
				}
				if (FabreP) translate([-19.8, 30 , Cz-73]) rotate([90,0,-90]) color("white") letter("SSR x 4");
			} else
			if (FabreP) translate([-19.8, 30 , Cz-73]) rotate([90,0,-90]) color("white") letter("SSR x 2");

		}
	}
}

module MKSPWC(Cx,Cy,Cz,Rtype) { //MKS power switch module
	if (Long<160) alert(1,"MKS_PWC"); else {//alert for inssuficient lenght
		union () {
			translate([-19,10,-6]) rotate([270,0,90]) tolelarmes(Cy-40,Cz-12,5,2,1.2);
			ssrfix(-16,Cy*.5-46,-Cz*.5+21,2);
			ssrfix(-16,Cy*.5-46,-Cz*.5-21,2);  
			ssrfix(-16,Cy*.5+26,-Cz*.5+21,2);
			ssrfix(-16,Cy*.5+26,-Cz*.5-21,2);  
			if (FabreP) translate([-19.8, 30 , Cz-73]) rotate([90,0,-90]) color("white") letter("MKS PWC");
		}
	}
}


module ssrfix(x,y,z,diam=4) {
	translate([x,y,z]) rotate([0,90,0]) 
	difference () {
		cylinder(h=10,d=12,$fn=80);  
		translate([0,0,-0.01]) cylinder(h=11,d=diam,$fn=80);  
	}
}

module PSUFix(Fx,Fy,Fz,Ftype,Tet=0) {
  translate([1,0,Fz]) rotate([270,0,90]) tolelarmes(Fy,Fz,5,2,1.2);
  if (Ftype==0) {//PSU DS 150 24
    if (Fy<260) alert(1,"PSU DS 150 24"); else {//alert for inssuficient lenght
		translate([6,(Fy/2+123),Fz/2+10]) rotate([0,90,0]) pcb_support();
		translate([6,(Fy/2+123),Fz/2-28]) rotate([0,90,0]) pcb_support();
		translate([6,(Fy/2-123),Fz/2+10]) rotate([0,90,0]) pcb_support();
		translate([6,(Fy/2-123),Fz/2-28]) rotate([0,90,00]) pcb_support();   
    }
  } 
}
