module letter(l) {
	// Use linear_extrude() to make the letters 3D objects as they
	// are only 2D shapes when only using text()
	linear_extrude(height = 1) {
		text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
	}
}