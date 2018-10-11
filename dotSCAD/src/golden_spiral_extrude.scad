/**
* golden_spiral_extrude.scad
*
* Extrudes a 2D shape along the path of a golden spiral.
*
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-golden_spiral_extrude.html
*
**/

module golden_spiral_extrude(shape_pts, from, to, point_distance, 
                             rt_dir = "CT_CLK", twist = 0, scale = 1.0, triangles = "SOLID") {

    pts_angles = golden_spiral(
        from = from, 
        to = to, 
        point_distance = point_distance,
        rt_dir = rt_dir
    );

    pts = [for(pt_angle = pts_angles) pt_angle[0]];
    angles = [
        for(pt_angle = pts_angles) 
            [90, 0, pt_angle[1] + (rt_dir == "CT_CLK" ? 0 : -90)]
    ];

    sections = cross_sections(
        shape_pts, 
        pts, angles, 
        twist = twist, 
        scale = scale
    );

    polysections(
        sections,
        triangles = triangles
    );

    // testing hook
    test_golden_spiral_extrude(sections);
}

// override it to test
module test_golden_spiral_extrude(sections) {

}