module pcb_support(he=5,d1=8,d2=3) {
    difference () {
    cylinder(h=he,d=d1,$fn=80);
    translate([0,0,-0.1])cylinder(h=he+0.2,d=d2,$fn=80);
    }
}
module pcb_implentation(Pl,Pw,Hl,Hw,he=5,d1=7,d2=3) {
    cube([Pl,Pw,5]);
    translate([4,(Pw-Hw)/2,5]) pcb_support(he,d1,d2);
    translate([4,(Pw-Hw)/2+Hw,5]) pcb_support(he,d1,d2);
    translate([4+Hl,(Pw-Hw)/2,5]) pcb_support(he,d1,d2);
    translate([4+Hl,(Pw-Hw)/2+Hw,5]) pcb_support(he,d1,d2);   
}
module Fix(Fx,Fy,Fz,Ftype,Tet=0) {
  translate([1,0,Fz]) rotate([270,0,90]) tolelarmes(Fy,Fz,5,2,1.2);
  if (Ftype==0) {
      
    translate([6,(Fy/2+123),Fz/2+10]) rotate([0,90,0]) pcb_support();
    translate([6,(Fy/2+123),Fz/2-28]) rotate([0,90,0]) pcb_support();
    translate([6,(Fy/2-123),Fz/2+10]) rotate([0,90,0]) pcb_support();
    translate([6,(Fy/2-123),Fz/2-28]) rotate([0,90,00]) pcb_support();   
      
  } 
}
module Fix(Fx,Fy,Fz,Ftype,Tet=0) {
  translate([1,0,Fz]) rotate([270,0,90]) tolelarmes(Fy,Fz,5,2,1.2);
  if (Ftype==0) {
      
    translate([6,(Fy/2+123),Fz/2+10]) rotate([0,90,0]) pcb_support();
    translate([6,(Fy/2+123),Fz/2-28]) rotate([0,90,0]) pcb_support();
    translate([6,(Fy/2-123),Fz/2+10]) rotate([0,90,0]) pcb_support();
    translate([6,(Fy/2-123),Fz/2-28]) rotate([0,90,00]) pcb_support();   
      
  } 
}
