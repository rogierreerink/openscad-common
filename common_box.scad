// Uses
use <common_plane.scad>

// View
common_box();

// Model
module common_box (
    x               = 40,
    y               = 40,
    z               = 5,
    r               = 5,
    center          = true
) {
    
    linear_extrude (
        height  = z,
        center  = center
    ) common_plane(
        x       = x,
        y       = y,
        r       = r,
        center  = center
    );
}