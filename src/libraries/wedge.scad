module wedge(angle, leg1, leg2, height = 0.5) {
  // Store the length of all three sides in an array.
  side = [sqrt(leg1 * leg1 + leg2 * leg2 - 2 * leg1 * leg2 * cos(angle)),	// Law of Cosines.
          leg1,
          leg2];

  i = (leg2 > leg1) ? 2 : 1;
  longest_leg = side[i];
  longest_side = (side[0] > longest_leg) ? side[0] : longest_leg;

  // The corner opposite of the shortest leg must be less than 90 degrees.
  sa = asin(side[3 - i] * sin(angle) / side[0]);		// Law of Sines.
  sb = 180 - angle - sa;					// Sum of all angles is 180 degrees.

  // Store the size of all three angles in an array.
  a = [angle, (i == 1) ? sb : sa, (i == 1) ? sa : sb];

  // Is there anything to draw at all?
  if (angle > 0 && angle < 180)
  {
    intersection()
    {
      if (angle <= 90)
	intersection()
	{
	  cube([longest_leg, longest_leg, height]);
	  rotate([0, 0, angle - 90])
	    cube([longest_leg, longest_leg, height]);
	}
      else
	union()
	{
	  cube([longest_leg, longest_leg, height]);
	  rotate([0, 0, angle - 90])
	    cube([longest_leg, longest_leg, height]);
	}
      if (a[2] < 90)
      {
	translate([leg1, 0, 0])
	  rotate([0, 0, 90 - a[2]])
	    translate([-longest_side, 0, 0])
	      cube([longest_side, longest_side, height]);
      }
      else
      {
        rotate([0, 0, angle])
	  translate([leg2, 0, 0])
	    rotate([0, 0, a[1]])
	      translate([-longest_side, 0, 0])
	        cube([longest_side, longest_side, height]);
      }
    }
  }
}