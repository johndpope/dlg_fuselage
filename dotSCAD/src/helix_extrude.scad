/**
* helix_extrude.scad
*
* Extrudes a 2D shape along a helix path.
*
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-helix_extrude.html
*
**/

include <__private__/__is_vector.scad>;
include <__private__/__frags.scad>;

module helix_extrude(shape_pts, radius, levels, level_dist, 
                     vt_dir = "SPI_DOWN", rt_dir = "CT_CLK", 
                     twist = 0, scale = 1.0, triangles = "SOLID") {

    function reverse(vt) = 
        let(leng = len(vt))
        [
            for(i = [0:leng - 1])
                vt[leng - 1 - i]
        ];                         
                         
    is_vt = __is_vector(radius);
    r1 = is_vt ? radius[0] : radius;
    r2 = is_vt ? radius[1] : radius;
    
    init_r = vt_dir == "SPI_DOWN" ? r2 : r1;

    frags = __frags(init_r);

    v_dir = vt_dir == "SPI_UP" ? 1 : -1;
    r_dir = rt_dir == "CT_CLK" ? 1 : -1;
            
    angle_step = 360 / frags * r_dir;
    initial_angle = atan2(level_dist / frags, 6.28318 * init_r / frags) * v_dir * r_dir;

    path_points = helix(
        radius = radius, 
        levels = levels, 
        level_dist = level_dist, 
        vt_dir = vt_dir, 
        rt_dir = rt_dir
    );

    clk_a = r_dir == 1 ? 0 : 180;
    angles = [for(i = [0:len(path_points) - 1]) [90 + initial_angle, 0, clk_a + angle_step * i]];
    
    sections = cross_sections(shape_pts, path_points, angles, twist, scale);

    polysections(
        sections,
        triangles = triangles
    );
    
    // hook for testing
    test_helix_extrude(sections);
}

// override it to test
module test_helix_extrude(sections) {

}