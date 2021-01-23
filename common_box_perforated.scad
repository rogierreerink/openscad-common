// Uses
use <common_plane_perforated.scad>

// View
$fn = 100;
common_box_perforated();

// Model
module common_box_perforated (
    x               = 40,
    y               = 40,
    z               = 5,
    r               = 5,
    hole_diameter   = 5,
    hole_space      = 5/2,
    mode            = "standard",
    center          = true
) {
    
    linear_extrude(
        height = z,
        center = center
    ) common_plane_perforated(
        x               = x,
        y               = y,
        r               = r,
        hole_diameter   = hole_diameter,
        hole_space      = hole_space,
        mode            = mode,
        center          = center
    );
}