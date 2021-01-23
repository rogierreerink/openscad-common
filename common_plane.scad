// View
$fn = 100;
common_plane();

// Model
module common_plane (
    x               = 40,
    y               = 40,
    r               = 5,
    center          = true
) {
    
    translate([
        center ? 0 : x / 2,
        center ? 0 : y / 2,
    ]) {
    
        for (
            i = [0:1]
        ) translate([
            i % 2 ? x / 2 - r : -x / 2 + r,
            i % 2 ? -y / 2 + r : y / 2 - r,
        ]) circle(
            r = r
        );
        
        for (
            i = [0:1]
        ) translate([
            i % 2 ? x / 2 - r : -x / 2 + r,
            i % 2 ? y / 2 - r : -y / 2 + r,
        ]) circle(
            r = r
        );
        
        polygon([
            
            [-x / 2, -y / 2 + r],
            [-x / 2 + r, -y / 2],
        
            [x / 2 - r, -y / 2],
            [x / 2, -y / 2 + r],
        
            [x / 2, y / 2 - r],
            [x / 2 - r, y / 2],
        
            [-x / 2 + r, y / 2],
            [-x / 2, y / 2 - r],
        ]);
    }
}