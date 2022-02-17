module tolelarmes(Long,Larg,Epaiss,Form,Rug=2) {
$fn=360;
k=Larg/Long;  
f= Form==2 ? Larg:Long*k;
intersection(){
    //color("blue")
union(){   
if (Form==1){
     
        translate([Long/2,Long*k/2,-Epaiss])
        scale([1,k,1,])
        cylinder(d=Long,h=Rug+Epaiss+.5);
        w=1;
    } else {
        translate([0,0,-Epaiss])
        cube([Long,Larg,Rug+Epaiss+.5]);
        } ;   
};
//color("red")
    
    union(){
        if (Form==1){
        translate([Long/2,Long*k/2,-Epaiss])
        scale([1,k,1,])
        cylinder(d=Long,h=Epaiss+0.5);
        } else {
        translate([0,0,-Epaiss])
        cube([Long,Larg,Epaiss+0.5]);
        } ; 

for(x = [-25 : 25 : Long+25])
{
    for(y = [-25 : 25 : f+25])
    {
translate([x,y,-2+Rug])
larme();
};
};
for(r = [7.5 : 25 : Long+25])
{
    for(t = [12.5-25 : 25 : f+25])
    {
translate([r,t,-2+Rug])
        rotate([0,0,90])
larme();
};
};
};
};
};
module larme() {
hull(){
translate([10,10,1])
rotate([0,0,45])
scale ([1,3,1])
rotate([0,0,45])
cube([5,5,1],center=true);
translate([10,10,2])
scale ([.1,.1,.1])
rotate([0,0,45])
cube([1,1,10],center=true);
}
}

module hexpattern(Px,Py,Pz) {
x=sqrt(3/4*hex_radius*hex_radius);
ystep=2*x;
xstep=3*hex_radius/2;
intersection() {
	for (xi=[0:xstep:Px])
		for(yi=[0:ystep:Py])
			hex(xi-Px/2,((((xi/xstep)%2)==0)?0:ystep/2)+yi-Py/2,Pz);
	translate([-Px/2,-Py/2, -Pz/2]) 
		cube([Px,Py,Pz/1]);
}
}

module brickface(width, height, brickwidth, brickheight, mortarthick, mortardeep) {
  rowoffset = (brickheight + mortarthick);
  dualrowoffset = (rowoffset*2);
  dualrows = round(height / dualrowoffset);
  halfbrick = round(brickwidth / 2);
  brickoffset = (brickwidth + mortarthick);
  brickfile = round(width / brickoffset);
  intersection()
  {
     translate([0,0-mortarthick,0]) cube([width,mortardeep*2,height]);
     union()
     {
        for (i = [0: dualrows])
        {
           translate([0,0,(dualrowoffset*i)+brickheight]) cube([width,mortardeep,mortarthick]);
           translate([0,0,(dualrowoffset*i)+brickheight+rowoffset]) cube([width,mortardeep,mortarthick]);
          for(j=[0: brickfile])
          {
            translate([(brickoffset*j)+brickwidth,0,(dualrowoffset*i)]) cube([mortarthick,mortardeep,brickheight]);    
            translate([(brickoffset*j)+halfbrick-(mortarthick/2),0,(dualrowoffset*i)+brickheight+mortarthick]) cube([mortarthick,mortardeep,brickheight]);        
          }
        }
     }
  }
}
module hex(x,y,z) {
	difference()
	{
		translate([x,y,-z/2]) 
			cylinder(r=(hex_radius+hex_border_width/20), h=(z/1), $fn=6);	
		translate([x,y,-z/2-0.1]) 
			cylinder(r=(hex_radius-hex_border_width/20), h=z/1+0.5, $fn=6);
	}
}
