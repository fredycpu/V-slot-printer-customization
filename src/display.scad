module Display(Bx,By,Bz,Dtype) {
	if (Bz>60) translate([1,0,Bz]) rotate([270,0,90]) tolelarmes(By,Bz-62,5,2,1.2);
	hole_size = 1.5; //default holes size for pcb
    translate([-47,-8,-6]) cube ([47,12,6]);
    translate([-47,0,-6]) cube ([8,By,6]);
    translate([-47,By-5,-6]) cube ([47,12,6]);
    translate([0,By+1,-2]) rotate ([-90,-180,00]) wedge(90, 45, 65, 5);
    translate([0,-8,-2]) rotate ([-90,-180,00]) wedge(90, 45, 65, 5);
    translate([-20,By/2,35])
	rotate ([45,0,-90])
	difference () {
		roundedcube([By+20,90,20], true,3, "all");
		if (Long<165) alert(1,"Display"); else {  //alert for insuficient lenght
			translate([0,-4.9,-10]) cube ([By,70,20],center=true); // cylinder(h=8,d=30.1,$fn=80);  
			if (Bz<61) rotate ([-45,0,0]) translate([-By/2-20,0,29]) cube ([By+30,40.2,10]); // crop top	
			rotate ([-45,0,0]) translate([-By/2-20,20.5,3]) cube ([By+30,40.2,60]); // crop end	
			translate([-By/2,30,-16])  rotate ([90,0,90])wedge(90, 18,18, By);
			translate([-By/2,-35,0])    
			union () {
				translate([+12.2,+4.05,4.5]) cube ([86.5,56.9,5.5]); // display place
        			if (Dtype==0) translate([-1.5,-1,-10.4]) cube ([128.6,67,15]); //PCB place MKS Robin TS35 with encoder
        			if (Dtype==4) translate([-1.5,-1,-10.4]) cube ([115,67,15]); //PCB place MKS Robin TF35
				
				if (Dtype==0) {					// rotary encoder hole for 3.5 robin nano
					translate([115,32.5,-10]) cube ([13.3,13.3,45],center=true); //rotary encoder hole
					translate([115,32.5,-10]) cube ([20,20,35],center=true);  //rotary encoder solderings
					}
				translate([4,4,-1]) cylinder(h=10,d=hole_size,$fn=80);//pcb holes
				translate([4,61,-1]) cylinder(h=10,d=hole_size,$fn=80); //pcb holes
				translate([106,4,-1]) cylinder(h=10,d=hole_size,$fn=80);//pcb holes
				translate([106,61,-1]) cylinder(h=10,d=hole_size,$fn=80);//pcb holes
				if (Dtype==0) {				
					translate([121,4,-1]) cylinder(h=10,d=hole_size,$fn=80);//pcb holes
					translate([121,61,-1]) cylinder(h=10,d=hole_size,$fn=80);//pcb holes
				}
			}
		}
        if (PWR_button) {
			if (By<140) alert(1,"Power_button"); else {//alert for insuficient lenght
				translate([-By/2+138,-22.5,0])  // Power button 
				union () {
					translate([0,0,8.5]) cylinder(h=1.5,d=18.1,$fn=80);
					translate([0,0,-10]) 
					intersection () {
						cylinder(h=20,d=16.1,$fn=80);  
						//cube ([14.2,16.1,60],center=true);
					}
					
				}
			}
		}
		if (Fan_c) {
			if (By<150) alert(1,"fan_control_1"); else {//alert for insuficient lenght
				Fan_Var(-By/2+138,20,2,0);
			}
        	}
		if (Fan_c>=2) {
			if (By<180) alert(1,"fan_control_2"); else {//alert for insuficient lenght
				Fan_Var(-By/2+168,20,2,0);				
			}
	        }
		if (Fan_c>=3) {
			if (By<210) alert(1,"fan_control_3"); else {//alert for insuficient lenght
				Fan_Var(-By/2+198,20,2,0);
			}
        	}
		if (Fan_c>=4) {
			if (By<240) alert(1,"fan_control_4"); else {//alert for insuficient lenght
				Fan_Var(-By/2+228,20,2,0);
			}
        	}
	}
}


module Fan_Var(Fx,Fy,Fz,FVtype) {// fan variator
  if (FVtype == 0) 
    translate([Fx,Fy,Fz])  
        union () {
       translate([0,0,4.5]) cylinder(h=6,d=16,$fn=80);
       translate([0,0,-10]) cylinder(h=20,d=7,$fn=80);  
       translate([0,0,-10]) cube ([30.2,30.2,24],center=true);
    
}

