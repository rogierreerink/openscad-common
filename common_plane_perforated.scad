// Uses
use <common_plane.scad>

// View
$fn = 100;
common_plane_perforated();

// Model
module common_plane_perforated (
    x               = 40,
    y               = 40,
    r               = 5,
    hole_diameter   = 5,
    hole_space      = 5/2,
    mode            = "standard",
    center          = true
) {
    
    translate([
        center ? -x / 2 : 0,
        center ? -y / 2 : 0,
    ]) difference() {
    
        common_plane(
            x       = x,
            y       = y,
            r       = r,
            center  = false
        );
        
        if (mode == "standard") {
            // Create a straight pattern
            perf_size_x     = hole_diameter + hole_space;
            perf_size_y     = hole_diameter + hole_space;
            perf_area_x     = x - hole_space;
            perf_area_y     = y - hole_space;
            perf_count_x    = floor(perf_area_x / perf_size_x);
            perf_count_y    = floor(perf_area_y / perf_size_y);
            perf_offset_x   = hole_diameter/2 + hole_space + (perf_area_x - perf_count_x*perf_size_x)/2;
            perf_offset_y   = hole_diameter/2 + hole_space + (perf_area_y - perf_count_y*perf_size_y)/2;
        
            for (
                x = [0:perf_count_x - 1]
            ) for (
                y = [0:perf_count_y - 1]
            ) translate([
                perf_offset_x + x*perf_size_x,
                perf_offset_y + y*perf_size_y,
            ]) circle(
                d = hole_diameter
            );
            
        } else if (mode == "hyve") {
            // Create a hyve pattern
            perf_size_x     = sqrt(pow(hole_diameter + hole_space,2) - pow((hole_diameter + hole_space)/2,2));
            perf_size_y     = hole_diameter + hole_space;
            perf_area_x     = x - hole_space;
            perf_area_y     = y - hole_space;
            perf_count_x    = floor(perf_area_x / perf_size_x);
            perf_count_y    = floor(perf_area_y / perf_size_y);
            perf_offset_x   = hole_diameter/2 + hole_space + (perf_area_x - perf_count_x*perf_size_x)/2;
            perf_offset_y   = hole_diameter/2 + hole_space + (perf_area_y - perf_count_y*perf_size_y)/2;
                
            for (
                x = [0:perf_count_x - 1]
            ) for (
                y = [x%2:perf_count_y - 1]
            ) translate([
                perf_offset_x + x*perf_size_x,
                perf_offset_y + y*perf_size_y - (x%2 ? perf_size_y/2 : 0),
            ]) circle(
                d = hole_diameter
            );
            
        } else {
            assert(false, "mode unknown");
        }
    }
}
